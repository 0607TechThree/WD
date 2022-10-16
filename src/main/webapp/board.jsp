<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="wd" tagdir="/WEB-INF/tags"%>
<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<!-- favicon start -->
<link rel="icon" type="image/x-icon" href="img/wdfavicon.png" />
<!-- favicon end -->
<head>
<title>WooriDoori - 블로그 게시판</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets2/css/main.css" />

<noscript>
	<link rel="stylesheet" href="assets2/css/noscript.css" />
</noscript>
<style type="text/css">
.modal {
	position: absolute;
	top: 0;
	left: 0;
	
	width: 100%;
	height: 100%;
	
	display: none;
	
	background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
	display: block;
}

.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	
	width: 350px;
	height: 350px;
	
	text-align: center;
	
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	
	transform: translateX(-50%) translateY(-50%);
	display: flex;
	justify-content: center;
	align-items: center;
}
#modal_content{
	width: 300px;
	height: 300px;
}
</style>
</head>

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">


		<!-- Main -->
		<div id="main">
			<div class="inner">
				<header>
					<center>
						<br>
						<h1>
							블로그 게시물 확인하기<br />
						</h1>
						<p><span> <a href="main.do"> <img alt="메인으로" src="img/home.png" style="width:40px; height:40px;"></a></span></p>
					</center>
					<!-- 로그인시는 이동 비로그인상태라면 모달 -->
					<div id="boardh">
						<div class="boardheadl">
						<c:if test="${udata == null}">
							<span> <a href="#" class="buttonatag">게시글 작성하기</a></span>
						</c:if>
						<div class="modal" style="z-index:1000;">
							<div class="modal_body">
								<div id="modal_content">
								<br>
								
								<p style="line-height: 15px; font-size: 15px;">로그인을 하시면</p>
								<p style="line-height: 15px; font-size: 15px;">글 작성이 가능합니다</p>
									<button onclick="javascript:href1()">로그인</button>
									<button onclick="javascript:href2()">회원가입</button>									
								</a>
								</div>
							</div>
						</div>
						<c:if test="${udata != null}">
							<span> <a href="boardwrite.jsp"> 게시글 작성하기 </a></span>
						</c:if>
						
						</div>
						<!-- 검색 -->
						<form action="board.do" method="post">
							<table>
								<tr>
									<th class="toppadding"><select name="searchCondition">
											<c:forEach var="v" items="${scMap}">
												<option value="${v.value}">${v.key}</option>
											</c:forEach>
									</select></th>
									<th class="toppadding"><input type="text" name="searchContent"
										placeholder="검색어를 입력하세요"></th>
									<th class="toppadding"><input type="submit" class="button" value="검색"></th>
								</tr>
							</table>
						</form>
						<div class="boardheadr">
							<c:if test="${udata == null}">
							<span> <a href="loginaction.do"> 로그인 </a>
							</span>
							</c:if>
							<c:if test="${udata != null}">
							<span> <a href="logout.do"> 로그아웃 </a>
							</span>
							</c:if>
						</div>
					</div>
				</header>

				<section class="tiles">
					<!-- 반복 필요 boarddatas -->
					<c:forEach var="v" items="${boarddatas}">
						<!-- 공개 -->
						<c:if test="${v.wdbopen == 0}">
							<article class="style${v.wdbrandom}">
								<span class="image"> <img
									src="assets/images/pic0${v.wdbrandom}.jpg" alt="" />
								</span> <a href="selectOneWdboard.do?wdbpk=${v.wdbpk}">
									<h2>제목 : ${v.wdbtitle}</h2>
									<div class="content">
										<p>작성자 : ${v.wdbwriter}</p>
										<p>좋아요 : ${v.wdblike}</p>
									</div>
								</a>
							</article>
						</c:if>
						<!-- 비공개 -->
						<c:if test="${v.wdbopen == 1}">
							<!-- 내가 쓴 글 -->
							<c:if test="${udata.wdmid == v.wdbwriter}">
								<article class="style${v.wdbrandom}">
									<span class="image"> <img
										src="assets/images/pic0${v.wdbrandom}.jpg" alt="" />
									</span> <a href="selectOneWdboard.do?wdbpk=${v.wdbpk}">
										<h2>제목 : ${v.wdbtitle}</h2>
										<div class="content">
											<p>작성자 : ${v.wdbwriter}</p>
											<p>좋아요 : ${v.wdblike}</p>
										</div>
									</a>
								</article>
							</c:if>
							<!-- 커플 정보에 있는 사람 -->
							<c:if test="${udata.wdmid == coupledata.wdmid}">
								<article class="style${v.wdbrandom}">
									<span class="image"> <img
										src="assets/images/pic0${v.wdbrandom}.jpg" alt="" />
									</span> <a href="selectOneWdboard.do?wdbpk=${v.wdbpk}">
										<h2>♥ 제목 : ${v.wdbtitle} ♥</h2>
										<div class="content">
											<p>작성자 : ${v.wdbwriter}</p>
											<p>좋아요 : ${v.wdblike}</p>
										</div>
									</a>
								</article>
							</c:if>
						</c:if>
					</c:forEach>
				</section>
			</div>
		</div>
	</div>

	<!-- Scripts -->
	<script src="assets2/js/jquery.min.js"></script>
	<script src="assets2/js/browser.min.js"></script>
	<script src="assets2/js/breakpoints.min.js"></script>
	<script src="assets2/js/util.js"></script>
	<script src="assets2/js/main.js"></script>
<script>
    const body = document.querySelector('body');
    const modal = document.querySelector('.modal');
    const btnOpenPopup = document.querySelector('.buttonatag');
    const btnOpenPopup2 = document.querySelector('.buttonatag2');

    btnOpenPopup.addEventListener('click', () => {
      modal.classList.toggle('show');

      if (modal.classList.contains('show')) {
        body.style.overflow = 'hidden';
      }
    });

    modal.addEventListener('click', (event) => {
      if (event.target === modal) {
        modal.classList.toggle('show');

        if (!modal.classList.contains('show')) {
          body.style.overflow = 'auto';
        }
      }
    });
    function href1(){
    	location.href ="loginaction.do"
    }
    function href2(){
    	location.href ="joinfirst.jsp"
    }
  </script>
</body>
</html>