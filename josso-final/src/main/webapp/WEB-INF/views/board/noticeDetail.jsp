<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../common.css" type="text/css">
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
                <h3 style="font-weight: bold;">좋소기업 공지사항 입니다. 필독하시기 바랍니다.</h3><br>
                <table>
                    <tr>
                        <td>작성자 : </td>
                        <td>관리자 </td>
                    </tr>
                    <tr>
                        <td>작성일자 : </td>
                        <td>2021-03-17</td>
                    </tr>
                    <tr>
                        <td>첨부파일 : </td>
                        <td>필독사항.pdf</td>
                    </tr>
                </table>
                <br>
                <div id="content">
                    올해   초부터 캘리포니아 농부성 협력기관 한 곳으로부터 의뢰를 받아서 캘리포니아 한인 농부들에게 제공할 여러 가지 문서를 번역해 왔습니다. 작년에 우연한 계기로 서류를 번역해 드렸던 한인분이 적극 추천해 주셔서 본의 아니게 농업 분야 서류를 번역하게 되었네요. 덕분에 우수농산물관리제도(Good Agricultural Practices)라든가 식품안전계획(Food Safety Plan)과 같은 용어에 친숙해졌습니다. 우물 안 개구리처럼 사는 저에게는 새로운 세상이 신기하고 재밌습니다. :-)

                    (나중에 타지역 한인 농부들도 참고하도록 웹에다 올릴 계획이고 정부 공개 자료를 이해하기 쉽도록 정리한 내용이니) 기밀을 유지하지 않아도 되는 문서라 한 문장 골라서 분석합니다. 신문 기사나 책처럼 정제되지 않은, 실생활에서 사용하는 문장이라 보시면 되겠습니다. 농장에서 사용하는 물은 1년에 한 번 수질 검사를 해야 하는데, 샘플 채취 방법을 설명하는 문장입니다.
                    올해 초부터 캘리포니아 농부성 협력기관 한 곳으로부터 의뢰를 받아서 캘리포니아 한인 농부들에게 제공할 여러 가지 문서를 번역해 왔습니다. 작년에 우연한 계기로 서류를 번역해 드렸던 한인분이 적극 추천해 주셔서 본의 아니게 농업 분야 서류를 번역하게 되었네요. 덕분에 우수농산물관리제도(Good Agricultural Practices)라든가 식품안전계획(Food Safety Plan)과 같은 용어에 친숙해졌습니다. 우물 안 개구리처럼 사는 저에게는 새로운 세상이 신기하고 재밌습니다. :-)

                    (나중에 타지역 한인 농부들도 참고하도록 웹에다 올릴 계획이고 정부 공개 자료를 이해하기 쉽도록 정리한 내용이니) 기밀을 유지하지 않아도
                    올해 초부터 캘리포니아 농부성 협력기관 한 곳으로부터 의뢰를 받아서 캘리포니아 한인 농부들에게 제공할 여러 가지 문서를 번역해 왔습니다. 작년에 우연한 계기로 서류를 번역해 드렸던 한인분이 적극 추천해 주셔서 본의 아니게 농업 분야 서류를 번역하게 되었네요. 덕분에 우수농산물관리제도(Good Agricultural Practices)라든가 식품안전계획(Food Safety Plan)과 같은 용어에 친숙해졌습니다. 우물 안 개구리처럼 사는 저에게는 새로운 세상이 신기하고 재밌습니다. :-)

                    (나중에 타지역 한인 농부들도 참고하도록 웹에다 올릴 계획이고 정부 공개 자료를 이해하기 쉽도록 정리한 내용이니) 기밀을 유지하지 않아도 되는 문서라 한 문장 골라서 분석합니다. 신문 기사나 책처럼 정제되지 않은, 실생활에서 사용하는 문장이라 보시면 되겠습니다. 농장에서 사용하는 물은 1년에 한 번 수질 검사를 해야 하는데, 샘플 채취 방법을 설명하는 문장입니다. 되는 문서라 한 문장 골라서 분석합니다. 신문 기사나 책처럼 정제되지 않은, 실생활에서 사용하는 문장이라 보시면 되겠습니다. 농장에서 사용하는 물은 1년에 한 번 수질 검사를 해야 하는데, 샘플 채취 방법을 설명하는 문장입니다.
                </div><br>
                <a href="http://127.0.0.1:5500/final/notice.html"><button>목록</button></a>
            </div>
        </main>
        <footer class="border-top">

        </footer>
    </body>
</html>