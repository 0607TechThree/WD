<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="wd" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <!-- favicon start -->
<link rel="icon" type="image/x-icon" href="img/wdfavicon.png" />
<!-- favicon end -->
  <title>WooriDoori - 마이페이지</title>
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
	  <!-- 나의정보시작 -->
	  <div id="fragment-1">
	    <div id="mypagemy">
	    	<div id="myuserimg">
	    		<img id="myuserimg2"alt="유저이미지" src="img/myuser.png">
	    	</div>
	    	<div id="myuserinfo">
    		<form action="#" method="post">
	    		<h3>아이디 : ${udata.wdmid}</h3>
	    		<br>
	    		<p>닉네임 : ${udata.wdmnick}</p>
	    		<br>
	    		<p>성별 : ${udata.wdmgender}</p>
	    		<br>
	    		<p>이메일 : ${udata.wdmemail}</p>
	    		<br>
	    		<p>MBTI : ${udata.wdmmbti}</p>
	    		<br>
	    		<p>VIP 신청여부 : ${udata.wdmvip}</p>
	    		<center>
			    	<input type="submit" value="수정하기"><button>삭제하기</button>
	    		</center>
	   		</form>
	    	</div>
	    </div>
	  </div>
	  <!-- 나의정보종료 -->
	  <!-- 커플정보시작 -->
	  <!-- 받아오는 데이터는 coupledata -->
	  <div id="fragment-2">
		<div id="mypagecouple">
			<div id="mycoupleimg">
	    		<img id="mycoupleimg2"alt="유저이미지" src="img/mycouple.png">
	    	</div>
	    	<div id="mycoupleinfo">
	    		<h3>커플정보</h3>
	    		<br>
	    		<p>우리 : </p>
	    		<br>
	    		<p>두리 : </p>
	    		<br>
	    		<p>만난날짜 : </p>
	    		<input type="submit" value="수정하기"><button>커플정보삭제하기</button>
	    	</div>
		</div>
	  </div>
	  <!-- 커플정보종료 -->
	  <!-- VIP정보시작 -->
	  <div id="fragment-3">
	  	<div>
	  		<div>
	  			<center>
		  			<p>등급안내</p>
		  			<table>
		  				<tr>
		  					<td></td>
		  					<td>일반등급</td>
		  					<td>VIP 등급</td>
		  				</tr>
		  				<tr>
		  					<td>등급 이미지</td>
		  					<td>일반이미지</td>
		  					<td>VIP이미지</td>
		  				</tr>
		  				<tr>
		  					<td>등급 효과</td>
		  					<td>일반 등급</td>
		  					<td>VIP 등급</td>
		  				</tr>
		  			</table>
		  			<br>
		  			<div>
		  				현재 회원님의 등급은 ( ) 등급입니다!
		  			</div>
		  			<div>
		  				VIP등급으로 전환 (결제하기) <button>dd</button>
		  			</div>
	  			</center>
	  		</div>
	  	</div>
	  </div>
	  <!-- VIP정보종료 -->
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