<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="wd" tagdir="/WEB-INF/tags"%>
<!DOCTYPE HTML>
<!--
	Lens by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
	<!-- favicon start -->
<link rel="icon" type="image/x-icon" href="img/wdfavicon.png" />
<!-- favicon end -->
		<title>WooriDoori - 원데이클래스 상세보기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets3/css/main.css" />
		<noscript><link rel="stylesheet" href="assets3/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload-0 is-preload-1 is-preload-2">

		<!-- Main -->
			<div id="main">

				<!-- Header -->
					<header id="header">
						<h2>${onedaydata.wdoname}</h2>
						<p>${onedaydata.wdoaddress}</p>
						<p>${onedaydata.wdosubject}</p>
						
					</header>

				<!-- Thumbnail -->
					
					<section id="thumbnails">
						
						<c:forEach var="v" items="${imgdatas}">
						<article>
							<a class="thumbnail" href="img/crawling/${v.wdipickname}"><img src="img/crawling/${v.wdipickname}" alt="" /></a>
							<h2></h2>
							<p></p>
						</article>
						</c:forEach>
					</section>
				

				<!-- Footer -->
					<footer id="footer">
						<ul class="copyright">
							<li>&copy; Untitled.</li><li>Design: <a href="main.do">WooriDoori</a>.</li>
						</ul>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="assets3/js/jquery.min.js"></script>
			<script src="assets3/js/browser.min.js"></script>
			<script src="assets3/js/breakpoints.min.js"></script>
			<script src="assets3/js/main.js"></script>

	</body>
</html>