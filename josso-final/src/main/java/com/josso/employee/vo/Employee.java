package com.josso.employee.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Employee {
	// 주석추가 - 홍수맹
	   private static final long serialVersionUID = 1111L;
	   private String employeeNumber;			// 사원번호
	   private String employeePassword;			// 비밀번호
	   private String employeeName;				// 사원이름
	   private String departmentCode;			// 부서코드
	   private String rankCode;					// 직급
	   private String positionCode;				// 직책
	   private String roleCode;					// 권한(1,2,3)
	   private String employeeEmail;			// 이메일
	   private String employeePhone;			// 휴대폰
	   private String employeeAddress;			// 집주소
	   private String employeeBirth;			// 생년월일
	   private String employeeExtensionNumber;	// 내선번호
	   private String employeePicture;			// 사진
	   @DateTimeFormat(pattern="yyyy-MM-dd")
	   private Date employeeHireDate;			// 입사일
	   @DateTimeFormat(pattern="yyyy-MM-dd")
	   private Date employeeRegistrationDate;	// 관리자가 사원을 등록한 일자
	   @DateTimeFormat(pattern="yyyy-MM-dd")
	   private Date employeeLoginDate;			// 사원별 로그인 날짜
	   private int employeeAnnualLeave;			// 연차휴가
	   private String emailAuthKey;				// 이메일 인증키
	   
	//기본 생성자   
	public Employee() {
		super();
	}
	
	//전체필드 생성자
	
	
	public Employee(String employeeNumber, String employeePassword, String employeeName, String departmentCode,
			String rankCode, String positionCode, String roleCode, String employeeEmail, String employeePhone,
			String employeeAddress, String employeeBirth, String employeeExtensionNumber, String employeePicture,
			Date employeeHireDate, Date employeeRegistrationDate, Date employeeLoginDate, int employeeAnnualLeave) {
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
		this.employeeAnnualLeave = employeeAnnualLeave;
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

	public void setEmployeeRegistrationDate(Date employeeRegistrationDate) {
		this.employeeRegistrationDate = employeeRegistrationDate;
	}

	public Date getEmployeeLoginDate() {
		return employeeLoginDate;
	}

	public void setEmployeeLoginDate(Date employeeLoginDate) {
		this.employeeLoginDate = employeeLoginDate;
	}

	public int getEmployeeAnnualLeave() {
		return employeeAnnualLeave;
	}

	public void setEmployeeAnnualLeave(int employeeAnnualLeave) {
		this.employeeAnnualLeave = employeeAnnualLeave;
	}
	
	

	public String getEmailAuthKey() {
		return emailAuthKey;
	}

	public void setEmailAuthKey(String emailAuthKey) {
		this.emailAuthKey = emailAuthKey;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	  
	   
}

