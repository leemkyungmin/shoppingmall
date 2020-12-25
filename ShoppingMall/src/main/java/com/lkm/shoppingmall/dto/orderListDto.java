package com.lkm.shoppingmall.dto;

public class orderListDto {
	
	int bIdx;
	int pIdx;
	String bOrder_num;
	String pName;
	String Price;
	String pOrder_price;
	char bOrder_status;
	String bCount;
	String pNimg;
	
	public orderListDto() {}
	
	
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
	public String getPrice() {
		return Price;
	}
	public void setPrice(String price) {
		Price = price;
	}
	public String getpOrder_price() {
		return pOrder_price;
	}
	public void setpOrder_price(String pOrder_price) {
		this.pOrder_price = pOrder_price;
	}
	public char getbOrder_status() {
		return bOrder_status;
	}
	public void setbOrder_status(char bOrder_status) {
		this.bOrder_status = bOrder_status;
	}
	public String getbCount() {
		return bCount;
	}
	public void setbCount(String bCount) {
		this.bCount = bCount;
	}
	public String getpNimg() {
		return pNimg;
	}
	public void setpNimg(String pNimg) {
		this.pNimg = pNimg;
	}


	public orderListDto(int bIdx,int pIdx, String bOrder_num, String pName, String price, String pOrder_price,
			char bOrder_status, String bCount, String pNimg) {
		super();
		this.bIdx = bIdx; 
		this.pIdx = pIdx;
		this.bOrder_num = bOrder_num;
		this.pName = pName;
		Price = price;
		this.pOrder_price = pOrder_price;
		this.bOrder_status = bOrder_status;
		this.bCount = bCount;
		this.pNimg = pNimg;
	}
	
	
}
