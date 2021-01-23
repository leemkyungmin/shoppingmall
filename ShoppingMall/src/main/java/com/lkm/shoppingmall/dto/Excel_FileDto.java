package com.lkm.shoppingmall.dto;

import java.sql.Date;


public class Excel_FileDto {

	int enIdx, dIdx,total;
	String enFile_name,enFile_final;
	Date en_Date;
	
	public Excel_FileDto() {};
	
	
	
	public int getTotal() {
		return total;
	}



	public void setTotal(int total) {
		this.total = total;
	}



	public int getEnIdx() {
		return enIdx;
	}
	public void setEnIdx(int enIdx) {
		this.enIdx = enIdx;
	}
	public int getdIdx() {
		return dIdx;
	}
	public void setdIdx(int dIdx) {
		this.dIdx = dIdx;
	}
	public String getEnFile_name() {
		return enFile_name;
	}
	public void setEnFile_name(String enFile_name) {
		this.enFile_name = enFile_name;
	}
	public String getEnFile_final() {
		return enFile_final;
	}
	public void setEnFile_final(String enFile_final) {
		this.enFile_final = enFile_final;
	}
	public Date getEn_Date() {
		return en_Date;
	}
	public void setEn_Date(Date en_Date) {
		this.en_Date = en_Date;
	}



	public Excel_FileDto(int enIdx, int dIdx, int total, String enFile_name, String enFile_final, Date en_Date) {
		super();
		this.enIdx = enIdx;
		this.dIdx = dIdx;
		this.total = total;
		this.enFile_name = enFile_name;
		this.enFile_final = enFile_final;
		this.en_Date = en_Date;
	}
	
	
}
