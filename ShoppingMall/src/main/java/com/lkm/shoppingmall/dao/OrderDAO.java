package com.lkm.shoppingmall.dao;

import java.util.ArrayList;

import com.lkm.shoppingmall.dto.orderListDto;

public interface OrderDAO {

	public ArrayList<orderListDto> getOrderList(String stDay,String endDay,String uSerid,String dId);
}
   
