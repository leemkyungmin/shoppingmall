package com.lkm.shoppingmall.dao;

import java.util.ArrayList;
import java.util.Map;

import com.lkm.shoppingmall.dto.CartListDto;
import com.lkm.shoppingmall.dto.CustomerServiceDto;
import com.lkm.shoppingmall.dto.customer_service_reviewDto;
import com.lkm.shoppingmall.dto.departmentDto;
import com.lkm.shoppingmall.dto.userDto;

public interface myDAO {

	public ArrayList<CustomerServiceDto> getCustomer_svc(Map<String,Object> pages);
	public int getPageCount(Map<String, Object> pages);
	public int pwusercheck(String id,String pw);
	public int pwdeptcheck(String id,String pw);
	
	public userDto userInfo(String idx);
	public departmentDto deptInfo(String idx);
	
	public int UpdateUserPw(String old_pw,String new_pw);
	public int UpdateDeptPw(String old_pw,String new_pw);
	
	public int updateUser(Map<String,Object> query);
	
	public int deleteUser(Map<String,Object> query);
	public int deleteDept(Map<String,Object> query);
	
	public int user_customer_svc(Map<String,Object> query);
	public int dept_customer_svc(Map<String,Object> query);
	
	
	public CustomerServiceDto getService(String cIdx);
	public customer_service_reviewDto getReview(String cIdx);	
	//조회수 증가
	public int updateHit(int cHit,int cIdx);
	
	public int update_custeomr_svc(Map<String,Object> query);
	
	public ArrayList<CartListDto> get_myCart(Map<String,Object> data);
	
	public int update_cart_count(Map<String, Object> cart);
}
