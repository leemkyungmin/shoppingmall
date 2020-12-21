package com.lkm.shoppingmall.dao;

import com.lkm.shoppingmall.dto.departmentDto;
import com.lkm.shoppingmall.dto.userDto;

public interface loginDAO {

	//일반 회원 로그인
	public userDto userloginchk(String uSerid,String uPw);
	//기업 회원 로그인
	public departmentDto  deptloginchk(departmentDto deptdto);
}
