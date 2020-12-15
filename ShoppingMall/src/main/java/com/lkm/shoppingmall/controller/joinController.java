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
	
	//약관 동의 페이지1 
	@RequestMapping("agree01")
	public String memberagree01() {
		
		return "join/member/agree01";
	}
	//약관 동의 페이지2 
	@RequestMapping("agree02")
	public String memberagree02() {
		
		return "join/member/agree02";
	}
	//약관 동의 페이지3 
	@RequestMapping("agree03")
	public String memberagree03() {
		
		return "join/member/agree03";
	}
	//약관 동의 페이지4 
	@RequestMapping("agree04")
	public String memberagree04() {
		
		return "join/member/agree04";
	}
	//약관 동의 페이지2 
	@RequestMapping("agree05")
	public String memberagree05() {
		
		return "join/member/agree05";
	}
}
