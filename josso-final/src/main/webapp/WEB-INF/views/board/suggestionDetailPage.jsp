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
                text-align:center;
                width: 10%;
                min-width: 200px;
                background:#DCDCDC;
                color:black; 
                font-size: 1.2em;
            }

            .right_td {
                padding-left: 30px;
                padding-bottom: 20px;
                font-weight:700;
                font-size:1.2em;
                min-width:300px;
            }
            
            #right_td{
                padding-bottom: 20px;
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
           
           	#suggestion_title {
				/* padding-left : 20px; */
				/* background : #38A9BA; */
				font-size : 2em;
				color : #38A9BA;
				width:280px;
				font-weight : 700;
			}
			
			td {
				border : 1px solid lightgray;
			}
        </style>

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
			<%@ include file="../include/header.jsp"%>
		</header>
	    <aside class="border-right">
			<%@ include file="../board/part/aside.jsp"%>
    	</aside>
    <nav>
        <div class="nav_title">
            <h2 id="suggestion_title" style="font-weight: 600;">》 건의사항 게시판</h2>
        </div>
        <div class="nav_content">
            <p style="margin: 12px 17px; font-style: italic; ">임직원 여러분들의 의견을 무엇이든 건의할 수 있는 게시판입니다.<br>
               업무, 시설, 편의사항 등 자유롭게 건의해주시면 최대한 신속히 해결하겠습니다.<br>
            </p>
        </div>
    </nav>
        <main style="width:90%;">
        <div style="width:100%">
            <div  style="padding-left:20px; width:90%">
                <table style="width: 100%; height:500px" id="board">
                    <thead>
                        <tr class="left_tr border-bottom"> 
                            <th class="left_td" style="padding-top:20px;">제목</th>
                            <td colspan="3" class="right_td" style="padding-top:20px"><span>${suggestionBoard.boardTitle}</span></td><br>
                        </tr>
                        <tr class="border-bottom" style="height: 50px;">
                            <th class="left_td" style="padding-top: 20px; width:5%">파일첨부</th>
                            <td style="padding-left:30px; width:35%; color:gray">
                            <c:if test="${empty suggestionBoard.boardFile}">
	                        	첨부파일 없음.
	                        </c:if> <c:if test="${not empty suggestionBoard.boardFile}">
	                        	<a href="${pageContext.request.contextPath}/resources/multipartFile/${suggestionBoard.boardFile}"download>
	                        		${suggestionBoard.boardFile}
	                        	</a>
							</c:if></td>
                            <th class="left_td" style="padding-top:20px; width:5%">작성자</th>
                            <td id="right_td" style="padding-top:20px; width:35%; text-align:center; font-size:1.2em"><span>${suggestionBoard.employeeName}</span></td><br>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="write_content" class="border-bottom">
                            <th class="left_td">내용</th>
                            <td colspan="3" class="right_td"><div id="smartEditor" style="height: 400px; width: 100%;">${suggestionBoard.boardContent}</div></td>
                        </tr>
                    </tbody>    
                </table>
            </div>

           <div class="row">        
            	<div class="container col-sm-6" style="text-align:left; padding-left:40px">
                	<c:if test="${employee.roleCode == 1}"></c:if>
                	<button class="btn btn-info">
                		<a href="reply?fk_Seq=${num}&groupNo=${suggestionBoard.groupNo}&depthNo=${suggestionBoard.depthNo}" style="color:white">답글 작성</a></button>
                	<button class="btn btn-secondary"><a href="list" style="color:white">목록</a></button>
            	</div>
            	<div class="container col-sm-6" style="text-align:right; padding-right:11%">
            	<c:if test="${suggestionBoard.employeeName == employee.employeeName }">
	                <button class="btn btn-info"><a href="updateBridge?num=${num}" style="color:white">수정하기</a></button>
    	            <button class="btn btn-secondary" onclick="confirm('정말 삭제하시겠습니까?')"><a href="delete?num=${num}" style="color:white">삭제</a></button>
            	</c:if>
            	</div>
            </div>
           </div>
        </main>
    </body>
</html>


