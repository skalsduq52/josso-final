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
<!-- modal,slide 스크립트 사용 -->
<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
</head>
<body>
	<!-- navigation 삽입 -->
	<header>
		<%@ include file="../electronicApproval/part/navigation.jsp"%>
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
		<div class="border-bottom">
			<table style="width: 100%;" id="board">
				<thead>
					<tr class="border-bottom" style="height: 40px;">
						<th style="padding-left: 40px; width: 15%;">기안일</th>
						<th style="width: 20%">결재양식</th>
						<th style="width: 35%">제목</th>
						<th style="width: 15%">기안자</th>
						<th style="width: 10%">결재상태</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${recepList[0] != null}">
					<c:forEach var="elist" items="${recepList}">
						<tr>
							<td id="tdnum"><fmt:formatDate value="${elist.registerDate}" pattern="yyyy-MM-dd"/></td>
							<c:if test="${elist.documentForm == 'F1'}">
								<td>휴가신청서</td>
							</c:if>
							<td><a href="/josso/elecApproval/signdetail?num=${elist.documentNo}">${elist.documentName}</a></td>
							<td>${elist.employeeName}/${elist.rankCode}/${elist.departmentCode}</td>
							<c:if test="${elist.middleAccept == 2 || elist.lastAccept == 2}">
								<td>반려</td>
							</c:if>
							<c:if test="${elist.middleAccept == 1 && elist.lastAccept == 1}">
								<td>완료</td>
							</c:if>
							<c:if test="${elist.middleAccept == 0 || (elist.middleAccept == 1 && elist.lastAccept == 0)}">
								<td>진행중</td>
							</c:if>
						</tr>
					</c:forEach>
				</c:if>	
				<c:if test="${recepList[0] == null}">	
					<tr>
						<th colspan="5" id="tdnum"  style="text-align: center;height:200px;">수신된 문서가 없습니다.</th>
					</tr>
				</c:if>
				</tbody>
			</table>
		</div>
		<c:if test="${recepList[0] != null}">
		 <div>     
                <ul class="pagination" style="padding-top: 20px; padding-left: 40%;">
                	<c:if test="${param.page !=1 and not empty param.page}">
						<li class="page-item"><a class="page-link" href="?page=${param.page-1}&title=${param.title}&query=${param.query}"><</a></li>&nbsp;&nbsp;
					</c:if>
					<c:if test="${param.page == 1 || empty param.page}">
						<li class="page-item disabled"><a class="page-link"><</a></li>&nbsp;&nbsp;
					</c:if>
                    <c:forEach var="i" begin="0" end="4">
						<c:if test="${(page.startNum+i) <= page.lastNum}">
							<li class="page-item ${(page.page==(page.startNum+i))?'active':''}"><a class="page-link" href="?page=${page.startNum+i}&title=${param.title}&query=${param.query}">${page.startNum+i}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${page.page+1 <= page.lastNum}">
						&nbsp;&nbsp;<li class="page-item"><a class="page-link" href="?page=${page.page+1}&title=${param.title}&query=${param.query}">></a></li>
					</c:if>
					<c:if test="${page.page+1 > page.lastNum}">
						&nbsp;&nbsp;<li class="page-item disabled"><a class="page-link">></a></li>
					</c:if>
                </ul>
            </div>
        </c:if>
        <br>
		<div style="float:right">
	            <form>
					<div class="input-group justify-content-right">
						<div class="form-group-append">
							<select class="form-control" name="title">
								<option ${(param.title == "DOCUMENT_NAME")?"Selected":""} value="DOCUMENT_NAME">문서제목</option>
								<option ${(param.title == "EMPLOYEE_NAME")?"Selected":""} value="EMPLOYEE_NAME">기안자</option>
							</select>
						</div>
						<input type="text" class="form-control" placeholder="Search" name="query" value="${param.query}">
						<div class="input-group-append">
							<button class="btn btn-success" type="submit">Go</button>
						</div>
					</div>
				</form>   
			</div>	 
		<!-- modal 삽입  -->
		<%@ include file="../electronicApproval/part/modal.jsp"%>
	</main>
	<footer class="border-top"> </footer>
</body>
</html>