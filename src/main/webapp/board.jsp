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
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets2/css/main.css" />
		<noscript><link rel="stylesheet" href="assets2/css/noscript.css" /></noscript>
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
								<h1>블로그 게시물 확인하기<br />
								</h1>
								<p> dolore.</p>
								</center>
								<!-- 로그인시는 이동 비로그인상태라면 모달 -->
								<div id="boardh">
									<div class="boardheadl">
									<span>
										<a href="boardwrite.jsp">
										게시글 작성하기
										</a>
									</span>
									</div>
									<div class="boardheadr">
									<span>
										<a href="loginaction.do">
										로그인
										</a>
									</span>
									</div>
								</div>
							</header>
							
							<section class="tiles">
								
								<!-- 반복 필요 boarddatas -->
								<c:forEach var="v" items="${boarddatas}">
								<article class="style${v.wdbrandom}">
									<span class="image">
										<img src="assets/images/pic01.jpg" alt="" />
									</span>
									<a href="selectOneWdboard.do?wdbpk=${v.wdbpk}">
										<h2>제목 : ${v.wdbtitle}</h2>
										<div class="content">
											<p>작성자 : ${v.wdbwriter}</p>
										</div>
									</a>
								</article>
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

	</body>
</html>