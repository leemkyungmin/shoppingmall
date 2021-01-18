package com.lkm.shoppingmall.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lkm.shoppingmall.command.admin.adminPageCommand;
import com.lkm.shoppingmall.command.admin.user_buyListCommand;
import com.lkm.shoppingmall.command.admin.user_customerListCommand;
import com.lkm.shoppingmall.command.admin.user_reviewListCommand;
import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.adminDAO;
import com.lkm.shoppingmall.dto.AdminNotice;
import com.lkm.shoppingmall.dto.userDto;

@Controller
public class adminContrroller {

	
	@Autowired
	private SqlSession sqlsession;
	private command command;
	
	@RequestMapping("admin/adminPage")
	public String adminOnly(HttpServletRequest req,Model model) {
		HttpSession  session = req.getSession();
		
		if(session.getAttribute("idx")  !=null) {
			String type =(String) session.getAttribute("type");
			int grade =Integer.parseInt( (String) session.getAttribute("grade"));
			if( type !=null && type.equals("user") && grade >=9 ) {
				
				command = new adminPageCommand();
				command.execute(sqlsession, model);
				
				return "admin/adminPage";
			} else {
				return "redirect:/index";
			}
		}else {
			return "redirect:/index";
		}

		
	}
	
	@GetMapping("admin/adminNotice_Detail")
	public String Notice_Detail(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		
	
		
		if(session.getAttribute("idx")  !=null) {
			int grade =Integer.parseInt( (String) session.getAttribute("grade"));
			if(grade >=9 ) {
				String aidx =req.getParameter("aidx");
				AdminNotice an = new AdminNotice();
				adminDAO adao = sqlsession.getMapper(adminDAO.class);
				an = adao.getDetail(aidx);
				model.addAttribute("an", an);
				return "admin/Notice_Detail";
			} else {
				return "";
			}
			
			
		} else {
			return "";
		}
		
	}
	@RequestMapping("admin/UserInfo")
	public String userInfo(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		
		adminDAO adao = sqlsession.getMapper(adminDAO.class);
		
		if(Integer.parseInt( (String) session.getAttribute("grade")) ==9) {
			ArrayList<userDto> ulist =new ArrayList<userDto>();
			ulist =adao.getUserInfo();
			model.addAttribute("ulist", ulist);

		} 
		return "admin/UserInfo";
		
	}
	@RequestMapping("admin/user_Detail")
	public String userDetail(HttpServletRequest req,Model model) {
		
		HttpSession session = req.getSession();
		adminDAO adao = sqlsession.getMapper(adminDAO.class);
		if(Integer.parseInt( (String) session.getAttribute("grade")) ==9) {
			userDto udto = new userDto();
			String uidx = req.getParameter("uidx");
			udto = adao.UserDetail(uidx);
			
			model.addAttribute("udto", udto); 
		} 
		
		return "admin/userDetail";
		
	}
	@GetMapping("admin/usercontroll/user_buys")
	public String user_buys(HttpServletRequest req,Model model) {
		
		model.addAttribute("req", req);
		
		command = new user_buyListCommand(); 
		command.execute(sqlsession, model); 
		
		
		return "admin/userControll/user_info";
	}
	@GetMapping("admin/usercontroll/user_review")
	public String user_review(HttpServletRequest req,Model model) {
		
		model.addAttribute("req", req);
		
		command = new user_reviewListCommand();
		command.execute(sqlsession, model);
				
		return "admin/userControll/user_info";
	}
	@GetMapping("admin/usercontroll/user_customer_svc")
	public String user_customer_svc(HttpServletRequest req,Model model) {
		
		model.addAttribute("req", req);
		command= new user_customerListCommand();
		command.execute(sqlsession, model);
		
		return "admin/userControll/user_info";
	}
	
	@PostMapping("admin/user_update")
	@ResponseBody
	public String user_update(HttpServletRequest req,Model model) {
		
		String uidx =req.getParameter("uidx");
		String grade =req.getParameter("grade");
		
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("uidx",uidx);
		data.put("grade",grade);
		
		adminDAO adao = sqlsession.getMapper(adminDAO.class);
		
		int result = adao.update_user(data);
		
		model.addAttribute("result", result);
		
		return result+"";
	}
	
}
