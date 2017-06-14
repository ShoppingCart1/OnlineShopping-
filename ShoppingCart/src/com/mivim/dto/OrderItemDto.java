package com.mivim.dto;

import java.io.Serializable;

public class OrderItemDto implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	private String itemId=null;
	private String userId=null;
	private double subTotal;
	private String total=null;
	private String	quantiy=null;
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getQuantiy() {
		return quantiy;
	}
	public void setQuantiy(String quantiy) {
		this.quantiy = quantiy;
	}
	
	
}
