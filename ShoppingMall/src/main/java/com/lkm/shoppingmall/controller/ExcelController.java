package com.lkm.shoppingmall.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lkm.shoppingmall.dao.productDAO;
import com.lkm.shoppingmall.dto.Dept_OrderList_ToFile;


@Controller
public class ExcelController {

	@Autowired
	private SqlSession SqlSession;
	

	@RequestMapping("Excel/CreateExcelFile")
	public void excelDown(HttpServletResponse response,HttpServletRequest  req) throws Exception {
		
		
		HttpSession session = req.getSession();
		if(session.getAttribute("idx") !=null) {
			if(session.getAttribute("buysell").equals("sell")) {
				
				try {
					productDAO pdao = SqlSession.getMapper(productDAO.class);
					
					String didx =(Integer) session.getAttribute("idx")+"";
					
					String filename="";
					Date date = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					String day = sdf.format(date);
					
					Map<String, Object> data = new HashMap<String, Object>();
					data.put("date",day);
					data.put("didx", didx);
					
					int count =pdao.DeptTodayExcelCount(data)+1;
					String dName=pdao.getDname(didx);
					
					filename=day+dName+(count+"")+"차";
					
					ArrayList<Dept_OrderList_ToFile> olist = new ArrayList<Dept_OrderList_ToFile>();
					olist =  pdao.getFile(didx);

					
				    Workbook wb = new HSSFWorkbook();
				    Sheet sheet = wb.createSheet(filename);
				    Row row = null;
				    Cell cell = null;
				    int rowNo = 0;
				   
				    CellStyle bodyStyle = wb.createCellStyle();
				    bodyStyle.setAlignment(HorizontalAlignment.CENTER);
				    Font font = wb.createFont(); 
				    font.setFontHeightInPoints((short) 14);
				    bodyStyle.setFont(font);

				    sheet.setColumnWidth(0, 2300);
				    sheet.setColumnWidth(1, 5000);
				    sheet.setColumnWidth(2, 5000);
				    sheet.setColumnWidth(3, 1500);
				    sheet.setColumnWidth(4, 5000);
				    sheet.setColumnWidth(5, 5000);
				    sheet.setColumnWidth(6, 20000);
				    sheet.setColumnWidth(7, 10000);
				    sheet.setColumnWidth(8, 10000);
				    
				    row = sheet.createRow(rowNo++);
				    cell = row.createCell(0);
				    cell.setCellStyle(bodyStyle);
				    cell.setCellValue("구매번호");
				    cell = row.createCell(1);
				    cell.setCellStyle(bodyStyle);
				    cell.setCellValue("주문번호");
				    cell = row.createCell(2);
				    cell.setCellStyle(bodyStyle);
				    cell.setCellValue("옵션명");
				    cell = row.createCell(3);
				    cell.setCellStyle(bodyStyle);
				    cell.setCellValue("갯수");
				    cell = row.createCell(4);
				    cell.setCellStyle(bodyStyle);
				    cell.setCellValue("이름");
				    cell = row.createCell(5);
				    cell.setCellStyle(bodyStyle);
				    cell.setCellValue("전화번호");
				    cell = row.createCell(6);
				    cell.setCellStyle(bodyStyle);
				    cell.setCellValue("주소");
				    cell = row.createCell(7);
				    cell.setCellStyle(bodyStyle);
				    cell.setCellValue("배달  요청사항");
				    cell = row.createCell(8);
				    cell.setCellStyle(bodyStyle);
				    cell.setCellValue("송장번호");
				    
				    // 데이터 부분 생성

				    for(Dept_OrderList_ToFile dot : olist) {

				        row = sheet.createRow(rowNo++);
				        cell = row.createCell(0);
				        cell.setCellStyle(bodyStyle);
				        cell.setCellValue(dot.getbIdx());
				        cell = row.createCell(1);
				        cell.setCellStyle(bodyStyle);
				        cell.setCellValue(dot.getbOrder_num());
				        cell = row.createCell(2);
				        cell.setCellStyle(bodyStyle);
				        cell.setCellValue(dot.getBoName());
				        cell = row.createCell(3);
				        cell.setCellStyle(bodyStyle);
				        cell.setCellValue(dot.getBoCount());
				        cell = row.createCell(4);
				        cell.setCellStyle(bodyStyle);
				        cell.setCellValue(dot.getName());
				        cell = row.createCell(5);
				        cell.setCellStyle(bodyStyle);
				        cell.setCellValue(dot.getPhone());
				        cell = row.createCell(6);
				        cell.setCellStyle(bodyStyle);
				        cell.setCellValue(dot.getAddress());
				        cell = row.createCell(7);
				        cell.setCellStyle(bodyStyle);
				        cell.setCellValue(dot.getbOrder_ment());
				        cell = row.createCell(8);
				        cell.setCellStyle(bodyStyle);
				        cell.setCellValue("");
				        
				    }
				    // 컨텐츠 타입과 파일명 지정
				    System.out.println(filename);
				    response.setContentType("ms-vnd/excel; charset=euc-kr");
				    response.setHeader("Content-Description" , "JSP Generated Data");
				    response.setHeader("Content-Disposition", "attachment; filename="+new String(filename.getBytes("euc-kr"),"8859_1")+".xls");
				    // 엑셀 출력
				    wb.write(response.getOutputStream());
				    
				    // 서버에 생성된 액셀 파일 저장 
				    String realPath = req.getSession().getServletContext().getRealPath("/resources/excelFiles");
					File directory = new File(realPath);
					if ( !directory.exists() ) {
						directory.mkdirs();
					}
				    File file =new File(realPath+"/"+filename+".xls");
				    data.put("filename",filename+".xls");
					if( file.exists()) {
						file.delete();
						pdao.Delete_excel(data);
					}
				    FileOutputStream fos = new FileOutputStream(realPath+"/"+filename+".xls");
				    wb.write(fos);
				    int result =pdao.Insert_excel(data);				   
				    
				    if(result >0) {
				    	for(int i=0; i<olist.size(); i++) {
				    		Map<String,Object> buy_update =  new HashMap<String, Object>();
				    		buy_update.put("bidx",olist.get(i).getbIdx());
				    		buy_update.put("enidx",data.get("enidx"));
				    		pdao.Update_buys(buy_update);
				    	}
				    }
				    // 종료 
				    wb.close();
				    
				    
				}catch(Exception e) {
					e.printStackTrace();
				}
				
			}
		}
		
	}
	
	@Autowired
	private SqlSession Sqlsession;
	
	@PostMapping("Excel/excel_final_updload")
	@ResponseBody
	public int excel_upload(MultipartHttpServletRequest mr) throws IllegalStateException, IOException {
		
		MultipartFile f = mr.getFile("file");
		String enidx =mr.getParameter("enidx");
		
		String saveFilename="";
		String originFilename  =f.getOriginalFilename();
		String extName = originFilename.substring(originFilename.lastIndexOf(".")+1);
		if(!(extName.toUpperCase().equals("XLS") || extName.toUpperCase().equals("XLSX")) ) {
			extName="xls";
		}
		saveFilename = originFilename.substring(0, originFilename.lastIndexOf("."))+
				"." + extName;
		String realPath = mr.getSession().getServletContext().getRealPath("/resources/excelFiles");
		File directory = new File(realPath);
		if ( !directory.exists() ) {
			directory.mkdirs();
		}
		File file =new File(realPath+"/"+saveFilename);
		if( file.exists()) {
			file.delete();
		}
		
		File saveFile = new File(realPath, saveFilename);
		f.transferTo(saveFile);
		
		productDAO pdao = Sqlsession.getMapper(productDAO.class);
		Map<String,Object> data=  new HashMap<String, Object>();
		data.put("enidx", enidx);
		data.put("en_file_final",saveFilename);
		int result = pdao.update_excelFile_final(data);
		System.out.println(realPath);
		FileInputStream fis = new FileInputStream(saveFile);
		Workbook wb =null;
		if(extName.toUpperCase().endsWith("XLS")) {
            try {
                wb = new HSSFWorkbook(fis);
            } catch (IOException e) {
                throw new RuntimeException(e.getMessage(), e);
            }
        }
        else if(extName.toUpperCase().endsWith("XLSX")) {
            try {
                wb = new XSSFWorkbook(fis);
            } catch (IOException e) {
                throw new RuntimeException(e.getMessage(), e);
            }
        }
		
		Sheet sheet =wb.getSheetAt(0);
		
		int target_bidx =0;
		int target_postnum =0;
		for(int i=0; i<sheet.getRow(0).getPhysicalNumberOfCells(); i++ ) {
			Cell cell = sheet.getRow(0).getCell(i);
			if(cell.toString().equals("구매번호")) {
				target_bidx=i;
			} else if(cell.toString().equals("송장번호")) {
				target_postnum=i;
			}
		}
		System.out.println("target_bidx="+target_bidx);
		System.out.println("target_postnum="+target_postnum);
		
		int row_count = sheet.getPhysicalNumberOfRows();
		
		for(int i=1; i<row_count; i++) {
			Row row = sheet.getRow(i);
			System.out.println(row.getCell(target_bidx).toString());
			System.out.println(row.getCell(8).toString().replaceAll("-",""));
			Map<String,Object> final_data =new HashMap<String, Object>();
			final_data.put("bidx",row.getCell(target_bidx).toString());
			final_data.put("post_num",row.getCell(8).toString().replaceAll("-",""));
			final_data.put("enidx",enidx);
			result =pdao.update_post_num(final_data);
		}
		
		if(result >0) {
		
			
		}
		

		return result;
	}
		
}
