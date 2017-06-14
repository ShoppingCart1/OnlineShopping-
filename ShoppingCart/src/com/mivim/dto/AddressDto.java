package com.mivim.dto;

import java.io.Serializable;

public class AddressDto implements Serializable{
private String user_id;
private String addressline1;
private String addressline2;
private String city;
private String state;
private String pincode;
private int status;
public String getUser_id() {
	return user_id;
}
public void setUser_id(String user_id) {
	this.user_id = user_id;
}
public String getAddressline1() {
	return addressline1;
}
public void setAddressline1(String addressline1) {
	this.addressline1 = addressline1;
}
public String getAddressline2() {
	return addressline2;
}
public void setAddressline2(String addressline2) {
	this.addressline2 = addressline2;
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
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
}
