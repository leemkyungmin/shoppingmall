package com.lkm.shoppingmall.commom;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface command {

	public void execute(SqlSession sqlSession,Model model);
}
