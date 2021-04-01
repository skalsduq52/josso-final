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
				<form action="${pageContext.request.contextPath}/schedule/modify" method="post">
					<table class="form_type">
						<tbody>
							<tr>
								<th>제목</th>
								<td><input class="ipt" name="scheduleTitle" type="text" value="${schedule.scheduleTitle}" value maxlength="500">
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
										<input type="date" class="start_date" name="scheduleStartDate" value="${schedule.scheduleStartDate}"> <!-- <input type="text" class="time_date dropdown-toggle" value=""> -->
										<input type="time" name="scheduleStartTime" value="${schedule.scheduleStartTime}">	
											<!-- <select name="scheduleStartTime">
												<option value="00:00">00:00</option>
												<option value="00:30">00:30</option>
												<option value="01:00">01:00</option>
												<option value="01:30">01:30</option>
												<option value="02:00">02:00</option>
												<option value="02:30">02:30</option>
												<option value="03:00">03:00</option>
												<option value="03:30">03:30</option>
												<option value="04:00">04:00</option>
												<option value="04:30">04:30</option>
												<option value="05:00">05:00</option>
												<option value="05:30">05:30</option>
												<option value="06:30">06:30</option>
												<option value="07:30">07:30</option>
												<option value="08:00">08:00</option>
												<option value="08:30">08:30</option>
												<option value="09:00">09:00</option>
												<option value="09:30">09:30</option>
												<option value="10:00">10:00</option>
												<option value="10:30">10:30</option>
												<option value="11:00">11:00</option>
												<option value="11:30">11:30</option>
												<option value="12:00">12:00</option>
												<option value="12:30">12:30</option>
												<option value="13:00">13:00</option>
												<option value="13:30">13:30</option>
												<option value="14:00">14:00</option>
												<option value="14:30">14:30</option>
												<option value="15:00">15:00</option>
												<option value="15:30">15:30</option>
												<option value="16:00">16:00</option>
												<option value="16:30">16:30</option>
												<option value="17:00">17:00</option>
												<option value="17:30">17:30</option>
												<option value="18:00">18:00</option>
												<option value="18:30">18:30</option>
												<option value="19:00">19:00</option>
												<option value="19:30">19:30</option>
												<option value="20:00">20:00</option>
												<option value="20:30">20:30</option>
												<option value="21:00">21:00</option>
												<option value="21:30">21:30</option>
												<option value="22:00">22:00</option>
												<option value="22:30">22:30</option>
												<option value="23:00">23:00</option>
												<option value="23:30">23:30</option>
										</select> -->
										</span> ~ <span> <%-- <img src="${pageContext.request.contextPath}/resources/images/달력이미지.png"> --%> 
											<input type="date" class="start_date" name="scheduleEndDate" value="${schedule.scheduleEndDate}"> <!-- <input type="text" class="time_date dropdown-toggle" value=""> -->
											<input type="time" name="scheduleEndTime" value="${schedule.scheduleEndTime}">	 <!-- <input type="text" class="time_date" value=""> -->
											<!-- <select name="scheduleEndTime">
												<option value="00:00">00:00</option>
												<option value="00:30">00:30</option>
												<option value="01:00">01:00</option>
												<option value="01:30">01:30</option>
												<option value="02:00">02:00</option>
												<option value="02:30">02:30</option>
												<option value="03:00">03:00</option>
												<option value="03:30">03:30</option>
												<option value="04:00">04:00</option>
												<option value="04:30">04:30</option>
												<option value="05:00">05:00</option>
												<option value="05:30">05:30</option>
												<option value="06:30">06:30</option>
												<option value="07:30">07:30</option>
												<option value="08:00">08:00</option>
												<option value="08:30">08:30</option>
												<option value="09:00">09:00</option>
												<option value="09:30">09:30</option>
												<option value="10:00">10:00</option>
												<option value="10:30">10:30</option>
												<option value="11:00">11:00</option>
												<option value="11:30">11:30</option>
												<option value="12:00">12:00</option>
												<option value="12:30">12:30</option>
												<option value="13:00">13:00</option>
												<option value="13:30">13:30</option>
												<option value="14:00">14:00</option>
												<option value="14:30">14:30</option>
												<option value="15:00">15:00</option>
												<option value="15:30">15:30</option>
												<option value="16:00">16:00</option>
												<option value="16:30">16:30</option>
												<option value="17:00">17:00</option>
												<option value="17:30">17:30</option>
												<option value="18:00">18:00</option>
												<option value="18:30">18:30</option>
												<option value="19:00">19:00</option>
												<option value="19:30">19:30</option>
												<option value="20:00">20:00</option>
												<option value="20:30">20:30</option>
												<option value="21:00">21:00</option>
												<option value="21:30">21:30</option>
												<option value="22:00">22:00</option>
												<option value="22:30">22:30</option>
												<option value="23:00">23:00</option>
												<option value="23:30">23:30</option>
										</select> -->
										</span>
									</div>
								</td>
							</tr>
	
							<%-- <tr>
								<th>참석자</th>
								<td>
									<span class="badge badge-pill badge-secondary" name="Attendee">안태민</span>
									<span class="btn_wrap" data-toggle="modal" data-target="#exampleModal">
										<span><img src="${pageContext.request.contextPath}/resources/images/플러스이미지.png"></span>
										<span>참석자 선택</span>
									</span>
								</td>
							</tr> --%>
	
							<tr>
								<th>장소</th>
								<td><input class="ipt" name="schedulePlace" type="text" maxlength="500" value="${schedule.schedulePlace}">
								</td>
							</tr>
	
							<tr>
								<th>내용</th>
								<td><textarea class="txtarea" name="scheduleContent" style="resize: none;"
										rows="10">${schedule.scheduleContent}</textarea></td>
							</tr>
						</tbody>
					</table>
					<div class="bt_area">
						<c:if test="${employee.employeeNumber == schedule.employeeNumber}">
							<span>
								<button type="submit" class="btn btn-info">수정</button>
								
							</span> 
							<span>
								<button type="button" class="btn btn-secondary">취소</button>
							</span>
						</c:if>
						<c:if test="${employee.employeeNumber != schedule.employeeNumber || empty employee.employeeNumber}">
							<button type="button" onclick="window.history.back()" class="btn btn-info">돌아가기</button>
						</c:if>
					</div>
				</form>
			</div>
					</div>
				</div>
			</div>
		</main>
