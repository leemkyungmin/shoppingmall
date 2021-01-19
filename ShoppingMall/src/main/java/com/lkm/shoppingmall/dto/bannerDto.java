package com.lkm.shoppingmall.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class bannerDto {

	int bidx;
	String bFilename;
	String BDEPTNAME;
	Date BDATE;
	String bManager;
	String bManager_number;
	
	public bannerDto() {}

	public String getbFilename() {
		return bFilename;
	}

	public void setbFilename(String bFilename) {
		this.bFilename = bFilename;
	}

	public String getbManager() {
		return bManager;
	}

	public void setbManager(String bManager) {
		this.bManager = bManager;
	}

	public String getbManager_number() {
		return bManager_number;
	}

	public void setbManager_number(String bManager_number) {
		this.bManager_number = bManager_number;
	}

	public bannerDto(int bidx, String bFilename, String bDEPTNAME, Date bDATE, String bManager,
			String bManager_number) {
		super();
		this.bidx = bidx;
		this.bFilename = bFilename;
		BDEPTNAME = bDEPTNAME;
		BDATE = bDATE;
		this.bManager = bManager;
		this.bManager_number = bManager_number;
	}

	
	
	
	
	
	
}
