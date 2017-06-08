package com.mivim.dto;

import java.io.File;
import java.io.FileInputStream;
import java.io.Serializable;

public class AdminDTO implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/*
	 * All references Initialization here
	 */
	private String itemId=null;
	private String itemName=null;
	private String unitPrice=null;
	private String imagePath=null;
	private String inventory=null;
	private String itemDescription=null;
	private String categoryId=null;
	private String categoryName=null;
	private String subCategoryId=null;
	private String parentId=null;
	private File image=null;
	private FileInputStream imageStream=null;
	private String statusCode=null;
	
	public String getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getInventory() {
		return inventory;
	}
	public void setInventory(String inventory) {
		this.inventory = inventory;
	}
	public String getItemDescription() {
		return itemDescription;
	}
	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getSubCategoryId() {
		return subCategoryId;
	}
	public void setSubCategoryId(String subCategoryId) {
		this.subCategoryId = subCategoryId;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public FileInputStream getImageStream() {
		return imageStream;
	}
	public void setImageStream(FileInputStream imageStream) {
		this.imageStream = imageStream;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	/*
	 * 
	 * These are setters and getters in AdminDTO Class
	 */
	
	

}
