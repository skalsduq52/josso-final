<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 사용하기 위한 선언부 -->
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/common.css"></link>
        <title>josso</title>
        <!-- 외부 글꼴 적용 시 링크 -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
        <!-- Icon -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
        crossorigin="anonymous">
        <!-- 부트스트랩 css 사용 -->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- fullcalendar css -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.1/main.min.css">
        <!-- fullcalendar js -->
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.1/main.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
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
              <%@ include file="../include/logout.jsp"%>
        </nav>
        <main>
            <div id="main">
            <form action="/josso/employeeInsert.do" method="post">
                <b>기본정보</b><br>
                <hr>
                <label for="employeeNumber">사원번호</label>
                <input type="text" name="employeeNumber" id="employeeNumber"/><br>
                <label for="employeeName">이름</label>
                <input type="text" name="employeeName" id="employeeName"/><br>
                <label for="employeePassword">비밀번호</label>
                <input type="password" name="employeePassword" id="employeePassword"/><br>
                <label for="employeeBirth">주민번호</label>
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
                <input type="submit" value="등록">
                   
            </form>
        </div>
        </main>
</body>

</html>
