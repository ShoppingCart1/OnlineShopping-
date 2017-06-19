package com.mivim.dto;

import java.io.Serializable;

public class OrderDto implements Serializable{
   private String userId;
   private String subTotal;
   private String itemId[];
   private String itemName;
   private String total[];
   private String quantity[];
   private double price;
   
   public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public String getItemName() {
	return itemName;
}
public void setItemName(String itemName) {
	this.itemName = itemName;
}
public String getUserId() {
	   return userId ;  
   }
   public void setUserId(String userId) {
	   this.userId=userId;
   }
   public String getSubTotal() {
	   return subTotal;
   }
   public void setSubTotal(String subTotal) {
	   this.subTotal= subTotal;
   }
   public String[] getItemId() {
	   return itemId;
   }
   public void setItemId(String[] itemId) {
	   this.itemId= itemId;
   }
   public String[] getTotal() {
	   return total;
   }
   public void setTotal(String[] total) {
	  this.total= total;
   }
   public String[] getQuantity() {
	   return quantity;
   }
   public void setQuantity(String[] quantity) {
	   this.quantity=quantity;
   }
}
