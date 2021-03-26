<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>사원번호</th>
			<td>${employee.employeeNumber}</td>
		</tr>
		
	</table>

<a href="employeeUpdate?employeeNumber=${employee.employeeNumber }">사원정보수정</a>
</body>
</html>