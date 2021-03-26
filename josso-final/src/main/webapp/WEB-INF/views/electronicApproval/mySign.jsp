<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<h1>내가 기안한 문서</h1>
		</div>
	</nav>

	<main>
		<div
			style="margin-left: 95%; padding-top: 10px; padding-bottom: 10px;">
			<select>
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="30">30</option>
			</select>
		</div>
		<div class="border-bottom">
			<table style="width: 100%; min-width: 1000px;" id="board">
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
						<td>대기중</td>
					</tr>
					<tr>
						<td id="tdnum">2021-03-17</td>
						<td>휴가신청서</td>
						<td>휴가신청의 건</td>
						<td>1</td>
						<td>대기중</td>
					</tr>
					<tr>
						<td id="tdnum">2021-03-17</td>
						<td>휴가신청서</td>
						<td>휴가신청의 건</td>
						<td>1</td>
						<td>대기중</td>
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
		<div
			style="margin-left: 80%; padding-top: 10px; padding-bottom: 10px;">
			<input type="text" name="??">
			<button>검색</button>
		</div>
		<!-- modal 삽입  -->
		<%@ include file="../electronicApproval/part/modal.jsp"%>
	</main>
	<footer class="border-top"> </footer>
</body>
</html>