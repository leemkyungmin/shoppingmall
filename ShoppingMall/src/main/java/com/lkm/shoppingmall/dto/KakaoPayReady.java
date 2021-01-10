package com.lkm.shoppingmall.dto;

import java.util.Date;

import lombok.Data;

@Data
public class KakaoPayReady {
	
	 private String tid, next_redirect_pc_url,next_redirect_app_url,next_redirect_mobile_url,android_app_scheme,ios_app_scheme;
	 private Date created_at;
	 private boolean tms_result;
	 
	
}
