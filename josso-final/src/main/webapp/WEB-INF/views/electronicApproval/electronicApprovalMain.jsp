<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common.css"></link>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/elecApproval/sign.css"></link>
<title>josso</title>
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
<!-- modal,slide 스크립트 사용 -->
<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
</head>
<body>
	<!-- navigation 삽입 -->
	<header>
		<%@ include file="../electronicApproval/part/navigation.jsp"%>
	</header>
	<!-- aside 삽입 -->
	<aside class="border-right">
		<%@ include file="../electronicApproval/part/aside.jsp"%>
	</aside>
	<nav class="border-bottom">
		<div class="content_top">
			<h1>전자결재 홈</h1>
		</div>
	</nav>
	<main>
		<div style="padding-top: 20px;">
			<h4 style="padding-left: 20px; padding-bottom: 10px;">결재 대기 문서</h4>
			<table style="width: 100%;" id="board">
				<thead>
					<tr class="border-top border-bottom" style="height: 40px;">
						<th style="padding-left: 40px; width: 15%;">기안일</th>
						<th style="width: 20%">결재양식</th>
						<th style="width: 35%">제목</th>
						<th style="width: 15%">기안자</th>
						<th style="width: 10%">결재상태</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${waitSign[0] != null}">
						<c:forEach var="waitlist" items="${waitSign}">
							<tr>
								<td id="tdnum"><fmt:formatDate value="${waitlist.registerDate}" pattern="yyyy-MM-dd"/></td>
								<c:if test="${waitlist.documentForm == 'F1'}">
									<td>휴가신청서</td>
								</c:if>
								<td><a href="elecApproval/signdetail?num=${waitlist.documentNo}">${waitlist.documentName}</a></td>
								<td>${waitlist.employeeName}/${waitlist.rankCode}/${waitlist.departmentCode}</td>
								<c:if test="${waitlist.lastAccept == 0}">
									<td>진행중</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>	
					<c:if test="${waitSign[0] == null}">	
					<tr>
						<th colspan="5" id="tdnum"  style="text-align: center;height:300px;">기안한 문서가 없습니다.</th>
					</tr>
				</c:if>
				</tbody>
			</table>
			<h4
				style="padding-top: 50px; padding-left: 20px; padding-bottom: 10px;">내가
				기안한 문서</h4>
			<table style="width: 100%;" id="board">
				<thead>
					<tr class="border-top border-bottom" style="height: 40px;">
						<th style="padding-left: 40px; width: 15%;">기안일</th>
						<th style="width: 20%">결재양식</th>
						<th style="width: 35%">제목</th>
						<th style="width: 15%">기안자</th>
						<th style="width: 10%">결재상태</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${mySign[0] != null}">
					<c:forEach var="mylist" items="${mySign}">
						<tr>
							<td id="tdnum"><fmt:formatDate value="${mylist.registerDate}" pattern="yyyy-MM-dd"/></td>
							<c:if test="${mylist.documentForm == 'F1'}">
								<td>휴가신청서</td>
							</c:if>
							<td><a href="elecApproval/signdetail?num=${mylist.documentNo}">${mylist.documentName}</a></td>
							<td>${emp.employeeName}/${emp.rankCode}/${emp.departmentCode}</td>
							<c:if test="${mylist.lastAccept == 0}">
								<td>진행중</td>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>	
				<c:if test="${mySign[0] == null}">	
					<tr>
						<th colspan="5" id="tdnum"  style="text-align: center;height:300px;">기안한 문서가 없습니다.</th>
					</tr>
				</c:if>
				</tbody>
			</table>
			<h4
				style="padding-top: 50px; padding-left: 20px; padding-bottom: 10px;">결재
				수신 문서</h4>
			<table style="width: 100%;" id="board">
				<thead>
					<tr class="border-top border-bottom" style="height: 40px;">
						<th style="padding-left: 40px; width: 15%;">기안일</th>
						<th style="width: 20%">결재양식</th>
						<th style="width: 35%">제목</th>
						<th style="width: 15%">기안자</th>
						<th style="width: 10%">결재상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td id="tdnum">2021-03-17</td>
						<td>휴가신청서</td>
						<td>휴가신청의 건</td>
						<td>나민엽/사원/인사</td>
						<td>완료</td>
					</tr>
					<tr>
						<td id="tdnum">2021-03-17</td>
						<td>휴가신청서</td>
						<td>휴가신청의 건</td>
						<td>나민엽/사원/인사</td>
						<td>반려</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- modal 삽입  -->
		<%@ include file="../electronicApproval/part/modal.jsp"%>

	</main>
	<footer class="border-top"></footer>
</body>
</html>