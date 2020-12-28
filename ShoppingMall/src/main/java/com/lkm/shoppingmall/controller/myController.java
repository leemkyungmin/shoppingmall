package com.lkm.shoppingmall.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lkm.shoppingmall.command.my.CsutomerSvcCommand;
import com.lkm.shoppingmall.command.my.updateuserCommand;
import com.lkm.shoppingmall.commom.command;

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
	
}
