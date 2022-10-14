<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- favicon start -->
<link rel="icon" type="image/x-icon" href="img/wdfavicon.png" />
<!-- favicon end -->
<title>WooriDoori - 회원가입</title>
<!--  favicon -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
.ui-datepicker-trigger{cursor: pointer;}
/*datepicer input 롤오버 시 손가락 모양 표시*/
.hasDatepicker{cursor: pointer;}

</style>
</head>
<body>
<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function() {
			$("#userid").focus();
		});
		function check() {
			var userid = $("#userid").val();
			var RegExp = /^[a-zA-Z0-9]{6,12}$/; // 아이디 유효성 검사
			if (userid == "") {
				alert("아이디를 입력해주세요");
				$("#userid").focus();
				return false;
	
			};
			// 아이디가 6자리 영문대소문자와 숫자로만 입력
	
			if (!RegExp.test(userid)) {
				alert("아이디는 6~12자리 영문대소문자와 숫자로만 입력해주세요");
				$("#userid").focus();
				return false;
			};
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/checkId.do?wdmid=' + userid,
				data : {
					userid : userid
				},
				success : function(result) {
					console.log("로그1 [" + result + "]");
					if (result == 1) {
						$("#result").text("사용가능한 아이디입니다");
						$("#result").css("color", "blue");
						$("#idDuplication").val('idCheck');
					} else {
						$("#result").text("이미 사용중인 아이디입니다");
						$("#result").css("color", "red");
					}
				},
				error : function(request, status, error) {
					console.log("code: " + request.status);
					console.log("message: " + request.responseText);
					console.log("error: " + error);
				}
			});
		}
		function inputIdChk(){
			document.getElementById("idDuplication").value="idUnCheck";
			$("#result").text("중복검사를 실행해주세요!");
			$("#result").css("color", "black");
		}
		</script>
		<script type="text/javascript">
		function Validation() {
			const form = document.forms[0];
			let validation = true;
			
			var RegExp = /^[a-zA-Z0-9]{6,12}$/; // 아이디 유효성 검사
	
			// var phoneExp = /^\d{3}-\d{3,4}-\d{4}$/; // 휴대폰 유효성 검사
			
			var exptext = /^[A-Za-z0-9_.-]+@[A-Za-z0-9-]+.[A-Za-z0-9-]+/; // 이메일 유효성 검사
	
			var userId = document.getElementById("userid");
	
			var userPs = document.getElementById("userps");
	
			var userPc = document.getElementById("userpc");
	
			var userM = document.getElementById("userm");
	
			var userR = document.getElementById("userRe");
			
			var idDuplication = document.getElementById("idDuplication");
	
			var userad = document.getElementById("sample6_postcode");
	
			//id와 password가 같을 경우
	
			if (userId.value == userPs.value) {
				alert("아이디와 비밀번호가 동일합니다.");
				$("#userPs").focus();
				validation=false;
	
			}
			
			// 아이디 중복검사를 하지 않았을 경우 확인메세지
			else if (idDuplication.value != "idCheck") {
				alert("아이디 중복검사를 진행 해주세요.");
				validation=false;
			}

			//==============================================================

			//password가 입력되지 않을 경우

			else if (userPs.value == "") {
				alert("비밀번호가 입력되지 않았습니다.");
				$("#userPs").focus();
				validation=false;
			}

			//password 6~12자리 영문대소문자와 숫자로만 입력

			else if (!RegExp.test(userPs.value)) {
				alert("비밀번호를 6~12자리 영문대소문자와 숫자로만 입력해주세요");
				$("#userPs").focus();
				validation=false;
			}

			//password_check가 입력되지 않을 경우

			else if (userPc.value == "") {
				alert("비밀번호 확인이 입력되지 않았습니다.");
				$("#userPc").focus();
				validation=false;
			}

			//password_check 6~12자리 영문대소문자와 숫자로만 입력

			else if (!RegExp.test(userPc.value)) {
				alert("비밀번호 확인을 6~12자리 영문대소문자와 숫자로만 입력해주세요");
				$("#userPc").focus();
				validation=false;
			}

			else if (userPs.value != userPc.value) {
				alert("비밀번호가 비밀번호 확인과 일치하지 않습니다");
				$("#userPc").focus();
				validation=false;
			}

			//===========================================================
			
			// 전화번호
			/*
			else if (userh.value == "") {
				alert("전화번호가 입력되지 않았습니다.");
				$("#userh").focus();
				validation=false;
			}
			else if (!phoneExp.test(userh.value)) {
				alert("전화번호 형식이 맞지 않습니다.");
				$("#userh").focus();
				validation=false;
			}
			*/
			
			if(exptext.test(userM.value) == false){
				 
				alert("이메일형식이 맞지 않습니다.");
				 
				validation=false;
				 
			}
			
			if(validation) {
		           alert('회원가입 성공!!')
		           form.action = 'insertWdmember.do';   //유효성 통과완료되면 서버로 데이터 전달하기.
		           form.method = 'POST';
		       		// 폼을 제출하려면 반드시 폼이 문서 안에 있어야 합니다.
		           form.submit();          // 서버로 데이터 전달하기 동작                                     
		    }           
		};
		
		
	</script>
<div id="joincontent">
	<div id="joincontentbox">
		<div id="joinlogobox">
			<a href="main.do">
				<a href="main.jsp"><img id="logo" alt="로고" src="img/wdmainlogo.png" ></a>
			</a>
		</div>
			<div id="joinsubject">
				<h3>회원가입</h3>
			</div>
			<form action="" name="userInfo" id="joinform">
						<input type="hidden" name="kemail" value="${param.kemail}">
						<input type="hidden" name="nemail" value="${param.nemail}">
			<table>
				<tr>
					<td class="jointabletitle"><div>아이디</div></td>
					<td><input name="wdmid" id="userid"  class="jointablevalueid"
						required placeholder="6~12자리 영문 혹은 영문과 숫자를 조합" onkeydown="inputIdChk()">
						<a class="ck_btn" href="javascript:check();">
							<button type="button" id="joincheckidbutton">중복확인</button>
						</a>
						<input type="hidden" id="idDuplication" value="idUnCheck"></td>
				</tr>
				<tr>
					<td></td>
					<td><div id="result"></div></td>
				</tr>
				<tr>
					<td class="jointabletitle"><div>비밀번호</div></td>
					<td><input type="password" name="wdmpw"  class="jointablevalue" id="userps"
						required placeholder="아이디와 다른 6~12자리 영문과 숫자를 조합"></td>
				</tr>
				<tr class="tablebordertop">
					<td class="jointabletitle"><div>비밀번호확인</div></td>
					<td><input type="password"  class="jointablevalue" id="userpc"
						required placeholder="비밀번호를 한번 더 입력해주세요"></td>
				</tr>
				<tr class="tablebordertop">
					<td class="jointabletitle"><div>닉네임</div></td>
					<td><input required  class="jointablevalue" name="wdmnick"
						placeholder="닉네임을 입력해주세요"></td>
				</tr>
				<!-- 사용안함
				<tr class="tablebordertop">
					<td class="jointabletitle"><div>휴대폰</div></td>
					<c:if test="${param.userh != null}">
					<td><input required  class="jointablevalue" name="tuph" id="userh"
						value="${param.userh}" readonly></td>
					</c:if>
					<c:if test="${param.userh == null}">
					<td><input required  class="jointablevalue" name="tuph" id="userh"
						placeholder="전화번호를 입력해주세요 ex)01012345678"></td>
					</c:if>
				</tr>
				 -->
				<tr class="tablebordertop">
					<td class="jointabletitle"><div>이메일</div></td>
					<td><input required  class="jointablevalue" name="wdmemail"
						placeholder="이메일을 입력해주세요"></td>
				</tr>
				<tr class="tablebordertop">
					<td class="jointabletitle">성별</td>
					<td>남&nbsp;<input type="radio"
						name="wdmgender" checked="checked" value="남">여&nbsp;<input type="radio" name="wdmgender" value="여">
					</td>
				</tr>
				<tr class="tablebordertop">
					<td class="jointabletitle">MBTI</td>
					<td>
						<select name="wdmmbti">
							<option>ESTJ</option>
							<option>ESTP</option>
							<option>ESFJ</option>
							<option>ESFP</option>
							<option>ENTJ</option>
							<option>ENTP</option>
							<option>ENFJ</option>
							<option>ENFP</option>
							<option>ISTJ</option>
							<option>ISTP</option>
							<option>ISFJ</option>
							<option>ISFP</option>
							<option>INTJ</option>
							<option>INTP</option>
							<option>INFJ</option>
							<option>INFP</option>
							<option>모른다</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<br>
						<center>					
							<input type="button" value="회원가입하기" id="joinbutton" onclick="Validation()">
						</center>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<!-- 
<script type="text/javascript">
$( "#datepicker" ).datepicker();

$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd' //Input Display Format 변경
    ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
    ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
    ,changeYear: true //콤보박스에서 년 선택 가능
    ,changeMonth: true //콤보박스에서 월 선택 가능                
    ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
    ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
    ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
    ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
    ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
    ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
    ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
    ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
    ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
    ,minDate: "-100Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
    ,maxDate: "today" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
    ,yearRange: "-100:+0"
});
$('#datepicker').datepicker('setDate', '-30Y');
// 초기 세팅 날짜
</script>
 -->
</body>
</html>
