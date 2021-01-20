package com.lkm.shoppingmall.command.index;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.ui.Model;

import com.lkm.shoppingmall.commom.command;
import com.lkm.shoppingmall.dao.indexDAO;
import com.lkm.shoppingmall.dto.*;

public class indexCommand implements command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		try {
			indexDAO idao =  sqlSession.getMapper(indexDAO.class);
			ArrayList<bannerDto> bdto = idao.getbanner();
			
			ArrayList<PopupNoticeDto> poplist =  new ArrayList<PopupNoticeDto>();
			poplist= idao.getpopup();
			JSONArray arr =new JSONArray();
			for(int i=0; i<poplist.size(); i++) {
				JSONObject obj = new JSONObject();
				obj.put("popidx",poplist.get(i).getPopIdx());
				obj.put("popname",poplist.get(i).getPopInfo());
				obj.put("popimg",poplist.get(i).getPopImg());
				obj.put("popuri",poplist.get(i).getPopUri());
				arr.add(obj);
			}
			
			
			model.addAttribute("poplist",arr.toString());			
			model.addAttribute("bdto",bdto);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
