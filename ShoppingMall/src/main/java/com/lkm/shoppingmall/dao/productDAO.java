package com.lkm.shoppingmall.dao;

import java.util.ArrayList;

import com.lkm.shoppingmall.dto.productsDto;

public interface productDAO {

	public ArrayList<productsDto> mylist(String idx);
}
