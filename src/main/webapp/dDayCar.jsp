<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D-Day계산기</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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

<table>
<tr>
    <th>
      D+Day 계산기
    </th>
  </tr>
  <tr>
    <th>
      사귄날짜
    </th>
    <td>
      <input type="text" name="inYYYY" id="inYYYY" maxlength="4" size="4" value="2022" class="actDDay" />년 
      <input type="text" name="inMM" id="inMM" maxlength="2" size="2" value="09" class="actDDay" />월 
      <input type="text" name="inDD" id="inDD" maxlength="2" size="2" value="29" class="actDDay" />일
    </td>
  </tr>
  <tr>
    <th>
      +DAY
    </th>
    <td>
      <input type="text" name="calcDay" id="calcDay" />일
      <input type="text" name="operator" id="operator" value="+" hidden/>
    </td>
  </tr>
  <tr>
    <th>
      결과는
    </th>
    <td>
      <input type="text" name="outYYYY" id="outYYYY" maxlength="4" size="4" />년 
      <input type="text" name="outMM" id="outMM" maxlength="2" size="2" />월
      <input type="text" name="outDD" id="outDD" maxlength="2" size="2" />일
    </td>
  </tr>
</table>

</body>
</html>