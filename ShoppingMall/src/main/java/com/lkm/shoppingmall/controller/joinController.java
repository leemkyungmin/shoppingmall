package com.lkm.shoppingmall.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class joinController {

	//회원 가입 페이지 이동
	@RequestMapping("registerForm")
	public String goregister(HttpServletRequest req,Model model) {
			 
		String type =req.getParameter("type"); 	
		model.addAttribute("type", type);
		return "join/registerForm";
	}
	// 일반 회원
	// 약관 동의 페이지
	@RequestMapping("userRegisterForm")
	public String register() {
		return "join/join_user_Conditions";
	}
}
