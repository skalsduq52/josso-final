<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>   
    <head>    
		<meta charset="UTF-8"> 
        <title>josso</title>
         <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/hsm_common.css" type="text/css">
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
         <!-- SmartEditor2 라이브러리(경로 맞춰줘야 함.) -->
         <script type="text/javascript" src="../final_project/smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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

            nav{
                height: 200px;
            }

            table {
                text-align: left;
            }

            #tdnum{
                text-align: center;
                padding-right: 80px;
            }

            .left_td {
                padding-bottom: 20px;
                width: 10%;
                min-width: 100px;
                background:lightgray;  
                opacity:0.5;         
            }


            .right_td {
                padding-bottom: 20px;
                width:50%;
                padding-right: 30px;
                font-weight:700;
                font-size:1.2em;
            }

            #multipart {
                border: 1px dashed gray;
                height: 60px;
                border-radius: 10px;
                text-align: center;
                min-width: 500px;
            }
            
            #write_content{
                height: 500px;
            }


            #attach_file{
                cursor: pointer;
                text-decoration: underline;
                color: gray;
                line-height: 55px;
            }

            .icon- {
                font-size: 1em;
                padding-right: 7px;
            }

            .report_kind {
               color: gray;
           }

           .report_kind:hover {
               text-decoration: none;
           }
           
           .row {
           		padding-top:30px;
           }


     
        </style>

<script type="text/javascript">
    var oEditors = [];
    $(function(){
          nhn.husky.EZCreator.createInIFrame({
              oAppRef: oEditors,
              elPlaceHolder: "smartEditor", //textarea에서 지정한 id와 일치해야 함. 
              //SmartEditor2Skin.html 파일이 존재하는 경로
              sSkinURI: "smartEditor/SmartEditor2Skin.html",  
              htParams : {
                  // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                  bUseToolbar : true,             
                  // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음), 저는 크기 지정했기 땜에 사용 안 함.
                  bUseVerticalResizer : false,     
                  // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음), 본에서도 쓰길래 true 해놓음,, 용도는 모르겠음
                  bUseModeChanger : true,         
              }, 
              fCreator: "createSEditor2"
          });
        
    });
</script>

<!--
<script>
    // 드래그 앤 드랍
    function addFileList(fIndex, fileName, fileSizeStr) {

        var html="";
        html += "<tr id='fileTr_" + fIndex + "'>";
        html += "   <td id='multipart' class='left' >";
        html += fileName + " (" + fileSizeStr +") "
            + "<input value='삭제' type='button' href='#' onclick='deleteFile'(" + fIndex + "); return false;'>"
        html += "   </td>"
        html += "</tr>"

        $('#fileTableTbody').append(html);
    }

</script>
-->
        
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
                                    <a href="" class="report_kind">공지사항</a></label>
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
    <nav >
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
            <form>
            <div  style="padding-left:10px;">
                <table style="width: 100%; text-align:center" id="board">
                    <thead>
                        <tr class="left_tr border-bottom"> 
                            <th class="left_td" style="padding-top:20px">제목</th>
                            <td class="right_td" style="padding-top:20px"><span>${suggestionBoard.boardTitle}</span></td><br>
                        </tr>
                        <tr class="border-bottom" style="height: 50px;">
                            <th class="left_td" style="padding-top: 20px;">파일첨부</th>
                            <td class="right_td" style="padding-top: 20px;">
                                <div>
                                <span>${suggestionBoard.boardFile}</span>
                                </div>
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="write_content" class="border-bottom">
                            <th class="left_td">내용</th>
                            <td class="right_td"><div id="smartEditor" style="height: 400px; width: 100%;"><span>${suggestionBoard.boardContent}</span></div></td>
                        </tr>
                    </tbody>    
                </table>
            </div>

           </form>
           <div class="row">        
            	<div class="container col-sm-6" style="text-align:left; padding-left:30px">
                	<button class="btn btn-info"><a href="list" style="color:white">목록</a></button>
            	</div>
            	<div class="container col-sm-6" style="text-align:right">
	                <button class="btn btn-info"><a href="updateBridge?num=${num}" style="color:white">수정하기</a></button>
    	            <button class="btn btn-secondary"><a href="delete?num=${num}" style="color:white">삭제</a></button>
            	</div>
            </div>
        </main>
        <footer class="border-top">

        </footer>
    </body>
</html>


