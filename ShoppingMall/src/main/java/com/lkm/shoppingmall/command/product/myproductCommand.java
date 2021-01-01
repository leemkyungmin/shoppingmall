package com.lkm.shoppingmall.command.product;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.productDAO;
import com.lkm.shoppingmall.dto.myproduct;
import com.lkm.shoppingmall.dto.productsDto;

public class myproductCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String,Object> map = model.asMap();
		
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpSession session =req.getSession();
		String idx = (Integer)session.getAttribute("idx")+"";
		productDAO pdao = sqlSession.getMapper(productDAO.class);
		ArrayList<productsDto> myplist =pdao.mylist(idx);
		model.addAttribute("myplist", myplist);
		

	}

}
