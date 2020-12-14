package com.lkm.shoppingmall.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.*;
import com.lkm.shoppingmall.dto.userDto;


@Controller
public class loginController {

	@Autowired
	private SqlSession sqlSession;
	private command command;
	
	//로그인 페이지 이동
	@RequestMapping("login")
	public String gologin(HttpServletRequest req,Model model) {
		
		return "login/loginPage";
	}
	
	//ajax 로그인	
	@RequestMapping(value="loginchk", method=RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	public String loginchk(HttpServletRequest request) {
		
		String uSerid = request.getParameter("uSerid");
		String uPw = request.getParameter("uPw");
		
		loginDAO ldao = sqlSession.getMapper(loginDAO.class);
		userDto udto =new userDto();
		udto = ldao.loginchk(uSerid, uPw);
		String result = "0";
		if (udto != null) {
			request.getSession().setAttribute("uSerid", udto.getuSerid());
			request.getSession().setAttribute("upw", udto.getuPw());
			request.getSession().setAttribute("uName", udto.getuSerName());
			result = "1";
		}
				 
		return result;
	}
	
	//ajax 로그아웃 (세션 삭제)
	//모든 세션 삭제 .invalidate();
	@RequestMapping("logout")
	public String logout(HttpServletRequest req ) {
		HttpSession session =req.getSession();
		System.out.println(session.getAttribute("uSerid"));
	
		session.invalidate();
						
		return "redirect:index";
	}
	
	
	
	 
	
}
