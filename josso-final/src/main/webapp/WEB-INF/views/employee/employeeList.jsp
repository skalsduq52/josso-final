<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jstl 사용하기 위한 선언부 -->
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                width: 1100px;
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

        <!--공통 아닌 것들-->
        <style>
            #tdnum{
            	padding-left : 30px
            }

            #selectnum {
                text-align: center;
                padding-right: 125px;
            }
            .search {
                height: 33px;
            }

            #board tbody tr td {
                height: 40px;
            }
            
            table {
                min-width: 1000px;
            }

            #theme {
                padding-left: 50px;
            }

            .bottom_area {
                display: inline-block;
                padding-top: 10px;
                padding-bottom: 10px;
                padding-right: 50px;
            }
            
            #employeeName:hover {
            	cursor:pointer;
            	color:blue;
            	font-weight:bold;
            }
            
            #employeeName {
            	color:slateblue;
            }
            
            #picture {
            	border:solid 1px lightgray;
            	width : 250px;
            	border-radius:50%
            	
            }
            
            .modal-title {
            	padding-left:10px;
            	font-size:2em;
            	font-weight:bold;
            }
            
            #modal-body {
            	padding-top:10px;
            	padding-left:8px;
            }
            
                        
            .modaltd {
            	width:8%;
            	text-align:right;
            }
            
            .modaltd2 {
            	padding-left:2%
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
                        <span class="icon"><i class="fas fa-user-friends fa-lg icon_" aria-hidden="true"></i>주소록</span>
                            
                    </div>
                </section>
                <section>
                    <div class="title_button">
                        <button type="button" onclick="location.href='/josso/employee/employeeInsert'" class="btn btn-info btn-sm btn-block">사원등록</button>
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
            <div class="border-top border-bottom">
                <table style="width: 100%;" id="board" class="table table-hover">
	
                    <thead>
                        <tr class="border-bottom" style="height: 40px;">
                            <th id="tdnum" style="width: 6%;">부서</th>
                            <th id="theme" style="width: 8%; ">이름</th>
                            <th style="width: 6%">직급</th>
                            <th style="width: 8%">직책</th>
                            <th style="width: 8%">사원번호</th>
                            <th style="width: 8%">입사일자</th>
                            <th style="width: 8%">Tel</th>
                            <th style="width: 8%">Phone</th>
                            <th style="width: 10%">E-mail</th>
                            <th style="width: 5%">수정</th>
                            <th style="width: 5%">삭제</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="employee" items="${employeeList}">
                        <tr>
                            <td id="tdnum">${employee.departmentCode }</td>
                            <td id="theme"><span class="employeeName" id="employeeName">${employee.employeeName }</span></td>
                            <td>${employee.rankCode }</td>
                            <td>${employee.positionCode }</td>
                            <td class="employeeNumber">${employee.employeeNumber }</td>
                            <td><fmt:formatDate value="${employee.employeeHireDate }" pattern="yy / MM / dd"></fmt:formatDate></td>
                            <td>${employee.employeeExtensionNumber }</td>
                            <td>${employee.employeePhone }</td>
                            <td><a href="${pageContext.request.contextPath}/email/write/directSend?emailAccept=${employee.employeeEmail}">${employee.employeeEmail}</a></td>
                       
                            <td><a href="/josso/employeeUpdate.do?employeeNumber=${employee.employeeNumber}" ><i class="fas fa-pencil-alt " style="color:lightred"></i></a></td>
                            <td><a href="/josso/employeeDelete.do?employeeNumber=${employee.employeeNumber}" onclick="return confirm('정말로 삭제하시겠습니까?')"><i class="far fa-trash-alt " style="color:gray"></i></a></td>
                        </tr>
                    </c:forEach> 
	                     
                    </tbody>  
                    	    
                </table>
            </div>
            <div>     
                <ul class="pagination" style="padding-top: 20px; padding-left: 40%;">
                    <li class="page-item "><a class="page-link" href="#">＜</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">＞</a></li>
                </ul>
            </div>
            
            
            <div class="bottom_area" style="float:right;">
                <select class="search" style="height: 38px;">
                    <option>이름</option>
                    <option>부서</option>
                </select>
                <input type="text" name="search" class="search" style="padding-bottom: 2px; height: 38px;">
                <button class="btn btn-success" style="height: 38px; margin-bottom: 5px;">검색</button>
            </div>                       
                        
                       
          
        </main>
</body>

</html>
