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
	<head>
	<!-- favicon start -->
<link rel="icon" type="image/x-icon" href="img/wdfavicon.png" />
<!-- favicon end -->
		<title>WooriDoori - 원데이클래스</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets2/css/main.css" />
		<noscript><link rel="stylesheet" href="assets2/css/noscript.css" /></noscript>
		<style type="text/css">
		.tiles article > .image {
				-moz-transition: -moz-transform 0.5s ease;
				-webkit-transition: -webkit-transform 0.5s ease;
				-ms-transition: -ms-transform 0.5s ease;
				transition: transform 0.5s ease;
				position: relative;
				display: block;
				width: 100%;
				height: 100%;
				border-radius: 4px;
				overflow: hidden;
			}

				.tiles article > .image img {
					display: block;
					object-fit : cover;
					width: 100%;
					height: 100%;
					max-height: 420px;
				}
		</style>
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">

				
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<br/>
							<header>
							<center>
								<h1>원데이클래스<br />
								</h1>
								<p>커플과 함께 즐거운 활동을 신청해봐요!</p>
							</center>
							</header>
							<section class="tiles">
							<!-- onedaydatas -->
								<c:forEach var="v" items="${onedaydatas}">
								<article>
									<span class="image">
										<img src="img/crawling/${v.wdomainimg}" alt="원데이메인이미지" />
									</span>
									<a href="selectOneWdoneday.do?wdopk=${v.wdopk}">
										<h2>${v.wdoname}</h2>
										<div class="content">
											<p>${v.wdoaddress}</p>
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