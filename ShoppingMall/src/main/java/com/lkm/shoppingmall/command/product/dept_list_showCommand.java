package com.lkm.shoppingmall.command.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.productDAO;
import com.lkm.shoppingmall.dto.Excel_FileDto;

public class dept_list_showCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String,Object> map = model.asMap();
		
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpSession session = req.getSession();
		productDAO pdao = sqlSession.getMapper(productDAO.class);
		String enDate = req.getParameter("enDate");
		String didx= (Integer)session.getAttribute("idx")+"";
		
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("didx",didx);
		data.put("enDate",enDate);
		
		ArrayList<Excel_FileDto> exlist = new ArrayList<Excel_FileDto>();
		exlist = pdao.excelFileList(data);
		
		model.addAttribute("exlist", exlist);
	}

}
