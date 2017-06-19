package com.mivim.dto;

import java.io.Serializable;

public class AddCartDto implements Serializable {
	
	private String itemId=null;
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((itemId == null) ? 0 : itemId.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AddCartDto other = (AddCartDto) obj;
		if (itemId == null) {
			if (other.itemId!= null)
				return false;
		} else if (!itemId.equals(other.itemId))
			return false;
		return true;
	}
	
	private String itemName=null;
	private String unitPirce=null;
	private String inventary=null;
	private String itemDescription=null;
	
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
	public String getUnitPirce() {
		return unitPirce;
	}
	public void setUnitPirce(String unitPirce) {
		this.unitPirce = unitPirce;
	}
	public String getInventary() {
		return inventary;
	}
	public void setInventary(String inventary) {
		this.inventary = inventary;
	}
	public String getItemDescription() {
		return itemDescription;
	}
	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}
	
	
}