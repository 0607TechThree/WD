<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D+Day계산기 | WooriDoori</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="css/dDayCar.css" />
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script>
$(document).ready(function(){
    var fromDate;
    var nowDate = new Date();
    var resultDate;
    var calcDay;
    
    $("#outYYYY").val(nowDate.getFullYear());
    $("#outMM").val(nowDate.getMonth()+1);
    $("#outDD").val(nowDate.getDate());
    
    fromDate = new Date($("#inYYYY").val(), $("#inMM").val()-1, $("#inDD").val());
    resultDate = new Date($("#outYYYY").val(), $("#outMM").val()-1, $("#outDD").val()).getTime();
    calcDay = (resultDate - fromDate)/(1000*60*60*24);
    if(calcDay>0){
      $("#operator").val("+");
      $("#calcDay").val(calcDay);
    }else{
      $("#operator").val("-");
      $("#calcDay").val(calcDay);
    }
        
    $(".actDDay").bind("keyup", function(){
      if(this.value.length==$(this).attr("maxlength")){
        fromDate = new Date($("#inYYYY").val(), $("#inMM").val()-1, $("#inDD").val());
        calcDay = (nowDate.getTime() - fromDate)/(1000*60*60*24);
        $("#calcDay").val(calcDay);
      }else{
        $("#calcDay").val("");
      }
    });
    
    $("#calcDay").bind("keyup", function(){
      if($("#calcDay").val().length>0){
        if($("#operator").val()=="+"){
          fromDate = new Date($("#inYYYY").val(), $("#inMM").val()-1, $("#inDD").val());
          resultDate = new Date(fromDate.getTime()+$("#calcDay").val()*(1000*60*60*24));
        }else{
          fromDate = new Date($("#inYYYY").val(), $("#inMM").val()-1, $("#inDD").val());
          resultDate = new Date(fromDate.getTime()-$("#calcDay").val()*(1000*60*60*24));
        }
        $("#outYYYY").val(resultDate.getFullYear());
        $("#outMM").val(resultDate.getMonth()+1);
        $("#outDD").val(resultDate.getDate());
      }else{
        $("#outYYYY").val("");
        $("#outMM").val("");
        $("#outDD").val("");
      }
    });
    
    $("#outYYYY").bind("keyup", function(){
      fromDate = new Date($("#inYYYY").val(), $("#inMM").val()-1, $("#inDD").val());
      resultDate = new Date($("#outYYYY").val(), $("#outMM").val()-1, $("#outDD").val()).getTime();
      calcDay = (resultDate - fromDate)/(1000*60*60*24);
      if(calcDay>0){
        $("#operator").val("+");
        $("#calcDay").val(calcDay);
      }else{
        $("#operator").val("-");
        $("#calcDay").val(calcDay);
      }
    });
    $("#outMM").bind("keyup", function(){
      fromDate = new Date($("#inYYYY").val(), $("#inMM").val()-1, $("#inDD").val());
      resultDate = new Date($("#outYYYY").val(), $("#outMM").val()-1, $("#outDD").val()).getTime();
      calcDay = (resultDate - fromDate)/(1000*60*60*24);
      if(calcDay>0){
        $("#operator").val("+");
        $("#calcDay").val(calcDay);
      }else{
        $("#operator").val("-");
        $("#calcDay").val(calcDay);
      }
    });
    $("#outDD").bind("keyup", function(){
      fromDate = new Date($("#inYYYY").val(), $("#inMM").val()-1, $("#inDD").val());
      resultDate = new Date($("#outYYYY").val(), $("#outMM").val()-1, $("#outDD").val()).getTime();
      calcDay = (resultDate - fromDate)/(1000*60*60*24);
      if(calcDay>0){
        $("#operator").val("+");
        $("#calcDay").val(calcDay);
      }else{
        $("#operator").val("-");
        $("#calcDay").val(calcDay);
      }
    });
  });
  
  function ErrorHandler(msg, location, lineNo){
    window.status = "[" + lineNo + "]" + msg;
    return true;
  }
</script>
</head>
<body>

<div id="pageAll">
	<div id="dDaycarPage">
		<!-- 로고, 상단 -->
		<div id="logo">
			<center>
				<h1 id="hd_h1">D+Day 계산기</h1>
				<hr>
			</center>
		</div>
	</div>
		<!-- 테이블 -->
		<div id="table">
		<center>
			<table>
			<tr>
			  </tr>
			  <tr>
			    <th>
			      사귄날짜
			    </th>
			    <td id="td">
			      <input type="text" name="inYYYY" id="inYYYY" maxlength="4" size="4" value="2022" class="actDDay" id="tdinput" /> 년 
			      <input type="text" name="inMM" id="inMM" maxlength="2" size="2" value="06" class="actDDay" id="tdinput" /> 월 
			      <input type="text" name="inDD" id="inDD" maxlength="2" size="2" value="07" class="actDDay" id="tdinput" /> 일
			    </td>
			  </tr>
			  <tr>
			    <th>
			      D+
			    </th>
			    <td>
			      <input type="text" name="calcDay" id="calcDay" id="tdinput" /> 일
			      <input type="text" name="operator" id="operator" value="+" hidden/>
			    </td>
			  </tr>
			  <tr>
			    <th>
			      일은
			    </th>
			    <td>
			      <input type="text" name="outYYYY" id="outYYYY" maxlength="4" size="4" id="tdinput" /> 년 
			      <input type="text" name="outMM" id="outMM" maxlength="2" size="2" id="tdinput" /> 월
			      <input type="text" name="outDD" id="outDD" maxlength="2" size="2" id="tdinput" /> 일
			    </td>
			  </tr>
			</table>
		</div>
		</center>
		<div id="copyright">
		ⓒ WooriDoori
		</div>
</div>

</body>
</html>