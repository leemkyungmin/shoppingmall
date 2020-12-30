package com.lkm.shoppingmall.dto;

import java.sql.Date;

public class customer_service_reviewDto {

	int cSridx;
	String cSrWriter;
	String cSrcontent;
	Date cSrwrite_date;
	int cIdx;
	
	public customer_service_reviewDto() {}
	
	public int getcSridx() {
		return cSridx;
	}
	public void setcSridx(int cSridx) {
		this.cSridx = cSridx;
	}
	public String getcSrWriter() {
		return cSrWriter;
	}
	public void setcSrWriter(String cSrWriter) {
		this.cSrWriter = cSrWriter;
	}
	public String getcSrcontent() {
		return cSrcontent;
	}
	public void setcSrcontent(String cSrcontent) {
		this.cSrcontent = cSrcontent;
	}
	public Date getcSrwrite_date() {
		return cSrwrite_date;
	}
	public void setcSrwrite_date(Date cSrwrite_date) {
		this.cSrwrite_date = cSrwrite_date;
	}
	public int getcIdx() {
		return cIdx;
	}
	public void setcIdx(int cIdx) {
		this.cIdx = cIdx;
	}

	public customer_service_reviewDto(int cSridx, String cSrWriter, String cSrcontent, Date cSrwrite_date, int cIdx) {
		super();
		this.cSridx = cSridx;
		this.cSrWriter = cSrWriter;
		this.cSrcontent = cSrcontent;
		this.cSrwrite_date = cSrwrite_date;
		this.cIdx = cIdx;
	}
	
	
}
