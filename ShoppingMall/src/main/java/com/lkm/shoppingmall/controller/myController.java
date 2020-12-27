package com.lkm.shoppingmall.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lkm.shoppingmall.commom.command;

@Controller
public class myController {

	@Autowired
	private SqlSession sqlSession;
	private command command;
	
	@RequestMapping("my/CustomerService")
	public String customerService(HttpServletRequest req, Model model) {
		
		HttpSession session =req.getSession();
		
		if(session.getAttribute("idx") ==null) {
			return "redirect:/index";
		} else {
			return "my/CustomerService";
		}
		
	}
}
