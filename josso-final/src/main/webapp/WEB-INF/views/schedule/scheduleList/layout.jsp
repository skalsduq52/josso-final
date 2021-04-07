<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title><tiles:getAsString name="title" /></title>  
		<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/css/fullcalendar/main.min.css"/>"></link>
		<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/css/common.css"/>"></link>
		<link rel="stylesheet" type="text/css"  href="<c:url value="/resources/css/schedule/scheduleList.css"/>"></link>
		<!-- 부트스트랩 css 사용 -->
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- 외부 글꼴 적용 시 링크 -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
        <!-- Icon -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
        crossorigin="anonymous">
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- fullcalendar css -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.1/main.min.css">
        <!-- js -->
        <script src="<c:url value="/resources/js/fullcalendar/main.min.js" />"></script>
        <script src="<c:url value="/resources/js/fullcalendar/ko.js" />"></script>
        <script src="<c:url value="/resources/js/schedule/aside.js" />"></script>
        <script src="<c:url value="/resources/js/schedule/scheduleList.js" />"></script>
        
</head>
<body class="body">
	<!-- header 부분 -->
	<tiles:insertAttribute name="header" />
	<!-- aside 부분 -->
	<tiles:insertAttribute name="aside" />
	<!-- nav 부분 -->
	<!-- main 부분 -->
	<tiles:insertAttribute name="main" />
	<!-- footer 부분 -->
	<tiles:insertAttribute name="footer" />
</body>
</html>