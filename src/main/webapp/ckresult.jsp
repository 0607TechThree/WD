<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error/error.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/ckeditor5/35.1.0/classic/ckeditor.js"></script>
</head>
<body>
	<div id="readEditor">
	${data.wdbcontent}
	<img alt="" src="img/ck/${data.fileName}">
	</div>

<script>
ClassicEditor
.create( document.querySelector( '#readEditor' ))

.then( editor => {
	window.editor = editor;
	editor.disableReadOnlyMode( '#readEditor' );
	const toolbarElement = editor.ui.view.toolbar.element;
	//toolbarElement.style.display = 'none';
} )
.catch( error => {
	console.error( error );
} );
</script>
</body>
</html>