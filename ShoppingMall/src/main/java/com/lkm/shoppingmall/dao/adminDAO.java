package com.lkm.shoppingmall.dao;

import java.util.ArrayList;
import java.util.Map;

import com.lkm.shoppingmall.dto.AdminNotice;
import com.lkm.shoppingmall.dto.CustomerServiceDto;
import com.lkm.shoppingmall.dto.PopupNoticeDto;
import com.lkm.shoppingmall.dto.bannerDto;
import com.lkm.shoppingmall.dto.orderListDto;
import com.lkm.shoppingmall.dto.reviewDto;
import com.lkm.shoppingmall.dto.userDto;

public interface adminDAO {

	public ArrayList<AdminNotice> getNotice();
	
	public AdminNotice getDetail(String aidx);
	
	public ArrayList<userDto> getUserInfo();
	
	public userDto UserDetail(String uidx);
	
	public ArrayList<orderListDto> user_buyList(Map<String, Object> data);
	
	public int user_buy_total(Map<String, Object> data);
	
	public ArrayList<reviewDto> rlist(Map<String,Object> data);
	
	public int review_total(Map<String,Object> data);
	
	public ArrayList<CustomerServiceDto> custome_list(Map<String, Object> data);
	public int custom_count(Map<String,Object> data);
	
	public int update_user(Map<String,Object> data);
	
	public ArrayList<bannerDto> getBanner();
	
	public ArrayList<PopupNoticeDto> getpopupnotice();
	
	public bannerDto showBanner(String bidx);
	
	public int update_banner(Map<String,Object> data);
	
	public int delete_banner(String bidx);
	
	public int Insert_banner(Map<String,Object> data);
	
	public int Insert_popup(Map<String,Object> data);
	
	public PopupNoticeDto popup_Detail(String popidx);
	
	public int update_popup(Map<String,Object> data);
	
	public int delete_popup(String popidx);

}
