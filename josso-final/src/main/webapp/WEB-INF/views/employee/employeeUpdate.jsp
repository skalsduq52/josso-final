<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보 수정</title>
<style>
            #title{
                padding: 15px 20px;
                font-size: 20px;
            }
            #main{
                margin: 15px 15px;
            }
            label{
                width:65px;
            }
        </style>
</head>
<body>

<form action="employeeUpdate.do" method="post">
	 <b>기본정보</b><br>
                <hr>
                <label for="employeeNumber">사원번호</label>
                <input type="text" name="employeeNumber" id="employeeNumber"/><br>
                <label for="employeeName">이름</label>
                <input type="text" name="employeeName" id="employeeName"/><br>
                <label for="employeePassword">비밀번호</label>
                <input type="password" name="employeePassword" id="employeePassword"/><br>
                <label for="employeeBirth">생년월일</label>
                <input type="text" name="employeeBirth" id="employeeBirth"/><br>
                <label for="employeePhone">휴대폰</label>
                <input type="text" name="employeePhone" id="employeePhone"/><br>
                <label for="employeeAddress">주소</label>
                <input type="text" name="employeeAddress" id="employeeAddress"/><br>
                <label for="employeePicture">사진</label>
                <input type="text" name="employeePicture" id="employeePicture"/><br>
                <label for="employeeEmail">이메일</label>
                <input type="email" name="employeeEmail" id="employeeEmail"/><br>
                <label for="employeeHireDate">입사일</label>
                <input type="text" name="employeeHireDate"id="employeeHireDate"/>
                <hr><br>

                <b>추가정보</b><br>
                <hr>
                <label for="departmentCode">부서명</label>
                <input type="text" name="departmentCode" id="departmentCode"/><br>
                <label for="rankCode">직급</label>
                <input type="text" name="rankCode" id="rankCode"/><br>
                <label for="positionCode">직책</label>
                <input type="text" name="positionCode" id="positionCode"/><br>
                <label for="employeeExtensionNumber">내선번호</label>
                <input type="text" name="employeeExtensionNumber" id="employeeExtensionNumber"/><br>
                <label for="employeeRegDate">가입일</label>
                <input type="text" name="employeeRegistrationDate" id="employeeRegistrationDate"/><br>
                <label for="employeeLogDate">로그인</label>
                <input type="text" name="employeeLoginDate" id="employeeLoginDate"/><br>
                <label for="roleCode">권한</label>
                <input type="text" name="roleCode" id="roleCode"/><br>
                <hr>
                <input type="submit" value="수정">
</form>
</body>
</html>