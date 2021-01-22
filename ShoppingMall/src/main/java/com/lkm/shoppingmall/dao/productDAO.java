package com.lkm.shoppingmall.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

import com.lkm.shoppingmall.dto.Dept_OrderList_ToFile;
import com.lkm.shoppingmall.dto.buyOptionDto;
import com.lkm.shoppingmall.dto.buys_optionDto;
import com.lkm.shoppingmall.dto.departmentDto;
import com.lkm.shoppingmall.dto.orderListDto;
import com.lkm.shoppingmall.dto.product_notice;
import com.lkm.shoppingmall.dto.product_optionDto;
import com.lkm.shoppingmall.dto.productsDto;
import com.lkm.shoppingmall.dto.reviewDto;
import com.lkm.shoppingmall.dto.userDto;

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
	
	public ArrayList<product_optionDto> getOption2(Map<String,Object> keys);
	
	public departmentDto selectDept(int pidx);
	
	public ArrayList<reviewDto> getReviewList(int pidx);
	
	public ArrayList<buyOptionDto> getbuysOption(int pidx);
	
	public userDto getUserInfo(String idx);
	
	public departmentDto getDeptInfo(String idx);
	
	public int buy_insert(Map<String,Object> data);
	
	public int buy_option(Map<String,Object> option);
	
	public orderListDto orderList(Map<String,Object> data);
	
	public Map<String,Integer> buy_total_price(String bidx);
	public ArrayList<buys_optionDto> getBuy_options(String bidx);
	
	public int insert_cart(Map<String, Object> cart);
	
	public ArrayList<Dept_OrderList_ToFile> getFile(String didx);
	
	public String getDname(String didx);
	
	public int DeptTodayExcelCount(Map<String,Object> data);
	
	public int Delete_excel(Map<String, Object> data);
	
	public int Insert_excel(Map<String,Object> data);
	
	public int Update_buys(Map<String,Object> buy_update);
	
}
