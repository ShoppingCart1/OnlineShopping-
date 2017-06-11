package com.mivim.controller;

public class Product {
	private static final long serialVersionUID = 1L;

	private int id;
	private String name;
	private double price;
	private String inventory;
	private String description;
	private String categoryName;
	private String subCategory;
	
	public Product() {
	}

	public Product(int id, String name, double price,String inventory,
			String description, String categoryName, String subCategory) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.inventory=inventory;
		this.description = description;
		this.categoryName = categoryName;
		this.subCategory = subCategory;
		
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getInventory() {
		return inventory;
	}
	public void setInventory(String inventory) {
		this.inventory = inventory;
	}


	public String getCategory() {
		return categoryName;
	}

	public void setCategory(String category) {
		this.categoryName = category;
	}

	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	

}
