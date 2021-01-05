package com.lkm.shoppingmall.dto;

public class buyOptionDto {
	int bOidx;
	String bOname;
	int bOprice;
	int bOcount;
	int bIdx;
	
	public buyOptionDto() {}

	public int getbOidx() {
		return bOidx;
	}

	public void setbOidx(int bOidx) {
		this.bOidx = bOidx;
	}

	public String getbOname() {
		return bOname;
	}

	public void setbOname(String bOname) {
		this.bOname = bOname;
	}

	public int getbOprice() {
		return bOprice;
	}

	public void setbOprice(int bOprice) {
		this.bOprice = bOprice;
	}

	public int getbOcount() {
		return bOcount;
	}

	public void setbOcount(int bOcount) {
		this.bOcount = bOcount;
	}

	public int getbIdx() {
		return bIdx;
	}

	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}

	public buyOptionDto(int bOidx, String bOname, int bOprice, int bOcount, int bIdx) {
		super();
		this.bOidx = bOidx;
		this.bOname = bOname;
		this.bOprice = bOprice;
		this.bOcount = bOcount;
		this.bIdx = bIdx;
	}

	
}
