package com.lkm.shoppingmall.dto;

import java.sql.Date;

public class myproduct {

	int pidx;
	String pname;
	Date pDate;
	int dIdx;
	int rCount;
	int rTotal;
	
	String pSumnail;
	String pOrder_price;
	String price;
	
	public myproduct() {}

	public int getPidx() {
		return pidx;
	}

	public void setPidx(int pidx) {
		this.pidx = pidx;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
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

	public int getrCount() {
		return rCount;
	}

	public void setrCount(int rCount) {
		this.rCount = rCount;
	}

	public int getrTotal() {
		return rTotal;
	}

	public void setrTotal(int rTotal) {
		this.rTotal = rTotal;
	}

	public String getpSumnail() {
		return pSumnail;
	}

	public void setpSumnail(String pSumnail) {
		this.pSumnail = pSumnail;
	}

	public String getpOrder_price() {
		return pOrder_price;
	}

	public void setpOrder_price(String pOrder_price) {
		this.pOrder_price = pOrder_price;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public myproduct(int pidx, String pname, Date pDate, int dIdx, int rCount, int rTotal, String pSumnail,
			String pOrder_price, String price) {
		super();
		this.pidx = pidx;
		this.pname = pname;
		this.pDate = pDate;
		this.dIdx = dIdx;
		this.rCount = rCount;
		this.rTotal = rTotal;
		this.pSumnail = pSumnail;
		this.pOrder_price = pOrder_price;
		this.price = price;
	}
	
	
	
}
