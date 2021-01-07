package com.lkm.shoppingmall.command.product;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.productDAO;
import com.lkm.shoppingmall.dto.buyOptionDto;
import com.lkm.shoppingmall.dto.departmentDto;
import com.lkm.shoppingmall.dto.product_notice;
import com.lkm.shoppingmall.dto.product_optionDto;
import com.lkm.shoppingmall.dto.productsDto;
import com.lkm.shoppingmall.dto.reviewDto;

public class selectproduct implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
	
		Map<String,Object> map = model.asMap();
		
		HttpServletRequest req= (HttpServletRequest) map.get("req");
		HttpSession session = req.getSession();
		
		int pidx = (Integer) map.get("pidx");
		
		productDAO pdao = sqlSession.getMapper(productDAO.class);
		
		productsDto pdto = new productsDto();
		pdto.setpIdx(pidx);
		pdto =  pdao.selectmyProduct(pdto);
		
		product_notice pndto = new product_notice();
		pndto.setpIdx(pidx);
		
		pndto = pdao.selectmyProduct_notice(pndto);
		
		ArrayList<product_optionDto> podto =  new ArrayList<product_optionDto>();
		
		podto = pdao.selecttop_options(pidx);
		departmentDto deptdto =  new departmentDto();
		
		deptdto = pdao.selectDept(pidx);
		ArrayList<reviewDto> rdto = new ArrayList<reviewDto>();
		rdto= pdao.getReviewList(pidx);
		
		ArrayList<buyOptionDto> bodto =  new ArrayList<buyOptionDto>();
		bodto =  pdao.getbuysOption(pidx);
				
		
		model.addAttribute("bodto", bodto);
		model.addAttribute("rdto", rdto);
		model.addAttribute("pdto", pdto);
		model.addAttribute("pndto", pndto);
		model.addAttribute("podto", podto);
		model.addAttribute("deptdto", deptdto);
		
	}

}
