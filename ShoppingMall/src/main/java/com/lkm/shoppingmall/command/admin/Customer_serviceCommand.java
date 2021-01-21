package com.lkm.shoppingmall.command.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.adminDAO;
import com.lkm.shoppingmall.dto.CustomerServiceDto;


public class Customer_serviceCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req =  (HttpServletRequest) map.get("req");
		
		String cStatus;
		
		if(req.getParameter("cStatus") ==null) {
			cStatus="0";
		} else {
			cStatus= req.getParameter("cStatus");
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("cStatus", cStatus);
		
		adminDAO adao = sqlSession.getMapper(adminDAO.class);
		ArrayList<CustomerServiceDto> cslist = new ArrayList<CustomerServiceDto>();
		
		cslist =adao.cs_admin_list(data);
		
		model.addAttribute("cStatus", cStatus);
		model.addAttribute("cslist", cslist);
		
	}

}
