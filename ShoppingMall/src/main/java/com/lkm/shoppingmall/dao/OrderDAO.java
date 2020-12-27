package com.lkm.shoppingmall.dao;

import java.util.ArrayList;
import java.util.Map;

import com.lkm.shoppingmall.dto.orderListDto;

public interface OrderDAO {

	public ArrayList<orderListDto> getOrderUserList(Map<String,Object> result);
	public ArrayList<orderListDto> getOrderDeptList(Map<String,Object> result);
	public ArrayList<orderListDto> getOrderCancelUserList(Map<String,Object> result);
	public ArrayList<orderListDto> getOrderCancelDeptList(Map<String,Object> result);
	public int getOrderUserCount(Map<String,Object> result );
	public int getOrderDeptCount(Map<String,Object> result );
}
   
