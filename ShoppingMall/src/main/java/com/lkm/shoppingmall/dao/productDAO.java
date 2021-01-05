package com.lkm.shoppingmall.dao;

import java.util.ArrayList;
import java.util.Map;

import com.lkm.shoppingmall.dto.buyOptionDto;
import com.lkm.shoppingmall.dto.departmentDto;
import com.lkm.shoppingmall.dto.product_notice;
import com.lkm.shoppingmall.dto.product_optionDto;
import com.lkm.shoppingmall.dto.productsDto;
import com.lkm.shoppingmall.dto.reviewDto;

public interface productDAO {

	public ArrayList<productsDto> mylist(String idx);
	
	public int insertproduct(Map<String,Object> query);
	public void  insertproductnotice(Map<String,Object> notice);
	public int insertproductOption1(Map<String,Object> option1);
	public int insertproductOption2(Map<String,Object> option2);
	
	public productsDto selectmyProduct(productsDto pdto );
	public product_notice selectmyProduct_notice(product_notice pndto);
	
	public ArrayList<product_optionDto> selectproduct_options(int pidx);
	public ArrayList<product_optionDto> selecttop_options(int pidx);
	
	public int selectDidx(int pidx);
	
	public int updateProducts(productsDto pdto);
	public int updateNotice(product_notice pndto);
	
	public int deleteOptions(int pidx);
	
	
	public departmentDto selectDept(int pidx);
	
	public ArrayList<reviewDto> getReviewList(int pidx);
	
	public ArrayList<buyOptionDto> getbuysOption(int pidx);
	
}
