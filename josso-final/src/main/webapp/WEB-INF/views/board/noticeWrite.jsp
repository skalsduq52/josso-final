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
         <script type="text/javascript" src="${pageContext.request.contextPath}/resources/smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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
	<meta charset="UTF-8">
        
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
                padding-left: 40px;
                width: 10%;
                min-width: 100px;
            }


            .right_td {
                padding-bottom: 20px;
                padding-right: 30px;
            }

            #multipart {
                border: 1px dashed gray;
                height: 60px;
                border-radius: 10px;
                text-align: center;
                min-width: 500px;
            }
            
            #write_content{
                height: 400px;
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

          #suggestion_title {
				/* padding-left : 20px; */
				/* background : #38A9BA; */
				font-size : 2em;
				color : #38A9BA;
				width:280px;
				font-weight : 700;
			}
     
        </style>

<script type="text/javascript">
    var oEditors = [];
    $(function(){
          nhn.husky.EZCreator.createInIFrame({
              oAppRef: oEditors,
              elPlaceHolder: "smartEditor", //textarea에서 지정한 id와 일치해야 함. 
              //SmartEditor2Skin.html 파일이 존재하는 경로
              sSkinURI: "${pageContext.request.contextPath}/resources/smartEditor/SmartEditor2Skin.html",  
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
     	  
          
          // 스마트에디터 값 전송
          $('form').click(function(){
    	 	oEditors.getById['smartEditor'].exec("UPDATE_CONTENTS_FIELD", []);
          });
          
         
        
    });
</script>


<script>
    // 드래그 앤 드랍
/*     function addFileList(fIndex, fileName, fileSizeStr) {

        var html="";
        html += "<tr id='fileTr_" + fIndex + "'>";
        html += "   <td id='multipart' class='left' >";
        html += fileName + " (" + fileSizeStr +") "
            + "<input value='삭제' type='button' href='#' onclick='deleteFile'(" + fIndex + "); return false;'>"
        html += "   </td>"
        html += "</tr>"

        $('#fileTableTbody').append(html);
    } */

</script>
        
</head>
<body class="body">
		<header>
			<%@ include file="../include/header.jsp"%>
		</header>
	    <aside class="border-right">
			<%@ include file="../board/part/aside.jsp"%>
    	</aside>
    <nav class="border-bottom">
        <div class="nav_title">
            <h2 id="suggestion_title" style="font-weight: 600;">》 공지사항 게시판</h2>
        </div>
        <div class="nav_content">
            <p style="margin: 12px 17px; font-style: italic; ">회사 공지사항입니다.<br>
               수시로 확인하시어 필독해주시고 궁금사항은 질의, 의무사항은 신속히 처리해주시기 바랍니다.<br>
            </p>
        </div>
    </nav>

        
        <main>
            <form action="register" method="POST" enctype="multipart/form-data">
            <div class="border-top">
                <table style="width: 100%;" id="board">
                    <thead>
                        <tr>
                            <th class="left_td" >제목</th>
                            <td class="right_td" ><input type="text" style="width: 100%;" name="boardTitle"></td><br>
                        </tr>
                        <tr >
                            <th class="left_td" >파일첨부</th>
                            <td class="right_td">
                            	<input type="file" name="boardFile">
                                <!-- <div id="dropZone">
                                <span>이 곳에 파일을 드래그 하세요. 또는</span>
                                    <input type="file" class="custom-file-input" id="customFile" style="display: none;" name="boardFile">
                                    <label for="customFile" id="attach_file" >파일선택</label>
                                    <table id="fileListTable" width="100%" border="0px">
                                         <tbody id="fileTableTbody">
    
                                         </tbody>
                                    </table>
                                </div> -->
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="write_content">
                            <th class="left_td">내용</th>
                            <td class="right_td">
                            <textarea id="smartEditor" style="height: 400px; width: 100%;" name="boardContent"></textarea></td>
                        </tr>
                    </tbody>    
                </table>
            </div>

            <div style="float:right; padding-right: 30px;">
                <input class="btn btn-primary" type="submit" value="제출하기">
            </div>  
           </form>        
        </main>
    </body>
</html>


