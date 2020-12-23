package com.lkm.shoppingmall.dao;

import java.util.ArrayList;

import com.lkm.shoppingmall.dto.bannerDto;
import com.lkm.shoppingmall.dto.productsDto;
import com.lkm.shoppingmall.dto.searchDto;

public interface indexDAO {

	public ArrayList<bannerDto> getbanner();
	public ArrayList<searchDto> searchResult(String query);
}
