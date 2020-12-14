package com.lkm.shoppingmall.dao;

import com.lkm.shoppingmall.dto.userDto;

public interface loginDAO {

	public userDto loginchk(String uSerid,String uPw);
}
