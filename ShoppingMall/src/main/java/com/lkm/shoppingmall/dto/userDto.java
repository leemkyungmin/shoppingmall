package com.lkm.shoppingmall.dto;

public class userDto {

	int uIdx;
	String uSerid;
	String uPw;
	String uName;
	String uAddress;
	String uPhone;
	int uPoint;
	
	public userDto() {
		
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

	public userDto(int uIdx, String uSerid, String uPw, String uName, String uAddress, String uPhone, int uPoint) {
		super();
		this.uIdx = uIdx;
		this.uSerid = uSerid;
		this.uPw = uPw;
		this.uName = uName;
		this.uAddress = uAddress;
		this.uPhone = uPhone;
		this.uPoint = uPoint;
	}
	
	
	
}
