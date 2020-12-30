package com.lkm.shoppingmall.command.my;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.myDAO;
import com.lkm.shoppingmall.dto.CustomerServiceDto;
import com.lkm.shoppingmall.dto.customer_service_reviewDto;

public class customer_svc_write implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String,Object> map = model.asMap();
		String cIdx = (String) map.get("cIdx");
		myDAO mdao = sqlSession.getMapper(myDAO.class);
		
		CustomerServiceDto csdto = mdao.getService(cIdx);

		int cHit = csdto.getcHit()+1;
		mdao.updateHit(cHit, csdto.getcIdx());
		csdto.setcHit(cHit);
		
		customer_service_reviewDto csrdto = mdao.getReview(cIdx);
		
		model.addAttribute("csrdto",csrdto);
		model.addAttribute("csdto", csdto);
	}

}
