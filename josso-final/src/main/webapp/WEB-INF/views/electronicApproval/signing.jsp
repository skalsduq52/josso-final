<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../common.css" type="text/css">
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
            #td_back{
                background-color: rgb(226, 226, 226);
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
                        <span class="icon"><i class="fa fa-envelope fa-lg" aria-hidden="true"></i></span>
                            전자결재
                    </div>
                </section>
                <section>
                    <div class="title_button">
                        <button type="button" class="btn btn-info btn-sm btn-block">새 결재 진행</button>
                    </div>
                </section>
                <section>
                    <div class="side_title">
                        <ul>
                            <li>
                                <span class="hover_title"><i class="fas fa-sort-down fa-rotate-270" style="color:gray;"></i>
                                    결재 대기 문서
                                </span>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <span class="hover_title"><i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                                    내가 기안한 문서
                                </span>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <span class="hover_title"><i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                                    결재 수신 문서
                                </span>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
        </aside>
        <nav class="border-bottom">
            <div class="content_top">
                <h1>휴가신청서</h1>
            </div>
        </nav>
        
        <main>
            <form>
            <div class="border" style="height: 95%; min-height: 1000px; margin: 10px 10px 10px 10px">
                <div style="height:300px;padding-left: 15px;">
                    <table>
                        <tbody>
                            <tr style="width: 800px; height: 200px;">
                                <td align="center" colspan="2"><h1>휴가신청서</h1></td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="1" style="width: 300px;">
                                        <tr>
                                            <td style="width: 100px;" id="td_back">문서번호</td>
                                            <td >1</td>
                                        </tr>
                                        <tr>
                                            <td id="td_back">소속</td>
                                            <td>인사</td>
                                        </tr>
                                        <tr>
                                            <td id="td_back">기안자</td>
                                            <td>나민엽</td>
                                        </tr>
                                        <tr>
                                            <td id="td_back">작성일자</td>
                                            <td>2021-03-18</td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="padding-left: 350px;">
                                    <table border="1" style="float: right;margin-left: 15px;">
                                        <tbody>
                                            <tr>
                                                <td rowspan="4" style="height: 130px;background-color: rgb(226, 226, 226);">승<br>인</td>
                                                <td style="height: 15px; width: 100px;" align="center">팀장</td>
                                                <td style="height: 15px; width: 100px;" align="center">대표이사</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2" align="center">나민엽</td>
                                                <td rowspan="2" align="center">안태민</td>
                                            </tr>
                                            <tr></tr>
                                            <tr>
                                                <td style="height: 30px;"></td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table border="1" style="float: right;">
                                        <tbody>
                                            <tr>
                                                <td rowspan="4" style="height: 130px;background-color: rgb(226, 226, 226);">신<br>청</td>
                                                <td style="height: 15px; width: 100px;" align="center">주임</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2" align="center">홍수명</td>
                                            </tr>
                                            <tr></tr>
                                            <tr>
                                                <td style="height: 30px;"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div style="padding-top: 150px;margin-left: 15px;">
                    <table border="1"> 
                        <tr>
                            <td align="center" style="height: 40px;width: 150px;" id="td_back">문서제목</td>
                            <td style="width: 850px;"><input type="text" placeholder="연,반차,대체,경조/이름/신청일자 " style="width: 100%;"></td>
                        </tr>
                    </table>
                </div>
                <div style="padding-top: 30px;margin-left: 15px;">
                    <table border="1">
                        <tr>
                            <td align="center" style="height: 40px;width: 150px;" id="td_back">휴가종류</td>
                            <td style="width: 850px;" >
                                <select style="width: 150px;">
                                    <option value="연차" selected="selected">연차</option>
                                    <option value="포상">포상</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="height: 40px;width: 150px;" id="td_back">기간 및 일시</td>
                            <td style="width: 850px;" >
                                <input type="date">~<input type="date">&nbsp;신청일수 : <input type="text" readonly value="1" style="width: 150px;">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="height: 40px;width: 150px;" id="td_back">연차 일수</td>
                            <td style="width: 850px;" >
                                총연차일수 : <input type="text" readonly value="16" style="width: 100px;">
                                사용한연차 : <input type="text" readonly value="16" style="width: 100px;">
                                잔여연차 : <input type="text" readonly value="16" style="width: 100px;">
                                신청연차 : <input type="text" readonly value="16" style="width: 100px;">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="background-color: rgb(226, 226, 226);">
                                1. 연차의 사용은 근로기준법에 따라 전년도에 발생한 개인별 잔여 연차에 한하여 사용함을 원칙으로 한다. 단, 최초 입사시에는 근로 기준법에<br>
                                 	따라 발생 예정된 연차를 차용하여 월 1회 사용 할 수 있다.<br>
                                2. 경조사 휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출<br>
                                3. 상기 사용일수는 주말(토·일요일) 및 공휴일을 제외하여 산정된 일수로 실제 사용일수와 상이할 수 있다.<br>
                                4. 출산휴가(배우자)의 경우 배우자의 출산일자를 증명하는 증빙서류를 첨부하여 기안을 올린다.<br>
                                5. 출산휴가(태아검진)의 경우 사후에 검진일자를 증명하는 병원 검진영수증 사본을 인사담당자에게 제출한다.<br>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="padding-top: 150px;margin-left: 15px;">
                    <button> 결재요청</button>
                    <button> 취소</button>
                </div>
            </form>
            </div>
        </main>
        <footer class="border-top">

        </footer>
    </body>
</html>