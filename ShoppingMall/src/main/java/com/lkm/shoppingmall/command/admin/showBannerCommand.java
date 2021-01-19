package com.lkm.shoppingmall.command.admin;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.adminDAO;
import com.lkm.shoppingmall.dto.bannerDto;

public class showBannerCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String,Object> map = model.asMap();
		
		String bidx=  (String) map.get("bidx");
		bannerDto bdto = new bannerDto();
		adminDAO adao = sqlSession.getMapper(adminDAO.class);
		bdto = adao.showBanner(bidx);
		model.addAttribute("bdto", bdto); 
	}

	
	
}
