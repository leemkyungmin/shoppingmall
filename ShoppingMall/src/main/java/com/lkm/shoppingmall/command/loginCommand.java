package com.lkm.shoppingmall.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.loginDAO;
import com.lkm.shoppingmall.dto.userDto;

public class loginCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		//로그인 처리 
		Map<String,Object> map =model.asMap();
		HttpServletRequest req =(HttpServletRequest)map.get("request");
		String uSerid = req.getParameter("uSerid");
		String uPw = req.getParameter("uPw");
		
		loginDAO ldao = sqlSession.getMapper(loginDAO.class);
		ldao.loginchk(uSerid, uPw);
	}

}
