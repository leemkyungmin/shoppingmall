package com.lkm.shoppingmall.dto;

import java.sql.Date;

import lombok.Data;


public class AdminNotice {

	int aidx;
	String aTitle,aContent;
	Date aReg_date;
	
	public AdminNotice() {}

	public int getAidx() {
		return aidx;
	}

	public void setAidx(int aidx) {
		this.aidx = aidx;
	}



	public String getaTitle() {
		return aTitle;
	}

	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public Date getaReg_date() {
		return aReg_date;
	}

	public void setaReg_date(Date aReg_date) {
		this.aReg_date = aReg_date;
	}

	public AdminNotice(int aidx, String aTitle, String aContent, Date aReg_date) {
		super();
		this.aidx = aidx;
		this.aTitle = aTitle;
		this.aContent = aContent;
		this.aReg_date = aReg_date;
	}
	
	
	
}
