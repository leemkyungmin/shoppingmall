package com.lkm.shoppingmall.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.lkm.shoppingmall.command.searchCommand;
import com.lkm.shoppingmall.command.index.indexCommand;
import com.lkm.shoppingmall.command.my.customer_svc_write;
import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.indexDAO;
import com.lkm.shoppingmall.dto.productsDto;



@Controller
public class indexController {

	@Autowired
	private SqlSession sqlSession;
	private command command;
	
	//index 페이지
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String mainPage(HttpServletRequest req,Model model) {
		
		command=new indexCommand();
		command.execute(sqlSession, model);
		
		return "index";
	}
	@RequestMapping(value="index",method=RequestMethod.GET)
	public String mainPage2(HttpServletRequest req,Model model) {
		
		command=new indexCommand();
		command.execute(sqlSession, model);
		
		return "index";
	}
	
	@RequestMapping(value="search",method=RequestMethod.GET)
	public String search(HttpServletRequest req,Model model) {
		model.addAttribute("req", req);
		command =new searchCommand();
		command.execute(sqlSession, model);
		return "searchPage";
	}
	@PostMapping( value="getProductInfo",produces="text/html; charset=utf-8")
	@ResponseBody
	public String return_product(@RequestParam("pidx") String pidx) {
		
		indexDAO idao = sqlSession.getMapper(indexDAO.class);
		productsDto pdto = idao.getproduct(pidx);
		
		JSONArray arr = new JSONArray();
		JSONObject obj = new JSONObject();
		obj.put("pname", pdto.getpName());
		obj.put("price", pdto.getpRice());
		obj.put("psumnail", pdto.getpSumnail());
		obj.put("ptag", pdto.getpTag());
		System.out.println(obj.toString());
		return obj.toString();
	}
	
	@PostMapping(value="recent_product_list",produces="text/html; charset=utf-8")
	@ResponseBody
	public String product_list(@RequestParam("ptag") String ptag) {
		System.out.println(ptag);
		ArrayList<productsDto> plist = new ArrayList<productsDto>();
		
		indexDAO idao = sqlSession.getMapper(indexDAO.class);
		plist =idao.getproudct_list(ptag);
		
		JSONArray arr =  new JSONArray();
		for(int i=0; i<plist.size(); i++) { 
			JSONObject obj = new JSONObject();
			obj.put("pidx", plist.get(i).getpIdx());
			obj.put("pname", plist.get(i).getpName());
			obj.put("psumnail", plist.get(i).getpSumnail());
			obj.put("price", plist.get(i).getpRice());
			arr.add(obj);
		}
		
		System.out.println(arr);
		
		return arr.toString();
	}
}
