<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error/error.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon start -->
<link rel="icon" type="image/x-icon" href="img/wdfavicon.png" />
<!-- favicon end -->
<title>WooriDoori - mail</title>
<link rel="stylesheet" href="./css/mail.css" />
</head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<body>
<!-- 
<div class="form-group" style="width: 38%; margin: 10px auto;">
<button type="button" class="btn btn-primary btn-lg btn-block" onclick="send_mail()">보내기</button>
</div>
 -->
 
<div id="allcontent">
<div id="logo">
<center>
<img src="assets/images/wdmainlogo.png">
</center>
<br>
</div>

<div id="formcontent">

<form action="sendMail.do" method="post">
	<input type="text" name="address" placeholder="상대방의 메일주소를 입력해주세요." class="inputtext"><br>
	<div id="spandiv">
	<span>ex) Woori@Doori.com</span>
	</div>
	<input type="text" name="wdcwoori" value="${udata.wdmid}" hidden><br><br>
	<input type="submit" value="전송" class="submitb">
</form>
</div>

</div>
<!--
<script type="text/javascript">
function send_mail(){
	window.open("./test_mail.jsp", "", "width=370, height=360, resizable=no, scrollbars=no, status=no");
}
</script>
 -->

</body>
</html>