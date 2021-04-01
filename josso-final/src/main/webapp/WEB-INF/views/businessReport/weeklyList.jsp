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

           .hover_tag {
               padding-left: 45px;
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
                font-weight:bold;
            }

            .bottom_area {
                display: inline-block;
                padding-top: 10px;
                padding-bottom: 10px;
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
                        <span class="icon"><i class="fa fa-paste icon_" aria-hidden="true"></i>보고</span>
                            
                    </div>
                </section>
    
                <section>
                    
                    <div class="side_title">
                        <span class="hover_icon">
                            <i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                        </span>
                        <span class="hover_title">일정별 업무보고</span>
                    </div>
                    <div>
                        <ul class="hover_tag">
                            <li>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label" for="inlineCheckbox1">
                                        <a href="" class="report_kind">주간 업무보고</a></label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label" for="inlineCheckbox2">
                                        <a href="report_list_monthly.html" class="report_kind">월간 실적보고</a>
                                    </label>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
        </aside>
        <nav class="border-bottom">
                <div class="nav_title">
                    <h2 id="suggestion_title" style="font-weight: 600;">주간 업무보고</h2>
                </div>
                <div class="nav_content">
                    <p style="margin: 12px 17px; font-style: italic; ">
                      이번주 진행한 업무 및 다음주 진행할 업무 일정들을 상세히 기입해주시면 됩니다.<br>
                      한 주간 고생많으셨습니다. 잘 마무리하시고 즐거운 주말 되시길 바랍니다.<br>
                    </p>
                </div>
        </nav>
        
        <main>
            <div class="border-top border-bottom">
                <table style="width: 100%;" id="board">
                    <thead>
                        <tr class="border-bottom" style="height: 40px;">
                            <th id="tdnum" style="width: 7%;">번호</th>
                            <th style="width: 3%;">부서</th>
                            <th id="theme" style="width: 20%">제목</th>
                            <th style="width: 5%">작성자</th>
                            <th style="width: 5%">직급</th>
                            <th style="width: 10%">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="ws" items="${ws}" varStatus="status">
                        <tr>
                            <td id="tdnum">${ws.reportNumber}</td>
                            <td>${ws.departmentCode}</td>
                            <td id="theme"><a href="DetailPage?num=${ws.reportNumber }">${sendTitle[status.index]}</a></td>
                            <td>${ws.employeeName }</td>
                            <td>${ws.rankCode }</td>
                            <td><fmt:formatDate value="${ws.writeTime }" pattern="yy년 MM월 dd일 / HH시 mm분"/></td>
                            <!-- <td>${ws.writeTime }</td>  -->
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

            <div class="bottom_area" style="float:left; padding-left: 20px;">
                <button class="btn btn-info"><a href="write" style="color:white">작성하기</a></button>
            </div>
            
            <div class="bottom_area" style="float:right;">
                <select class="search" style="height: 37px;">
                    <option>제목</option>
                    <option>작성자</option>
                </select>
                <input type="text" name="search" class="search" style="padding-bottom: 3px; height: 38px;">
                <button class="btn btn-success" style="height: 38px; margin-bottom: 3px;">검색</button>
            </div>       

        </main>
        <footer class="border-top">

        </footer>
    </body>
</html>