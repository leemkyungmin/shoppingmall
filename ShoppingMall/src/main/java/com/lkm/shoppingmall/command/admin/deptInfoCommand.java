package com.lkm.shoppingmall.command.admin;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.adminDAO;
import com.lkm.shoppingmall.dto.departmentDto;

public class deptInfoCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
	
		ArrayList<departmentDto> deptlist = new ArrayList<departmentDto>();
		
		adminDAO adao = sqlSession.getMapper(adminDAO.class);
		
		deptlist =  adao.getDeptinfo();
		
		model.addAttribute("deptlist", deptlist);
		

	}

}
