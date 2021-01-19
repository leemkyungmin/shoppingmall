package com.lkm.shoppingmall.command.admin;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.adminDAO;
import com.lkm.shoppingmall.dto.PopupNoticeDto;
import com.lkm.shoppingmall.dto.bannerDto;

public class adminHomePageControllCommand  implements command{

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		ArrayList<bannerDto> blist =  new ArrayList<bannerDto>();
		ArrayList<PopupNoticeDto> popuplist = new ArrayList<PopupNoticeDto>();
		
		adminDAO adao = sqlSession.getMapper(adminDAO.class);
		
		blist =adao.getBanner();
		popuplist = adao.getpopupnotice();
		
		model.addAttribute("blist",blist);
		model.addAttribute("popuplist",popuplist);
		
		
	}

	
}
