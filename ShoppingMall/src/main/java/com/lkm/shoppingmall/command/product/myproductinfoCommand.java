package com.lkm.shoppingmall.command.product;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.productDAO;
import com.lkm.shoppingmall.dto.product_notice;
import com.lkm.shoppingmall.dto.product_optionDto;
import com.lkm.shoppingmall.dto.productsDto;

public class myproductinfoCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String,Object> map = model.asMap();
		int pidx = (Integer) map.get("pidx");
		
		productsDto pdto = new productsDto();
		pdto.setpIdx(pidx);
		productDAO pdao = sqlSession.getMapper(productDAO.class);
		
		pdto = pdao.selectmyProduct(pdto);
		
		product_notice pndto = new product_notice();
		pndto.setpIdx(pidx);
		
		pndto = pdao.selectmyProduct_notice(pndto);
		
		ArrayList<product_optionDto> podto =  pdao.selectproduct_options(pidx);
		
		model.addAttribute("pdto", pdto);
		model.addAttribute("pndto", pndto);
		model.addAttribute("podto", podto);
		
		/* 옵션 변경시 기존 데이터를 삭제하고 다시 등록 
		 * 기존 데이터를 변경할때  추가된 옵션이나  삭제된 옵션을 처리할때 쉽게 처리할수있도록 ???
		 * 기존 데이터 삭제시  사용자 구매 기록 처리 변경 
		 * SELECT b.*
			FROM PRODUCTS_OPTION a inner join products_option b  on a.poidx =b.podept
			where a.poidx =옵션 변경시 ...; 
		 */
		
		
		

	}

}
