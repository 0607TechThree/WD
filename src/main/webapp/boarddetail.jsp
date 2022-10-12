<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="wd" tagdir="/WEB-INF/tags"%>
<!DOCTYPE HTML>
<!--
	Astral by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Astral by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script
	src="https://cdn.ckeditor.com/ckeditor5/35.1.0/classic/ckeditor.js"></script>
</head>
<body class="is-preload">

	<!-- Wrapper-->
	<div id="wrapper">
		<center>
			<a href="main.jsp"><img id="logo" alt="로고"
				src="img/wdmainlogo.png"></a>
		</center>
		<br>
		<!-- Nav -->
		<nav id="nav">
			<a href="#" class="icon solid fa-home"><span>간단히 보기</span></a> <a
				href="#work" class="icon solid fa-folder"><span>자세히 보기</span></a>
		</nav>

		<!-- Main -->
		<div id="main">

			<!-- Me -->
			<article id="home" class="panel intro">
				<header>
					<h1>Jane Doe</h1>
					<p>Senior Astral Projectionist</p>
				</header>
				<a href="#work" class="jumplink pic"> <span
					class="arrow icon solid fa-chevron-right"><span>See
							my work</span></span> <img src="assets/images/me.jpg" alt="" />
				</a>
			</article>

			<!-- Work -->
			<article id="work" class="panel">
				<header>
					<h2>Work</h2>
				</header>
				<section>
					<div id="readEditor">
						${data.wdbcontent}
					</div>
				</section>
			</article>
		</div>
	</div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
<script>
ClassicEditor
.create( document.querySelector( '#readEditor' ))

.then( editor => {
	window.editor = editor;
	editor.disableReadOnlyMode( '#readEditor' );
	const toolbarElement = editor.ui.view.toolbar.element;
	//toolbarElement.style.display = 'none';
} )
.then(editor => {
	
})
.catch( error => {
	console.error( error );
} );
</script>
</body>
</html>