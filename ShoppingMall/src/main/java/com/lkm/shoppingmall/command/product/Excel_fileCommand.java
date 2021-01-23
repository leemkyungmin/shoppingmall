package com.lkm.shoppingmall.command.product;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.productDAO;
import com.lkm.shoppingmall.dto.Excel_FileDto;

public class Excel_fileCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model)  {
		
		productDAO pdao = sqlSession.getMapper(productDAO.class);
		Map<String,Object> map = model.asMap();
		HttpServletRequest req =  (HttpServletRequest) map.get("req");
		HttpSession session = req.getSession();
		String didx = (Integer)session.getAttribute("idx")+"";
		
		String stDay ="";
		String endDay="";
		Date date =new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal =Calendar.getInstance();
		// 처음 페이지 열릴시 오늘 날짜로 설정 
		if(req.getParameter("stDay") ==null) {
			
			stDay = sdf.format(date);
			//endDay 오늘 날짜 +1 
			
			cal.setTime(date);
			cal.add(Calendar.DATE,1);
			
			endDay = sdf.format(cal.getTime());
			
		} else {
			stDay  =req.getParameter("stDay");
			endDay  =req.getParameter("endDay");
			try {
				date = sdf.parse(endDay);
				
				cal.setTime(date);
				cal.add(Calendar.DATE, 1);
				endDay = sdf.format(cal.getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
		
		}
		
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("didx",didx);
		data.put("stDay",stDay);
		data.put("endDay",endDay);
	
		
		ArrayList<Excel_FileDto> eflist = new ArrayList<Excel_FileDto>();
		eflist =pdao.getFileList(data);
		
		model.addAttribute("eflist",eflist);
		model.addAttribute("stDay",stDay);
		model.addAttribute("endDay",endDay);
		
	}
	
	
}
