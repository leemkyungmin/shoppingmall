package com.lkm.shoppingmall.dao;

import java.util.ArrayList;
import java.util.Map;

import com.lkm.shoppingmall.dto.productsDto;

public interface productDAO {

	public ArrayList<productsDto> mylist(String idx);
	
	public int insertproduct(Map<String,Object> query);
	public void  insertproductnotice(Map<String,Object> notice);
	public int insertproductOption1(Map<String,Object> option1);
	public int insertproductOption2(Map<String,Object> option2);
	
}
