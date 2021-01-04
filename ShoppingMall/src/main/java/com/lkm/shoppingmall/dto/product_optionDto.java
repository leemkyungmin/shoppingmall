package com.lkm.shoppingmall.dto;

public class product_optionDto {

	int poidx;
	String poname;
	int poprice;
	int podept;
	
	public product_optionDto() {}
	
	
	public int getPoidx() {
		return poidx;
	}


	public void setPoidx(int poidx) {
		this.poidx = poidx;
	}


	public int getPodept() {
		return podept;
	}


	public void setPodept(int podept) {
		this.podept = podept;
	}


	public String getPoname() {
		return poname;
	}
	public void setPoname(String poname) {
		this.poname = poname;
	}
	public int getPoprice() {
		return poprice;
	}
	public void setPoprice(int poprice) {
		this.poprice = poprice;
	}


	public product_optionDto(int poidx, String poname, int poprice, int podept) {
		super();
		this.poidx = poidx;
		this.poname = poname;
		this.poprice = poprice;
		this.podept = podept;
	}
	
	
	
	
}
