package com.lkm.shoppingmall.dto;

public class searchDto {

	int pIdx;
	String pName;
	double rRating;
	int rRcount;
	int pRice;
	String dName;
	String pSumnail;
	
	public searchDto(){}

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

	public int getrRating() {
		return (int) rRating;
	}

	public void setrRating(double rRating) {
		this.rRating = rRating;
	}

	public int getrRcount() {
		return rRcount;
	}

	public void setrRcount(int rRcount) {
		this.rRcount = rRcount;
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

	

	public String getpSumnail() {
		return pSumnail;
	}

	public void setpSumnail(String pSumnail) {
		this.pSumnail = pSumnail;
	}

	public searchDto(int pIdx, String pName, double rRating, int rRcount, int pRice, String dName, String pSumnail) {
		super();
		this.pIdx = pIdx;
		this.pName = pName;
		this.rRating = rRating;
		this.rRcount = rRcount;
		this.pRice = pRice;
		this.dName = dName;
		this.pSumnail = pSumnail;
	}
	
	
	
}
