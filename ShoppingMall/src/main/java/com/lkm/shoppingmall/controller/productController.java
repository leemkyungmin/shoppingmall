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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lkm.shoppingmall.command.product.Update_myproduct;
import com.lkm.shoppingmall.command.product.myproductCommand;
import com.lkm.shoppingmall.command.product.myproductinfoCommand;
import com.lkm.shoppingmall.command.product.selectproduct;
import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.productDAO;
import com.lkm.shoppingmall.dto.departmentDto;
import com.lkm.shoppingmall.dto.product_optionDto;
import com.lkm.shoppingmall.dto.productsDto;
import com.lkm.shoppingmall.dto.userDto;

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
					System.out.println(realPath);
					File directory = new File(realPath);
					System.out.println(directory);
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
	
	
	
	@RequestMapping(value="product/buy/kakaopay",method=RequestMethod.POST)
	public String kakaopay(HttpServletRequest req) throws Exception {
		
		String name = req.getParameter("Name");
		String seller = req.getParameter("seller");
		String options =req.getParameter("options");
		String total_price =req.getParameter("total_price");
		String req_option =req.getParameter("req_option");
		
		Map<String,Object> map = new HashMap<>();
		map.put("name",name);
		map.put("seller",seller);
		map.put("options",options);
		map.put("total_price",total_price);
		map.put("req_option",req_option);
		
		
		return "redirect:"+com.lkm.shoppingmall.commom.kakaopay.kakaoPayReady(map);
	}
	@RequestMapping(value="product/buy/kakaoPaySuccess",method=RequestMethod.GET)
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
       System.out.println("pg토큰:"+pg_token);
        
    }
	
}
