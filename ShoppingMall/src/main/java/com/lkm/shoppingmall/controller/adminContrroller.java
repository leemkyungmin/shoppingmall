package com.lkm.shoppingmall.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lkm.shoppingmall.command.admin.adminHomePageControllCommand;
import com.lkm.shoppingmall.command.admin.adminPageCommand;
import com.lkm.shoppingmall.command.admin.popupDetailCommand;
import com.lkm.shoppingmall.command.admin.showBannerCommand;
import com.lkm.shoppingmall.command.admin.user_buyListCommand;
import com.lkm.shoppingmall.command.admin.user_customerListCommand;
import com.lkm.shoppingmall.command.admin.user_reviewListCommand;
import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.adminDAO;
import com.lkm.shoppingmall.dto.AdminNotice;
import com.lkm.shoppingmall.dto.userDto;

@Controller
public class adminContrroller {

	
	@Autowired
	private SqlSession sqlsession;
	private command command;
	
	@RequestMapping("admin/adminPage")
	public String adminOnly(HttpServletRequest req,Model model) {
		HttpSession  session = req.getSession();
		
		if(session.getAttribute("idx")  !=null) {
			String type =(String) session.getAttribute("type");
			int grade =Integer.parseInt( (String) session.getAttribute("grade"));
			if( type !=null && type.equals("user") && grade >=9 ) {
				
				command = new adminPageCommand();
				command.execute(sqlsession, model);
				
				return "admin/adminPage";
			} else {
				return "redirect:/index";
			}
		}else {
			return "redirect:/index";
		}

		
	}
	
	@GetMapping("admin/adminNotice_Detail")
	public String Notice_Detail(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		
	
		
		if(session.getAttribute("idx")  !=null) {
			int grade =Integer.parseInt( (String) session.getAttribute("grade"));
			if(grade >=9 ) {
				String aidx =req.getParameter("aidx");
				AdminNotice an = new AdminNotice();
				adminDAO adao = sqlsession.getMapper(adminDAO.class);
				an = adao.getDetail(aidx);
				model.addAttribute("an", an);
				return "admin/Notice_Detail";
			} else {
				return "";
			}
			
			
		} else {
			return "";
		}
		
	}
	@RequestMapping("admin/UserInfo")
	public String userInfo(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		
		adminDAO adao = sqlsession.getMapper(adminDAO.class);
		if(session.getAttribute("idx") !=null) {
			if(Integer.parseInt( (String) session.getAttribute("grade")) ==9) {
				ArrayList<userDto> ulist =new ArrayList<userDto>();
				ulist =adao.getUserInfo();
				model.addAttribute("ulist", ulist);
				
			} 
			return "admin/UserInfo";
		} else {
			return "redirect:/login";
		}
	
		
		
	}
	@RequestMapping("admin/user_Detail")
	public String userDetail(HttpServletRequest req,Model model) {
		
		HttpSession session = req.getSession();
		adminDAO adao = sqlsession.getMapper(adminDAO.class);
		if(Integer.parseInt( (String) session.getAttribute("grade")) ==9) {
			userDto udto = new userDto();
			String uidx = req.getParameter("uidx");
			udto = adao.UserDetail(uidx);
			
			model.addAttribute("udto", udto); 
		} 
		
		return "admin/userDetail";
		
	}
	@GetMapping("admin/usercontroll/user_buys")
	public String user_buys(HttpServletRequest req,Model model) {
		
		model.addAttribute("req", req);
		
		command = new user_buyListCommand(); 
		command.execute(sqlsession, model); 
		
		
		return "admin/userControll/user_info";
	}
	@GetMapping("admin/usercontroll/user_review")
	public String user_review(HttpServletRequest req,Model model) {
		
		model.addAttribute("req", req);
		
		command = new user_reviewListCommand();
		command.execute(sqlsession, model);
				
		return "admin/userControll/user_info";
	}
	@GetMapping("admin/usercontroll/user_customer_svc")
	public String user_customer_svc(HttpServletRequest req,Model model) {
		
		model.addAttribute("req", req);
		command= new user_customerListCommand();
		command.execute(sqlsession, model);
		
		return "admin/userControll/user_info";
	}
	
	@PostMapping("admin/user_update")
	@ResponseBody
	public String user_update(HttpServletRequest req,Model model) {
		
		String uidx =req.getParameter("uidx");
		String grade =req.getParameter("grade");
		
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("uidx",uidx);
		data.put("grade",grade);
		
		adminDAO adao = sqlsession.getMapper(adminDAO.class);
		
		int result = adao.update_user(data);
		
		model.addAttribute("result", result);
		
		return result+"";
	}
	
	@GetMapping("admin/homePageControll")
	public String homepageControll(HttpServletRequest req, Model model) {
		
		HttpSession session =req.getSession();
		
		if(session.getAttribute("idx") !=null) {
			
			if(Integer.parseInt( (String) session.getAttribute("grade")) ==9) {
				command = new adminHomePageControllCommand();
				command.execute(sqlsession, model);
			}
			return "admin/HomePageControll";
			
		} else {
			return "redirect:/login";
		}
		
	}
	@GetMapping("admin/showBanner")
	public String showBanner(HttpServletRequest req,Model model) {
		
		String bidx = req.getParameter("bidx");
		
		model.addAttribute("bidx",bidx);
		
		command= new showBannerCommand();
		command.execute(sqlsession, model);;
		
		
		return "admin/ShowBanner";
	}
	
	@RequestMapping(value="admin/change_bannerImg",method=RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	String update_banner(MultipartHttpServletRequest req) {
		MultipartFile file = req.getFile("file");
		String saveFilename = null;
		File saveFile =null;
		if(!file.isEmpty()) {
			String originFilename  =file.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf(".")+1);
			
			
			try {
				saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) +
						UUID.randomUUID() +
						"." + extName;
				String realPath = req.getSession().getServletContext().getRealPath("resources/assets/images/bannerImg");
				File directory = new File(realPath);
				if ( !directory.exists() ) {
					
					directory.mkdirs();
				}
				saveFile = new File(realPath, saveFilename);
				file.transferTo(saveFile);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return saveFilename;
	}
	
	@PostMapping("admin/update_banner")
	@ResponseBody
	public String update_banner(HttpServletRequest req) {
		
		adminDAO adao = sqlsession.getMapper(adminDAO.class);
		
		int bidx = Integer.parseInt(req.getParameter("bidx"));
		String bdeptname =req.getParameter("bdeptname");
		String bmanager  = req.getParameter("bmanager");
		String bmanager_number = req.getParameter("bmanager_number");
		String bdate = req.getParameter("bdate");
		String bFilename =req.getParameter("bFilename");
		
		Map<String,Object> data = new HashMap<String, Object>();
		
		data.put("bidx", bidx);
		data.put("bdeptname",bdeptname);
		data.put("bmanager",bmanager);
		data.put("bmanager_number", bmanager_number);
		data.put("bdate",bdate);
		data.put("bFilename",bFilename);
		
		int result = adao.update_banner(data);
		
		return result+"";
		
	}
	
	@PostMapping("admin/DeleteBanner")
	@ResponseBody
	public int delete_banner(HttpServletRequest req) {
		
		String bidx =req.getParameter("bidx");
		
		adminDAO adao = sqlsession.getMapper(adminDAO.class);
		
		int result = adao.delete_banner(bidx);
		
		return result;
	}
	@GetMapping("admin/newBanner")
	public String newBanner() {
		
		return "admin/newBanner";
	}
	@PostMapping("admin/insert_newBanner")
	@ResponseBody
	public String insert_banner(HttpServletRequest req) {
		
		adminDAO adao = sqlsession.getMapper(adminDAO.class);
		
		String bdeptname =req.getParameter("bdeptname");
		String bmanager  = req.getParameter("bmanager");
		String bmanager_number = req.getParameter("bmanager_number");
		String bdate = req.getParameter("bdate");
		String bFilename =req.getParameter("bFilename");
		
		Map<String,Object> data = new HashMap<String, Object>();
		
		data.put("bdeptname",bdeptname);
		data.put("bmanager",bmanager);
		data.put("bmanager_number", bmanager_number);
		data.put("bdate",bdate);
		data.put("bFilename",bFilename);
		
		int result =adao.Insert_banner(data);
		
		String bidx = (Integer) data.get("bidx")+"";
				
		return bidx;
	}
	
	@GetMapping("admin/newPopup")
	public String newPopup() {
		
		return "admin/newPopup";
	}
	
	@RequestMapping(value="admin/Update_PopupImg",method=RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	public String popupImg(MultipartHttpServletRequest req) {
		MultipartFile file = req.getFile("file");
		String saveFilename = null;
		File saveFile =null;
		if(!file.isEmpty()) {
			String originFilename  =file.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf(".")+1);
			try {
				saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) +
						UUID.randomUUID() +
						"." + extName;
				String realPath = req.getSession().getServletContext().getRealPath("resources/assets/images/popupImg");
				File directory = new File(realPath);
				if ( !directory.exists() ) {
					directory.mkdirs();
				}
				saveFile = new File(realPath, saveFilename);
				file.transferTo(saveFile);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return saveFilename;
	}
	
	@PostMapping("admin/insertNewPopup")
	@ResponseBody
	public String insertPopup(HttpServletRequest req) {
		
		adminDAO adao = sqlsession.getMapper(adminDAO.class);
		
		String popInfo = req.getParameter("popInfo");
		String popImg =req.getParameter("popImg");
		String popupUri =req.getParameter("popupUri");
		
		if(popupUri ==null) {
			popupUri="null";
		}
		
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("popInfo",popInfo);
		data.put("popImg",popImg);
		data.put("popupUri",popupUri);
		
		int result = adao.Insert_popup(data);
		
		return data.get("popIdx")+"";
	}
	@GetMapping("admin/popupDetail")
	public String popupDetaill(HttpServletRequest req,Model model) {
		
		model.addAttribute("req", req);
		command= new popupDetailCommand();
		command.execute(sqlsession, model);
		
		return "admin/popupDetail";
	}
	@PostMapping("UpdatePopup")
	@ResponseBody
	public int UpdatePopup(HttpServletRequest req) {
		
		adminDAO adao = sqlsession.getMapper(adminDAO.class);
		
		String popidx =req.getParameter("popidx");
		String popInfo =req.getParameter("popInfo");
		String popImg =req.getParameter("popImg");
		String popupUri =req.getParameter("popupUri");

		Map<String,Object> data = new HashMap<String, Object>();
		data.put("popidx", popidx);
		data.put("popInfo", popInfo);
		data.put("popImg", popImg);
		data.put("popupUri", popupUri);
		
		int result = adao.update_popup(data);
		
		return result;
	}
	
	@PostMapping("admin/deletePopup")
	@ResponseBody
	public int deletePopup(HttpServletRequest req) {
		
		String popidx =req.getParameter("popidx");
	
		adminDAO adao =  sqlsession.getMapper(adminDAO.class);
		
		int result = adao.delete_popup(popidx);
		
		return result;
	}
	
}
