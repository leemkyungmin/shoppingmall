package com.lkm.shoppingmall.dto;

import java.sql.Date;

public class userDto {

	int uIdx;
	String uSerid;
	String uPw;
	String uName;
	String uAddress;
	String uPhone;
	int uPoint;
	String uGrade;
	Date uReg_date;
	String uEmail;
	String show;
	
	public String getShow() {
		return show;
	}

	public void setShow(String show) {
		this.show = show;
	}

	public userDto() {
		
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public Date getuReg_date() {
		return uReg_date;
	}

	public void setuReg_date(Date uReg_date) {
		this.uReg_date = uReg_date;
	}

	public String getuGrade() {
		return uGrade;
	}

	public void setuGrade(String uGrade) {
		this.uGrade = uGrade;
	}

	public int getuIdx() {
		return uIdx;
	}

	public void setuIdx(int uIdx) {
		this.uIdx = uIdx;
	}

	public String getuSerid() {
		return uSerid;
	}

	public void setuSerid(String uSerid) {
		this.uSerid = uSerid;
	}

	public String getuPw() {
		return uPw;
	}

	public void setuPw(String uPw) {
		this.uPw = uPw;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuAddress() {
		return uAddress;
	}

	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public int getuPoint() {
		return uPoint;
	}

	public void setuPoint(int uPoint) {
		this.uPoint = uPoint;
	}

	public userDto(int uIdx, String uSerid, String uPw, String uName, String uAddress, String uPhone, int uPoint,String uGrade,String uEmail,String show) {
		super();
		this.uIdx = uIdx;
		this.uSerid = uSerid;
		this.uPw = uPw;
		this.uName = uName;
		this.uAddress = uAddress;
		this.uPhone = uPhone;
		this.uPoint = uPoint;
		this.uGrade = uGrade;
		this.uEmail = uEmail;
		this.show = show;
	}
	
	
	
}
