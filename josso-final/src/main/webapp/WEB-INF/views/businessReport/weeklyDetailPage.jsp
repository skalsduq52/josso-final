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
                resize: none;
                padding : 15px 15px;
                font-size:1.2em;
                font-weight:bold;
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
                                        <a href="report_list_weekly.html" class="report_kind">주간 업무보고</a></label>
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
        <nav>
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
            <form>
            <div class="border-top">
                <table style="width: 97%;" id="board">
                    <thead>
                        <tr style="height: 50px;">
                            <th class="left_td"></th>
                            <th class="week">이번 주</th>
                            <th class="week">다음 주</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr style="height: 60px;">
                            <th class="left_td"></th>
                            <th class="report_date">
                                <input type="date" value="<fmt:formatDate value="${wr.thisStart }" pattern="yyyy-MM-dd"/>" readonly class="date">　∼　<input type="date" value="<fmt:formatDate value="${wr.thisEnd }" pattern="yyyy-MM-dd"/>" readonly class="date"></th><br>
                            <th class="report_date">
                                <input type="date" value="<fmt:formatDate value="${wr.nextStart }" pattern="yyyy-MM-dd"/>" readonly class="date">　∼　<input type="date" value="<fmt:formatDate value="${wr.nextStart }" pattern="yyyy-MM-dd"/>" readonly class="date"></th><br>
                        </tr>
                        <tr>
                            <th class="left_td">고객(사) 미팅</th>
                            <td class="right_td1"><textarea class="write_area" type="text" readonly>${wr.thisMeeting }</textarea></td>
                            <td class="right_td2"><textarea class="write_area" type="text" readonly>${wr.nextMeeting }</textarea></td>
                        </tr>
                        <tr >
                            <th class="left_td">회의 내용</th>
                            <td class="right_td1"><textarea class="write_area" type="text" readonly>${wr.thisConference }</textarea></td>
                            <td class="right_td2"><textarea class="write_area" type="text" readonly>${wr.nextConference }</textarea></td>
                        </tr>
                        <tr >
                            <th class="left_td">프로젝트</th>
                            <td class="right_td1"><textarea class="write_area" type="text" readonly>${wr.thisProject }</textarea></td>
                            <td class="right_td2"><textarea class="write_area" type="text" readonly>${wr.nextProject }</textarea></td>
                        </tr>
                        <tr id="write_content">
                            <th class="left_td">특이사항</th>
                            <td class="right_td1"><textarea class="write_area" type="text" readonly>${wr.thisEtc }</textarea></td>
                            <td class="right_td2"><textarea class="write_area" type="text" readonly>${wr.nextEtc }</textarea></td>
                        </tr>
                    </tbody>    
                </table>
            </div>            
	            <div>
	            <div style="float:left; width: 150px; height: 100px;" >
	            </div>
	            <div style="padding-top: 50px; padding-right: 50px; float:right" class="text-center">
	                	<button class="btn btn-info btn-lg"><a href="updateBridge?num=${num1}" style="color:white">수정하기</a></button>
	                	<button class="btn btn-secondary btn-lg" onclick="return confirm('정말 삭제하시겠습니까?')"><a href="delete?num=${num1 }" style="color:white">삭제하기</a></button>
	                	<button class="btn btn-secondary btn-lg"><a href="list" style="color:white">목록으로</a></button>
	            </div>
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