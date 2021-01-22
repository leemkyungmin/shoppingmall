package com.lkm.shoppingmall.command.product;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.productDAO;
import com.lkm.shoppingmall.dto.Dept_OrderList_ToFile;

public class my_product_orderList implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String,Object> map = model.asMap();
		
		HttpServletRequest req =(HttpServletRequest) map.get("req");
		HttpSession session =req.getSession();
		productDAO pdao = sqlSession.getMapper(productDAO.class);
		String didx = (Integer) session.getAttribute("idx")+"";
		
		ArrayList<Dept_OrderList_ToFile> dolist = new ArrayList<Dept_OrderList_ToFile>();
		dolist = pdao.getFile(didx);
		model.addAttribute("dolist",dolist);
		
	
	}

}
