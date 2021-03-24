package com.josso.employee.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Employee {
	   private static final long serialVersionUID = 1111L;
	   private String employeeNumber;
	   private String employeePassword;
	   private String employeeName;
	   private String departmentCode;
	   private String rankCode;
	   private String positionCode;
	   private String roleCode;
	   private String employeeEmail;
	   private String employeePhone;
	   private String employeeAddress;
	   private String employeeBirth;
	   private String employeeExtensionNumber;
	   private String employeePicture;
	   @DateTimeFormat(pattern="yyyy-MM-dd")
	   private Date employeeHireDate;
	   @DateTimeFormat(pattern="yyyy-MM-dd")
	   private Date employeeRegistrationDate;
	   @DateTimeFormat(pattern="yyyy-MM-dd")
	   private Date employeeLoginDate;
	   
	//기본 생성자   
	public Employee() {
		super();
	}
	
	//전체필드 생성자
	public Employee(String employeeNumber, String employeePassword, String employeeName, String departmentCode,
			String rankCode, String positionCode, String roleCode, String employeeEmail, String employeePhone,
			String employeeAddress, String employeeBirth, String employeeExtensionNumber, String employeePicture,
			Date employeeHireDate, Date employeeRegistrationDate, Date employeeLoginDate) {
		super();
		this.employeeNumber = employeeNumber;
		this.employeePassword = employeePassword;
		this.employeeName = employeeName;
		this.departmentCode = departmentCode;
		this.rankCode = rankCode;
		this.positionCode = positionCode;
		this.roleCode = roleCode;
		this.employeeEmail = employeeEmail;
		this.employeePhone = employeePhone;
		this.employeeAddress = employeeAddress;
		this.employeeBirth = employeeBirth;
		this.employeeExtensionNumber = employeeExtensionNumber;
		this.employeePicture = employeePicture;
		this.employeeHireDate = employeeHireDate;
		this.employeeRegistrationDate = employeeRegistrationDate;
		this.employeeLoginDate = employeeLoginDate;
	}

	//주소록용 생성자
	public Employee(String employeeNumber, String employeeName, String departmentCode, String rankCode,
			String positionCode, String employeeEmail, String employeePhone, String employeeExtensionNumber,
			String employeePicture, Date employeeHireDate) {
		super();
		this.employeeNumber = employeeNumber;
		this.employeeName = employeeName;
		this.departmentCode = departmentCode;
		this.rankCode = rankCode;
		this.positionCode = positionCode;
		this.employeeEmail = employeeEmail;
		this.employeePhone = employeePhone;
		this.employeeExtensionNumber = employeeExtensionNumber;
		this.employeePicture = employeePicture;
		this.employeeHireDate = employeeHireDate;
	}

	public String getEmployeeNumber() {
		return employeeNumber;
	}
	public void setEmployeeNumber(String employeeNumber) {
		this.employeeNumber = employeeNumber;
	}
	public String getEmployeePassword() {
		return employeePassword;
	}
	public void setEmployeePassword(String employeePassword) {
		this.employeePassword = employeePassword;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getDepartmentCode() {
		return departmentCode;
	}
	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}
	public String getRankCode() {
		return rankCode;
	}
	public void setRankCode(String rankCode) {
		this.rankCode = rankCode;
	}
	public String getPositionCode() {
		return positionCode;
	}
	public void setPositionCode(String positionCode) {
		this.positionCode = positionCode;
	}
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public String getEmployeeEmail() {
		return employeeEmail;
	}
	public void setEmployeeEmail(String employeeEmail) {
		this.employeeEmail = employeeEmail;
	}
	public String getEmployeePhone() {
		return employeePhone;
	}
	public void setEmployeePhone(String employeePhone) {
		this.employeePhone = employeePhone;
	}
	public String getEmployeeAddress() {
		return employeeAddress;
	}
	public void setEmployeeAddress(String employeeAddress) {
		this.employeeAddress = employeeAddress;
	}
	public String getEmployeeBirth() {
		return employeeBirth;
	}
	public void setEmployeeBirth(String employeeBirth) {
		this.employeeBirth = employeeBirth;
	}
	public String getEmployeeExtensionNumber() {
		return employeeExtensionNumber;
	}
	public void setEmployeeExtensionNumber(String employeeExtensionNumber) {
		this.employeeExtensionNumber = employeeExtensionNumber;
	}
	public String getEmployeePicture() {
		return employeePicture;
	}
	public void setEmployeePicture(String employeePicture) {
		this.employeePicture = employeePicture;
	}
	public Date getEmployeeHireDate() {
		return employeeHireDate;
	}
	public void setEmployeeHireDate(Date employeeHireDate) {
		this.employeeHireDate = employeeHireDate;
	}
	
	public Date getEmployeeRegistrationDate() {
		return employeeRegistrationDate;
	}
	public void setEmployeeRegDate(Date employeeRegistrationDate) {
		this.employeeRegistrationDate = employeeRegistrationDate;
	}
	public Date getEmployeeLoginDate() {
		return employeeLoginDate;
	}
	public void setEmployeeLogDate(Date employeeLoginDate) {
		this.employeeLoginDate = employeeLoginDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	  
	   
}

