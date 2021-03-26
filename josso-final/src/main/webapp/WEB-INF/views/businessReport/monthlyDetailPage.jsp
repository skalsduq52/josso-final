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

        <style>
           .hover_tag {
               padding-left: 45px;
           }

           .report_kind {
               color: gray;
           }

           .report_kind:hover {
               text-decoration: none;
           }
           .search {
                height: 33px;
            }

            table {
                text-align: left;
            }

            #tdnum{
                text-align: center;
                padding-right: 80px;
            }

            .left_td {
                padding-top: 20px;
                padding-bottom: 20px;
                text-align:center;
                width: 10%;
                font-size: 18px;
            }

            #multipart {
                border: 1px dashed gray;
                height: 60px;
                border-radius: 10px;
                text-align: center;
            }
            

            #attach_file{
                cursor: pointer;
                text-decoration: underline;
                color: gray;
                line-height: 55px;
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

            nav {
                height: 200px;
            }

            .report_date {
                text-align: center;
            }

            .write_area {
                width: 100%;
                height: 200px;
                border: none;
                padding : 15px 15px;
                resize: none;
            }

            .week {
                text-align: center;
                font-size: 1.7em;
            }

            td {
                border: solid 2px lightgray;
                min-width: 500px;
            }

            th {
                min-width: 150px;
            }

            textarea:focus {
                outline: none;
            }
            
            .date {
                background:lightgray;
                text-align: end;
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
                                        <a href="" class="report_kind">월간 실적보고</a>
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
                <h2 id="suggestion_title" style="font-weight: 600;">월간 실적보고</h2>
            </div>
            <div class="nav_content">
                <p style="margin: 12px 17px; font-style: italic; ">
                    한 달의 성과를 만드시느라 대단히 고생많으셨습니다.<br>
                    부족한 점을 보완하고 더 나은 미래를 함께 만들어고자 하는 모든 노고에 감사드립니다.<br>
                </p>
            </div>
        </nav>

        
        <main>
            <form>
            <div class="border-top">
                <table style="width: 97%;" id="board">
                    <thead>
                        <tr style="height: 50px;">
                            <th class="left_td"></th>
                            <th class="week">지난 달</th>
                            <th class="week">이번 달</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr style="height: 60px;">
                            <th class="left_td"></th>
                            <th class="report_date">
                                <input type="month" value="2021-02" readonly class="date"></th><br>
                            <th class="report_date">
                                <input type="month" value="2021-03" readonly  class="date"></th><br>
                        </tr>
                        <tr>
                            <th class="left_td">정량적 성과</th>
                            <td class="right_td1"><textarea class="write_area" type="text" readonly>프로젝트 2건 완료</textarea></td>
                            <td class="right_td2"><textarea class="write_area" type="text" readonly>프로젝트 1건 완료 2건 진행 중</textarea></td>
                        </tr>
                        <tr >
                            <th class="left_td">정성적 성과</th>
                            <td class="right_td1"><textarea class="write_area" type="text" readonly>안태민 대표의 실력이 많이 늘었음</textarea></td>
                            <td class="right_td2"><textarea class="write_area" type="text" readonly>안태민 대표를 첫 파견 보냄</textarea></td>
                        </tr>
                        <tr >
                            <th class="left_td">성과 근거</th>
                            <td class="right_td1"><textarea class="write_area" type="text" readonly>안태민 대표의 실력 향상으로 업무 효율 증가</textarea></td>
                            <td class="right_td2"><textarea class="write_area" type="text" readonly>안태민 대표의 파견으로 내가 휴가갈 수 있었음. 개조아</textarea></td>
                        </tr>
                        <tr id="write_content">
                            <th class="left_td">보완할 점</th>
                            <td class="right_td1"><textarea class="write_area" type="text" readonly>안태민 대표가 아직 풀스택이 아님</textarea></td>
                            <td class="right_td2"><textarea class="write_area" type="text" readonly>안태민 대표를 풀스택으로 만들어야 함</textarea></td>
                        </tr>
                    </tbody>    
                </table>
            </div>

            <div>
                <div style="float:left; width: 150px; height: 100px;" >
                </div>
                <div style="padding-top: 50px; padding-right: 50px; float:right" class="text-center">
                    <input class="btn btn-info btn-lg" type="submit" value="수정하기">
                    <input class="btn btn-secondary btn-lg" onclick="history.back()" type="submit" value="목록">
                </span>
                </div>
           </form>        
        </main>
        <br>
        <br>
        <br>
        <footer class="border-top">

        </footer>
    </body>
</html>