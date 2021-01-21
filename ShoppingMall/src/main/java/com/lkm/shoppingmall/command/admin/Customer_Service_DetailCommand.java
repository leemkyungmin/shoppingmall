package com.lkm.shoppingmall.command.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.adminDAO;
import com.lkm.shoppingmall.dto.CustomerServiceDto;
import com.lkm.shoppingmall.dto.customer_service_reviewDto;

public class Customer_Service_DetailCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String,Object> map = model.asMap();
		
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		String cidx =req.getParameter("cidx");
		
		adminDAO adao = sqlSession.getMapper(adminDAO.class);
		CustomerServiceDto csdto = new CustomerServiceDto();
		customer_service_reviewDto csrdto = new customer_service_reviewDto();
		csrdto=adao.customer_service_review(cidx);
		csdto =adao.customer_service_detail(cidx);
		model.addAttribute("csdto",csdto);  
		model.addAttribute("csrdto", csrdto);
	}

}
