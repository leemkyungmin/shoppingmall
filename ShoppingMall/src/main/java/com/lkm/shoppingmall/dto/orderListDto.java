package com.lkm.shoppingmall.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class orderListDto {
	
	int bIdx;
	int pIdx;
	String bOrder_num;
	String pName;
	int price;
	int pOrder_price;
	int bOrder_status;
	int count;
	String pSumnail;
	Date bDate;
	
	public orderListDto() {}
	
	public int getbIdx() {
		return bIdx;
	}
	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}
	public int getpIdx() {
		return pIdx;
	}
	public void setpIdx(int pIdx) {
		this.pIdx = pIdx;
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
	public String getpSumnail() {
		return pSumnail;
	}
	public void setpSumnail(String pSumnail) {
		this.pSumnail = pSumnail;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	public orderListDto(int bIdx, int pIdx, String bOrder_num, String pName, int price, int pOrder_price,
			int bOrder_status, int count, String pSumnail, Date bDate) {
		super();
		this.bIdx = bIdx;
		this.pIdx = pIdx;
		this.bOrder_num = bOrder_num;
		this.pName = pName;
		this.price = price;
		this.pOrder_price = pOrder_price;
		this.bOrder_status = bOrder_status;
		this.count = count;
		this.pSumnail = pSumnail;
		this.bDate = bDate;
	}
	
	
	
	
	
}
