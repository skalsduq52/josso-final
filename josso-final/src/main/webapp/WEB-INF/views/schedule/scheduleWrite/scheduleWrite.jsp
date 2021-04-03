<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

		<nav class="border-bottom">
			<!-- Navbar content -->
			<div class="content_top">
				<h1>일정등록</h1>
			</div>
		</nav>
		<main>
			<div>
				<form action="${pageContext.request.contextPath}/schedule/register" method="post">
					<table class="form_type">
						<tbody>
							<tr>
								<th id="title">제목</th>
								<td><input class="ipt" name="scheduleTitle" type="text" value maxlength="500">
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
										<span> <%-- <img src="${pageContext.request.contextPath}/resources/images/달력이미지.png">  --%>
										<input type="date" class="start_date" name="scheduleStartDate" value=""> <!-- <input type="text" class="time_date dropdown-toggle" value=""> -->
										<input type="time" name="scheduleStartTime">	
										</span> ~ <span> <%-- <img src="${pageContext.request.contextPath}/resources/images/달력이미지.png"> --%> 
											<input type="date" class="start_date" name="scheduleEndDate" value=""> <!-- <input type="text" class="time_date dropdown-toggle" value=""> -->
											<input type="time" name="scheduleEndTime">	 <!-- <input type="text" class="time_date" value=""> -->
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<th>참석자</th>
								<td>
									<span id="Attendee">
									
									</span>
									<span class="btn_wrap" data-toggle="modal" data-target="#exampleModal">
										<span><img src="${pageContext.request.contextPath}/resources/images/플러스이미지.png"></span>
										<span>참석자 선택</span>
									</span>
								</td>
							</tr>
							<tr>
								<th>장소</th>
								<td><input class="ipt" name="schedulePlace" type="text" maxlength="500">
								</td>
							</tr>
	
							<tr>
								<th>내용</th>
								<td><textarea class="txtarea" name="scheduleContent" style="resize: none;"
										rows="10"></textarea></td>
							</tr>
						</tbody>
					</table>
					<div class="bt_area">
						<span>
							<button type="submit" class="btn btn-info">확인</button>
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
								<li class="hover_team1">
									<a href="#"> 
										<i class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
										<b>운영팀</b>
									</a>
								</li>
								<ul class="modal_mb1">
								<c:forEach var="n" items="${employee}">
									<c:if test="${n.departmentCode eq '운영본부'}">
										<li><span class="Addattendee">${n.employeeName}&nbsp;${n.rankCode}</span></li>
									</c:if>
								</c:forEach>
									
								</ul>
								<li class="hover_team2">
									<a href="#"> 
										<i class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
										<b>개발팀</b>
									</a>
								</li>
								<ul class="modal_mb2">
								
								<c:forEach var="n" items="${employee}">
									<c:if test="${n.departmentCode eq '개발본부'}">
										<li><span class="Addattendee">${n.employeeName}&nbsp;${n.rankCode}</span></li>
									</c:if>
								</c:forEach>
								
								</ul>
								<li class="hover_team3">
									<a href="#"> 
										<i class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
										<b>영업팀</b>
									</a>
								</li>
								<ul class="modal_mb3">
									
								<c:forEach var="n" items="${employee}">
									<c:if test="${n.departmentCode eq '영업본부'}">
										<li><span class="Addattendee">${n.employeeName}&nbsp;${n.rankCode}</span></li>
									</c:if>
								</c:forEach>
								
								</ul>
								<li class="hover_team4">
									<a href="#"> 
										<i class="fas fa-sort-down fa-rotate-270" style="color: gray"></i>
										<b>지원팀</b>
									</a>
								</li>
								<ul class="modal_mb4">
								
								<c:forEach var="n" items="${employee}">
									<c:if test="${n.departmentCode eq '지원본부'}">
										<li><span class="Addattendee">${n.employeeName}&nbsp;${n.rankCode}</span></li>
									</c:if>
								</c:forEach>
								
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
		