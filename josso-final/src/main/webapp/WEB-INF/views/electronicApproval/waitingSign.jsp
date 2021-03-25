<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/common.css"></link>    
        <style>
            #board tbody tr:hover {
                background: rgb(249, 249, 249);
            }
            #board tbody tr td {
                height: 40px;
            }
            .nav_title{
                float: left;
                display: block;
                width: 200px;
                height: 55px;
                padding: 54px 40px;
                text-align: left;
            }
            #tdnum{
                padding-left: 40px;
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
        <!-- aside 삽입  -->
        <aside class="border-right">
            <%@ include file="../electronicApproval/part/aside.jsp"%>
        </aside>
        <nav class="border-bottom">
            <div class="content_top">
                <h1>결재 대기 문서</h1>
            </div>
        </nav>
        
        <main>
            <div style="margin-left: 95%; padding-top: 10px;padding-bottom: 10px;">
                <select>
                    <option value="10">10</option>
                    <option value="20">20</option>
                    <option value="30">30</option>
                </select>
            </div>
            <div class="border-bottom">
                <table style="width: 100%;" id="board">
                    <thead>
                        <tr class="border-top border-bottom" style="height: 40px;">
                            <th style="padding-left: 40px; width: 15%;">기안일</th>
                            <th style="width: 20%">결재양식</th>
                            <th style="width: 35%">제목</th>
                            <th style="width: 15%">기안자</th>
                            <th style="width: 10%">결재상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td id="tdnum">2021-03-17</td>
                            <td>휴가신청서</td>
                            <td>휴가신청의 건</td>
                            <td>나민엽/사원/인사</td>
                            <td>대기중</td>
                        </tr>
                        <tr>
                            <td id="tdnum">2021-03-17</td>
                            <td>휴가신청서</td>
                            <td>휴가신청의 건</td>
                            <td>홍수명/사원/인사</td>
                            <td>대기중</td>
                        </tr>
                        <tr>
                            <td id="tdnum">2021-03-17</td>
                            <td>휴가신청서</td>
                            <td>휴가신청의 건</td>
                            <td>김재윤/사원/인사</td>
                            <td>대기중</td>
                        </tr>
                    </tbody>    
                </table>
            </div>
            <div>     
                <ul class="pagination" style="padding-top: 20px; padding-left: 40%;">
                    <li class="page-item "><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </div>
            <div style="margin-left: 80%; padding-top: 10px;padding-bottom: 10px;">
                <input type="text" name="??"><button>검색</button>
            </div>         
        </main>
        <footer class="border-top">

        </footer>
    </body>
</html>