<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert('${message}');
	if('${itemNumber}' == 1){
		location.href = "first?itemNumber=${itemNumber}";
	}else if('${itemNumber}' == 2){
		location.href = "second?itemNumber=${itemNumber}";
	}else if('${itemNumber}' == 3){
		location.href = "third?itemNumber=${itemNumber}";
	}else if('${itemNumber}' == 4){
		location.href = "avante?itemNumber=${itemNumber}";
	}else if('${itemNumber}' == 5){
		location.href = "benz?itemNumber=${itemNumber}";
	}
</script>
</head>
<body>

</body>
</html>