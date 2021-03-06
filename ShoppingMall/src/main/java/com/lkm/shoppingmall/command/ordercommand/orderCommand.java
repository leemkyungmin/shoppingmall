package com.lkm.shoppingmall.command.ordercommand;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import com.lkm.shoppingmall.commom.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.PageMaker;
import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.OrderDAO;
import com.lkm.shoppingmall.dto.orderListDto;

public class orderCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String,Object> map =model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		Map<String,Object> result = new HashMap<String, Object>();
		
		String stDay =req.getParameter("stDay");
		String endDay =req.getParameter("endDay");
		String query =req.getParameter("query");
		Date time = new Date();
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
		
		if(stDay == null && endDay == null) {
			
			Calendar ctime = Calendar.getInstance();
			ctime.add(Calendar.MONTH,-1);
			ctime.add(Calendar.DATE, -1);
			stDay =sdf.format(ctime.getTime());
			Calendar etime =Calendar.getInstance();
			etime.add(Calendar.DATE, +1);
			endDay =sdf.format(etime.getTime());
			
		}
		if(query ==null) {
			query ="";
		}
		
		
		String uSerid = "";
		String dId = "";
		
		ArrayList<orderListDto> uOrderList = new ArrayList<orderListDto>();
		
		HttpSession session =req.getSession();
		String type =(String) session.getAttribute("type");
		String idx = (Integer) session.getAttribute("idx")+"";
		
		int page ;
		int totalCount=0;		
		//페이징 처리
		if(req.getParameter("page") !=null) {
			page =Integer.parseInt(req.getParameter("page"));
		}else {
			page = 1;
		}
		
		int recordPerPage = 5; // 1페이지당 보여줄 갯수
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = recordPerPage * page;
		
		result.put("stDay", stDay);
		result.put("endDay", endDay);
		result.put("beginRecord",beginRecord);
		result.put("endRecord", endRecord);
		
		
		
		OrderDAO ODAO = sqlSession.getMapper(OrderDAO.class);
		if(type.equals("user")) {
			result.put("uidx", idx);
			uOrderList =ODAO.getOrderUserList(result);
			totalCount =ODAO.getOrderUserCount(result);
		}else {
			result.put("didx", idx);
			uOrderList =ODAO.getOrderDeptList(result);
			totalCount =ODAO.getOrderDeptCount(result);
		}
		String pageMaker = PageMaker.getPageView("OrderList" , page, recordPerPage, totalCount);
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("OrderList",uOrderList);
		System.out.println("stDay:"+stDay);
		System.out.println("endDay:"+endDay);
		model.addAttribute("stDay",stDay);
		model.addAttribute("endDay",endDay);
	}

}
