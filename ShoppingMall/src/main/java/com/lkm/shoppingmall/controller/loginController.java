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
		
		return "login/loginPage";
		
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
			
			if (udto != null && !(udto.getShow().toLowerCase().equals("n"))) {
				request.getSession().setAttribute("idx", udto.getuIdx());
				request.getSession().setAttribute("id", udto.getuSerid());
				request.getSession().setAttribute("pw", udto.getuPw());
				request.getSession().setAttribute("name", udto.getuName());
				request.getSession().setAttribute("point", udto.getuPoint());
				request.getSession().setAttribute("grade", udto.getuGrade());
				request.getSession().setAttribute("type", type);
				result = "1";
			} else {
				result ="0";
			}
		}else {
			String dId = request.getParameter("uSerid");
			String dPw = request.getParameter("uPw");
			departmentDto deptDTO =new departmentDto();
			loginDAO ldao =sqlSession.getMapper(loginDAO.class);
			deptDTO.setdId(dId);
			deptDTO.setdPw(dPw);
			
			departmentDto resultDTO =ldao.deptloginchk(deptDTO);
			System.out.println(resultDTO.getdType());
			if (resultDTO != null && !(resultDTO.getShow().toLowerCase().equals("n"))) {
				request.getSession().setAttribute("idx", resultDTO.getdIdx());
				request.getSession().setAttribute("id", resultDTO.getdId());
				request.getSession().setAttribute("pw", resultDTO.getdPw());
				request.getSession().setAttribute("name", resultDTO.getdName());
				request.getSession().setAttribute("point", resultDTO.getdPoint());
				request.getSession().setAttribute("type", type);
				request.getSession().setAttribute("buysell",  resultDTO.getdType());
				result = "1";
			} else {
				result ="0";
			}
						
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
						
		return "redirect:/index";
	}
	
	
	
	 
	
}
