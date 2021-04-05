package com.josso.reserve.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Item implements Serializable{
	private static final long serialVersionUID = 5434L;
	
	private int itemNumber;
	private String itemName;
	
	public int getItemNumber() {
		return itemNumber;
	}
	public void setItemNumber(int itemNumber) {
		this.itemNumber = itemNumber;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
}
