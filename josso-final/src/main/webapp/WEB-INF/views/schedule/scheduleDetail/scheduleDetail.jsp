<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		<nav class="border-bottom">
			<!-- Navbar content -->
			<div class="content_top">
				<h1>일정변경 및 삭제</h1>
			</div>
		</nav>
		<main>
			<div>
				<form action="${pageContext.request.contextPath}/schedule/update" method="post">
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
										</span> ~ <span> <%-- <img src="${pageContext.request.contextPath}/resources/images/달력이미지.png"> --%> 
											<input type="date" class="start_date" name="scheduleEndDate" value="${schedule.scheduleEndDate}"> <!-- <input type="text" class="time_date dropdown-toggle" value=""> -->
											<input type="time" name="scheduleEndTime" value="${schedule.scheduleEndTime}">	 <!-- <input type="text" class="time_date" value=""> -->
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
								<th>참석자</th>
								<td>
									<c:forEach var="n" items="${attendee}" begin="0" end="${size}">
										<span class='badge badge-pill badge-secondary'>${n}</span>&nbsp;
									</c:forEach>
								</td>
							</tr>
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
							<input type="hidden" name="scheduleNumber" value="${schedule.scheduleNumber}">
						</tbody>
					</table>
					<div class="bt_area">
						<c:if test="${employee.employeeNumber == schedule.employeeNumber}">
							<span>
								<button type="submit" onclick="return confirm('정말 수정하시겠습니까?')" class="btn btn-info">수정</button>
								
							</span> 
							<span>
								<button type="button" onclick="window.history.back()" class="btn btn-secondary">취소</button>
							</span>
							<span>
								<button type="button" name="btn_del" onclick="return confirm('정말 삭제하시겠습니까?')" value="${schedule.scheduleNumber}" class="btn btn-danger">삭제</button>
							</span>
						</c:if>
						<c:if test="${employee.employeeNumber != schedule.employeeNumber || empty employee.employeeNumber}">
							<button type="button" onclick="window.history.back()"  class="btn btn-info">돌아가기</button>
						</c:if>
					</div>
				</form>
			</div>
		</main>
