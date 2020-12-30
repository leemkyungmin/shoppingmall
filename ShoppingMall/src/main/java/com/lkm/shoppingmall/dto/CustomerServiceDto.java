package com.lkm.shoppingmall.dto;

import java.sql.Date;

public class CustomerServiceDto {

	int cIdx;
	String cTitle;
	String cContent;
	String cType;
	int cHit;
	String cStatus;
	int uIdx;
	int dIdx;
	Date cReg_date;
	
	
	public CustomerServiceDto() {}
	
	public int getcIdx() {
		return cIdx;
	}
	public void setcIdx(int cIdx) {
		this.cIdx = cIdx;
	}
	public String getcTitle() {
		return cTitle;
	}
	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public String getcType() {
		return cType;
	}
	public void setcType(String cType) {
		this.cType = cType;
	}
	public int getcHit() {
		return cHit;
	}
	public void setcHit(int cHit) {
		this.cHit = cHit;
	}
	public String getcStatus() {
		return cStatus;
	}
	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}
	public int getuIdx() {
		return uIdx;
	}
	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}
	public int getdIdx() {
		return dIdx;
	}
	public void setdIdx(int dIdx) {
		this.dIdx = dIdx;
	}
	public Date getcReg_date() {
		return cReg_date;
	}
	public void setcReg_date(Date cReg_date) {
		this.cReg_date = cReg_date;
	}
	public CustomerServiceDto(int cIdx, String cTitle, String cContent, String cType, int cHit, String cStatus, int uIdx,
			int dIdx, Date cReg_date) {
		super();
		this.cIdx = cIdx;
		this.cTitle = cTitle;
		this.cContent = cContent;
		this.cType = cType;
		this.cHit = cHit;
		this.cStatus = cStatus;
		this.uIdx = uIdx;
		this.dIdx = dIdx;
		this.cReg_date = cReg_date;
	}
	
	
}
