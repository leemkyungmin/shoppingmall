package com.lkm.shoppingmall.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonArray;
import com.lkm.shoppingmall.command.product.myproductCommand;
import com.lkm.shoppingmall.commom.command;

@Controller
public class productController {

	@Autowired
	private SqlSession sqlsession;
	private command command;
	
	@RequestMapping("product/myproduct")
	public String myproducts(HttpServletRequest req,Model model) {
		HttpSession session =req.getSession();
		
		if(session.getAttribute("idx") !=null) {
			if(session.getAttribute("buysell").equals("sell")) {
				model.addAttribute("req", req);
				command = new myproductCommand();
				command.execute(sqlsession, model);
				return "product/myproduct";
			} else {
				return "redirect:/index";
			} 
		} else {
			return "redirect:/index";
		}
	}
	
	@RequestMapping("product/newProductsForm")
	public String newProduct(HttpServletRequest req,Model model) {
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("idx")==null) {
			return "redirect:/index";
		} else {
			String buysell = (String) session.getAttribute("buysell");
			if(buysell ==null) {
				return "redirect:/index";
			} else {
				return "product/newProductsForm";
			}
		}
		
	}
	@RequestMapping(value="product/insertsumnail",method=RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	public String img_return(MultipartHttpServletRequest  req) {
		
		MultipartFile file = req.getFile("file");
		String saveFilename = null;
		File saveFile =null;
		if(!file.isEmpty()) {
			String originFilename  =file.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf(".")+1);
			
			
			try {
				saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) +
						"_" +
						"sumnail" +
						"." + extName;
				String realPath = req.getSession().getServletContext().getRealPath("/resources/images/Department_sumnail");
				System.out.println(realPath);
				File directory = new File(realPath);
				System.out.println(directory);
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
	
	@RequestMapping(value="product/productnoticeupload",method=RequestMethod.POST,produces="text/html; charset=utf-8")
	@ResponseBody
	public String product_notice_Img_upload(MultipartHttpServletRequest mr ) throws Exception {		
		
		String files="";
		List<MultipartFile> flist = mr.getFiles("files");
		
		int st_num =0;
		int end_num =flist.size();
		
		System.out.println(flist.size());
		for(MultipartFile f : flist) {
			try {
				st_num++;
				String saveFilename="";
				String originFilename  =f.getOriginalFilename();
				String extName = originFilename.substring(originFilename.lastIndexOf(".")+1);
				try {
					saveFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) +
							"_" +
							"notice_img" +
							"." + extName;
					String realPath = mr.getSession().getServletContext().getRealPath("/resources/images/Department_notice");
					System.out.println(realPath);
					File directory = new File(realPath);
					System.out.println(directory);
					if ( !directory.exists() ) {
						
						directory.mkdirs();
					}
					File saveFile = new File(realPath, saveFilename);
					f.transferTo(saveFile);
					files +=saveFilename;
					if(st_num <end_num) {
						files+=",";
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return files;
	}
}
