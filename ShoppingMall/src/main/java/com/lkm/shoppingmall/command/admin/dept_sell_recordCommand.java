package com.lkm.shoppingmall.command.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.PageMaker;
import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.adminDAO;
import com.lkm.shoppingmall.dto.orderListDto;

public class dept_sell_recordCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String,Object> map = model.asMap();
		
		HttpServletRequest req= (HttpServletRequest) map.get("req");
		adminDAO adao = sqlSession.getMapper(adminDAO.class);
		String didx=req.getParameter("didx");
		
		ArrayList<orderListDto> olist =new ArrayList<orderListDto>();
		
		Map<String,Object> data =new HashMap<String, Object>();
		
		int page ;
		int totalCount=0;		
		if(req.getParameter("page") !=null) {
			page =Integer.parseInt(req.getParameter("page"));
		}else {
			page = 1;
		}
		int recordPerPage = 7; // 1페이지당 보여줄 갯수
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = recordPerPage * page; 
		
		data.put("didx",didx);
		data.put("beginRecord",beginRecord);
		data.put("endRecord", endRecord);
		
		olist =adao.getOrder_list(data);
		totalCount =adao.buy_total(didx);
		String pageMaker = PageMaker.getPageView2("dept_sell_record?didx="+didx , page, recordPerPage, totalCount);
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("olist", olist);
		
		

	}

}
