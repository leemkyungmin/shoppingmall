package com.lkm.shoppingmall.command;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.OrderDAO;
import com.lkm.shoppingmall.dto.orderListDto;

public class orderCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String,Object> map =model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String stDay =req.getParameter("stDay");
		String endDay =req.getParameter("endDay");
		System.out.println("stDay : "+stDay);
		System.out.println("endDay : "+endDay);
		Date time = new Date();
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
		
		if(stDay == null && endDay == null) {
			
			Calendar ctime = Calendar.getInstance();
			ctime.add(Calendar.MONTH,-1);
			stDay =sdf.format(ctime.getTime());
			endDay =sdf.format(time);
		}
		
		
		
		String uSerid = "";
		String dId = "";
		
		ArrayList<orderListDto> uOrderList = new ArrayList<orderListDto>();
		
		HttpSession session =req.getSession();
		String type =(String) session.getAttribute("type");
		String idx = (Integer) session.getAttribute("idx")+"";
		System.out.println(idx);
		OrderDAO ODAO = sqlSession.getMapper(OrderDAO.class);
		if(type.equals("user")) {
			uSerid = (String) session.getAttribute("uSerid");
			uOrderList =ODAO.getOrderList(stDay, endDay,idx,"0");  
		}else {
			dId = (String) session.getAttribute("dId");
			uOrderList =ODAO.getOrderList(stDay, endDay,"0",idx); 
		}
		model.addAttribute("OrderList",uOrderList);
		model.addAttribute("years",sdf.format(time));
	}

}
