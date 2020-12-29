package com.lkm.shoppingmall.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSplitPaneUI;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.lkm.shoppingmall.command.my.CsutomerSvcCommand;
import com.lkm.shoppingmall.command.my.updateuserCommand;
import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.myDAO;

@Controller
public class myController {

	@Autowired
	private SqlSession sqlsession;
	private command command;
	
	@RequestMapping("my/CustomerService")
	public String customerService(HttpServletRequest req, Model model) {
		
		HttpSession session =req.getSession();
		
		if(session.getAttribute("idx") ==null) {
			return "redirect:/lgoin";
		} else {
			model.addAttribute("req", req);
			command =new CsutomerSvcCommand();
			command.execute(sqlsession, model);
			return "my/CustomerService";
		}
		
	}
	@RequestMapping("my/confirmPassword")
	public String confirmPassword(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		
		if( session.getAttribute("idx") ==null) {
			return "redirect:/login";
		}else {
			return "my/confirmPassword";
		}
		
	}
	@RequestMapping("my/myPage")
	public String myPage(HttpServletRequest req,Model model) {
		
		HttpSession session = req.getSession();
		if( session.getAttribute("idx") ==null) {
			return "redirect:/login";
		}else {
			model.addAttribute("req", req);
			command =new updateuserCommand();
			command.execute(sqlsession, model);
			return "my/myPage";
		}
	}
	
	@RequestMapping(value ="my/pwChk",method=RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	public String pwChk(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(req.getParameter("pw").equals(session.getAttribute("pw"))) {
			return "1";
		}else {
			return "0";
		}
	}
	@RequestMapping("my/UpdatePwForm")
	public String updatepwForm() {
		return "my/UpdatePwForm";
	}
	@RequestMapping(value="my/updatepw",method=RequestMethod.POST,produces ="text/html; charset=utf-8")
	@ResponseBody
	public String updatepw(HttpServletRequest req,Model model) {
		
		HttpSession session = req.getSession();
		
		String old_pw = req.getParameter("old_pw");
		String new_pw = req.getParameter("new_pw");
		
		int result=0;
		myDAO mDAO = sqlsession.getMapper(myDAO.class);
		
		if(session.getAttribute("type").equals("user")) {
			result =mDAO.UpdateUserPw(old_pw, new_pw);
		} else {
			result =mDAO.UpdateDeptPw(old_pw, new_pw);
		}
		
		if(result ==1) {
			session.removeAttribute("pw");
			session.setAttribute("pw",new_pw);
		}
		
		return result+"";
		
	}
	
	@RequestMapping(value="my/userUpdate",method=RequestMethod.POST,produces="test/html; charset=utf-8")
	@ResponseBody
	public String updateUser(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		String idx = (Integer) session.getAttribute("idx")+"";
		myDAO mdao = sqlsession.getMapper(myDAO.class);
		Map<String,Object> query = new HashMap<String, Object>();
		int result =0;
		if(idx ==null) {
			result =-1;
		} else {
			String uEmail = req.getParameter("uEmail");
			String uPhone =req.getParameter("uPhone");
			query.put("uEmail",uEmail);
			query.put("uPhone",uPhone);
			query.put("uIdx",idx);
			result = mdao.updateUser(query);
		}
		
		return result+"";
		
	}
	@RequestMapping("my/deleteuser")
	public String delete(HttpServletRequest req,Model model) {
		HttpSession session =req.getSession();
		
		if(session.getAttribute("idx") ==null) {
			return "redirect:/login";
		} else {
			return "my/deleteuser";
		}
		
	}
	@RequestMapping(value="my/deletecheck",method =RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	public String deleteusers(HttpServletRequest req,Model model) {
		
		HttpSession session = req.getSession();
		myDAO mdao = sqlsession.getMapper(myDAO.class);
		Map<String,Object> query = new HashMap<String, Object>();
		int result =0;
		if(session.getAttribute("idx") ==null) {
			result =-1;
		} else {
			String pw =req.getParameter("pw");
			String idx= session.getAttribute("idx")+"";
			query.put("idx",idx);
			query.put("pw",pw);
			if(session.getAttribute("type").equals("user")) {
				result =mdao.deleteUser(query);
			} else {
				result =mdao.deleteDept(query);
			}
			
		}
		if(result >0) {
			session.invalidate();
		}
		return result+"";
		
	}
	
	@RequestMapping("my/Write-Customer-Service")
	public String write_customer_svc() {
		return "my/Write_Customer_Service";
	}
	
	@RequestMapping(value="my/profileImage",method=RequestMethod.POST,produces = "text/html; charset=utf-8")
	@ResponseBody
	public String uploadSummernoteImageFile(MultipartHttpServletRequest  mr) {
		MultipartFile list =mr.getFile("file");
		String saveFilename = null;
		File saveFile =null;
		if(!list.isEmpty()) {
			String originFilename  =list.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf(".")+1);
			
			
			try {
				saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) +
						"_" +
						System.currentTimeMillis() +
						"." + extName;
				String realPath = mr.getSession().getServletContext().getRealPath("/resources/images/summernote");
				System.out.println(realPath);
				File directory = new File(realPath);
				
				if ( !directory.exists() ) {
					System.out.println("11111");
					
					directory.mkdirs();
				}
				saveFile = new File(realPath, saveFilename);
				list.transferTo(saveFile);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		System.out.println(saveFilename);
		return saveFilename;
	}
	
	@RequestMapping(value ="my/upload_customer_svc",method=RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	public String upload_customer_svc(HttpServletRequest req,Model model) {
		
		HttpSession session = req.getSession();
		Map<String,Object> query = new HashMap<String, Object>();
		myDAO mdao = sqlsession.getMapper(myDAO.class);
		int result =0;
		if(session.getAttribute("idx") ==null) {
			result =-1;
		} else {
			String idx =(Integer)session.getAttribute("idx")+"";
			query.put("idx", idx);
			query.put("cTitle", req.getParameter("cTitle"));
			query.put("cContent",req.getParameter("cContent"));
			if(session.getAttribute("type").equals("user")) {
				result = mdao.user_customer_svc(query);
			} else {
				result =mdao.dept_customer_svc(query);
			}
		}
		
		return result+"";
	}
	
}
