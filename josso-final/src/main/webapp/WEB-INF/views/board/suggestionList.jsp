<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <nav class="border-bottom">
            <div class="nav_title">
                <h2 id="suggestion_title" style="font-weight: 600;">건의사항 게시판</h2>
            </div>
            <div class="nav_content">
                <p style="margin: 12px 17px; font-style: italic; ">임직원 여러분들의 의견을 무엇이든 건의할 수 있는 게시판입니다.<br>
                   업무, 시설, 편의사항 등 자유롭게 건의해주시면 최대한 신속히 해결하겠습니다.<br>
                </p>
            </div>
        </nav>

        
        <main>
            <div class="border-top border-bottom">
                <table style="width: 100%;" id="board">
                    <thead>
                        <tr class="border-bottom" style="height: 40px;">
                            <th id="tdnum" style="width: 10%;">번호</th>
                            <th id="theme" style="width: 50%">제목</th>
                            <th style="width: 15%">작성자</th>
                            <th style="width: 15%">작성일</th>
                            <th style="width: 10%">조회</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td id="tdnum">7</td>
                            <td id="theme">연봉 좀 올려주시면 안될까요,, 먹고 살기 힘들어요</td>
                            <td>안태민 대표이사</td>
                            <td>2020-03-16</td>
                            <td id="selectnum">357</td>
                        </tr>
                        <tr>
                            <td id="tdnum">6</td>
                            <td id="theme">무야호~~~~ 나그도나르도~~</td>
                            <td>최낙도 팀장</td>
                            <td>2020-03-16</td>
                            <td id="selectnum">1</td>
                        </tr>
                        <tr>
                            <td id="tdnum">5</td>
                            <td id="theme">않이,, 삼실에서 담배피면 외 않되?</td>
                            <td>김재윤 본부장</td>
                            <td>2020-03-16</td>
                            <td id="selectnum">1</td>
                        </tr>
                        <tr>
                            <td id="tdnum">4</td>
                            <td id="theme">저 과장 안시켜주면 si로 이직할겁니다.</td>
                            <td>나민엽 대리</td>
                            <td>2020-03-16</td>
                            <td id="selectnum">1</td>
                        </tr>
                        <tr>
                            <td id="tdnum">3</td>
                            <td id="theme">구내식당 가격이 너무 비싸요,,</td>
                            <td>김우영(외부인)</td>
                            <td>2020-03-16</td>
                            <td id="selectnum">1</td>
                        </tr>
                        <tr>
                            <td id="tdnum">2</td>
                            <td id="theme">화장실에 비데설치해주세요.. 제발요 ㅠㅠ</td>
                            <td>최민재 본부장</td>
                            <td>2020-03-16</td>
                            <td id="selectnum">1</td>
                        </tr>
                        <tr>
                            <td id="tdnum"></td>
                            <td id="theme" style="color:blue">ㄴRe : 휴지도 아깝다!! 내 연봉 떨어진다!</td>
                            <td>안태민 대표이사</td>
                            <td>2020-03-16</td>
                            <td id="selectnum">0</td>
                        </tr>
                        <tr>
                            <td id="tdnum">1</td>
                            <td id="theme">최민재 본부장이 사내에서 폭력을 사용합니다 (※익명 보장좀※)</td>
                            <td>홍수명 팀장</td>
                            <td>2020-03-16</td>
                            <td id="selectnum">0</td>
                        </tr>
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
                <button class="btn btn-info">작성하기</button>
            </div>
            
            <div class="bottom_area" style="float:right;">
                <select class="search" style="height: 37px;">
                    <option>제목</option>
                    <option>작성자</option>
                </select>
                <input type="text" name="search" class="search" style="height: 38px;">
                <button class="btn btn-success" style="height: 38px; margin-bottom: 5px;">검색</button>
            </div>             
        </main>
        <footer class="border-top">

        </footer>
    </body>
</html>