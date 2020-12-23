package com.lkm.shoppingmall.dto;

import java.sql.Date;

public class productsDto {
	int pIdx;
	String pName;
	int pRice;
	int pRice_per;
	Date pDate;
	int dIdx;
	int pNidx;
	
	public productsDto() {}
	
	public int getpIdx() {
		return pIdx;
	}
	public void setpIdx(int pIdx) {
		this.pIdx = pIdx;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpRice() {
		return pRice;
	}
	public void setpRice(int pRice) {
		this.pRice = pRice;
	}
	public int getpRice_per() {
		return pRice_per;
	}
	public void setpRice_per(int pRice_per) {
		this.pRice_per = pRice_per;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}
	public int getdIdx() {
		return dIdx;
	}
	public void setdIdx(int dIdx) {
		this.dIdx = dIdx;
	}
	public int getpNidx() {
		return pNidx;
	}
	public void setpNidx(int pNidx) {
		this.pNidx = pNidx;
	}
	public productsDto(int pIdx, String pName, int pRice, int pRice_per, Date pDate, int dIdx, int pNidx) {
		super();
		this.pIdx = pIdx;
		this.pName = pName;
		this.pRice = pRice;
		this.pRice_per = pRice_per;
		this.pDate = pDate;
		this.dIdx = dIdx;
		this.pNidx = pNidx;
	}
	
	
	
}
