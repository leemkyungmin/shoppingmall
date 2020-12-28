package com.lkm.shoppingmall.command.my;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.PageMaker;
import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.myDAO;
import com.lkm.shoppingmall.dto.CustomerServiceDto;

public class CsutomerSvcCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req =(HttpServletRequest) map.get("req");
		HttpSession session = req.getSession();
		
		
		int page ;		
		//페이징 처리
		if(req.getParameter("page") !=null) {
			page =Integer.parseInt(req.getParameter("page"));
		}else {
			page = 1;
		}
		int recordPerPage = 10; // 1페이지당 보여줄 갯수
		int beginRecord = (page - 1) * recordPerPage + 1;
		int endRecord = recordPerPage * page;
		
		int totalPage =0;
		
		Map<String,Object> pages =new HashMap<String, Object>();
		pages.put("beginRecord",beginRecord);
		pages.put("endRecord", endRecord);
				
		myDAO mDAO = sqlSession.getMapper(myDAO.class);
		ArrayList<CustomerServiceDto> csdto = new ArrayList<CustomerServiceDto>();
		String type =(String) session.getAttribute("type");
		
		if(type.equals("user")) {
			int uIdx =(Integer) session.getAttribute("idx");
			pages.put("uIdx", uIdx);
			pages.put("dIdx", 0);
			csdto = mDAO.getCustomer_svc(pages);
			totalPage  =mDAO.getPageCount(pages);
		} else {
			int dIdx =(Integer) session.getAttribute("idx");
			pages.put("uIdx", 0);
			pages.put("dIdx", dIdx);
			csdto = mDAO.getCustomer_svc(pages);
			totalPage  =mDAO.getPageCount(pages);
		}
		
		String pagemaker =PageMaker.getPageView("CustomerService", totalPage, recordPerPage, totalPage);
		
		model.addAttribute("pagemaker", pagemaker);
		model.addAttribute("csdto", csdto);

	}

}
