<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title> 레이어 팝업 예제 </title>
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
	
	width: 200px;
	height: 200px;
	
	padding: 40px;
	
	text-align: center;
	
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	
	transform: translateX(-50%) translateY(-50%);
}
</style>

</head>
<body>
<button class="buttonatag">모달</button>
<button class="buttonatag2">모달2</button>

<div class="modal" style="z-index:1000;">
	<div class="modal_body">
		<div class="bt-idpw">
			<h4>
				<center>
				로그인 후 이용 가능합니다!
				</center>
			</h4>
			<a href="login.do">
				<button class="bt-id" type="submit" height="54" radius="3">
					<span class="btn-idpw">로그인</span>
				</button>
			</a>
			<a href="joinfirst.jsp">
				<button class="bt-pw" type="button" height="54" radius="3">
					<span class="btn-idpw">회원가입</span>
				</button>
			</a>
		</div>
	</div>
</div>

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
    
    btnOpenPopup2.addEventListener('click', () => {
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