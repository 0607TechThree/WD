<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="insertWdcouple.do" method="post">
	<input type="hidden" name="wdcwoori" value="${param.wdcwoori}">
	<input type="hidden" name="wdcdoori" value="2">
	<input type="text" name="wdcdate">
	<input type="submit" value="확인">
</form>
</body>
</html>