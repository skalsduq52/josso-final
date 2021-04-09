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


        </style>


    </head>
    <body class="body">
		<header>
			<%@ include file="../include/header.jsp"%>
		</header>
        <aside class="border-right">
			<%@ include file="../businessReport/part/aside.jsp"%>
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
            <form action="register" method="POST">
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
                                <input type="month" name="lastMonth" required></th><br>
                            <th class="report_date">
                                <input type="month" name="thisMonth" required></th><br>
                        </tr>
                        <tr>
                            <th class="left_td">정량적 성과</th>
                            <td class="right_td1"><textarea class="write_area" name="lastQuantity"></textarea></td>
                            <td class="right_td2"><textarea class="write_area" name="thisQuantity"></textarea></td>
                        </tr>
                        <tr >
                            <th class="left_td">정성적 성과</th>
                            <td class="right_td1"><textarea class="write_area" name="lastQuality"></textarea></td>
                            <td class="right_td2"><textarea class="write_area" name="thisQuality"></textarea></td>
                        </tr>
                        <tr >
                            <th class="left_td">성과 근거</th>
                            <td class="right_td1"><textarea class="write_area" name="lastReason"></textarea></td>
                            <td class="right_td2"><textarea class="write_area" name="thisReason"></textarea></td>
                        </tr>
                        <tr id="write_content">
                            <th class="left_td">보완할 점</th>
                            <td class="right_td1"><textarea class="write_area" name="lastSupplement"></textarea></td>
                            <td class="right_td2"><textarea class="write_area" name="thisSupplement"></textarea></td>
                        </tr>
                    </tbody>    
                </table>
            </div>

            <div>
            <div style="float:left; width: 150px; height: 100px;" >
            </div>
            <div style="padding-top: 50px; padding-right: 50px; float:right" class="text-center">
                <input class="btn btn-info btn-lg" type="submit" value="등록하기">
                <input type="button" class="btn btn-secondary btn-lg" onclick="history.back()" value="취소">
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