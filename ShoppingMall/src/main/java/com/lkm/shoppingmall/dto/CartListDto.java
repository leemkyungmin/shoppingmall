package com.lkm.shoppingmall.dto;

import lombok.Data;

public class CartListDto {
	
	int pIdx,cIdx,pOrder_price,cPrice,cTotal_Count;
	String dName,cName,pName,pSumnail;
	
	public CartListDto() {}
	
	public int getpIdx() {
		return pIdx;
	}
	public void setpIdx(int pIdx) {
		this.pIdx = pIdx; 
	}
	public int getcIdx() {
		return cIdx;
	}
	public void setcIdx(int cIdx) {
		this.cIdx = cIdx;
	}
	public int getpOrder_price() {
		return pOrder_price;
	}
	public void setpOrder_price(int pOrder_price) {
		this.pOrder_price = pOrder_price;
	}
	public int getcPrice() {
		return cPrice;
	}
	public void setcPrice(int cPrice) {
		this.cPrice = cPrice;
	}
	public int getcTotal_Count() {
		return cTotal_Count;
	}
	public void setcTotal_Count(int cTotal_Count) {
		this.cTotal_Count = cTotal_Count;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getpSumnail() {
		return pSumnail;
	}
	public void setpSumnail(String pSumnail) {
		this.pSumnail = pSumnail;
	}
	public CartListDto(int pIdx, int cIdx, int pOrder_price, int cPrice, int cTotal_Count, String dName, String cName,
			String pName, String pSumnail) {
		super();
		this.pIdx = pIdx;
		this.cIdx = cIdx;
		this.pOrder_price = pOrder_price;
		this.cPrice = cPrice;
		this.cTotal_Count = cTotal_Count;
		this.dName = dName;
		this.cName = cName;
		this.pName = pName;
		this.pSumnail = pSumnail;
	}
	

	
	
}
