<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 | Wooridoori</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<div class="checkbox_group">

  <input type="checkbox" id="check_all" >
  <label for="check_all">전체 동의</label>
  
  <ul>
	  <li>
	  <input type="checkbox" id="check_1" class="normal" >
	  <label for="check_1">필수약관1</label><br>
	  	<textarea>
	  		내용
	 	</textarea>
	  </li>
	  
	  <li>
	  <input type="checkbox" id="check_2" class="normal" >
	  <label for="check_2">필수약관2</label><br>
	    <textarea>
	  		내용
	  	</textarea>
	  </li>
	  
	  <li>
	  <input type="checkbox" id="check_3" class="normal" >
	  <label for="check_3">선택약관1</label><br>
	    <textarea>
	  		내용
	  	</textarea>
	  </li>
  </ul>
  <a href="/join.do"><button>회원가입</button></a>
</div>

<script>
//체크박스 전체 선택
$(".checkbox_group").on("click", "#check_all", function () {
    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
});

// 체크박스 개별 선택
$(".checkbox_group").on("click", ".normal", function() {
    var is_checked = true;

    $(".checkbox_group .normal").each(function(){
        is_checked = is_checked && $(this).is(":checked");
    });

    $("#check_all").prop("checked", is_checked);
});
</script>

</body>
</html>
