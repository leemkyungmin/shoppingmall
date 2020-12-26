package com.lkm.shoppingmall.dto;

import java.sql.Date;

public class orderListDto {
	
	int bIdx;
	int pIdx;
	String bOrder_num;
	String pName;
	int price;
	int pOrder_price;
	int bOrder_status;
	int count;
	String pNimg;
	Date bDate;
	
	public orderListDto() {}
	
	
	public Date getbDate() {
		return bDate;
	}
	

	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}


	public int getpIdx() {
		return pIdx;
	}


	public void setpIdx(int pIdx) {
		this.pIdx = pIdx;
	}


	public int getbIdx() {
		return bIdx;
	}


	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}


	public String getbOrder_num() {
		return bOrder_num;
	}
	public void setbOrder_num(String bOrder_num) {
		this.bOrder_num = bOrder_num;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	
	public int getpOrder_price() {
		return pOrder_price;
	}
	public void setpOrder_price(int pOrder_price) {
		this.pOrder_price = pOrder_price;
	}
	public int getbOrder_status() {
		return bOrder_status;
	}
	public void setbOrder_status(int bOrder_status) {
		this.bOrder_status = bOrder_status;
	}

	public String getpNimg() {
		return pNimg;
	}
	public void setpNimg(String pNimg) {
		this.pNimg = pNimg;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public orderListDto(int bIdx,int pIdx, String bOrder_num, String pName, int price, int pOrder_price,
			int bOrder_status, int count, String pNimg,Date bDate) {
		super();
		this.bIdx = bIdx; 
		this.pIdx = pIdx;
		this.bOrder_num = bOrder_num;
		this.pName = pName;
		this.price = price;
		this.pOrder_price = pOrder_price;
		this.bOrder_status = bOrder_status;
		this.count = count;
		this.pNimg = pNimg;
		this.bDate = bDate;
	}
	
	
}
