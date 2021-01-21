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

public class user_buyListCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String,Object> map = model.asMap();
		
		HttpServletRequest req =  (HttpServletRequest) map.get("req");
		
		int page ;
		int totalCount=0;		
		if(req.getParameter("page") !=null) {
			page =Integer.parseInt(req.getParameter("page"));
		}else {
			page = 1;
		}
		String uidx = req.getParameter("uidx");
		
		int recordPerPage = 5; // 1페이지당 보여줄 갯수
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = recordPerPage * page;
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("uidx", uidx);
		data.put("didx","0");
		data.put("beginRecord",beginRecord);
		data.put("endRecord", endRecord);

		adminDAO adao =  sqlSession.getMapper(adminDAO.class);
		ArrayList<orderListDto> blist = new ArrayList<orderListDto>();
		blist =adao.user_buyList(data);
		
		totalCount =adao.user_buy_total(data);
		
		String pageMaker = PageMaker.getPageView2("user_buys?uidx="+uidx , page, recordPerPage, totalCount);
		model.addAttribute("blist", blist);
		model.addAttribute("pageMaker", pageMaker);

	}

}
