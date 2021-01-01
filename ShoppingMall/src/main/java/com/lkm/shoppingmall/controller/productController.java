package com.lkm.shoppingmall.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lkm.shoppingmall.command.product.myproductCommand;
import com.lkm.shoppingmall.commom.command;

@Controller
public class productController {

	@Autowired
	private SqlSession sqlsession;
	private command command;
	
	@RequestMapping("product/myproduct")
	public String myproducts(HttpServletRequest req,Model model) {
		HttpSession session =req.getSession();
		
		if(session.getAttribute("idx") !=null) {
			if(session.getAttribute("buysell").equals("sell")) {
				model.addAttribute("req", req);
				command = new myproductCommand();
				command.execute(sqlsession, model);
				return "product/myproduct";
			} else {
				return "redirect:/index";
			} 
		} else {
			return "redirect:/index";
		}
	}
	
	@RequestMapping("product/newProductsForm")
	public String newProduct(HttpServletRequest req,Model model) {
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("idx")==null) {
			return "redirect:/index";
		} else {
			String buysell = (String) session.getAttribute("buysell");
			if(buysell ==null) {
				return "redirect:/index";
			} else {
				return "product/newProductsForm";
			}
		}
		
	}
}
