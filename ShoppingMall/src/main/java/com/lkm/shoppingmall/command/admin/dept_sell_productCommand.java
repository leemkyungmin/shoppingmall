package com.lkm.shoppingmall.command.admin;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.adminDAO;
import com.lkm.shoppingmall.dto.productsDto;

public class dept_sell_productCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String,Object> map = model.asMap();
		
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		adminDAO adao = sqlSession.getMapper(adminDAO.class);
		String didx = req.getParameter("didx");
		System.out.println(didx);
		ArrayList<productsDto> plist =  new ArrayList<productsDto>();
		plist = adao.getproduct_list(didx);
		
		model.addAttribute("plist",plist);
	}

}
