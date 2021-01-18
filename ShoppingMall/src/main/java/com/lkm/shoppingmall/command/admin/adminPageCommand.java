package com.lkm.shoppingmall.command.admin;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.adminDAO;
import com.lkm.shoppingmall.dto.AdminNotice;

public class adminPageCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
	
		ArrayList<AdminNotice> alist = new ArrayList<AdminNotice>();
		
		adminDAO adao = sqlSession.getMapper(adminDAO.class);
		
		alist =adao.getNotice();
		
		model.addAttribute("alist",alist);
		
	}

}
