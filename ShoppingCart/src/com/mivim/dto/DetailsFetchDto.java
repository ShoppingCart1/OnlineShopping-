package com.mivim.dto;

import java.util.ArrayList;

public class DetailsFetchDto {
 private String user_id = null;
 private String orderId;
 private String sub_total;
 private String grand_total;
 private String item_id;
 private String itemName;
 private String address_line1;
 private String address_line2;
 private String city;
 private String state;
 private String pincode;
 private String totalPrice=null;
 private String quantity=null;
 

/**
 * @return the itemName
 */
public String getItemName() {
	return itemName;
}



/**
 * @param itemName the itemName to set
 */
public void setItemName(String itemName) {
	this.itemName = itemName;
}



/**
 * @return the quantity
 */
public String getQuantity() {
	return quantity;
}



/**
 * @param quantity the quantity to set
 */
public void setQuantity(String quantity) {
	this.quantity = quantity;
}



/**
 * @return the totalPrice
 */
public String getTotalPrice() {
	return totalPrice;
}



/**
 * @param totalPrice the totalPrice to set
 */
public void setTotalPrice(String totalPrice) {
	this.totalPrice = totalPrice;
}



public String getOrderId() {
	return orderId;
}



public void setOrderId(String orderId) {
	this.orderId = orderId;
}



public String getSub_total() {
	return sub_total;
}



public void setSub_total(String sub_total) {
	this.sub_total = sub_total;
}



public String getGrand_total() {
	return grand_total;
}



public void setGrand_total(String grand_total) {
	this.grand_total = grand_total;
}



public String getItem_id() {
	return item_id;
}



public void setItem_id(String item_id) {
	this.item_id = item_id;
}

public String getAddress_line1() {
	return address_line1;
}

public void setAddress_line1(String address_line1) {
	this.address_line1 = address_line1;
}

public String getAddress_line2() {
	return address_line2;
}

public void setAddress_line2(String address_line2) {
	this.address_line2 = address_line2;
}



public String getCity() {
	return city;
}



public void setCity(String city) {
	this.city = city;
}



public String getState() {
	return state;
}



public void setState(String state) {
	this.state = state;
}



public String getPincode() {
	return pincode;
}



public void setPincode(String pincode) {
	this.pincode = pincode;
}

public String getUser_id() {
	return user_id;
}


public void setUser_id(String user_id) {
	this.user_id = user_id;
}
 

}
