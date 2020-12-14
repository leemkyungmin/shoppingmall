package com.lkm.shoppingmall.command;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.indexDAO;
import com.lkm.shoppingmall.dto.*;

public class indexCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		try {
			indexDAO idao =  sqlSession.getMapper(indexDAO.class);
			ArrayList<bannerDto> bdto = idao.getbanner();
			model.addAttribute("bdto",bdto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
