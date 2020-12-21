package com.lkm.shoppingmall.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.joinDAO;
import com.lkm.shoppingmall.dto.departmentDto;

@Controller
public class joinDepartmentController {

	@Autowired
	private SqlSession sqlSession;
	private command command;
	
	//기업 회원 가입 페이지
	@RequestMapping("join/department_Reg")
	public String Buys(@RequestParam("dType") String dType,Model model) {
		model.addAttribute("dType", dType);
		return "join/department/Department_Reg";
	}
	
	// 아이디 중복확인 ajax
	@RequestMapping(value ="join/dIdcheck",method = RequestMethod.POST, produces = "text/html; charset=utf-8")
	@ResponseBody
	public String dIdcheck(@RequestParam("dId") String dId) {
		
		joinDAO JDAO = sqlSession.getMapper(joinDAO.class);
		return JDAO.dIdcheck(dId)+"";
	}
	
	//사업자 중복 확인 ajax
	@RequestMapping(value ="join/dSaup_nocheck",method = RequestMethod.POST, produces = "text/html; charset=utf-8")
	@ResponseBody
	public String dSaup_nocheck(@RequestParam("dSaup_no") String dSaup_no) {
		
		joinDAO JDAO = sqlSession.getMapper(joinDAO.class);
	
		return JDAO.dSaup_nocheck(dSaup_no)+"";
	}
	
	//기업 회원 가입 성공
	@RequestMapping("join/department_reg_success")
	public String department_reg_success(HttpServletRequest req,Model model) {
		
		departmentDto deptDTO =new departmentDto();
		deptDTO.setdId(req.getParameter("dId"));
		deptDTO.setdPw(req.getParameter("dPw"));
		deptDTO.setdName(req.getParameter("dName"));
		deptDTO.setdPhone(req.getParameter("dPhone"));
		deptDTO.setdSaup_no(req.getParameter("saup-no"));
		deptDTO.setdType(req.getParameter("dType"));
		
		String dAddress =req.getParameter("postcode") + "/" + req.getParameter("roadAddress") + "/" + req.getParameter("detailAddress") ;
		deptDTO.setdAddress(dAddress);
		
		int result =0;
		joinDAO JDAO =sqlSession.getMapper(joinDAO.class);
		result =JDAO.signinDepartment(deptDTO);
		System.out.println(result);
		
		return "redirect:/login";
	}
}
