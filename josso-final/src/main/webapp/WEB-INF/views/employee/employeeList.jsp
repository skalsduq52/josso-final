<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 사용하기 위한 선언부 -->
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<title>Employee List</title>
</head>
<body>
  
        <main>
            <div id="main">
                <table>
	
                    <tr height = "40" style="border-top: 1px solid #ddd;">
                        <th>사번</th>
                        <th>이름</th>
                        <th>생년월일</th>
                        <th>휴대폰</th>
                        <th>주소</th>
                        <th>이메일</th>
                        <th>입사일</th>
                        <th>부서코드</th>
                        <th>직위</th>
                        <th>직책</th>
                        <th>내선번호</th>
                        <th>가입일</th>
                        <th>로그인날짜</th>
                        <th>권한</th>
                        
                    </tr>
                    
                <c:forEach var="employee" items="${employeeList }">
                    <!-- employee 변수를 선언해서 컨트롤러에서 넘겨준 Employee 데이터를 저장 -->
                    
                    <tr height = "40" style="border-top: 1px solid #ddd;">
                        <td><a href="/josso/employee/employeeView?employeeNumber=${employee.employeeNumber}">${employee.employeeNumber}</a></td>
                        <td>${employee.employeeName}</td>
                        <td>${employee.employeeBirth}</td>
                        <td>${employee.employeePhone}</td>
                        <td>${employee.employeeAddress}</td>
                        <td>${employee.employeeEmail}</td>
                        <td>${employee.employeeHireDate}</td>
                        <td>${employee.departmentCode}</td>
                        <td>${employee.rankCode}</td>
                        <td>${employee.positionCode}</td>
                        <td>${employee.employeeExtensionNumber}</td>
                        <td>${employee.employeeRegistrationDate}</td>
                        <td>${employee.employeeLoginDate}</td>
                        <td>${employee.roleCode}</td>
                                
                        
                        <td><a href="/josso/employeeDelete.do?employeeNumber=${employee.employeeNumber}">삭제</a></td>
                        
                    </tr>
                    
                </c:forEach>
                
                    <tr>
                        <td><a href="employeeInsert">등록</a></td>
                    </tr>
                </table>
        </div>
        </main>
</body>

</html>