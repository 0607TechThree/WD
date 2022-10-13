<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="wd" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>tabs demo</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  <link rel="stylesheet" href="css/mypage.css">
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
  
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style type="text/css">

#mypage > * {
	font-family: 'Jua';
}
</style> 
</head>

<body>

<!-- header Start-->
<wd:header/>
<!-- header End -->
<br>
<br>
<br>
<br>
<br>
<div id="mypage">
	<div>
		<center>
		<h1>마이페이지</h1>
		</center>
	</div>
	<div id="tabs">
	  <ul id="tabsli">
	    <li id="1"><a class="ina" href="#fragment-1"><center><img class="tabimg" alt="내정보" src="img/mypage/info.png"><p>내 정보</p></center></a></li>
	    <li id="2"><a class="ina" href="#fragment-2"><center><img class="tabimg" alt="커플정보" src="img/mypage/couple.png"><p>커플 정보</p></center></a></li>
	    <li id="3"><a class="ina" href="#fragment-3"><center><img class="tabimg" alt="vip정보" src="img/mypage/vip.png"><p>VIP 정보</p></center></a></li>
	  </ul>
	  <div id="fragment-1">
	    <div id="mypagemy">
	    	<div id="myuserimg">
	    		<img id="myuserimg2"alt="유저이미지" src="img/myuser.png">
	    	</div>
	    	<div id="myuserinfo">
	    		안녕
	    	</div>
	    </div>
	  </div>
	  <div id="fragment-2">
	    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
	    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
	  </div>
	  <div id="fragment-3">
	    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
	    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
	    Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
	  </div>
	</div>
</div>
<!-- Footer Start -->
<wd:footer/> 
<!-- Footer End -->
<script>
$( "#tabs" ).tabs();

</script>

</body>
</html>