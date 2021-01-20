package com.lkm.shoppingmall.command.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.adminDAO;
import com.lkm.shoppingmall.dto.departmentDto;

public class deptDetailCommand  implements command{

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String,Object> map = model.asMap();
		adminDAO adao = sqlSession.getMapper(adminDAO.class);
		HttpServletRequest req= (HttpServletRequest) map.get("req");
		
		String didx = req.getParameter("didx");
		
		departmentDto deptdto = new departmentDto();
		deptdto = adao.getDeptDetail(didx);
		System.out.println(deptdto);
		model.addAttribute("deptdto", deptdto);

		
	}

	
}
