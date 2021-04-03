<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            $(function(){
	        	$('#allCk').click(function(){
                    // attr prop
                    if($('#allCk').prop('checked')==true){
                        $('input[name=check]').prop('checked',true);
                    } else {
                        $('input[name=check]').prop('checked', false);
                    }
                });
            });
            $(".check").on("change",function(){
                if($(".check").prop("checked") == true){
                         $("#allCk").prop("checked",true);
                         return;
                }                    
                if($(".check").prop("checked") == false){
                          $("#allCk").prop("checked",false);
                }
     		 })
     		 
     		 function allCheckFunc( obj ) {
					$("[name=check]").prop("checked", $(obj).prop("checked") );
			}
			
			/* 체크박스 체크시 전체선택 체크 여부 */
			function oneCheckFunc( obj )
			{
				var allObj = $("[name=allCk]");
				var objName = $(obj).attr("name");
			
				if( $(obj).prop("checked") )
				{
					checkBoxLength = $("[name="+ objName +"]").length;
					checkedLength = $("[name="+ objName +"]:checked").length;
			
					if( checkBoxLength == checkedLength ) {
						allObj.prop("checked", true);
					} else {
						allObj.prop("checked", false);
					}
				}
				else
				{
					allObj.prop("checked", false);
				}
			}
			
			$(function(){
				$("[name=allCk]").click(function(){
					allCheckFunc( this );
				});
				$("[name=check]").each(function(){
					$(this).click(function(){
						oneCheckFunc( $(this) );
					});
				});
			});
			
			$(function(){
				$('.reBtn').click(function(){
					var check = Array();
					var emailNumber = $('.check');
					var date = 0;
					for(i=0 ; i<emailNumber.length ; i++){
						 if(emailNumber[i].checked == true){
							 check[date] = emailNumber[i].value;
							date++;
						}
					}
					console.log(check.length);
					if(check.length == 0){
						alert("원하는 메일을 체크해주세요.");
					}else if( check.length > 1){
						alert("1개의 메일만 선택해주세요.");
						retunr;
					}else {
						location.href = '${pageContext.request.contextPath}/email/accept/reply?num='+check;
					}
				});
			});
			
			$(function(){
				$('.deliBtn').click(function(){
					var check = Array();
					var emailNumber = $('.check');
					var date = 0;
					for(i=0 ; i<emailNumber.length ; i++){
						 if(emailNumber[i].checked == true){
							 check[date] = emailNumber[i].value;
							date++;
						}
					}
					console.log(check.length);
					if(check.length == 0){
						alert("원하는 메일을 체크해주세요.");
					}else if( check.length > 1){
						alert("1개의 메일만 선택해주세요.");
						false;
					}else {
						location.href = '${pageContext.request.contextPath}/email/accept/delivery?num='+check;
					}
				});
			});
			
			$(function(){
				$('.readBtn').click(function(){
					var check = Array();
					var emailNumber = $('.check');
					var date = 0;
					for(i=0 ; i<emailNumber.length ; i++){
						 if(emailNumber[i].checked == true){
							 check[date] = emailNumber[i].value;
							date++;
						}
					}
					console.log(check.length);
					location.href = '${pageContext.request.contextPath}/email/accept/ckRead?num='+check;
				});
			});

			
			
        </script>
        <style>
	        tbody tr:hover {
				background: rgb(249, 249, 249);
			}
        	.content_top h1{
			    margin : -35px 0px 0px -25px;
			}
			.nav-search{
			    margin: -50px 0px 0px -15px;
			}
			.nav-menu {
			    margin: -15px 0px 0px 8px;
			}
			a:hover { color: blue; text-decoration: none;}
			
			.send-list-content a:hover { color: blue; text-decoration: underline;}
			 
        </style>
        <!-- <style type="text/css">
			 .send-list-content a:link { color: blue; text-decoration: none;}
			 .send-list-content a:visited { color: black; text-decoration: none;}
			 .send-list-content a:hover { color: blue; text-decoration: underline;}
			 
		</style>	 -->
    </head>
    <body class="body">
    
        <!-- navigation 삽입 -->
		<header>
			<%@ include file="../email/part/header.jsp"%>
		</header>
		
        <!-- aside 삽입 -->
		<aside class="border-right">
			<%@ include file="../email/part/aside.jsp"%>
		</aside>
		
        <nav class="border-bottom" >
            <!-- Navbar content -->
            <div class="container-xl-fluid">
                <div class="row">
                    <div class="col">
                        <div class="content_top">
                            <h1>받은메일함</h1>
                        </div>
                    </div>
                    
                    <div class="col-6"></div>
                    <div class="col">
                        
                </div>
                  </div>
                <div class="row">
                    <div class="col"> </div>
                    <div class="col"></div>
                    <div class="col"><span>
                    <form action="${pageContext.request.contextPath}/email/search" method="get">
                        <div class="input-group justify-content-right nav-search">
                            <input type="text" class="form-control" placeholder="Search" name="word" value="">
                            <div class="input-group-append">
                                <button class="btn btn-success" type="submit">검색</button>
                            </div>
                        </div>
                    </form>
                    </span></div>
                </div>
                <form action="${pageContext.request.contextPath}/email/accept/ckWastebasket" method="get">
                <div class="row">
                    <div class="col nav-menu">
                        <input type="button" class="reBtn btn btn-outline-info float-left" value="답장">
		                <input type="button" class="readBtn btn btn-outline-info float-left" value="읽음">
                        <input type="button" class="deliBtn btn btn-outline-info float-left" value="전달"> 
                        <input type="submit" class="btn btn-outline-info float-left" value="휴지통">
                    </div>
                    <div class="col"></div>
                    <div class="col"></div>
                </div>
            </div>
        </nav>

        <main>
            <br>
            <div class="container-fluid">
                <div>
                    <table class="table" style="text-align: center; border: 1px solid #dddddd">
                        
                        <!-- 받은 메일함 소제목-->
                        <thead>
                            <tr>
                                <td class="send-list-title" style="width: 10%;"><input type="hidden" id="userId" value="111@naver.com"><input type="checkbox" id="allCk" name="allCk"></td>
                                <td class="send-list-title" style="width: 20%;">보낸 사람</td>
                                <td class="send-list-title" style="width: 45%;">제목</td>
                                <td class="send-list-title" style="width: 25%;">작성일</td>
                            </tr>
                        </thead>
                        
                        <!-- 받은 메일 반복문으로 출력-->
                        
                        
                        
                        <tbody class="table table-borderless table-hover">
                            <c:forEach var="n" items="${acceptList}">
								<tr>
	                                <td><input type="checkbox" class="check" name="check" value="${n.emailNumber}"></td>
	                                <td>${n.employeeName}/${n.rankCode}/${n.departmentCode}</td>
	                            <c:set var="read" value="${n.emailRead}"/>
								
								<c:if test="${read eq 'YES'}">	                                
	                                <td class="send-list-content"><a style="color:black;" href="${pageContext.request.contextPath}/email/accept/detail?num=${n.emailNumber}">${n.emailTitle}</a></td>
	                            </c:if>
	                            <c:if test="${read eq 'NO'}">
	                            	<td class="send-list-content"><a style="font-weight:bold; font-size:15px;" href="${pageContext.request.contextPath}/email/accept/detail?num=${n.emailNumber}">${n.emailTitle}</a></td>
	                            </c:if>
	                            
	                                <td><fmt:formatDate value="${n.regDate}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"></fmt:formatDate></td>
	                            </tr>
							</c:forEach>
                        </tbody>
                        </table>
                </div>
            </div>
            </form>
            
            <ul class="pagination justify-content-center">
                
                    <li class="page-item"><a class="page-link" href="#"><<</a></li>
                    <li class="page-item"><a class="page-link" href="#"><</a></li>&nbsp;&nbsp;
                    <li class="page-item ${(page==(startNum+i))?'active':''}"><a class="page-link" href="#">1</a></li>
                    <a class="page-link" href="#">2</a></li>
                    <a class="page-link" href="#">3</a></li>
                    <a class="page-link" href="#">4</a></li>
                    <a class="page-link" href="#">5</a></li>
                    &nbsp;&nbsp;<li class="page-item"><a class="page-link" href="#">></a></li>

                    <li class="page-item"><a class="page-link" href="#">>></a></li>


            </ul>
            
			
			
        </main>
        <footer class="border-top">
                푸터요
        </footer>
    </body>
</html>