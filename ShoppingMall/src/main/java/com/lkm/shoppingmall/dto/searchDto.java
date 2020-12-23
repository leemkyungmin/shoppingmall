package com.lkm.shoppingmall.dto;

public class searchDto {

	int pIdx;
	String pName;
	double Rating;
	int Rcount;
	int pRice;
	String dName;
	String pNimg;
	
	public String getpNimg() {
		return pNimg;
	}

	public void setpNimg(String pNimg) {
		this.pNimg = pNimg;
	}

	public searchDto() {}
	
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
	public double getRating() {
		return Rating;
	}
	public void setRating(double rating) {
		Rating = rating;
	}
	public int getRcount() {
		return Rcount;
	}
	public void setRcount(int rcount) {
		Rcount = rcount;
	}
	public int getpRice() {
		return pRice;
	}
	public void setpRice(int pRice) {
		this.pRice = pRice;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public searchDto(int pIdx, String pName, double rating, int rcount, int pRice, String dName,String pNimg) {
		super();
		this.pIdx = pIdx;
		this.pName = pName;
		Rating = rating;
		Rcount = rcount;
		this.pRice = pRice;
		this.dName = dName;
		this.pNimg = pNimg;
	}
	
	
	
}
