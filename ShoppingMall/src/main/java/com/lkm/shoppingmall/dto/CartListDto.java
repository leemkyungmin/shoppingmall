package com.lkm.shoppingmall.dto;

import lombok.Data;

@Data
public class CartListDto {
	
	int pIdx,cIdx,pOrder_price,cPrice,cTotal_Count;
	String cName,pName,pSumnail;
}
