package com.lkm.shoppingmall.dao;

import com.lkm.shoppingmall.dto.userDto;

public interface joinDAO {

	//일반회원 아이디 확인
	public int uIdcheck(String uId);
	//일반회원 가입 
	public int signinMember(userDto udto);
}
