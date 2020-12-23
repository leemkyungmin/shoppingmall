package com.lkm.shoppingmall.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lkm.shoppingmall.command.indexCommand;
import com.lkm.shoppingmall.command.searchCommand;
import com.lkm.shoppingmall.commom.command;



@Controller
public class indexController {

	@Autowired
	private SqlSession sqlSession;
	private command command;
	
	//index 페이지
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String mainPage(HttpServletRequest req,Model model) {
		
		command=new indexCommand();
		command.execute(sqlSession, model);
		
		return "index";
	}
	@RequestMapping(value="index",method=RequestMethod.GET)
	public String mainPage2(HttpServletRequest req,Model model) {
		
		command=new indexCommand();
		command.execute(sqlSession, model);
		
		return "index";
	}
	
	@RequestMapping(value="search",method=RequestMethod.GET)
	public String search(HttpServletRequest req,Model model) {
		model.addAttribute("req", req);
		command =new searchCommand();
		command.execute(sqlSession, model);
		return "searchPage";
	}
	
}
