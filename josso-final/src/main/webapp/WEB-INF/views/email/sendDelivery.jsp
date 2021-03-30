<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
    <link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/common.css"></link>
        <link rel="stylesheet" href="../team01/common.css" type="text/css">
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
         <!-- SmartEditor2 라이브러리(경로 맞춰줘야 함.) -->
         <script type="text/javascript" src="../team01/smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
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
            $("#re").click(function(){
                if(confirm("정말 등록하시겠습니까 ?") == true){
                    alert("등록되었습니다");
                }
                else{
                    return ;
                }
            });
            function button_event(){
                if (confirm("다시 작성하시겠습니까??") == true){    //확인
                    document.form.submit();
                    location.href ='email_write.html';
                }else{   //취소
                    return;
                }
            }
        </script>
        <style>
            table>thead>tr>td>input{
                border: 1px solid gray;
            }
            .content_top h1{
			    margin : -35px 0px 0px -25px;
			}
			.nav-search{
			    margin: -50px 0px 0px -15px;
			}
			.nav-menu {
			    margin: -15px 0px 0px 8px;
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
                        <a href="/exam/email/accept/list?id=111@naver.com">
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
                        <span class="icon"><i class="fas fa-calendar-alt icon_" aria-hidden="true"></i>메일</span>
                            
                    </div>
                </section>
                <section>
                    <div class="title_button">
                        <button type="button" class="btn btn-info btn-sm btn-block"><a class="a" href="/exam/email/write/open"> 메일쓰기</a></button>
                    </div>
                </section>
                <section>
                    
                    <div class="side_title">
                        <span class="hover_icon">
                            <i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                        </span>
                        <span class="hover_title">내 메일함</span>
                        <span class="write_img">
                            <img src="../images/글쓰기(연필).png">
                        </span>
                    </div>
                    <div>
                        <ul class="hover_tag">
                            <li>
                                <div class="form-check form-check-inline">
                                    <label class="form-check-label" for="inlineCheckbox1"><a href="/exam/email/accept/list?id=111@naver.com">받은 메일함</a></label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check form-check-inline">
                                    
                                    <label class="form-check-label" for="inlineCheckbox1"><a href="/exam/email/send/list?id=111@naver.com"> 보낸 메일함</a></label>
                                </div>
                            </li>
                            <li>
                                <div class="form-check form-check-inline">
                                    
                                    <label class="form-check-label" for="inlineCheckbox1"><a href="/exam/email/wastebasket/list?id=111@naver.com"> 휴지통</a></label>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
        </aside>
        <nav class="border-bottom" >
            <!-- Navbar content -->
            <div class="container-xl-fluid">
                <div class="row">
                    <div class="col">
                        <div class="content_top">
                            <h1>보낸메일함</h1>
                        </div>
                    </div>
                    
                    <div class="col-6"></div>
                    <div class="col">
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col"></div>
                    <div class="col"></div>
                    <div class="col">
                        
                    </div>
                </div>
                <div class="row">
                    <div class="col nav-menu">
                        <a href="/exam/email/send/deliverySend"><input type="submit" class="btn btn-outline-info float-left" value="보내기"></a> 
                        <a href="/exam/email/send/delivery"><input type="submit" class="btn btn-outline-info float-left" value="다시쓰기"></a>
                    </div>
                    <div class="col"></div>
                    <div class="col"></div>
                </div>
            </div>
        </nav>
        <main>
            
            <table class="table table-hover">
                <thead class="thead-dark text-left">
                    <tr>
                        <td style="width: 120px;">보내는 사람 :</td>
                        <td colspan="2">
                        <input type="email" name="emailSend" class="form-control form-control-sm form-control-plaintext">
                        </td>
                    </tr>
                    <tr>
                        <td>받는 사람  </td>
                        <td colspan="2"><input type="email" name="emailAccept" class="form-control form-control-sm form-control-plaintext"></td>
                    </tr>
                    <tr>
                        <td>참조  </td>
                        <td colspan="2"><input type="email" name="emailReference" class="form-control form-control-sm form-control-plaintext"></td>
                    </tr>
                    <tr>
                        <td>제목  </td>
                        <td colspan="2"><input type="text" value="FW: ${sendDelivery.emailTitle}" name="emailTitle" class="form-control form-control-sm form-control-plaintext"></td>
                    </tr>
                    <tr>
                        <td>첨부파일  </td>
                        <td colspan="2"><input type="file" ></td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2">
                            <textarea id="smartEditor" class="form-control"
                             name="emailContent" minlength="3500"
                            style="height: 550px;">





-----Original Message-----
From: <${sendDelivery.emailSend}>
To: 이름/부서/직급 <${sendDelivery.emailAccept }>
Cc:
Sent: <fmt:formatDate value="${sendDelivery.regDate}" pattern="yy-MM-dd [E] a hh:mm:ss"></fmt:formatDate>
Subject: ${sendDelivery.emailTitle}

${sendDelivery.emailContent}

                            </textarea>
                        </td>
                    </tr>
                </tbody>
            </table>

            
        </main>
        <footer class="border-top">
                푸터요
        </footer>
    </body>
</html>