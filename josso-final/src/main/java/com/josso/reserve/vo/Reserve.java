package com.josso.reserve.vo;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Component;

import com.josso.employee.vo.Employee;

@Component
public class Reserve implements Serializable{
	private static final long serialVersionUID = 3333L;
	
	private int reservationNumber;
	private String reservationStartDate;
	private String startTime;
	private String endTime;
	private String reservationPurpose;
	private String employeeNumber;
	private int itemNumber;
	
	private List<Employee> employee;
	private List<Item> item;
	
	public int getReservationNumber() {
		return reservationNumber;
	}
	public void setReservationNumber(int reservationNumber) {
		this.reservationNumber = reservationNumber;
	}
	public String getReservationStartDate() {
		return reservationStartDate;
	}
	public void setReservationStartDate(String reservationStartDate) {
		this.reservationStartDate = reservationStartDate;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getReservationPurpose() {
		return reservationPurpose;
	}
	public void setReservationPurpose(String reservationPurpose) {
		this.reservationPurpose = reservationPurpose;
	}
	public String getEmployeeNumber() {
		return employeeNumber;
	}
	public void setEmployeeNumber(String employeeNumber) {
		this.employeeNumber = employeeNumber;
	}
	public int getItemNumber() {
		return itemNumber;
	}
	public void setItemNumber(int itemNumber) {
		this.itemNumber = itemNumber;
	}
	public List<Employee> getEmployee() {
		return employee;
	}
	public void setEmployee(List<Employee> employee) {
		this.employee = employee;
	}
	public List<Item> getItem() {
		return item;
	}
	public void setItem(List<Item> item) {
		this.item = item;
	}
	
}
