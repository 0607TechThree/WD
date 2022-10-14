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
<style type="text/css">
#onedaydetailhimg{
	display: flex;
	justify-content: space-around;
}
.himg{
	width: 30px;
	height: 30px;
}
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
	
	width: 200px;
	height: 200px;
	
	text-align: center;
	
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	
	transform: translateX(-50%) translateY(-50%);
}
</style>
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
						<div id="onedaydetailhimg">
							<a href="main.do">
								<img class="himg" alt="메인으로" src="img/home.png" title="메인으로">
							</a>
							<a href="oneday.do">
								<img class="himg" alt="목록으로" src="img/list.png" title="목록으로">
							</a>
							<a href="#" class="buttonatag">
								<img class="himg" alt="문의하기" src="img/ask.png" title="문의하기">
							</a>
						</div>
					</header>
					<div class="modal" style="z-index:1000;">
						<div class="modal_body">
							<div class="bt-idpw">
								<img alt="문의하기" src="img/kakaoqr.png" style="width:195px; height:195px; border-radius: 10px;">
							</div>
						</div>
					</div>
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
    
  </script>
	</body>
</html>