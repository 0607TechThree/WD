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

.rttd{
	width: 200px;
	height: 70px;
	text-align: center;
	border-bottom:1px solid black;
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
		<h1 style="color:rgb(240,99,99);">마이페이지</h1>
		</center>
	</div>
	<div id="tabs">
	  <ul id="tabsli">
	    <li id="1"><a class="ina" href="#fragment-1"><center><img class="tabimg" alt="내정보" src="img/mypage/info1.png"><p style="color:rgb(240,99,99);">내 정보</p></center></a></li>
	    <li id="2"><a class="ina" href="#fragment-2"><center><img class="tabimg" alt="커플정보" src="img/mypage/couple1.png"><p style="color:rgb(240,99,99);">커플 정보</p></center></a></li>
	    <li id="3"><a class="ina" href="#fragment-3"><center><img class="tabimg" alt="vip정보" src="img/mypage/vip1.png"><p style="color:rgb(240,99,99);">등급 정보</p></center></a></li>
	  </ul>
	  <!-- 나의정보시작 -->
	  <div id="fragment-1">
	    <div id="mypagemy">
	    	<div id="myuserimg">
	    		<img id="myuserimg2"alt="유저이미지" src="img/mypage/info3.png">
	    	</div>
	    	<div id="myuserinfo">
    		<form action="updateWdmember.do" method="post">
	    		<h3 style="color:rgb(240,99,99);">회원정보</h3>
	    		<input type="hidden" name="wdmpk" value="${udata.wdmpk}">
	    		<p>아이디 : ${udata.wdmid}</p>
	    		<br>
	    		<p>
	    		닉네임 : <input type="text" name="wdmnick" value="${udata.wdmnick}">
	    		</p>
	    		<br>
	    		<p>이메일 : ${udata.wdmemail}</p>
	    		<br>
	    		<p>엠비티아이 : ${udata.wdmmbti}
	    		<select name="wdmmbti">
					<option>ESTJ</option>
					<option>ESTP</option>
					<option>ESFJ</option>
					<option>ESFP</option>
					<option>ENTJ</option>
					<option>ENTP</option>
					<option>ENFJ</option>
					<option>ENFP</option>
					<option>ISTJ</option>
					<option>ISTP</option>
					<option>ISFJ</option>
					<option>ISFP</option>
					<option>INTJ</option>
					<option>INTP</option>
					<option>INFJ</option>
					<option>INFP</option>
					<option>모른다</option>
				</select>
	    		</p>
	    		<br>
	    		<p>VIP 신청여부 : ${udata.wdmvip}</p>
	    		<center>
			    	<input type="submit" value="수정하기"><button onclick="memberdelete()">계정탈퇴</button>
	    		</center>
	   		</form>
	    	</div>
	    </div>
	  </div>
	  <!-- 나의정보종료 -->
	  <!-- 커플정보시작 -->
	  <c:if test="${coupledata != null}">
	  <!-- 받아오는 데이터는 coupleinfo -->
	  <div id="fragment-2">
		<div id="mypagecouple">
			<div id="mycoupleimg">
	    		<img id="mycoupleimg2"alt="유저이미지" src="img/mypage/couple2.png">
	    	</div>
	    	<div id="mycoupleinfo">
	    		<h3 style="color:rgb(240,99,99);">커플정보</h3>
	    		<br>
	    		<p>우리 : ${coupleinfo.wdcwoori}</p>
	    		<br>
	    		<p>두리 : ${coupleinfo.wdcdoori}</p>
	    		<br>
	    		<p>만난날짜 : ${coupleinfo.wdcdate}</p>
	    		<br>
	    		<p>* 커플정보 삭제 시 자동 로그아웃 됩니다</p>
	    		<button onclick="coupledelete()">커플정보삭제하기</button>
	    	</div>
		</div>
	  </div>
	  </c:if>
	  <c:if test="${coupledata == null}">
	  <div id="fragment-2">
		<div id="mypagecouple">
			<div id="mycoupleimg">
	    		<img id="mycoupleimg2"alt="유저이미지" src="img/mypage/couple2.png">
	    	</div>
	    	<div id="mycoupleinfo">
	    		<h3 style="color:rgb(240,99,99);">커플정보가 존재하지 않습니다</h3>
	    		<br>
	    		<p></p>
	    		<br>
	    		<p>커플 신청 버튼을 통해 상대방에게 신청할 수 있습니다!</p>
	    		<br>
	    		<p></p>
	    		<button onclick="javascript:couplemail()">커플신청하기</button>
	    	</div>
		</div>
	  </div>
	  </c:if>
	  <!-- 커플정보종료 -->
	  <!-- VIP정보시작 -->
	  <div id="fragment-3">
	  	<div>
	  		<div>
	  			<center>
		  			<h3 style="color:rgb(240,99,99);">- 등급안내 -</h3>
		  			<br>
		  			<table id="ranktable">
		  				<tr>
		  					<td class="rttd"></td>
		  					<td class="rttd">일반등급</td>
		  					<td class="rttd" style="color:rgb(240,99,99);">VIP등급</td>
		  				</tr>
		  				<tr>
		  					<td class="rttd">등급 이미지</td>
		  					<td class="rttd"><img alt="일반등급" src="img/mypage/card.png" style="width:50px; height:auto;"></td>
		  					<td class="rttd"><img alt="vip등급" src="img/mypage/vipcard.png" style="width:50px; height:auto;"></td>
		  				</tr>
		  				<tr>
		  					<td class="rttd">등급 혜택</td>
		  					<td class="rttd">1. 기본 서비스 제공</td>
		  					<td class="rttd" style="color:rgb(240,99,99);">1. 기본 서비스 제공<br>
		  									2. 광고전용 팝업창 제외
		  					</td>
		  				</tr>
		  			</table>
		  			<br>
		  			<div style="color:rgb(240,99,99);">
		  				현재 회원님의 등급은
		  				<c:if test="${udata.wdmvip == 0}">
			  				<img alt="일반등급" src="img/mypage/card.png" style="width:50px; height:auto;">
		  				</c:if>
		  				<c:if test="${udata.wdmvip == 1}">
		  					<img alt="VIP등급" src="img/mypage/vipcard.png" style="width:50px; height:auto;">
		  				</c:if>
		  				등급입니다!
		  			</div>
		  			<div>
		  				<c:if test="${udata.wdmvip == 0}">
			  				VIP등급으로 전환 (결제하기) <button onclick="javascript:kakaopayopen()">결제하기</button>
		  				</c:if>
		  				
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

function kakaopayopen(){
	window.open("kakaoPay.jsp", "","width=500, height=600");
}

function couplemail(){
	window.open("couplecheck.jsp","","width=500, height=600");
}

function coupledelete(){
	if(confirm("정말 커플정보를 삭제하시겠습니까?"))
	{
	location.href="deleteWdcouple.do?wdcpk=${coupleinfo.wdcpk}";
	}
	else
	{
	alert('취소를 누르셨습니다');
	}
}

function memberdelete(){
	if(confirm("정말 탈퇴하시겠습니까!?"))
	{
		location.href="deleteWdmember.do?wdmid=${udata.wdmid}&wdmpw=${udata.wdmpw}";
	}
	else
	{
	alert('취소를 누르셨습니다');
	}
}
</script>

</body>
</html>