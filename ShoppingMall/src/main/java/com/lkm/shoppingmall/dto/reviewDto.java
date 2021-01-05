package com.lkm.shoppingmall.dto;

import java.sql.Date;

public class reviewDto {

	int rIdx;
	String rWriter;
	String bOption;
	String rContent;
	int rAting;
	Date rWrite_date;
	int bidx;
	
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public int getrIdx() {
		return rIdx;
	}
	public void setrIdx(int rIdx) {
		this.rIdx = rIdx;
	}
	public String getrWriter() {
		return rWriter;
	}
	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}
	public String getbOption() {
		return bOption;
	}
	public void setbOption(String bOption) {
		this.bOption = bOption;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public int getrAting() {
		return rAting;
	}
	public void setrAting(int rAting) {
		this.rAting = rAting;
	}
	public Date getrWrite_date() {
		return rWrite_date;
	}
	public void setrWrite_date(Date rWrite_date) {
		this.rWrite_date = rWrite_date;
	}
	
	
	public reviewDto() {}
	public reviewDto(int rIdx, String rWriter, String bOption, String rContent, int rAting, Date rWrite_date,
			int bidx) {
		super();
		this.rIdx = rIdx;
		this.rWriter = rWriter;
		this.bOption = bOption;
		this.rContent = rContent;
		this.rAting = rAting;
		this.rWrite_date = rWrite_date;
		this.bidx = bidx;
	}
	
}
