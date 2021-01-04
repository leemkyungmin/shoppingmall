package com.lkm.shoppingmall.command.product;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.productDAO;
import com.lkm.shoppingmall.dto.product_notice;
import com.lkm.shoppingmall.dto.productsDto;

public class Update_myproduct  implements command{

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String,Object> map =model.asMap();
		
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		String pName= req.getParameter("pName");
		int price = Integer.parseInt(req.getParameter("price"));
		int order_price =Integer.parseInt(req.getParameter("order_price"));
		int pidx= Integer.parseInt(req.getParameter("pidx"));
		String sumNail =req.getParameter("sumNail");
		String pnoticeimg =req.getParameter("pnoticeimg");
		String pimg = req.getParameter("pimg");
		
		String[] option1 = req.getParameterValues("option1");
		
		productDAO pdao = sqlSession.getMapper(productDAO.class);
		int result = 0;
		
		productsDto pdto =  new productsDto();
		pdto.setpIdx(pidx);
		pdto.setpName(pName);
		pdto.setpOrder_price(order_price);
		pdto.setpRice(price);
		pdto.setpSumnail(sumNail);
		
		result =pdao.updateProducts(pdto);
		
		product_notice pndto = new product_notice();
		pndto.setpIdx(pidx);
		pndto.setpImg(pimg);
		pndto.setpNimg(pnoticeimg);
		
		pdao.updateNotice(pndto);
		
		pdao.deleteOptions(pidx);
		
		for(int i=0; i<option1.length; i++) {
			Map<String,Object> options =new HashMap<String, Object>();
			String[] op2_names= req.getParameterValues("option2_name"+(i+1));
			String[] op2_price = req.getParameterValues("option2_price"+(i+1));
			System.out.println("op2_names :"+op2_names);
			int option_avg = 0;
			for(String p : op2_price) {
				option_avg +=Integer.parseInt(p);
			}
			options.put("poname", option1[i]);
			options.put("avg_price", option_avg);
			options.put("pidx",pidx);
			int option1_result =pdao.insertproductOption1(options);
							
			if(option1_result >0) {
				String poidx = options.get("poidx")+"";
				System.out.println(op2_names.length);
				for(int j=0; j<op2_names.length; j++) {
					Map<String,Object> option2 = new HashMap<String, Object>();
					option2.clear();
					option2.put("poidx", poidx);
					option2.put("op2_name",op2_names[j]);
					option2.put("op2_price",op2_price[j]);
					option2.put("pidx", pidx);
					pdao.insertproductOption2(option2);
				}
			}
			
		}
		
		
	}

	
}
