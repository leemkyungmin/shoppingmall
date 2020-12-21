package com.lkm.shoppingmall.dto;

import java.sql.Date;

public class departmentDto {

	int dIdx;
	String dId;
	String dPw;
	String dPhone;
	String dSaup_no;
	String dType;
	String dName;
	String dAddress;
	int dPoint;
	Date dReg_date;
	
	public departmentDto() {
		
	}

	public int getdIdx() {
		return dIdx;
	}

	public void setdIdx(int dIdx) {
		this.dIdx = dIdx;
	}

	public String getdId() {
		return dId;
	}

	public void setdId(String dId) {
		this.dId = dId;
	}

	public String getdPw() {
		return dPw;
	}

	public void setdPw(String dPw) {
		this.dPw = dPw;
	}

	public String getdPhone() {
		return dPhone;
	}

	public void setdPhone(String dPhone) {
		this.dPhone = dPhone;
	}

	public String getdSaup_no() {
		return dSaup_no;
	}

	public void setdSaup_no(String dSaup_no) {
		this.dSaup_no = dSaup_no;
	}

	public String getdType() {
		return dType;
	}

	public void setdType(String dType) {
		this.dType = dType;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public String getdAddress() {
		return dAddress;
	}

	public void setdAddress(String dAddress) {
		this.dAddress = dAddress;
	}

	public int getdPoint() {
		return dPoint;
	}

	public void setdPoint(int dPoint) {
		this.dPoint = dPoint;
	}

	public Date getdReg_date() {
		return dReg_date;
	}

	public void setdReg_date(Date dReg_date) {
		this.dReg_date = dReg_date;
	}

	public departmentDto(int dIdx, String dId, String dPw, String dPhone, String dSaup_no, String dType, String dName,
			String dAddress, int dPoint, Date dReg_date) {
		super();
		this.dIdx = dIdx;
		this.dId = dId;
		this.dPw = dPw;
		this.dPhone = dPhone;
		this.dSaup_no = dSaup_no;
		this.dType = dType;
		this.dName = dName;
		this.dAddress = dAddress;
		this.dPoint = dPoint;
		this.dReg_date = dReg_date;
	}

	
}
