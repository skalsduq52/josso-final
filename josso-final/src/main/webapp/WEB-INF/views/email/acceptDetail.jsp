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
         <!-- SmartEditor2 라이브러리(경로 맞춰줘야 함.) -->
         <!-- <script type="text/javascript" src="../team01/smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script> -->
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
        <script type="text/javascript">
            /* var oEditors = [];
            $(function(){
                  nhn.husky.EZCreator.createInIFrame({
                      oAppRef: oEditors,
                      elPlaceHolder: "smartEditor", //textarea에서 지정한 id와 일치해야 함. 
                      //SmartEditor2Skin.html 파일이 존재하는 경로
                      sSkinURI: "smartEditor/SmartEditor2Skin.html",  
                      htParams : {
                          // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                          bUseToolbar : true,             
                          // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음), 저는 크기 지정했기 땜에 사용 안 함.
                          bUseVerticalResizer : false,     
                          // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음), 본에서도 쓰길래 true 해놓음,, 용도는 모르겠음
                          bUseModeChanger : true,         
                      }, 
                      fCreator: "createSEditor2"
                  });
                
            }); */
            $("#re").click(function(){
                if(confirm("정말 등록하시겠습니까 ?") == true){
                    alert("등록되었습니다");
                }
                else{
                    return ;
                }
            });
            function button_event(){
                if (confirm("다시 작성하시겠습니까??") == true){    //확인
                    document.form.submit();
                    location.href ='email_write.html';
                }else{   //취소
                    return;
                }
            }
        </script>
        <style>
            table>thead>tr>td>input{
                border: 1px solid gray;
            }
            .form-control[readonly]{
                
                background-color: white;
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
        </style>
    </head>
    <body class="body">
        <!-- navigation 삽입 -->
		<header>
			<%@ include file="../include/header.jsp"%>
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
                        <div>
                            <h3 style="padding:10px 0px 0px 10px; font-size: 20px; font-weight: bold;">자세히보기</h3>
                        </div>
                    </div>
                    
                    <div class="col-6"></div>
                    <div class="col">
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col"></div>
                    <div class="col"></div>
                    <div class="col">
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col nav-menu" style="padding: 45px 0px 5px 15px">
                        	<a href="${pageContext.request.contextPath}/email/accept/reply?num=${acceptDetail.emailNumber}"><input type="submit" class="btn btn-outline-info float-left" value="답장"></a>
	                        	<c:if test="${acceptDetail.emailRead eq 'NO'}">
		                        <a href="${pageContext.request.contextPath}/email/accept/read?num=${acceptDetail.emailNumber}"><input type="submit" class="btn btn-outline-info float-left" value="읽음"></a>
		                        </c:if>
		                        <c:if test="${acceptDetail.emailRead eq 'YES'}">
		                        <a href="${pageContext.request.contextPath}/email/accept/read?num=${acceptDetail.emailNumber}"><input type="submit" class="btn btn-outline-info float-left" value="안읽음"></a>
		                        </c:if>
	                        <a href="${pageContext.request.contextPath}/email/accept/delivery?num=${acceptDetail.emailNumber}"><input type="submit" class="btn btn-outline-info float-left" value="전달"></a>
	                        <a href="${pageContext.request.contextPath}/email/accept/wastebasket?num=${acceptDetail.emailNumber}"><input type="submit" class="btn btn-outline-info float-left" value="휴지통"></a>
                    </div>
                    <div class="col"></div>
                    <div class="col"></div>
                </div>
            </div>
        </nav>
        <main>
            
            <table class="table">
                <thead class="thead-dark text-left">
                    <tr>
                        <td style="width: 120px;">제목</td>
                        <td colspan="2">
                        <input type="email" class="form-control form-control-sm " style="font-size: 15px;"readonly value="${acceptDetail.emailTitle}">
                        </td>
                    </tr>
                    <tr>
                        <td>보낸 사람  </td>
                        <td colspan="2"><input type="email" readonly value="${es.employeeName} / ${es.rankCode} / ${es.departmentCode}" class="form-control form-control-sm "></td>
                    </tr>
                    <tr>
                        <td>받는 사람</td>
                        <td colspan="2"><input type="email" readonly value="${ea.employeeName} / ${ea.rankCode} / ${ea.departmentCode}" class="form-control form-control-sm ">
                        <table id="textarea1" rows="4" cols="100" style="overflow: auto; height: 50px; display:none;"></table></td>
                    </tr>
                    <tr>
                        <td>참조</td>
                        <td colspan="2"><input type="text" readonly value="${er.employeeName} / ${er.rankCode} / ${er.departmentCode}"class="form-control form-control-sm ">
                        <table id="textarea2" rows="4" cols="100" style="overflow: auto; height: 50px; display:none;"></table></td>
                    </tr>
                    <tr>
                        <td>보낸날짜  </td>
                        <td colspan="2"><input type="text" readonly value="<fmt:formatDate value="${acceptDetail.regDate}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"></fmt:formatDate>" class="form-control form-control-sm "></td>
                    </tr>
                    <tr>
                        <td>첨부파일  </td>
                        <td colspan="2"><input type="text" readonly value="첨부파일이 없습니다." class="form-control form-control-sm "></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2">
                            <textarea id="smartEditor" readonly class="form-control"
                             minlength="7500"
                            style="height: 720px;">${acceptDetail.emailContent}</textarea>
                        </td>
                    </tr>
                </tbody>
            </table>

            
        </main>
    </body>
</html>