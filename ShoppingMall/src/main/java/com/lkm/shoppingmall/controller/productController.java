package com.lkm.shoppingmall.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.lkm.shoppingmall.command.product.Excel_fileCommand;
import com.lkm.shoppingmall.command.product.Update_myproduct;
import com.lkm.shoppingmall.command.product.dept_list_showCommand;
import com.lkm.shoppingmall.command.product.my_product_orderList;
import com.lkm.shoppingmall.command.product.myproductCommand;
import com.lkm.shoppingmall.command.product.myproductinfoCommand;
import com.lkm.shoppingmall.command.product.selectproduct;
import com.lkm.shoppingmall.commom.Kakaopay;
import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.loginDAO;
import com.lkm.shoppingmall.dao.myDAO;
import com.lkm.shoppingmall.dao.productDAO;
import com.lkm.shoppingmall.dto.CartListDto;
import com.lkm.shoppingmall.dto.buys_optionDto;
import com.lkm.shoppingmall.dto.departmentDto;
import com.lkm.shoppingmall.dto.orderListDto;
import com.lkm.shoppingmall.dto.product_optionDto;
import com.lkm.shoppingmall.dto.productsDto;
import com.lkm.shoppingmall.dto.userDto;

import lombok.Setter;

@Controller
public class productController {

	@Autowired
	private SqlSession sqlsession;
	private command command;
		
	@RequestMapping("product/myproduct")
	public String myproducts(HttpServletRequest req,Model model) {
		HttpSession session =req.getSession();
		
		if(session.getAttribute("idx") !=null) {
			if(session.getAttribute("buysell").equals("sell")) {
				model.addAttribute("req", req);
				command = new myproductCommand();
				command.execute(sqlsession, model);
				return "product/myproduct";
			} else {
				return "redirect:/index";
			} 
		} else {
			return "redirect:/index";
		}
	}
	
	@RequestMapping("product/newProductsForm")
	public String newProduct(HttpServletRequest req,Model model) {
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("idx")==null) {
			return "redirect:/index";
		} else {
			String buysell = (String) session.getAttribute("buysell");
			if(buysell ==null) {
				return "redirect:/index";
			} else {
				return "product/newProductsForm";
			}
		}
		
	}
	@RequestMapping(value="product/insertsumnail",method=RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	public String img_return(MultipartHttpServletRequest  req) {
		
		MultipartFile file = req.getFile("file");
		String saveFilename = null;
		File saveFile =null;
		if(!file.isEmpty()) {
			String originFilename  =file.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf(".")+1);
			
			
			try {
				saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) +
						UUID.randomUUID() +
						"." + extName;
				String realPath = req.getSession().getServletContext().getRealPath("resources/images/Department_sumnail");
				System.out.println(realPath);
				File directory = new File(realPath);
				System.out.println(directory);
				if ( !directory.exists() ) {
					
					directory.mkdirs();
				}
				saveFile = new File(realPath, saveFilename);
				file.transferTo(saveFile);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return saveFilename;
	}
	
	@RequestMapping(value="product/productnoticeupload",method=RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	public String product_notice_Img_upload(MultipartHttpServletRequest mr ) throws Exception {		
		
		String files="";
		List<MultipartFile> flist = mr.getFiles("files");
		
		int st_num =0;
		int end_num =flist.size();
		
		System.out.println(flist.size());
		for(MultipartFile f : flist) {
			try {
				st_num++;
				String saveFilename="";
				String originFilename  =f.getOriginalFilename();
				String extName = originFilename.substring(originFilename.lastIndexOf(".")+1);
				try {
					saveFilename = originFilename.substring(0, originFilename.lastIndexOf("."))+
							UUID.randomUUID()+
							"." + extName;
					String realPath = mr.getSession().getServletContext().getRealPath("/resources/images/Department_notice");
					File directory = new File(realPath);
					if ( !directory.exists() ) {
						directory.mkdirs();
					}
					File saveFile = new File(realPath, saveFilename);
					f.transferTo(saveFile);
					files +=saveFilename;
					if(st_num <end_num) {
						files+=",";
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return files;
	}
	
	
	
	@RequestMapping(value="product/product_infoupload",method=RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	public String product_info(MultipartHttpServletRequest mr) {
		List<MultipartFile> files = mr.getFiles("files");
		String filename="";
		int st_num = 0;
		int end_num = files.size();
		for(MultipartFile f : files) {
			st_num++;
			String origin = f.getOriginalFilename(); 
			String ext = f.getOriginalFilename().substring(origin.lastIndexOf(".")+1);
			
			try {
				String saveFile = origin.substring(0, origin.lastIndexOf(".")) +
						UUID.randomUUID()+
						"." + ext;
				String path = mr.getSession().getServletContext().getRealPath("/resources/images/Department_product_img");
				File dir = new File(path);
				if( !dir.exists()) {
					dir.mkdirs();
				}
				
				File save =  new File(path,saveFile);
				f.transferTo(save);
				filename +=saveFile;
				if(st_num <end_num) {
					filename+=",";
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return filename;
	}
	@RequestMapping(value="product/insertproduct",method =RequestMethod.POST)
	public String insert_product(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		String idx = (Integer)session.getAttribute("idx")+"";
		if(idx ==null) {
			return "redirect:/login";
		} else {
			String pName = req.getParameter("pName");
			String price = req.getParameter("price");
			String order_price =req.getParameter("order_price");
			String option1[] = req.getParameterValues("option1");
			String sumNail =req.getParameter("sumNail");
			String pnoticeimg =req.getParameter("pnoticeimg");
			String pimg =req.getParameter("pimg");
			
			productDAO pdao = sqlsession.getMapper(productDAO.class);
			int result =0;
			Map<String,Object> query = new HashMap<String, Object>();
			query.put("pName", pName);
			query.put("price", price);
			query.put("order_price",order_price);
			query.put("psumNail",sumNail);
			query.put("didx", idx);
			result = pdao.insertproduct(query);
			System.out.println("pidx : "+query.get("pidx"));
			
			if(result >0) {
				String pidx = query.get("pidx")+"";
				
				//공지사항 추가 
				Map<String,Object> notice = new HashMap<String, Object>();
				notice.put("notice_img", pnoticeimg);
				notice.put("pimg", pimg);
				notice.put("pidx", pidx);
				pdao.insertproductnotice(notice);
				
				for(int i=0; i<option1.length; i++) {
					Map<String,Object> options =new HashMap<String, Object>();
					String[] op2_names= req.getParameterValues("option2_name"+(i+1));
					String[] op2_price = req.getParameterValues("option2_price"+(i+1));
					System.out.println("op2_names :"+op2_names);
					int option_avg = 0;
					for(String p : op2_price) {
						option_avg +=Integer.parseInt(p);
					}
					options.put("poname", option1[i]);
					options.put("avg_price", option_avg);
					options.put("pidx", pidx);
					int option1_result =pdao.insertproductOption1(options);
									
					if(option1_result >0) {
						String poidx = options.get("poidx")+"";
						System.out.println(op2_names.length);
						for(int j=0; j<op2_names.length; j++) {
							Map<String,Object> option2 = new HashMap<String, Object>();
							option2.clear();
							option2.put("poidx", poidx);
							option2.put("op2_name",op2_names[j]);
							option2.put("op2_price",op2_price[j]);
							option2.put("pidx", pidx);
							pdao.insertproductOption2(option2);
						}
					}
					
				}
			}
			
			return "redirect:/product/myproduct";
		}
		
	}
	@RequestMapping(value="product/myproduct/{didx}/{pidx}",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	public String getmyProduct(@PathVariable("pidx") int pidx,@PathVariable("didx") int didx,HttpServletRequest req,Model model) {
		productDAO pdao = sqlsession.getMapper(productDAO.class);
		int idx= pdao.selectDidx(pidx);
		System.out.println(idx);
		if(idx==didx) {
			model.addAttribute("pidx", pidx);
			command=new myproductinfoCommand();
			command.execute(sqlsession, model);
			return "product/UpdateMyproductForm";
		} else {
			return "redirect:/index";
		}
	}
	
	@RequestMapping(value="product/update_myproduct",method=RequestMethod.POST)
	public String update_myproduct(HttpServletRequest req,Model model) {
		model.addAttribute("req", req);
		command= new Update_myproduct();
		command.execute(sqlsession, model);
		
		String pidx = req.getParameter("pidx");
		String didx= (Integer) req.getSession().getAttribute("idx")+"";
		
		return "redirect:/product/myproduct/"+didx+"/"+pidx;
	}
	
	@RequestMapping(value="product/products/{pidx}",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	public String selectproduct(@PathVariable("pidx") int pidx,HttpServletRequest req,Model model) {
		model.addAttribute("pidx", pidx);
		model.addAttribute("req",req);
		command=new selectproduct();
		command.execute(sqlsession, model);
		return "product/showproduct";
	}
	
	@RequestMapping(value="product/getOption2",method=RequestMethod.POST)
	@ResponseBody
	public JSONArray getOption2(HttpServletRequest req,Model model) {
		
		String poidx = req.getParameter("poidx");
		String pIdx = req.getParameter("pidx");
		System.out.println(poidx);
		System.out.println(pIdx);
		Map<String,Object> keys = new HashMap<String, Object>();
		keys.put("poidx", poidx);
		keys.put("pIdx",pIdx);
		
		
		JSONArray arr = new JSONArray();
		ArrayList<product_optionDto> podto = new ArrayList<product_optionDto>();
		productDAO pdao = sqlsession.getMapper(productDAO.class);
		
		podto = pdao.getOption2(keys);

		for( product_optionDto po : podto) {
			JSONObject obj =  new JSONObject(); 
			obj.put("poidx",po.getPoidx());
			obj.put("poname", po.getPoname());
			obj.put("poprice",po.getPoprice());
			arr.add(obj);
		}
		
		return arr;
		
	}
	@RequestMapping(value="product/buy",method=RequestMethod.POST)
	public String BuyPage(HttpServletRequest req,Model model) throws ParseException {
			HttpSession session =req.getSession();
			
			String option_arr = req.getParameter("selected_option");
			JSONParser parser = new JSONParser();
			JSONArray arr= (JSONArray) parser.parse(option_arr);
			productDAO pdao = sqlsession.getMapper(productDAO.class);
			productsDto pdto =new productsDto();
			int pIdx = Integer.parseInt(req.getParameter("pIdx"));
			
			pdto.setpIdx(pIdx);
			pdto = pdao.selectmyProduct(pdto);
			model.addAttribute("arr", arr);
			model.addAttribute("pdto",pdto);
			
			
			
			String idx = (Integer) session.getAttribute("idx")+"";
			String type =(String) session.getAttribute("type");
			
			
			
			userDto udto =new userDto();
			departmentDto deptdto = new departmentDto();
			if(type.equals("user")) {
				udto = pdao.getUserInfo(idx);
				model.addAttribute("udto", udto);
			} else {
				deptdto =pdao.getDeptInfo(idx);
				model.addAttribute("deptdto",deptdto);
			}
			
		return "product/buyPage";
	}
	
	@Setter(onMethod_ = @Autowired)
    private Kakaopay kakaopay;
	
		
	@PostMapping("product/buy/kakaopay")
	@ResponseBody
	public String kakaopay(HttpServletRequest req) throws Exception {
		
		String name = req.getParameter("Name");
		String seller = req.getParameter("seller");
		String options =req.getParameter("options");
		String total_price =req.getParameter("total_price");
		String req_option =req.getParameter("req_option");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("name",name);
		map.put("seller",seller);
		map.put("options",options);
		map.put("total_price",total_price);
		map.put("req_option",req_option);
		System.out.println(kakaopay.kakaoPayReady(map));
		return kakaopay.kakaoPayReady(map);
		//return "redirect:"+kakaopay.kakaoPayReady(map);
	}
	@GetMapping("product/buy/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) { 
       System.out.println("pg토큰:"+pg_token);
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
    }
	@PostMapping("product/buy/insert")
	@ResponseBody
	
	public String buy_insert(HttpServletRequest req) throws ParseException {
		HttpSession session = req.getSession();
		String total_price =req.getParameter("total_price");
		String pidx =req.getParameter("pidx");
		String border_num =req.getParameter("border_num");
		String options =req.getParameter("options");
		String border_status =req.getParameter("border_status");
		String border_ment =req.getParameter("border_ment");
		String didx=  req.getParameter("didx");

		productDAO pdao = sqlsession.getMapper(productDAO.class);
		int bidx =0;
		try {
			
			Map<String,Object> data =new HashMap<String, Object>();
			data.put("total_price",total_price);
			data.put("pidx", pidx);
			data.put("border_num", border_num);
			data.put("border_status", border_status);
			data.put("border_ment",border_ment);
			data.put("didx", didx); 
			
			String idx = (Integer) session.getAttribute("idx")+"";
			if(session.getAttribute("type").equals("user")) {
				data.put("uidx",idx);
				data.put("pdidx", 0);
			} else {
				data.put("uidx",0);
				data.put("pdidx", idx);
			}
			System.out.println(data);
			int result =0;
			result =pdao.buy_insert(data);
			bidx= (Integer) data.get("bidx");
			JSONParser parser =new JSONParser();
			
			JSONArray arr =(JSONArray) parser.parse(options);
			Map<String,Object> option = new HashMap<String, Object>();
			for(int i=0; i<arr.size(); i++) {
				JSONObject obj = (JSONObject) arr.get(i);
				option.clear();
				option.put("boname",obj.get("topponame") +" / "+obj.get("poname") );
				option.put("boprice", obj.get("poprice"));
				option.put("count", obj.get("count"));
				option.put("bidx", bidx);
				result =pdao.buy_option(option);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bidx+"";
	}
	@RequestMapping(value="product/buy/buySuccess",method=RequestMethod.GET)
	public String buysuccess(@RequestParam("bidx") String bidx,HttpServletRequest req,Model model) {
		
		HttpSession session =req.getSession();
		
		if(session.getAttribute("idx") ==null) {
			return "redirect:/login";
		}
		else {
			String idx = (Integer) session.getAttribute("idx")+"";
			System.out.println(bidx);
			Map<String,Object> data = new HashMap<String, Object>();
			
			data.put("bidx",bidx);
			
			userDto udto = new userDto();
			departmentDto deptdto =new departmentDto();
			productDAO pdao = sqlsession.getMapper(productDAO.class);
			
			if(session.getAttribute("type").equals("user")) {
				data.put("uidx",idx);
				data.put("pdidx",0);
				udto =  pdao.getUserInfo(idx);
			} else {
				data.put("uidx",0);
				data.put("pdidx",idx);
				deptdto = pdao.getDeptInfo(idx);
			}
					
			
			orderListDto odto = pdao.orderList(data);
			Map<String, Integer> op = pdao.buy_total_price(bidx);
			System.out.println(op);
			String total_price =op.get("TOTAL_PRICE")+"";
			
			int point = total_price.length()%3;
			String str= total_price.substring(0,point);
			
			while(point <total_price.length()){ 
				if( str !=""){
					str +=",";
				}
				str +=total_price.substring(point, point+3);
				point+=3;
			}
			
			ArrayList<buys_optionDto> options = pdao.getBuy_options(bidx);
			
			model.addAttribute("udto", udto);
			model.addAttribute("deptdto", deptdto);
			model.addAttribute("odto", odto);
			model.addAttribute("total_price", str);
			model.addAttribute("total_count", op.get("BOCOUNT"));
			model.addAttribute("options", options);
			return "product/buy/buysuccess";
		}
		
	}
	@GetMapping("product/buy/login")
	public String login(HttpServletRequest req,Model model) {
		model.addAttribute("type", req.getParameter("type"));
		return "login/PopupLogin";
	}
	@PostMapping("product/buy/loginchk")
	@ResponseBody
	public String loginchk(HttpServletRequest req) {
		
		String id= req.getParameter("id");
		String pw= req.getParameter("pw");
		String type =req.getParameter("type");
		
		loginDAO ldao = sqlsession.getMapper(loginDAO.class);
		String result =null;
		if(type.equals("user")) {
			userDto udto =new userDto();
			udto = ldao.userloginchk(id, pw);
			System.out.println(udto);
			if (udto != null && !(udto.getShow().toLowerCase().equals("n"))) {
				req.getSession().setAttribute("idx", udto.getuIdx());
				req.getSession().setAttribute("id", udto.getuSerid());
				req.getSession().setAttribute("pw", udto.getuPw());
				req.getSession().setAttribute("name", udto.getuName());
				req.getSession().setAttribute("point", udto.getuPoint());
				req.getSession().setAttribute("type", type);
				result = "1";
			} else {
				result ="0";
			}
		} else {
			departmentDto deptDTO =new departmentDto();
			deptDTO.setdId(id);
			deptDTO.setdPw(pw);
			
			departmentDto resultDTO =ldao.deptloginchk(deptDTO);
			if (resultDTO != null && !(resultDTO.getShow().toLowerCase().equals("n"))) {
				req.getSession().setAttribute("idx", resultDTO.getdIdx());
				req.getSession().setAttribute("id", resultDTO.getdId());
				req.getSession().setAttribute("pw", resultDTO.getdPw());
				req.getSession().setAttribute("name", resultDTO.getdName());
				req.getSession().setAttribute("point", resultDTO.getdPoint());
				req.getSession().setAttribute("type", type);
				req.getSession().setAttribute("buysell",  resultDTO.getdType());
				result = "1";
			} else {
				result ="0";
			}
		}
		System.out.println(req.getSession().getAttribute("idx"));
		System.out.println(req.getSession().getAttribute("buysell"));
		
		return result;
	}
	@PostMapping("product/insert_cart")
	public String insert_cart(HttpServletRequest req,Model model) throws ParseException {
		
		HttpSession session =req.getSession();
		int pIdx = Integer.parseInt(req.getParameter("pIdx"));
		
		String option_arr = req.getParameter("selected_option");
		JSONParser parser = new JSONParser();
		JSONArray arr= (JSONArray) parser.parse(option_arr);
		
		String idx = (Integer) session.getAttribute("idx")+"";
		String type =(String) session.getAttribute("type");
		
		productDAO pdao = sqlsession.getMapper(productDAO.class);
		
		Map<String, Object> cart =  new HashMap<String, Object>();
		cart.put("pidx",pIdx);
		
		if(type.equals("user")) {
			cart.put("uidx", idx);
			cart.put("didx", 0);
		} else {
			cart.put("uidx", 0);
			cart.put("didx", idx);
		}
		for(int i=0; i<arr.size(); i++) {
			JSONObject obj = (JSONObject) arr.get(i);
			Map<String,Object> cart_op =new HashMap<String, Object>();
			
			cart_op.put("pidx", pIdx);
			cart_op.put("uidx",cart.get("uidx"));
			cart_op.put("didx",cart.get("didx"));
			cart_op.put("cname",(String) obj.get("poname"));
			cart_op.put("cprice",(String) obj.get("poprice"));
			cart_op.put("ctotal_count",(Long) obj.get("count"));
			
			int result =pdao.insert_cart(cart_op);
			
		}
				
		
		return "redirect:/my/myCartList";
		
	}
	@GetMapping("product/orderList")
	public String orderList(HttpServletRequest req,Model model) {
		
		HttpSession session =req.getSession();
		if(session.getAttribute("idx") !=null) {
			if(session.getAttribute("buysell").equals("sell")) {
				model.addAttribute("req", req);
				command=new my_product_orderList();
				command.execute(sqlsession, model);
			}
			   
			return "product/dept_orderList";  
		} else {
			return "redirect:/login";
		}
      
	}    
	@GetMapping("product/Excel_file") 
	public String insert_posNum(HttpServletRequest req,Model model) {
		
		HttpSession session =req.getSession();
		if(session.getAttribute("idx") !=null) {
			if(session.getAttribute("buysell").equals("sell")) {
				model.addAttribute("req", req);
				command = new Excel_fileCommand();
				command.execute(sqlsession, model);
			}
			return "product/Excel_file_list"; 
		} else {
			return "redirect:/login";
		}
	} 
	@PostMapping("product/Dept_list_show")
	public String Dept_List_show(HttpServletRequest req,Model model) {
		
		HttpSession session =req.getSession();
		if(session.getAttribute("idx") !=null) {
			if(session.getAttribute("buysell").equals("sell")) {
				model.addAttribute("req", req);
				command =new dept_list_showCommand();
				command.execute(sqlsession, model);
			}
			return "product/Excel_file_list_selected"; 
		} else {
			return "redirect:/login";
		}
	}
}
