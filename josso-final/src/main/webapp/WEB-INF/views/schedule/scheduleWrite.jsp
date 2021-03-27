<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
