package com.lkm.shoppingmall.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lkm.shoppingmall.command.uEmail_AuthCommand;
import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.joinDAO;

@Controller
public class joinController {

	
	@Autowired
	private SqlSession sqlSession;
	private command command;

	
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
		
		return "join/member/agree/agree02";
	}
	//약관 동의 페이지3 
	@RequestMapping("agree03")
	public String memberagree03() {
		
		return "join/member/agree/agree03";
	}
	//약관 동의 페이지4 
	@RequestMapping("agree04")
	public String memberagree04() {
		
		return "join/member/agree/agree04";
	}
	//약관 동의 페이지2 
	@RequestMapping("agree05")
	public String memberagree05() {
		
		return "join/member/agree/agree05";
	}
	//일반회원 정보 입력 페이지
	@RequestMapping("memberRegisterPage")
	public String memberRegister() {
		return "join/member/memberRegisterPage";
	}
	
	//아이디 중복체크 ajax
	@RequestMapping(value ="uIdcheck",method=RequestMethod.POST, produces="text/html; charset=utf-8")
	@ResponseBody
	public String uIdcheck(@RequestParam("uId") String uId) {
		joinDAO JDAO = sqlSession.getMapper(joinDAO.class);
		return JDAO.uIdcheck(uId)+"";
	}
	
	//이메일 인증 ajax
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "uEmail_Auth",method=RequestMethod.POST, produces="text/html; charset=utf-8")
	@ResponseBody
	public String uEmil_Auth(HttpServletRequest request,Model model) {
		
		model.addAttribute("request",request);	
		System.out.println("mail_Sender : "+mailSender);
		model.addAttribute("mailSender",mailSender);
		uEmail_AuthCommand auto_cmd = new uEmail_AuthCommand();
		
		return auto_cmd.execute(sqlSession, model);
	}
}
