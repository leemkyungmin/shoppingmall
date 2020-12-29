package com.lkm.shoppingmall.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.JsonObject;
import com.lkm.shoppingmall.command.my.CsutomerSvcCommand;
import com.lkm.shoppingmall.command.my.updateuserCommand;
import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.myDAO;

@Controller
public class myController {

	@Autowired
	private SqlSession sqlsession;
	private command command;
	
	@RequestMapping("my/CustomerService")
	public String customerService(HttpServletRequest req, Model model) {
		
		HttpSession session =req.getSession();
		
		if(session.getAttribute("idx") ==null) {
			return "redirect:/lgoin";
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
	
	
	
}
