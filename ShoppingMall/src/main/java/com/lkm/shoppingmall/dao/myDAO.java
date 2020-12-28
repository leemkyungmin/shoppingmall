package com.lkm.shoppingmall.dao;

import java.util.ArrayList;
import java.util.Map;

import com.lkm.shoppingmall.dto.CustomerServiceDto;
import com.lkm.shoppingmall.dto.departmentDto;
import com.lkm.shoppingmall.dto.userDto;

public interface myDAO {

	public ArrayList<CustomerServiceDto> getCustomer_svc(Map<String,Object> pages);
	public int getPageCount(Map<String, Object> pages);
	public int pwusercheck(String id,String pw);
	public int pwdeptcheck(String id,String pw);
	
	public userDto userInfo(String idx);
	public departmentDto deptInfo(String idx);
}
