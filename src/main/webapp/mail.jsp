<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon start -->
<link rel="icon" type="image/x-icon" href="img/wdfavicon.png" />
<!-- favicon end -->
<title>WooriDoori - mail</title>
</head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<body>
<!-- 
<div class="form-group" style="width: 38%; margin: 10px auto;">
<button type="button" class="btn btn-primary btn-lg btn-block" onclick="send_mail()">보내기</button>
</div>
 -->
<form action="sendMail.do" method="post">
	<input type="text" name="address" placeholder="상대방의 메일주소를 입력해주세요.">
	<input type="text" name="wdcwoori" value="${udata.wdmid}" hidden>
	<input type="submit" value="전송">
</form>


<!--
<script type="text/javascript">
function send_mail(){
	window.open("./test_mail.jsp", "", "width=370, height=360, resizable=no, scrollbars=no, status=no");
}
</script>
 -->

</body>
</html>