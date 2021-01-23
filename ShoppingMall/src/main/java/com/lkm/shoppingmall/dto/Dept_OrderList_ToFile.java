package com.lkm.shoppingmall.dto;

public class Dept_OrderList_ToFile {

	int bIdx,boCount,enIdx;
	String bOrder_num,bOrder_ment,boName,address,name,phone,bPost_num;
	
	
	public Dept_OrderList_ToFile() {}


	public int getbIdx() {
		return bIdx;
	}


	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}


	public int getBoCount() {
		return boCount;
	}


	public void setBoCount(int boCount) {
		this.boCount = boCount;
	}


	public int getEnIdx() {
		return enIdx;
	}


	public void setEnIdx(int enIdx) {
		this.enIdx = enIdx;
	}


	public String getbOrder_num() {
		return bOrder_num;
	}


	public void setbOrder_num(String bOrder_num) {
		this.bOrder_num = bOrder_num;
	}


	public String getbOrder_ment() {
		return bOrder_ment;
	}


	public void setbOrder_ment(String bOrder_ment) {
		this.bOrder_ment = bOrder_ment;
	}


	public String getBoName() {
		return boName;
	}


	public void setBoName(String boName) {
		this.boName = boName;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getbPost_num() {
		return bPost_num;
	}


	public void setbPost_num(String bPost_num) {
		this.bPost_num = bPost_num;
	}


	public Dept_OrderList_ToFile(int bIdx, int boCount, int enIdx, String bOrder_num, String bOrder_ment, String boName,
			String address, String name, String phone, String bPost_num) {
		super();
		this.bIdx = bIdx;
		this.boCount = boCount;
		this.enIdx = enIdx;
		this.bOrder_num = bOrder_num;
		this.bOrder_ment = bOrder_ment;
		this.boName = boName;
		this.address = address;
		this.name = name;
		this.phone = phone;
		this.bPost_num = bPost_num;
	}

	
	
	
	
}
