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
import com.lkm.shoppingmall.dto.departmentDto;
import com.lkm.shoppingmall.dto.userDto;


@Controller
public class loginController {

	@Autowired
	private SqlSession sqlSession;
	private command command;
	
	//로그인 페이지 이동
	@RequestMapping("login")
	public String gologin(HttpServletRequest req,Model model) {
		if(req.getSession().getAttribute("uSerid") !=null && req.getSession().getAttribute("dId") !=null) {
			return "login/loginPage";
		}else {
			return "redirect:index";
		}
		
	}
	
	//ajax 로그인	
	@RequestMapping(value="loginchk", method=RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	public String loginchk(HttpServletRequest request) {
		
		
		String type= request.getParameter("type");
		System.out.println(type);
		String result = "0";
		if(type.equals("user")) {
			String uSerid = request.getParameter("uSerid");
			String uPw = request.getParameter("uPw");
			loginDAO ldao = sqlSession.getMapper(loginDAO.class);
			userDto udto =new userDto();
			udto = ldao.userloginchk(uSerid, uPw);
			
			if (udto != null) {
				request.getSession().setAttribute("idx", udto.getuIdx());
				request.getSession().setAttribute("id", udto.getuSerid());
				request.getSession().setAttribute("pw", udto.getuPw());
				request.getSession().setAttribute("Name", udto.getuName());
				request.getSession().setAttribute("point", udto.getuPoint());
				request.getSession().setAttribute("type", type);
				result = "1";
			}
		}else {
			String dId = request.getParameter("uSerid");
			String dPw = request.getParameter("uPw");
			departmentDto deptDTO =new departmentDto();
			loginDAO ldao =sqlSession.getMapper(loginDAO.class);
			deptDTO.setdId(dId);
			deptDTO.setdPw(dPw);
			
			departmentDto resultDTO =ldao.deptloginchk(deptDTO);
			System.out.println(resultDTO.getdId());
			System.out.println(resultDTO.getdPw());
			if (resultDTO != null) {
				request.getSession().setAttribute("Idx", resultDTO.getdIdx());
				request.getSession().setAttribute("Id", resultDTO.getdId());
				request.getSession().setAttribute("Pw", resultDTO.getdPw());
				request.getSession().setAttribute("Name", resultDTO.getdName());
				request.getSession().setAttribute("point", resultDTO.getdPoint());
				request.getSession().setAttribute("type", type);
				result = "1";
			}
			System.out.println(request.getSession().getAttribute("dId"));
			
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
