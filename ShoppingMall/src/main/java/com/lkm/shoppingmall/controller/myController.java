package com.lkm.shoppingmall.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
import com.lkm.shoppingmall.command.my.CsutomerSvcCommand;
import com.lkm.shoppingmall.command.my.customer_svc_write;
import com.lkm.shoppingmall.command.my.updateuserCommand;
import com.lkm.shoppingmall.commom.CartKakaopay;
import com.lkm.shoppingmall.commom.Kakaopay;
import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.myDAO;
import com.lkm.shoppingmall.dto.CartListDto;

import lombok.Setter;

@Controller
public class myController {

	@Autowired
	private SqlSession sqlsession;
	private command command;
	
	@RequestMapping("my/CustomerService")
	public String customerService(HttpServletRequest req, Model model) {
		
		HttpSession session =req.getSession();
		
		if(session.getAttribute("idx") ==null) {
			return "redirect:/login";
		} else {
			model.addAttribute("req", req);
			command =new CsutomerSvcCommand();
			command.execute(sqlsession, model);
			return "my/CustomerService";
		}
		
	}
	@RequestMapping("my/confirmPassword")
	public String confirmPassword(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		
		if( session.getAttribute("idx") ==null) {
			return "redirect:/login";
		}else {
			return "my/confirmPassword";
		}
		
	}
	@RequestMapping("my/myPage")
	public String myPage(HttpServletRequest req,Model model) {
		
		HttpSession session = req.getSession();
		if( session.getAttribute("idx") ==null) {
			return "redirect:/login";
		}else {
			model.addAttribute("req", req);
			command =new updateuserCommand();
			command.execute(sqlsession, model);
			return "my/myPage";
		}
	}
	
	@RequestMapping(value ="my/pwChk",method=RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	public String pwChk(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(req.getParameter("pw").equals(session.getAttribute("pw"))) {
			return "1";
		}else {
			return "0";
		}
	}
	@RequestMapping("my/UpdatePwForm")
	public String updatepwForm() {
		return "my/UpdatePwForm";
	}
	@RequestMapping(value="my/updatepw",method=RequestMethod.POST,produces ="text/html; charset=utf-8")
	@ResponseBody
	public String updatepw(HttpServletRequest req,Model model) {
		
		HttpSession session = req.getSession();
		
		String old_pw = req.getParameter("old_pw");
		String new_pw = req.getParameter("new_pw");
		
		int result=0;
		myDAO mDAO = sqlsession.getMapper(myDAO.class);
		
		if(session.getAttribute("type").equals("user")) {
			result =mDAO.UpdateUserPw(old_pw, new_pw);
		} else {
			result =mDAO.UpdateDeptPw(old_pw, new_pw);
		}
		
		if(result ==1) {
			session.removeAttribute("pw");
			session.setAttribute("pw",new_pw);
		}
		
		return result+"";
		
	}
	
	@RequestMapping(value="my/userUpdate",method=RequestMethod.POST,produces="test/html; charset=utf-8")
	@ResponseBody
	public String updateUser(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		String idx = (Integer) session.getAttribute("idx")+"";
		myDAO mdao = sqlsession.getMapper(myDAO.class);
		Map<String,Object> query = new HashMap<String, Object>();
		int result =0;
		if(idx ==null) {
			result =-1;
		} else {
			String uEmail = req.getParameter("uEmail");
			String uPhone =req.getParameter("uPhone");
			query.put("uEmail",uEmail);
			query.put("uPhone",uPhone);
			query.put("uIdx",idx);
			result = mdao.updateUser(query);
		}
		
		return result+"";
		
	}
	@RequestMapping("my/deleteuser")
	public String delete(HttpServletRequest req,Model model) {
		HttpSession session =req.getSession();
		
		if(session.getAttribute("idx") ==null) {
			return "redirect:/login";
		} else {
			return "my/deleteuser";
		}
		
	}
	@RequestMapping(value="my/deletecheck",method =RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	public String deleteusers(HttpServletRequest req,Model model) {
		
		HttpSession session = req.getSession();
		myDAO mdao = sqlsession.getMapper(myDAO.class);
		Map<String,Object> query = new HashMap<String, Object>();
		int result =0;
		if(session.getAttribute("idx") ==null) {
			result =-1;
		} else {
			String pw =req.getParameter("pw");
			String idx= session.getAttribute("idx")+"";
			query.put("idx",idx);
			query.put("pw",pw);
			if(session.getAttribute("type").equals("user")) {
				result =mdao.deleteUser(query);
			} else {
				result =mdao.deleteDept(query);
			}
			
		}
		if(result >0) {
			session.invalidate();
		}
		return result+"";
		
	}
	
	@RequestMapping("my/Write-Customer-Service")
	public String write_customer_svc() {
		return "my/Write_Customer_Service";
	}
	
	@RequestMapping(value="my/profileImage",method=RequestMethod.POST,produces = "text/html; charset=utf-8")
	@ResponseBody
	public String uploadSummernoteImageFile(MultipartHttpServletRequest  mr) {
		MultipartFile list =mr.getFile("file");
		String saveFilename = null;
		File saveFile =null;
		if(!list.isEmpty()) {
			String originFilename  =list.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf(".")+1);
			
			
			try {
				saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) +
						"_" +
						System.currentTimeMillis() +
						"." + extName;
				String realPath = mr.getSession().getServletContext().getRealPath("/resources/images/summernote");
				System.out.println(realPath);
				File directory = new File(realPath);
				
				if ( !directory.exists() ) {
					System.out.println("11111");
					
					directory.mkdirs();
				}
				saveFile = new File(realPath, saveFilename);
				list.transferTo(saveFile);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		System.out.println(saveFilename);
		return saveFilename;
	}
	
	@RequestMapping(value ="my/upload_customer_svc",method=RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	public String upload_customer_svc(HttpServletRequest req,Model model) {
		
		HttpSession session = req.getSession();
		Map<String,Object> query = new HashMap<String, Object>();
		myDAO mdao = sqlsession.getMapper(myDAO.class);
		int result =0;
		if(session.getAttribute("idx") ==null) {
			result =-1;
		} else {
			String idx =(Integer)session.getAttribute("idx")+"";
			query.put("idx", idx);
			query.put("cTitle", req.getParameter("cTitle"));
			query.put("cContent",req.getParameter("cContent"));
			query.put("cType",req.getParameter("cType"));
			if(session.getAttribute("type").equals("user")) {
				result = mdao.user_customer_svc(query);
			} else {
				result =mdao.dept_customer_svc(query);
			}
		}
		
		return result+"";
	}
	
	@RequestMapping(value="my/custom_svc/{cIdx}",method=RequestMethod.GET,produces=MediaType.APPLICATION_JSON_VALUE)
	public String getmySerivce(@PathVariable("cIdx") String cIdx,Model model) {
		
		model.addAttribute("cIdx", cIdx);
		command=new customer_svc_write();
		command.execute(sqlsession, model);
		return "my/custom_show_my_write_view";
	}
	
	@RequestMapping(value="my/update_custom_svc",method=RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	public String updateCustomer_svc(HttpServletRequest req) {
		
		String cType =req.getParameter("cType");
		String cTitle=req.getParameter("cTitle");
		String cContent =req.getParameter("cContent");
		String cIdx =req.getParameter("cIdx");
		
		Map<String,Object> query = new HashMap<String, Object>();
		query.put("cType", cType);
		query.put("cTitle", cTitle);
		query.put("cContent", cContent);
		query.put("cIdx", cIdx);
		
		myDAO mdao = sqlsession.getMapper(myDAO.class);
		
		int result =mdao.update_custeomr_svc(query);
		
		return result+"";
		
	}
	@RequestMapping("my/myCartList")
	public String myCartList(HttpServletRequest req,Model model) {
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("idx") ==null) {
			return "redirect:/login";
		}
		else {
			Map<String,Object> cart = new HashMap<String, Object>();
			String idx = (Integer) session.getAttribute("idx")+"";
			if(session.getAttribute("type").equals("user")) {
				cart.put("uidx",idx);
				cart.put("didx",0);
			} else {
				cart.put("uidx",0);
				cart.put("didx",idx);
			}
			
			myDAO mdao = sqlsession.getMapper(myDAO.class);
			ArrayList<CartListDto> cdto =mdao.get_myCart(cart);
			model.addAttribute("cdto", cdto);
			
			return "my/myCartList";
		}
		
	}
	@PostMapping("my/update_cart_count")
	@ResponseBody
	public String update_cart_count(HttpServletRequest req) {
		
		String cIdx= req.getParameter("cIdx");
		String count =req.getParameter("count");
		
		Map<String, Object> cart = new HashMap<String, Object>();
		cart.put("cidx",cIdx);
		cart.put("count",count);
		
		myDAO mdao = sqlsession.getMapper(myDAO.class);
		
		int result = mdao.update_cart_count(cart);
		
		return result+"";
	}
	
	@Setter(onMethod_ = @Autowired)
    private CartKakaopay kakaopay;
	
	@PostMapping("/my/cart/kakaopay")
	@ResponseBody
	public String kakaopay(HttpServletRequest req) throws Exception {
		
		String name = req.getParameter("Name");
		String seller = req.getParameter("seller");
		String options =req.getParameter("options");
		String total_price =req.getParameter("total_price");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("name",name);
		map.put("seller",seller);
		map.put("options",options);
		map.put("total_price",total_price);
		return kakaopay.kakaoPayReady(map);
	}
	
	@GetMapping("my/cart/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) { 
       System.out.println("pg토큰:"+pg_token);
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
    }
	
	
	@PostMapping("my/cart/insert")
	@ResponseBody
	public void insert_cart(HttpServletRequest req) throws ParseException {
		
		HttpSession session = req.getSession();
		String total_price =req.getParameter("total_price");
		String border_num =req.getParameter("border_num");
		String options =req.getParameter("options");
		String border_status =req.getParameter("border_status");
	
		JSONParser parser =new JSONParser();
		
		JSONArray arr =(JSONArray) parser.parse(options);
		System.out.println(arr);
		ArrayList<String> pidx_list = new ArrayList<String>();
		
		for(int i=0; i<arr.size(); i++) {
			JSONObject obj = (JSONObject) arr.get(i);
			System.out.println(obj.get("poidx"));
			if(!pidx_list.contains(obj.get("poidx")+"")) {
				pidx_list.add(obj.get("poidx")+"");
			}
		}
		myDAO mdao =sqlsession.getMapper(myDAO.class);
		System.out.println(pidx_list);
		for(int i=0; i<pidx_list.size(); i++) {
			
			Map<String,Object> buys = new HashMap<String, Object>();
			buys.put("pidx", pidx_list.get(i));
			buys.put("border_num", border_num);
			buys.put("border_ment", "도착하기전에 연락주세요");
			buys.put("border_status", 2);
			String idx =(Integer)session.getAttribute("idx")+"";
			if(session.getAttribute("type").equals("user")) {
				buys.put("uidx",idx);
				buys.put("pdidx",0);
			} else {
				buys.put("uidx",0);
				buys.put("pdidx",idx);
			}
			
			int price =0; 
			Map<String, Object> buys_options = new HashMap<String, Object>();
			for(int j=0; j<arr.size(); j++) {
				JSONObject obj = (JSONObject) arr.get(j);
				
				if(pidx_list.get(i).equals(obj.get("poidx")+"")) {
					int poprice = Integer.parseInt(obj.get("poprice").toString());
					int count =Integer.parseInt(obj.get("count").toString()); 
					price  +=poprice*count;
					System.out.println(price);
					
				}
			}
			buys.put("total_price", price);
			mdao.insert_buy(buys);
			System.out.println(buys.get("bidx"));
			for(int j=0; j<arr.size(); j++) {
				JSONObject obj = (JSONObject) arr.get(j);
				
				if(pidx_list.get(i).equals(obj.get("poidx").toString())) {
					buys_options.put("bidx", buys.get("bidx"));
					buys_options.put("boname", obj.get("poname").toString());
					buys_options.put("boprice", obj.get("poprice").toString());
					buys_options.put("count", obj.get("count").toString());
					mdao.buy_option(buys_options);
					mdao.delete_cart((String) obj.get("cidx").toString()); 
				}
			}
		}

	}
}
