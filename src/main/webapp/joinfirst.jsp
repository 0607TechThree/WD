<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error/error.jsp" %>	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="css/joinfirst.css" type="text/css">
<!-- favicon start -->
<link rel="icon" type="image/x-icon" href="img/wdfavicon.png" />
<!-- favicon end -->
<title>WooriDoori - 회원가입약관</title>

</head>
<body>
<div id="joinform">
	<div id="joinwrapper">
		<center>
			<a href="main.jsp"><img id="logo" alt="로고" src="img/wdmainlogo.png" ></a>
		</center>
		<!-- 상단 시작 { -->
		<div id="hd">
    		<h2 id="hd_h1">회원가입약관</h2>
		</div>
		<!-- } 상단 끝 -->
		<hr>

		<!-- 콘텐츠 시작 { -->
		<div id="wrapper">
    		<div id="container_wr">
   
    			<div id="container">
        			
						<!-- 회원가입약관 동의 시작 { -->
						<div class="register">
    						<form  name="fregister" id="fregister" action="join.jsp" onsubmit="return fregister_submit(this);" method="POST" autocomplete="off">
								<p class="join-text"><i class="fa fa-check-circle" aria-hidden="true"></i> 회원가입약관 및 개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.</p>
        					<section id="fregister_term">
        						<h4 >개인정보수집·이용동의 </h4>
        						<textarea readonly class="joinarea">
        							Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
        							tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        							quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo 
        							consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
        							cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
        							non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
 								</textarea>
						        <fieldset class="fregister_agree">
						            <input type="checkbox" name="agree" value="1" id="agree11" class="selec_chk">
						            <label for="agree11"><span></span><b class="sound_only check-text">회원가입약관의 내용에 동의합니다.</b></label>
						        </fieldset>
						    </section>

    						<section id="fregister_private">
						        <h4>개인정보처리방침안내</h4>
						        <textarea readonly class="joinarea">
						    	     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
        							tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
        							quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo 
        							consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
        							cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
        							non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
						 		</textarea>
						
						        <fieldset class="fregister_agree">
						            <input type="checkbox" name="agree2" value="1" id="agree21" class="selec_chk">
						            <label for="agree21"><span></span><b class="sound_only check-text">개인정보처리방침안내의 내용에 동의합니다.</b></label>
								</fieldset>
						    </section>
	
							<div id="fregister_chkall " class="chk_all fregister_agree">
						        <input type="checkbox" name="chk_all" id="chk_all" class="selec_chk ">
						        <label for="chk_all"  class="check-text "><span></span >회원가입 약관에 모두 동의합니다</label>
						        <a href="" class="btn_close" style="text-align: right">선택해제</a>
						    </div>
							    
						    <div class="btn_confirm">
						        <button type="submit" class="btn_submit bt-id">다음으로</button>
						    </div>
							<input type="hidden" name="kemail" value="${param.kemail}">
							<input type="hidden" name="nemail" value="${param.nemail}">
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="http://moden939.gabia.io/new/js/jquery-1.12.4.min.js"></script>
<script src="http://moden939.gabia.io/new/js/jquery-migrate-1.4.1.min.js"></script>
<script src="http://moden939.gabia.io/new/js/jquery.menu.js?ver=181222"></script>
<script src="http://moden939.gabia.io/new/js/common.js?ver=181222"></script>
<script src="http://moden939.gabia.io/new/js/wrest.js?ver=181222"></script>
<script src="http://moden939.gabia.io/new/js/placeholders.min.js"></script>
<script type="text/javascript">
function fregister_submit(f)
{
    if (!f.agree.checked) {
        alert("회원가입약관의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
        f.agree.focus();
        return false;
    }

    if (!f.agree2.checked) {
        alert("개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.");
        f.agree2.focus();
        return false;
    }
    return true;
}

jQuery(function($){
    // 모두선택
    $("input[name=chk_all]").click(function() {
        if ($(this).prop('checked')) {
            $("input[name^=agree]").prop('checked', true);
        } else {
            $("input[name^=agree]").prop("checked", false);
        }
    });
});

</script>
</body>
</html>