package com.lkm.shoppingmall.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.indexDAO;
import com.lkm.shoppingmall.dto.searchDto;

public class searchCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map =model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		String query =req.getParameter("search-item");

		indexDAO IDAO = sqlSession.getMapper(indexDAO.class);
		ArrayList<searchDto> sdto = IDAO.searchResult(query);
		
		model.addAttribute("sdto",sdto);
		model.addAttribute("query",query);
		
	}

}
