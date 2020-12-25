package com.lkm.shoppingmall.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lkm.shoppingmall.command.orderCommand;
import com.lkm.shoppingmall.commom.command;

@Controller
public class orderController {

	@Autowired
	private SqlSession sqlSession;
	private command command;

	@RequestMapping("order/OrderList")
	public String orderList(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		if(session.getAttribute("idx") !=null) {
			model.addAttribute("req", req);
			command =new orderCommand();
			command.execute(sqlSession, model);
			return "order/orderListPage"; 
		} else {
			return "redirect:/login"; 
		}
		
	}
}
