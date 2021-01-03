package com.lkm.shoppingmall.dto;

public class product_notice {

	int pNidx;
	String pNimg;
	int pIdx;
	String pImg;
	
	public product_notice() {}
	
	public int getpNidx() {
		return pNidx;
	}
	public void setpNidx(int pNidx) {
		this.pNidx = pNidx;
	}
	public String getpNimg() {
		return pNimg;
	}
	public void setpNimg(String pNimg) {
		this.pNimg = pNimg;
	}
	public int getpIdx() {
		return pIdx;
	}
	public void setpIdx(int pIdx) {
		this.pIdx = pIdx;
	}
	public String getpImg() {
		return pImg;
	}
	public void setpImg(String pImg) {
		this.pImg = pImg;
	}
	public product_notice(int pNidx, String pNimg, int pIdx, String pImg) {
		super();
		this.pNidx = pNidx;
		this.pNimg = pNimg;
		this.pIdx = pIdx;
		this.pImg = pImg;
	}
	
	
}
