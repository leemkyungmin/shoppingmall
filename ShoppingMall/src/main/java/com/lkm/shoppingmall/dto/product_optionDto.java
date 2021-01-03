package com.lkm.shoppingmall.dto;

public class product_optionDto {

	String top_menu;
	String poname;
	int poprice;
	
	public product_optionDto() {}
	
	public String getTop_menu() {
		return top_menu;
	}
	public void setTop_menu(String top_menu) {
		this.top_menu = top_menu;
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
	public product_optionDto(String top_menu, String poname, int poprice) {
		super();
		this.top_menu = top_menu;
		this.poname = poname;
		this.poprice = poprice;
	}
	
	
	
}
