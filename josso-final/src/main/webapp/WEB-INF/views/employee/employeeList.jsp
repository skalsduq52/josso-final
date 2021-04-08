<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 사용하기 위한 선언부 -->
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/common.css"></link>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<title>Employee List</title>
	        <!--공통 CSS-->
        <style>
            nav {
                height: 130px;
            }
            .nav_title{
                float: left;
                display: block;
                width: 1000px;
                height: 80px;
                padding: 50px 30px;
                text-align: left;
            }

            .nav_content {
                float: left;
                display:block;
                margin-left: 20px;
                width: 800px;
                height: 70px;
                margin-top: 7px;
                border-radius: 20px;
                text-align: left;
                background: cornsilk;
            }

            .report_kind {
               color: gray;
           }

           .report_kind:hover {
               text-decoration: none;
           }

           .hover_tag {
               padding-left: 45px;
           }
           .loginInfo{
           		float:right;
           		display:block;
           		margin:20px;
           }
        </style>

</head>
<body class="body">
  		<header>
            <%@ include file="../include/header.jsp"%>
        </header>
        <aside class="border-right">
            <div>
                <section>
                    <div class="title">
                        <span class="icon"><i class="fas fa-calendar-alt icon_" aria-hidden="true"></i>캘린더</span>
                            
                    </div>
                </section>
                <section>
                    <div class="title_button">
                        <button type="button" class="btn btn-info btn-sm btn-block">일정등록</button>
                    </div>
                </section>
                <section>
                    
                    <div class="side_title">
                        <span class="hover_icon">
                            <i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                        </span>
                        <span class="hover_title">내 캘린더</span>
                        <span class="write_img">
                            <img src="../images/글쓰기(연필).png">
                        </span>
                    </div>
                    <div>
                        <ul class="hover_tag">
                            <li>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1" checked>
                                    <label class="form-check-label" for="inlineCheckbox1">내 일정</label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                                    <label class="form-check-label" for="inlineCheckbox1">내 일정</label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                                    <label class="form-check-label" for="inlineCheckbox1">내 일정</label>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
        </aside>
        <nav class="border-bottom" style="padding-bottom: 100px;">
                <div class="nav_title">
                    <h2 id="suggestion_title" style="font-weight: 600;">전체 주소록</h2>
                </div>
                <div class="loginInfo">${employee.employeeName}님 안녕하세요.</div>
                <br>
                <div>
                </div>
        </nav>
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
