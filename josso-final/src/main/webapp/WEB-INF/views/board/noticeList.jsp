<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                height: 200px;
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


        </style>

        <!--공통 아닌 것들-->
        <style>
            #tdnum{
                text-align: center;
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
                padding-left: 70px;
            }

            .bottom_area {
                display: inline-block;
                padding-top: 10px;
                padding-bottom: 10px;
            }

            .icon- {
                font-size: 1em;
                padding-right: 7px;
            }
			
			#suggestion_title {
				/* padding-left : 20px; */
				/* background : #38A9BA; */
				font-size : 2em;
				color : #38A9BA;
				width:280px;
				font-weight : 700;
			}
            

        </style>

    </head>
    <body class="body">
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
                    <li>
                        <a href="#">
                        <span class="icon"><i class="fa fa-paste" aria-hidden="true"></i></span>
                        <span class="icon">보고</span>
                        </a>
                    </li>
                </ul>
            </div>
        </header>
        <aside class="border-right">
            <div>
                <section>
                    <div class="title">
                        <span class="icon"><i class="fas fa-list-ul fa-lg icon-" aria-hidden="true"></i>게시판</span>
                            
                    </div>
                </section>
    
                <section>
                    
                    <div class="side_title">
                        <span class="hover_icon">
                            <i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                        </span>
                        <span class="hover_title">게시판 목록</span>
                    </div>
                    <div>
                        <ul class="hover_tag">
                            <li>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label" for="inlineCheckbox1">
                                        <a href="report_list_weekly.html" class="report_kind">공지사항</a></label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label" for="inlineCheckbox2">
                                        <a href="" class="report_kind">건의사항</a>
                                    </label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label" for="inlineCheckbox2">
                                        <a href="" class="report_kind">질의&응답</a>
                                    </label>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
        </aside>
        <nav>
            <div class="nav_title">
                <h2 id="suggestion_title">》 공지사항 게시판</h2>
            </div>
            <div class="nav_content">
                <p style="margin: 12px 17px; font-style: italic; ">회사 공지사항입니다.<br>
               수시로 확인하시어 필독해주시고 궁금사항은 질의, 의무사항은 신속히 처리해주시기 바랍니다.<br>
                </p>
            </div>
        </nav>

        
        <main style="width:80%;">
            <div class="border-top border-bottom">
                <table style="width: 100%;" id="board">
                    <thead>
                        <tr class="border-bottom" style="height: 40px;">
                            <th id="tdnum" style="width: 10%;">번호</th>
                            <th id="theme" style="width: 30%">제목</th>
                            <th style="width: 15%">작성자</th>
                            <th style="width: 15%">작성일</th>
                            <th style="width: 10%">조회</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="noticeList" items="${noticeList}">
                        <tr>
                            <td id="tdnum">${noticeList.boardNum}</td>
                            <td id="theme"><a href="detailPage?num=${noticeList.boardNum}">${noticeList.boardTitle}</a></td>
                            <td>${noticeList.employeeName}</td>
                            <td><fmt:formatDate value="${noticeList.boardRegDate}" pattern="yy년 MM월 dd일 / HH시 mm분"/></td>
                            <td id="selectnum">${noticeList.boardHit}</td>
                        </tr>
						</c:forEach>
                    </tbody>    
                </table>
            </div>
            <div>     
            <!-- param. 이 무슨 뜻이지? -->
			<ul class="pagination" style="padding-top: 20px; padding-left: 40%;">
                	<c:if test="${param.page !=1 and not empty param.page}">
						<li class="page-item"><a class="page-link" href="?page=${param.page-1}&title=${param.title}&query=${param.query}"><</a></li>&nbsp;&nbsp;
					</c:if>
				<c:if test="${param.page == 1 || empty param.page}">
					<li class="page-item disabled"><a class="page-link"><</a></li>&nbsp;&nbsp;
					</c:if>
				<c:forEach var="i" begin="0" end="4">
					<c:if test="${(page.startNum+i) <= page.lastNum}">
						<li class="page-item ${(page.page==(page.startNum+i))?'active':''}"><a class="page-link" href="?page=${page.startNum+i}&title=${param.title}&query=${param.query}">${page.startNum+i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${page.page+1 <= page.lastNum}">&nbsp;&nbsp;
				<li class="page-item"><a class="page-link" href="?page=${page.page+1}&title=${param.title}&query=${param.query}">></a></li>
				</c:if>
				<c:if test="${page.page+1 > page.lastNum}"> &nbsp;&nbsp;<li class="page-item disabled"><a class="page-link">></a></li>
				</c:if>
			</ul>

            <div class="bottom_area" style="float:left; padding-left: 20px;">
                <button class="btn btn-info"><a href="write" style="color:white">작성하기</a></button>
            </div>
            
            <form>
            <div class="bottom_area" style="float:right;">
                <select class="search" style="height: 37px;" name="title">
                    <option ${(param.title == "BOARD_TITLE")? "selected" : ""} value="BOARD_TITLE">제목</option>
                    <option ${(param.title == "EMPLOYEE_NAME")? "selected" : ""} value="EMPLOYEE_NAME">작성자</option>
                </select>
                <input type="text" name="query" placeholder="Search By" value="${param.query}" class="search" style="height: 38px;">
                <button class="btn btn-success" style="height: 38px; margin-bottom: 5px;">검색</button>
            </div>        
            </form>
            
        
            
            
                 
        </main>
    </body>
</html>