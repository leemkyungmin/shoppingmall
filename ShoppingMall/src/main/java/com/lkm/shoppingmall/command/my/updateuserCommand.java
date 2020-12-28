package com.lkm.shoppingmall.command.my;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.myDAO;
import com.lkm.shoppingmall.dto.departmentDto;
import com.lkm.shoppingmall.dto.userDto;

public class updateuserCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String,Object> map =model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpSession session = req.getSession();
		myDAO mDAO = sqlSession.getMapper(myDAO.class);
		String idx =null;
		
		userDto udto =new userDto();
		departmentDto deptdto = new departmentDto();
		
		idx =(Integer) session.getAttribute("idx")+"";
		if(session.getAttribute("type").equals("user")) {
			udto = mDAO.userInfo(idx);
		} else {
			deptdto =mDAO.deptInfo(idx);
		}
		model.addAttribute("udto", udto);
		model.addAttribute("deptdto",deptdto);

	}

}
