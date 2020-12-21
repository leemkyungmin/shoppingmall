package com.lkm.shoppingmall.dao;

import com.lkm.shoppingmall.dto.departmentDto;
import com.lkm.shoppingmall.dto.userDto;

public interface joinDAO {

	//********* 일반회원 *********
	//일반회원 아이디 중복 확인
	public int uIdcheck(String uId);
	//일반회원 가입 
	public int signinMember(userDto udto);
	
	//********* 기업회원 *********
	//기업 회원 아이디 중복 확인
	public int dIdcheck(String dId);
	//기업 회원 사업자 번호 중복 확인
	public int dSaup_nocheck(String dSaup_no);
	//기업 회원 가입 성공 
	public int signinDepartment(departmentDto deptdto);
}
