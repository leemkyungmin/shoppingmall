package com.lkm.shoppingmall.dto;

import java.sql.Date;


public class productsDto {
	
	//제품 등록 추가 사항 
	//products : 업체가 등록한 상품의 기본정보를 가지고있는다 .
	//데이터 :상품번호 ,상품명, 별점, 평균가격 ,배송비 ,상품상태,배송방법,연락처 ,메인 이미지
	//products_notice : 등록한 상품의 공지사항 이미지 ,상품 이미지 를 가지고있는다.(상품 이미지 데이터 처리 해결할것) 
	//데이터 : 공지사항 번호 , 공지사항 이미지 , 상품번호(products)테이블을 바라보고있음,상품정보 이미지
	
	
	//products_option : 옵션에 따른 데이터를 어떻게 처리해야할까 ... ?
	//ex) 옵션번호 ,상품명,가격,옵션번호 참조(default 0),상품번호(products 테이블 참조)
	// 종류 옵션을 선택하면  ajax 를 이용해 종류 옵션의 옵션번호를 넘겨 옵션참조번호 = 옵션번호 일치 하는 데이터 가지고오기.
	// 예상쿼리 select * from products_option  where 옵션참조번호 = ajax 를 통해 넘어온 옵션번호 값 ..
	
	
	int pIdx;
	String pName;
	int pRice;
	int pRice_per;
	Date pDate;
	int dIdx;
	int pOrder_price;
	String pSumnail;
	
	public productsDto() {}
	
	public int getpIdx() {
		return pIdx;
	}
	public void setpIdx(int pIdx) {
		this.pIdx = pIdx;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpRice() {
		return pRice;
	}
	public void setpRice(int pRice) {
		this.pRice = pRice;
	}
	public int getpRice_per() {
		return pRice_per;
	}
	public void setpRice_per(int pRice_per) {
		this.pRice_per = pRice_per;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}
	public int getdIdx() {
		return dIdx;
	}
	public void setdIdx(int dIdx) {
		this.dIdx = dIdx;
	}

	public int getpOrder_price() {
		return pOrder_price;
	}

	public void setpOrder_price(int pOrder_price) {
		this.pOrder_price = pOrder_price;
	}

	public String getpSumnail() {
		return pSumnail;
	}

	public void setpSumnail(String pSumnail) {
		this.pSumnail = pSumnail;
	}

	public productsDto(int pIdx, String pName, int pRice, int pRice_per, Date pDate, int dIdx, int pOrder_price,
			String pSumnail) {
		super();
		this.pIdx = pIdx;
		this.pName = pName;
		this.pRice = pRice;
		this.pRice_per = pRice_per;
		this.pDate = pDate;
		this.dIdx = dIdx;
		this.pOrder_price = pOrder_price;
		this.pSumnail = pSumnail;
	}
	
	
	
}
