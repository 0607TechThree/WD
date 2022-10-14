<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon start -->
<link rel="icon" type="image/x-icon" href="img/wdfavicon.png" />
<!-- favicon end -->
<title>WooriDoori - 메일</title>
</head>
<body>
<form action="insertWdcouple.do" method="post">
	<input type="hidden" name="wdcwoori" value="${param.wdcwoori}">
	<input type="hidden" name="wdcdoori" value="${udata.wdmid}">
	<input type="text" name="wdcdate">
	<input type="submit" value="확인">
</form>
</body>
</html>