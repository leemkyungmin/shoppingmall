package com.lkm.shoppingmall.command.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.adminDAO;
import com.lkm.shoppingmall.dto.PopupNoticeDto;

public class popupDetailCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		
		Map<String,Object> map = model.asMap();
		
		HttpServletRequest req=  (HttpServletRequest) map.get("req");
	
		String popidx = req.getParameter("popidx");
		
		adminDAO adao = sqlSession.getMapper(adminDAO.class);
		
		PopupNoticeDto popdto = new PopupNoticeDto();
		
		popdto = adao.popup_Detail(popidx);
		
		model.addAttribute("popdto", popdto);
		
	}

}
