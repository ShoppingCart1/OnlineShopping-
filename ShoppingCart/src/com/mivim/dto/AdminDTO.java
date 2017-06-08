package com.mivim.dto;

import java.io.File;
import java.io.FileInputStream;
import java.io.Serializable;

public class AdminDTO implements Serializable{
	
	
	/*
	 * All references Initialization here
	 */
	private String item_id=null;
	private String item_name=null;
	private String unit_price=null;
	private String image_path=null;
	private String inventory=null;
	private String item_description=null;
	private String category_id=null;
	private String category_name=null;
	private String sub_category_id=null;
	private String Status=null;

	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		this.Status = status;
	}
	private File image=null;
	private FileInputStream image_stream=null;
	
	
	
	/*
	 * 
	 * These are setters and getters in AdminDTO Class
	 */
	public String getItem_id() {
		return item_id;
	}
	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(String unit_price) {
		this.unit_price = unit_price;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public String getInventory() {
		return inventory;
	}
	public void setInventory(String inventory) {
		this.inventory = inventory;
	}
	public String getCategory_id() {
		return category_id;
	}
	public void setCategory_id(String category_id) {
		this.category_id = category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public String getItem_description() {
		return item_description;
	}
	public void setItem_description(String item_description) {
		this.item_description = item_description;
	}
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public FileInputStream getImage_stream() {
		return image_stream;
	}
	public void setImage_stream(FileInputStream image_stream) {
		this.image_stream = image_stream;
	}
	public String getSub_category() {
		return sub_category_id;
	}
	public void setSub_category(String sub_category_id) {
		this.sub_category_id = sub_category_id;
	}
	
	
	

}
