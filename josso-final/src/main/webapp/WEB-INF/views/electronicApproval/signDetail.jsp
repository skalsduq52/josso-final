<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script>
 $(function () {
	var date1 = new Date("<c:out value='${ev.startDate}'/>");
	var date2 = new Date("<c:out value='${ev.endDate}'/>");
	num = ((date2.getTime() - date1.getTime()) / (1000*60*60*24))+1;
	$('#appDate').text(num);
	$('#appDate1').text(num);
	
	
	var num = "<c:out value='${ev.documentNo}'/>";
	
	$("#accept1").click(function(){
	    if(confirm("결재 완료하시겠습니까") == true){
	    	window.location.href="/josso/elecApproval/middleAccept?num="+num;
	    }
	    else{
	        return ;
	    }
	});
	
	$("#reject1").click(function(){
	    if(confirm("반려 하시겠습니까?") == true){
	    	window.location.href="/josso/elecApproval/middleReject?num="+num;
	    }
	    else{
	        return ;
	    }
	});

	
 });
</script>
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

	<!-- nav -->
	<nav class="border-bottom">
		<div class="content_top">
			<h1>휴가신청서</h1>
		</div>
	</nav>

	<!-- main -->
	<main>
			<div class="border"
				style="height: 95%; min-height: 1000px; margin: 10px 10px 10px 10px">
				<div style="height: 300px; padding-left: 15px;">
					<table>
						<tbody>
							<tr style="width: 800px; height: 200px;">
								<td align="center" colspan="2"><h1>휴가신청서</h1></td>
								<input type="hidden" name="documentForm" value="F1">
							</tr>
							<tr>
								<td>
									<table border="1" style="width: 300px;">
										<tr>
											<td style="width: 100px;" id="td_back">문서번호</td>
											<td>${ev.documentNo}</td>
										</tr>
										<tr>
											<td id="td_back">소속</td>
											<td>${ev.departmentCode}</td>
										</tr>
										<tr>
											<td id="td_back">기안자</td>
											<td>${ev.employeeName}</td>
										</tr>
										<tr>
											<td id="td_back">작성일자</td>
											<td><fmt:formatDate value="${ev.registerDate}" pattern="yyyy-MM-dd"/></td>
										</tr>
									</table>
								</td>
								<td style="padding-left: 350px;">
									<table border="1" style="float: right; margin-left: 15px;">
										<tbody>
											<tr>
												<td rowspan="4"
													style="height: 150px; background-color: rgb(226, 226, 226);">승<br>인
												</td>
												<td style="height: 15px; width: 100px;" align="center">${middle.departmentCode}</td>
												<td style="height: 15px; width: 100px;" align="center">${last.departmentCode}</td>
											</tr>
											<tr>
												<td rowspan="2" align="center">
												<c:if test="${ev.middleAccept == 1 || ev.middleAccept == 2}"><img style="width:60px;" src="../resources/images/도장.png"></c:if><br>${middle.employeeName}</td>
												<td rowspan="2" align="center">
												<c:if test="${ev.lastAccept == 1 || ev.lastAccept == 2}"><img style="width:60px;" src="../resources/images/도장.png"></c:if><br>${last.employeeName}</td>
											</tr>
											<tr></tr>
											<tr>
												<td style="height: 30px;" align="center"><c:if test="${ev.middleAccept == 1}"><fmt:formatDate value="${ev.middleAcceptDate}" pattern="yyyy-MM-dd"/></c:if>
												<c:if test="${ev.middleAccept == 2}">반&emsp;려</c:if>
												</td>
												<td align="center"><c:if test="${ev.lastAccept == 1}"><fmt:formatDate value="${ev.lastAcceptDate}" pattern="yyyy-MM-dd"/></c:if>
												<c:if test="${ev.lastAccept == 2}">반&emsp;려</c:if></td>
											</tr>
										</tbody>
									</table>
									<table border="1" style="float: right;">
										<tbody>
											<tr>
												<td rowspan="4"
													style="height: 130px; background-color: rgb(226, 226, 226);">신<br>청
												</td>
												<td style="height: 15px; width: 100px;" align="center">${ev.rankCode}</td>
											</tr>
											<tr>
												<td rowspan="2" align="center"><img style="width:60px;" src="../resources/images/도장.png"><br>${ev.employeeName}</td>
											</tr>
											<tr></tr>
											<tr>
												<td style="height: 30px;" align="center"><fmt:formatDate value="${ev.registerDate}" pattern="yyyy-MM-dd"/></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div style="padding-top: 150px; margin-left: 15px;">
					<table border="1">
						<tr>
							<td align="center" style="height: 40px; width: 150px;"
								id="td_back">문서제목</td>
							<td style="width: 850px;">&nbsp;${ev.documentName}</td>
						</tr>
					</table>
				</div>
				<div style="padding-top: 30px; margin-left: 15px;">
					<table border="1">
						<tr>
							<td align="center" style="height: 40px; width: 150px;"
								id="td_back">휴가종류</td>
							<td style="width: 850px;">
							&nbsp;${ev.holyType}</td>
						</tr>
						
						<tr>
							<td align="center" style="height: 40px; width: 150px;"
								id="td_back">기간 및 일시</td>
							<td style="width: 850px;">&nbsp;${ev.startDate} ~ ${ev.endDate}&emsp;&emsp;신청일수 : <span id="appDate"></span> </td>
						</tr>
						<tr>
							<td align="center" style="height: 40px; width: 150px;"
								id="td_back">연차 일수</td>
							<td style="width: 850px;">&nbsp;총연차일수 : 16 &emsp;&emsp;사용한연차 : ${used}
								&emsp;&emsp;잔여연차 :  ${drafter.employeeAnnualLeave}
								&emsp;&emsp;신청연차 : 	<label id="appDate1"></label>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="background-color: rgb(226, 226, 226);">
								1. 연차의 사용은 근로기준법에 따라 전년도에 발생한 개인별 잔여 연차에 한하여 사용함을 원칙으로 한다. 단, 최초
								입사시에는 근로 기준법에<br> 따라 발생 예정된 연차를 차용하여 월 1회 사용 할 수 있다.<br>
								2. 경조사 휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출<br> 3.
								상기 사용일수는 주말(토·일요일) 및 공휴일을 제외하여 산정된 일수로 실제 사용일수와 상이할 수 있다.<br>
								4. 출산휴가(배우자)의 경우 배우자의 출산일자를 증명하는 증빙서류를 첨부하여 기안을 올린다.<br> 5.
								출산휴가(태아검진)의 경우 사후에 검진일자를 증명하는 병원 검진영수증 사본을 인사담당자에게 제출한다.<br>
							</td>
						</tr>
					</table>
					<div style="padding-top: 150px; margin-left: 15px;">
					<c:if test="${employee.employeeNumber == middle.employeeNumber && ev.middleAccept == 0}">
						<button id="accept1">승인</button>
						<button id="reject1">반려</button>
					</c:if>
					<c:if test="${(employee.employeeNumber == last.employeeNumber && ev.lastAccept == 0) && ev.middleAccept == 1}">
						<button id="accept2">승인</button>
						<button id="reject2">반려</button>
					</c:if>
				</div>
				</div>
		</div>
		<!-- modal 삽입  -->
		<%@ include file="../electronicApproval/part/modal.jsp"%>
	</main>
	<footer class="border-top"> </footer>
</body>
</html>