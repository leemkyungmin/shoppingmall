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
import com.lkm.shoppingmall.dto.reviewDto;

public class dept_reviewListCommand implements command {

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
		String didx = req.getParameter("didx");
		
		int recordPerPage = 5; // 1페이지당 보여줄 갯수
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = recordPerPage * page;
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("didx",didx); 
		data.put("beginRecord",beginRecord);
		data.put("endRecord", endRecord);

		adminDAO adao =  sqlSession.getMapper(adminDAO.class);
		ArrayList<reviewDto> rlist = new ArrayList<reviewDto>();
		
		rlist =adao.dept_rlist(data);
		totalCount = adao.dept_review_total(data);
		
		String pageMaker = PageMaker.getPageView2("dept_review?didx="+didx , page, recordPerPage, totalCount);
		model.addAttribute("rlist", rlist);
		model.addAttribute("pageMaker", pageMaker);

	}

}
