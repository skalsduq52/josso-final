<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hsm_common.css" type="text/css">
        <style>
            .nav_title{
                float: left;
                display: block;
                width: 200px;
                height: 55px;
                padding: 63px 40px;
                text-align: left;
            }
            .side_title ul{
                padding-left: 0px;
            }
        </style>
        <title>josso</title>
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
                $('.hover_icon').click(function(){
                    $('.hover_tag').slideToggle("slow")
                });
            });
        </script>
    </head>
    <body>
        <header>
            <div class="navigation">
                <ul>
                    <li>
                        <a href="#">
                        <span class="icon"><i class="fa fa-home" aria-hidden="true"></i></span>
                        <span class="icon">홈</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                        <span class="icon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
                        <span class="icon">메일</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                        <span class="icon"><i class="fas fa-list-ul fa-lg" aria-hidden="true"></i></span>
                        <span class="icon">게시판</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                        <span class="icon"><i class="fas fa-calendar-alt fa-lg" aria-hidden="true"></i></span>
                        <span class="icon">캘린더</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                        <span class="icon"><i class="fas fa-clock fa-lg" aria-hidden="true"></i></span>
                        <span class="icon">예약</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                        <span class="icon"><i class="fas fa-clipboard fa-lg" aria-hidden="true"></i></span>
                        <span class="icon">결재</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                        <span class="icon"><i class="fas fa-user-friends fa-lg" aria-hidden="true"></i></span>
                        <span class="icon">조직도</span>
                        </a>
                    </li>
                
                </ul>
            </div>
        </header>
        <aside class="border-right">
            <div>
                <section>
                    <div class="title">
                        <span class="icon"><i class="fas fa-list-ul fa-lg" aria-hidden="true"></i></span>
                            게시판
                    </div>
                </section>
                <section>
                    <div class="side_title" style="padding-top: 75px">
                        <ul>
                            <li>
                                <span class="hover_title"><i class="fas fa-sort-down fa-rotate-270" style="color:gray;"></i>
                                    공지사항
                                </span>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <span class="hover_title"><i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                                    건의사항
                                </span>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
        </aside>
        <nav class="border-bottom">
            <div class="content_top">
                <h1>공지사항</h1>
            </div>
        </nav>
        
        <main>
            <div class="border-top" style="padding-left: 20px;padding-top: 20px; width: 90%;">
                <h3 style="font-weight: bold;">${noticeBoard.boardTitle}</h3><br>
                <table>
                    <tr>
                        <td>작성자 : </td>
                        <td>${employee.employeeName}</td>
                    </tr>
                    <tr>
                        <td>작성일자 : </td>
                        <td>${noticeBoard.boardRegDate}</td>
                    </tr>
                    <tr>
                        <td>첨부파일 : </td>
                        <td>
	                        <c:if test="${empty noticeBoard.boardFile}">
	                        	첨부파일 없음.
	                        </c:if>
	                        <c:if test="${not empty noticeBoard.boardFile}">
	                        	<a href="${pageContext.request.contextPath}/resources/multipartFile/${noticeBoard.boardFile}"download>
	                        		${noticeBoard.boardFile}
	                        	</a>
	                        </c:if>
                        </td>
                    </tr>
                </table>
                <br>
                <div id="content">
                	${noticeBoard.boardContent}
                </div><br>
                <a href="list"><button>목록</button></a>
                <a href="updateBridge?num=${num}"><button>수정</button></a>
                <a href="delete?num=${num }"><button>삭제</button></a>
            </div>
        </main>
        <footer class="border-top">

        </footer>
    </body>
</html>