package com.lkm.shoppingmall.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.joinDAO;
import com.lkm.shoppingmall.dto.userDto;

public class memberRegSuccessCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub

		Map<String, Object> map =model.asMap();
		
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String uSerid =req.getParameter("uId");
		String uPw = req.getParameter("uPw");
		String uName =req.getParameter("uName");
		String uPhone =req.getParameter("uPhone");
		String postcode = req.getParameter("postcode");
		String roadAddress =req.getParameter("roadAddress");
		String detailAddress =req.getParameter("detailAddress");
		String uAddress =postcode +"/"+roadAddress+"/"+detailAddress;
		userDto udto =new userDto();
		
		udto.setuSerid(uSerid);
		udto.setuPw(uPw);
		udto.setuAddress(uAddress);
		udto.setuName(uName);
		udto.setuPhone(uPhone);
		
		joinDAO jdao =sqlSession.getMapper(joinDAO.class);
		
		model.addAttribute("result", jdao.signinMember(udto));
		
	}

}
