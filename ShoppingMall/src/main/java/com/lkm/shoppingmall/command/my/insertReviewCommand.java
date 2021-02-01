package com.lkm.shoppingmall.command.my;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.myDAO;

public class insertReviewCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpSession session = req.getSession();
		

		String content =req.getParameter("contents");
		String point =req.getParameter("point");
		String idx = (Integer)session.getAttribute("idx")+"";
		String name = (String) session.getAttribute("name");
		String bidx = req.getParameter("bidx");
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("content",content);
		data.put("point",point);
		data.put("name",name);
		data.put("bidx",bidx);
		
		myDAO mdao =sqlSession.getMapper(myDAO.class);
		
		int result = mdao.insertReview(data);
		
	}

}
