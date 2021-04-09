<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
		<meta charset="UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hsm_common.css" type="text/css">
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
        <script>
            $(function(){
                $('.side_title').click(function(){
                    // $('.hover_tag').slideToggle("slow,linear,callback");
                    var submenu = $('.hover_tag>li');
                    if(submenu.is(":visible")){
                        submenu.slideUp();
                    }else{
                        submenu.slideDown();
                    }
                });
            });
        </script>

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
        </style>

        <!--공통 아닌 것들-->
        <style>
            #tdnum{
            	padding-left : 60px
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
		
		
		<!-- 모달 아작스 -->
		<script>
		
			$(function(){

                $('.employeeName').click(function(){
                    // var employeeNumber = '2001001';
                    // 못읽어옴
                    //var employeeNumber = $('.employeeNumber').text();
                    //console.log('employeeNumber : ' + employeeNumber);
                    var employeeNumber = $(this).parent().parent().children('.employeeNumber').text();
                    console.log(employeeNumber);
                    
                   	/* var imgPath = '<img src="${pageContext.request.contextPath}/resources/images/test_banana.PNG" id="picture">'; */
                   	var imgPath = '<img src="${pageContext.request.contextPath}/resources/multipartFile/';
                   	var imgPathEnd = '" id="picture">'; 
                    
                    $.ajax({
    					type : "POST",
    					url : "detail",
    					dataType : "json",
    					data : {
    						"employeeNumber" : employeeNumber,
    					},
    					success : function(data) {
						$('#addressDetail').modal();
    						
                    	
						$('.modal-title').html(data.name);
						$('#picture').html(imgPath+data.picture+imgPathEnd);
						$('#number').html(data.number);
						$('#rank').html(data.rank);
						$('#position').html(data.position);
						$('#email').html(data.email);
						$('#tel').html(data.tel);
						$('#phone').html(data.phone);
						$('#hiredate').html(data.hiredate);
    					},
    					error : function(request, status, error) {
    						alert("에러발생. 관리자에 문의하세요.");
    					}
    				})
                });
                
                
			})
		</script>
    </head>
    <body class="body">
		<header>
			<%@ include file="../include/header.jsp"%>
		</header>
		<aside class="border-right">
			<%@ include file="../staff/part/aside.jsp"%>
		</aside>
        <nav class="border-bottom" style="padding-bottom: 100px;">
                <div class="nav_title">
                    <h2 id="suggestion_title" style="font-weight: 600;">전체 주소록</h2>
                </div>
                <br>
                <div>
                </div>
        </nav>
        
        <main>
		
		<div class="border-top border-bottom">
                <table style="width: 100%;" id="board">
                    <thead>
                        <tr class="border-bottom" style="height: 40px;">
                            <th id="tdnum" style="width: 8%;">부서</th>
                            <th id="theme" style="width: 10%; ">이름</th>
                            <th style="width: 6%">직급</th>
                            <th style="width: 8%">직책</th>
                            <th style="width: 8%">사원번호</th>
                            <th style="width: 8%">입사일자</th>
                            <th style="width: 10%">Tel</th>
                            <th style="width: 10%">Phone</th>
                            <th style="width: 15%">E-mail</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="el" items="${employeeList}">
                        <tr>
                            <td id="tdnum">${el.departmentCode }</td>
                            <td id="theme"><span class="employeeName" id="employeeName">${el.employeeName }</span></td>
                            <td>${el.rankCode }</td>
                            <td>${el.positionCode }</td>
                            <td class="employeeNumber">${el.employeeNumber }</td>
                            <td><fmt:formatDate value="${el.employeeHireDate }" pattern="yy / MM / dd"></fmt:formatDate></td>
                            <td>${el.employeeExtensionNumber }</td>
                            <td>${el.employeePhone }</td>
                            <td><a href="${pageContext.request.contextPath}/email/write/directSend?emailAccept=${el.employeeEmail}">${el.employeeEmail}</a></td>
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
            
            
	<!-- 모달(팝업창) -->
	<div class="modal fade" id="addressDetail">
	  <div class="modal-dialog modal-dialog-centerd modal-md">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title"></h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
		
	      <!-- Modal body -->
	      <div id="modal-body">
	      <div class="modal-body">
	      		<table class="modal-table">
	      			<tr>
			        	<td colspan="2">
			        		<div id="picture">
			        		<%--  <img src="${pageContext.request.contextPath}/resources/images/test_banana.PNG" id="picture"> --%>
			        		</div><br>
			        	</td>
	      			</tr>
	      			
	      			<tr id="modaltr">
	      				<td class="modaltd">사원번호 &nbsp;&nbsp;&nbsp;: </td>
	      				<td class="modaltd2" id="number"><br>
			        	</td>
	      			</tr>
	      			
	      			<tr id="modaltr">
	      				<td class="modaltd">직     급 &nbsp;&nbsp;&nbsp;: </td>
	      				<td class="modaltd2" id="rank"><br>
			        	</td>
	      			</tr>
	      				      			
	      			<tr id="modaltr">
	      				<td class="modaltd">직     책 &nbsp;&nbsp;&nbsp;: </td>
	      				<td class="modaltd2" id="position">
			        	</td>
	      			</tr>
	      				      			
	      			<tr id="modaltr">
	      				<td class="modaltd">E-mail &nbsp;&nbsp;&nbsp;: </td>
	      				<td class="modaltd2" id="email">
			        	</td>
	      			</tr>
	      				      			
	      			<tr id="modaltr">
	      				<td class="modaltd">Tel &nbsp;&nbsp;&nbsp;: </td>
	      				<td class="modaltd2" id="tel">
			        	</td>
	      			</tr>
	      				      			
	      			<tr id="modaltr">
	      				<td class="modaltd">Phone &nbsp;&nbsp;&nbsp;: </td>
	      				<td class="modaltd2" id="phone">
			        	</td>
	      			</tr>
	      				      			
	      			<tr id="modaltr">
	      				<td class="modaltd" >입사일자 &nbsp;&nbsp;&nbsp;: </td>
	      				<td class="modaltd2" id="hiredate">
			        	</td>
	      			</tr>
	        	</table>
	       
	      </div>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      </div>
	
	    </div>
	  </div>
	</div>
    </body>
</html>