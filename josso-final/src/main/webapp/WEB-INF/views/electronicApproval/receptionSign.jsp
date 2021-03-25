<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../common.css" type="text/css">
        <style>
            #boardlist tbody tr:hover {
                background: rgb(249, 249, 249);
            }
            #boardlist tbody tr td {
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
            a:link { color: black; text-decoration: none;}
            a:visited { color: black; text-decoration: none;}
            a:hover{color: black; text-decoration: none;}
            .sign_info{
                width: 100%;
                height: 40px; 
                background-color:rgb(238, 238, 238);
                line-height: 40px;
                padding-left: 10px;
            }
            .side_title ul{
                padding-left: 0px;
            }
        </style>
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
                $('.document_kind').click(function(){
                    var submenu = $('.hover_tag>li');
                    if(submenu.is(":visible")){
                        submenu.slideUp();
                    }else{
                        submenu.slideDown();
                    }
                });
                $('.document_kind_2').click(function(){
                    var submenu = $('.hover_tag2>li');
                    if(submenu.is(":visible")){
                        submenu.slideUp();
                    }else{
                        submenu.slideDown();
                    }
                });
                $('.document_kind_3').click(function(){
                    var submenu = $('.hover_tag3>li');
                    if(submenu.is(":visible")){
                        submenu.slideUp();
                    }else{
                        submenu.slideDown();
                    }
                });
                $('.document_kind_4').click(function(){
                    var submenu = $('.hover_tag4>li');
                    if(submenu.is(":visible")){
                        submenu.slideUp();
                    }else{
                        submenu.slideDown();
                    }
                });
                $('.document_kind_5').click(function(){
                    var submenu = $('.hover_tag5>li');
                    if(submenu.is(":visible")){
                        submenu.slideUp();
                    }else{
                        submenu.slideDown();
                    }
                });
                $('.document_kind_6').click(function(){
                    var submenu = $('.hover_tag6>li');
                    if(submenu.is(":visible")){
                        submenu.slideUp();
                    }else{
                        submenu.slideDown();
                    }
                });

                $('.dataRow').on({
                    'dragstart': function (e) {
                        e.originalEvent.dataTransfer.setData('text', $(this).html());
                    },
                    // 'dragend' : function(e) {
                    //    $(this).remove();
                    // }
                });

                $('#droppObj').on({
                    'dragenter': function (e) {
                    },
                    'dragleave': function (e) {
                    },
                    'dragover': function (e) {
                        e.preventDefault();
                    },

                    'drop': function (e) {
                        if($('#drop1 >tbody>tr').length == 1){
                        console.log($('#drop1 >tbody>tr').length)
                        var data = e.originalEvent.dataTransfer.getData('text');
                        var trObj = document.createElement('tr');
                        var board = document.getElementById('droppObj');
                        trObj.innerHTML = data;
                        console.log( board.lastElementChild.lastElementChild);
                        board.lastElementChild.lastElementChild.append(trObj);
                        e.preventDefault();
                        }else{
                            var data = e.originalEvent.dataTransfer.getData('text');
                            var parent1 = document.getElementById('droppObj');
                            var parent2 = parent1.lastElementChild.lastElementChild;
                            data1 = parent1.lastElementChild.lastElementChild.lastElementChild;
                            data1.remove();
                            var trObj = document.createElement('tr');
                            trObj.innerHTML = data;
                            parent2.append(trObj);
                            e.preventDefault();
                        }
                    }
                });
                
                $('#droppObj1').on({
                    'dragenter': function (e) {
                    },
                    'dragleave': function (e) {
                    },
                    'dragover': function (e) {
                        e.preventDefault();
                    },
                    'drop': function (e) {
                        if($('#drop2 >tbody>tr').length == 1){
                        var data = e.originalEvent.dataTransfer.getData('text');
                        var trObj = document.createElement('tr');
                        var board = document.getElementById('droppObj1');
                        trObj.innerHTML = data;
                        console.log( board.lastElementChild.lastElementChild);
                        board.lastElementChild.lastElementChild.append(trObj);
                        e.preventDefault();
                        }else{
                            var data = e.originalEvent.dataTransfer.getData('text');
                            var parent1 = document.getElementById('droppObj1');
                            var parent2 = parent1.lastElementChild.lastElementChild;
                            data1 = parent1.lastElementChild.lastElementChild.lastElementChild;
                            data1.remove();
                            var trObj = document.createElement('tr');
                            trObj.innerHTML = data;
                            parent2.append(trObj);
                            e.preventDefault();
                        }
                    }
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
                <h1>결재 수신 문서</h1>
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
                <table style="width: 100%;" id="boardlist">
                    <thead>
                        <tr class="border-top border-bottom" style="height: 40px;">
                            <th style="padding-left: 40px; width: 15%;">기안일</th>
                            <th style="width: 20%">결재양식</th>
                            <th style="width: 35%">제목</th>
                            <th style="width: 15%">첨부</th>
                            <th style="width: 10%">결재상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td id="tdnum">2021-03-17</td>
                            <td>휴가신청서</td>
                            <td>휴가신청의 건</td>
                            <td>1</td>
                            <td>완료</td>
                        </tr>
                        <tr>
                            <td id="tdnum">2021-03-17</td>
                            <td>휴가신청서</td>
                            <td>휴가신청의 건</td>
                            <td>1</td>
                            <td>반려</td>
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
                <input type="text" name="??" id="search"><button>검색</button>
            </div>
            <div class="modal fade" id="newsign">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                  <div class="modal-content">
                  
                    <!-- Modal Header -->
                    <div class="modal-header">
                      <h4 class="modal-title">새 결재 진행</h4>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                      <div class="border" style="width: 38%; float: left; margin: 10px 10px 10px 10px;height: 400px;min-width: 290px;">
                        <div class="document_kind">
                            <span class="hover_icon">
                                <i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                            </span>
                            <span class="hover_title">결재양식</span>
                        </div>
                        <div>
                            <ul class="hover_tag">
                                <li>
                                    <div class="document_kind_2">
                                        <div class="form-check form-check-inline 1">
                                            <span class="hover_icon">
                                                <i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                                            </span>
                                            <label class="form-check-label" for="inlineCheckbox1">공통양식</label>
                                        </div>
                                    </div>    
                                    <ul class="hover_tag2">
                                        <li>기안서</li>
                                        <li>보고서</li>
                                    </ul>
                                </li>
                                <li>
                                    <div class="document_kind_3">
                                        <div class="form-check form-check-inline">
                                            <span class="hover_icon">
                                                <i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                                            </span>
                                            <label class="form-check-label" for="inlineCheckbox1">근태관리</label>
                                        </div>
                                    </div>    
                                    <ul class="hover_tag3">
                                        <li><a href="#">휴가신청서</a></li>
                                        <li>외근신청서</li>
                                        <li>휴직신청서</li>
                                    </ul>
                                </li>
                                <li>
                                    <div class="document_kind_4">
                                        <div class="form-check form-check-inline">
                                            <span class="hover_icon">
                                                <i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                                            </span>
                                            <label class="form-check-label" for="inlineCheckbox1">지출결의</label>
                                        </div>
                                    </div>
                                    <ul class="hover_tag4">
                                        <li>지출결의서</li>
                                    </ul>
                                </li>
                                <li>
                                    <div class="document_kind_5">
                                        <div class="form-check form-check-inline">
                                            <span class="hover_icon">
                                                <i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                                            </span>
                                            <label class="form-check-label" for="inlineCheckbox1">인사총무</label>
                                        </div>
                                    </div>    
                                    <ul class="hover_tag5">
                                        <li>인사명령서</li>
                                        <li>인수인계서</li>
                                        <li>사유서</li>
                                        <li>시말서</li>
                                    </ul>
                                </li>
                                <li>
                                    <div class="document_kind_6">
                                        <div class="form-check form-check-inline">
                                            <span class="hover_icon">
                                                <i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                                            </span>
                                            <label class="form-check-label" for="inlineCheckbox1">법인카드관리</label>
                                        </div>
                                    </div>    
                                    <ul class="hover_tag6">
                                        <li>발급신청서</li>
                                        <li>분실확인서</li>
                                        <li>사용신청서</li>
                                        <li>반납확인서</li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                      </div>
                      <div class="border" style="width: 56%; float: right; margin: 10px 10px 10px 10px;height: 400px;min-width: 428px;">
                        <div class="sign_info">
                            상세정보
                        </div>
                        <div style="width: 100%;padding-left: 10px;padding-top: 10px;">
                            <table>
                                <tr>
                                    <td style="width: 100px;">제목</td>
                                    <td>휴가신청서</td>
                                </tr>
                                <tr>
                                    <td style="padding-top: 10px;">보존연한</td>
                                    <td style="padding-top: 10px;">5년</td>
                                </tr>
                            </table>
                            <div><input type="text" style="width: 80%;"><img style="width: 30px; padding-bottom: 3px;" src="../search.png"></div>
                            <div class="border" style="overflow: auto;height: 100px;margin-top: 5px;margin-right: 10px;">
                                <table class="border-top" style="width: 100%;margin-top: 5px;" id="board">
                                   <thead>
                                        <tr class="border-bottom dataRow">
                                                <th>부서</th>
                                                <th>직급</th>
                                                <th>이름</th>
                                        </tr>
                                   </thead>
                                    <tbody id="droppObj3">
                                        <tr class="dataRow" draggable="true">
                                            <td>인사본부</td>
                                            <td>과장</td>
                                            <td id="gd">나민엽</td>
                                        </tr>
                                        <tr class="dataRow" draggable="true">
                                            <td>인사본부</td>
                                            <td>팀장</td>
                                            <td>나민엽</td>
                                        </tr>
                                        <tr class="dataRow" draggable="true">
                                            <td>인사본부</td>
                                            <td>주임</td>
                                            <td>나민엽</td>
                                        </tr>
                                        <tr class="dataRow" draggable="true">
                                            <td>인사본부</td>
                                            <td>주임</td>
                                            <td>나민엽</td>
                                        </tr>
                                        <tr class="dataRow" draggable="true">
                                            <td>인사본부</td>
                                            <td>주임</td>
                                            <td>나민엽</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div style="width: 100%;height: 150px;">
                                <div class="border" style="width: 180px; height: 120px;float: left;margin-top: 20px; margin-left: 10px;" id="droppObj">
                                    <div class="border-bottom" style="height: 40px;line-height: 40px;text-align: center;" >
                                        중간 결재자
                                    </div>
                                    <table style="width: 100%;" id="drop1">
                                        <tbody>
                                            <tr class="border-bottom">
                                                <td style="width: 40%;">부서</td>
                                                <td style="width: 30%;">직급</td>
                                                <td style="width: 30%;">이름</td>
                                            </tr>
                                        </tbody>    
                                    </table>
                                </div>
                                <div class="border" style="width: 180px; height: 120px;float: left;margin-top: 20px; margin-left: 10px;" id="droppObj1">
                                    <div class="border-bottom" style="height: 40px;line-height: 40px;text-align: center;" >
                                        최종 결재자
                                    </div>
                                    <table style="width: 100%;" id="drop2">
                                        <tbody id="droppObj1">
                                            <tr class="border-bottom">
                                                <td style="width: 40%;">부서</td>
                                                <td style="width: 30%;">직급</td>
                                                <td style="width: 30%;">이름</td>
                                            </tr>
                                        </tbody>    
                                    </table>
                                </div>
                            </div>
                        </div>
                      </div>
                    </div>
                    
                    <!-- Modal footer -->
                    <div class="modal-footer">
                      <button type="button" class="btn btn-success" data-dismiss="modal" id="submit">등록</button>
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    </div>
                    
                  </div>
                </div>
              </div>
        </main>
        <footer class="border-top">
        </footer>
    </body>
</html>