<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
		<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/common.css"></link>
		<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/resources/css/schedule/scheduleWrite.css"></link>
		<title>josso</title>
		<!-- 외부 글꼴 적용 시 링크 -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link
			href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
			rel="stylesheet">
		<!-- Icon -->
		<link rel="stylesheet"
			href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
			integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
			crossorigin="anonymous">
		<!-- 부트스트랩 css 사용 -->
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<!-- jQuery library -->
		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- Popper JS -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<!-- Latest compiled JavaScript -->
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<!-- 부트스트랩 datepicker css -->
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
			integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw=="
			crossorigin="anonymous" />
		<!-- 부트스트랩 datepicker js -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"
			integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ=="
			crossorigin="anonymous"></script>
		<script>
			$(function() {
				$('.side_title').click(function() {
					// $('.hover_tag').slideToggle("slow,linear,callback");
					var submenu = $('.hover_tag>li');
					if (submenu.is(":visible")) {
						submenu.slideUp();
					} else {
						submenu.slideDown();
					}
				});
				$('.hover_team1').click(function() {
					var submenu = $('.modal_mb1');
					if (submenu.is(":visible")) {
						submenu.slideUp();
					} else {
						submenu.slideDown();
					}
				});
				$('.hover_team2').click(function() {
					var submenu = $('.modal_mb2');
					if (submenu.is(":visible")) {
						submenu.slideUp();
					} else {
						submenu.slideDown();
					}
				});
				$('.hover_team3').click(function() {
					var submenu = $('.modal_mb3');
					if (submenu.is(":visible")) {
						submenu.slideUp();
					} else {
						submenu.slideDown();
					}
				});
				$('.hover_team4').click(function() {
					var submenu = $('.modal_mb4');
					if (submenu.is(":visible")) {
						submenu.slideUp();
					} else {
						submenu.slideDown();
					}
				});
				$('.btn_wrap').click(function() {
					var modalDiv = $('#exampleModal');
					modalDiv.modal({
						backdrop : false,
						show : true
					});
					$('.modal-dialog').draggable({
						handle : ".modal-header"
					});
				});
			});
		</script>
		<script>
			$(function() {
				$('.start_date').datepicker({
					format : "yyyy-mm-dd"
				});
				$('.end_date').datepicker({
					format : "yyyy-mm-dd"
				});
			});
		</script>
	</head>
	<body class="body">
		<header>
			<div class="navigation">
				<ul>
					<li><a href="#"> <span class="icon"><i
								class="fa fa-home" aria-hidden="true"></i></span> <span class="icon">홈</span>
					</a></li>
					<li><a href="#"> <span class="icon"><i
								class="fa fa-envelope" aria-hidden="true"></i></span> <span class="icon">메일</span>
					</a></li>
					<li><a href="#"> <span class="icon"><i
								class="fas fa-list-ul fa-lg" aria-hidden="true"></i></span> <span
							class="icon">게시판</span>
					</a></li>
					<li><a href="#"> <span class="icon"><i
								class="fas fa-calendar-alt fa-lg" aria-hidden="true"></i></span> <span
							class="icon">캘린더</span>
					</a></li>
					<li><a href="#"> <span class="icon"><i
								class="fas fa-clock fa-lg" aria-hidden="true"></i></span> <span
							class="icon">예약</span>
					</a></li>
					<li><a href="#"> <span class="icon"><i
								class="fas fa-clipboard fa-lg" aria-hidden="true"></i></span> <span
							class="icon">결재</span>
					</a></li>
					<li><a href="#"> <span class="icon"><i
								class="fas fa-user-friends fa-lg" aria-hidden="true"></i></span> <span
							class="icon">조직도</span>
					</a></li>
					<li><a href="#"> <span class="icon"><i
								class="fa fa-paste" aria-hidden="true"></i></span> <span class="icon">보고</span>
					</a></li>
				</ul>
			</div>
		</header>
		<aside class="border-right">
			<div>
				<section>
					<div class="title">
						<span class="icon"><i class="fas fa-calendar-alt icon_"
							aria-hidden="true"></i>캘린더</span>
	
					</div>
				</section>
				<section>
					<div class="title_button">
						<button type="button" class="btn btn-info btn-sm btn-block">일정등록</button>
					</div>
				</section>
				<section>
	
					<div class="side_title">
						<span class="hover_icon"> <i
							class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
						</span> <span class="hover_title">내 캘린더</span> <span class="write_img">
							<img src="../images/글쓰기(연필).png">
						</span>
					</div>
					<div>
						<ul class="hover_tag">
							<li>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox"
										id="inlineCheckbox1" value="option1" checked> <label
										class="form-check-label" for="inlineCheckbox1">내 일정</label>
								</div>
							</li>
							<li>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox"
										id="inlineCheckbox1" value="option1"> <label
										class="form-check-label" for="inlineCheckbox1">내 일정</label>
								</div>
							</li>
							<li>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="checkbox"
										id="inlineCheckbox1" value="option1"> <label
										class="form-check-label" for="inlineCheckbox1">내 일정</label>
								</div>
							</li>
						</ul>
					</div>
				</section>
			</div>
		</aside>
		<nav class="border-bottom">
			<!-- Navbar content -->
			<div class="content_top">
				<h1>일정등록</h1>
			</div>
		</nav>
		<main>
			<div>
				<form action="#">
					<table class="form_type">
						<tbody>
							<tr>
								<th>제목</th>
								<td><input class="ipt" type="text" value maxlength="500">
								</td>
							</tr>
	
							<tr>
								<th>날짜</th>
								<td>
									<!-- <div class="input-group date" data-provide="datepicker">
	                                        <input type="text" class="form-control" id="datepicker">
	                                        <div class="input-group-addon">
	                                            <span class="glyphicon glyphicon-th"></span>
	                                        </div>
	                                    </div> -->
									<div class="date_ipt">
										<span> <img src="../images/달력이미지.png"> <input
											type="text" class="start_date" data-provide="datepicker"
											value=""> <!-- <input type="text" class="time_date dropdown-toggle" value=""> -->
											<select>
												<option value="">00:00</option>
												<option value="">00:30</option>
												<option value="">01:00</option>
												<option value="">01:30</option>
												<option value="">02:00</option>
												<option value="">02:30</option>
												<option value="">03:00</option>
												<option value="">03:30</option>
												<option value="">04:00</option>
												<option value="">04:30</option>
												<option value="">05:00</option>
												<option value="">05:30</option>
												<option value="">06:30</option>
												<option value="">07:30</option>
												<option value="">08:00</option>
												<option value="">08:30</option>
												<option value="">09:00</option>
												<option value="">09:30</option>
												<option value="">10:00</option>
												<option value="">10:30</option>
												<option value="">11:00</option>
												<option value="">11:30</option>
												<option value="">12:00</option>
												<option value="">12:30</option>
												<option value="">13:00</option>
												<option value="">13:30</option>
												<option value="">14:00</option>
												<option value="">14:30</option>
												<option value="">15:00</option>
												<option value="">15:30</option>
												<option value="">16:00</option>
												<option value="">16:30</option>
												<option value="">17:00</option>
												<option value="">17:30</option>
												<option value="">18:00</option>
												<option value="">18:30</option>
												<option value="">19:00</option>
												<option value="">19:30</option>
												<option value="">20:00</option>
												<option value="">20:30</option>
												<option value="">21:00</option>
												<option value="">21:30</option>
												<option value="">22:00</option>
												<option value="">22:30</option>
												<option value="">23:00</option>
												<option value="">23:30</option>
										</select>
										</span> ~ <span> <img src="../images/달력이미지.png"> <input
											type="text" class="end_date" data-provide="datepicker"
											value=""> <!-- <input type="text" class="time_date" value=""> -->
											<select>
												<option value="">00:00</option>
												<option value="">00:30</option>
												<option value="">01:00</option>
												<option value="">01:30</option>
												<option value="">02:00</option>
												<option value="">02:30</option>
												<option value="">03:00</option>
												<option value="">03:30</option>
												<option value="">04:00</option>
												<option value="">04:30</option>
												<option value="">05:00</option>
												<option value="">05:30</option>
												<option value="">06:30</option>
												<option value="">07:30</option>
												<option value="">08:00</option>
												<option value="">08:30</option>
												<option value="">09:00</option>
												<option value="">09:30</option>
												<option value="">10:00</option>
												<option value="">10:30</option>
												<option value="">11:00</option>
												<option value="">11:30</option>
												<option value="">12:00</option>
												<option value="">12:30</option>
												<option value="">13:00</option>
												<option value="">13:30</option>
												<option value="">14:00</option>
												<option value="">14:30</option>
												<option value="">15:00</option>
												<option value="">15:30</option>
												<option value="">16:00</option>
												<option value="">16:30</option>
												<option value="">17:00</option>
												<option value="">17:30</option>
												<option value="">18:00</option>
												<option value="">18:30</option>
												<option value="">19:00</option>
												<option value="">19:30</option>
												<option value="">20:00</option>
												<option value="">20:30</option>
												<option value="">21:00</option>
												<option value="">21:30</option>
												<option value="">22:00</option>
												<option value="">22:30</option>
												<option value="">23:00</option>
												<option value="">23:30</option>
										</select>
										</span>
									</div>
								</td>
							</tr>
	
							<tr>
								<th>참석자</th>
								<td><span class="badge badge-pill badge-secondary">안태민</span>
									<span class="badge badge-pill badge-secondary">안태민</span> <span
									class="badge badge-pill badge-secondary">안태민</span> <span
									class="badge badge-pill badge-secondary">안태민</span> <span
									class="badge badge-pill badge-secondary">안태민</span> <span
									class="badge badge-pill badge-secondary">안태민</span> <span
									class="btn_wrap" data-toggle="modal" data-target="#exampleModal">
										<span><img src="../images/플러스이미지.png"></span> <span>참석자
											선택</span>
								</span></td>
							</tr>
	
							<tr>
								<th>장소</th>
								<td><input class="ipt" type="text" value maxlength="500">
								</td>
							</tr>
	
							<tr>
								<th>내용</th>
								<td><textarea class="txtarea" style="resize: none;"
										rows="10"></textarea></td>
							</tr>
						</tbody>
					</table>
					<div class="bt_area">
						<span>
							<button type="button" class="btn btn-info">확인</button>
						</span> <span>
							<button type="button" class="btn btn-secondary">취소</button>
						</span>
					</div>
				</form>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm modal-dialog-scrollable">
					<div class="modal-content">
						<div class="modal-header">
							<h6 class="modal-title" id="exampleModalLabel">참석자 추가</h6>
							<br>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<ul>
								<li class="hover_team1"><a href="#"> <i
										class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
										영업팀
								</a></li>
								<ul class="modal_mb1">
									<li>안태민</li>
									<li>안태민</li>
								</ul>
								<li class="hover_team2"><a href="#"> <i
										class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
										지원팀
								</a></li>
								<ul class="modal_mb2">
									<li>안태민</li>
									<li>안태민</li>
								</ul>
								<li class="hover_team3"><a href="#"> <i
										class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
										개발팀
								</a></li>
								<ul class="modal_mb3">
									<li>안태민</li>
									<li>안태민</li>
								</ul>
								<li class="hover_team4"><a href="#"> <i
										class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
										운영팀
								</a></li>
								<ul class="modal_mb4">
									<li>안태민</li>
									<li>안태민</li>
								</ul>
							</ul>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</main>
		<footer class="border-top"> </footer>
	</body>
</html>