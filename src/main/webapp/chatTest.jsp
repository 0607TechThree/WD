<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("https://fonts.googleapis.com/css?family=Karla");

* {
	box-sizing: border-box;
}

::selection {
	background: #fd0;
	color: #222;
}

br {
	font-size: 0;
}

body {
	font-family: "Karla", sans-serif;
	margin: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100vw;
	height: 100vh;
	font-size: 16px;
	background-color: #ddd;
}

.chat-box {
	width: 300px;
	height: 400px;
	background-color: #eee;
	border-radius: 16px 16px 0 0;
	overflow: hidden;
	border: 2px #45f solid;
}

.chat-box header {
	background-color: #45f;
	color: #fff;
	display: flex;
	padding: 0 16px;
}

.chat-box header>* {
	line-height: 40px;
}

.chat-box header h1 {
	margin: 0;
	font-size: 1.1em;
}

.chat-box header .close-button {
	cursor: pointer;
	user-select: none;
}

.chat-box section {
	overflow-y: scroll;
	overflow-x: hidden;
	height: calc(100% - 40px - 40px);
	padding: 12px;
}

.chat-box section div {
	margin: 12px 0;
}

.chat-box section span {
	display: inline-block;
	padding: 6px 8px;
	margin: 1px 0;
	max-width: 90%;
	word-wrap: break-word;
}

.chat-box section div.me {
	text-align: left;
}

.chat-box section div.me span {
	background-color: #68c;
	border-radius: 4px 16px 16px 4px;
}

.chat-box section div.me span:first-of-type {
	border-top-left-radius: 16px;
}

.chat-box section div.me span:last-of-type {
	border-bottom-left-radius: 16px;
}

.chat-box section div.not-me {
	text-align: right;
}

.chat-box section div.not-me span {
	background-color: #bcf;
	border-radius: 16px 4px 4px 16px;
}

.chat-box section div.not-me span:first-of-type {
	border-top-right-radius: 16px;
}

.chat-box section div.not-me span:last-of-type {
	border-bottom-right-radius: 16px;
}

.chat-box footer input {
	font-family: "Karla", sans-serif;
	outline: 0;
	padding: 0 12px;
	height: 40px;
	width: 70%;
	font-size: 1em;
}

footer {
	display: flex;
}
</style>
</head>
<body>
	<div class="chat-box">
		<header>
			<h1>wooridoori</h1>
			<span style="flex: 1"></span>
		</header>
		<section id="messages">
			<div class="me">
				<span>123</span>
			</div>
			<div class="not-me">
				<span>12345</span>
			</div>
		</section>

		<footer>
			<input id="messageinput" type="text" placeholder="Type a message...">
			<input type="text" id="sender" value="${udata.wdmid}"
				style="display: none;">
			<button type="button" onclick="javascript:send(${udata.wdmid});">메세지
				전송</button>
		</footer>
	</div>
	<script src="assets/js/jquery-2.1.0.min.js"></script>
	<script type="text/javascript">
	 var ws;
     var messages = document.getElementById("messages");
$( document ).ready(function() {
         if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
             writeResponse("WebSocket is already opened.");
             return;
         }
         //웹소켓 객체 만드는 코드
         ws = new WebSocket("ws://localhost:8088/app/echo.do");
         
         ws.onOpen = function(event){
             if(event.data === undefined){
           		return;
             }
             writeResponse(event.data);
         };
         
         ws.onmessage = function(event){
             //console.log('writeResponse');
	    	 writeResponse(event.data);
             //console.log(event.data)
         };
         
         ws.onclose = function(event){
             writeResponse("대화 종료");
         }
});
/*function send(itsMe){
     var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
     var scrollToBottom = (messages.scrollHeight - messages.scrollTop - messages.clientHeight < 80);
	 var lastMessage = messageList.children[messageList.children.length-1];
     var message = document.getElementById("messageinput");
     var newMessage = document.createElement("span");
	 var className;
	  newMessage.innerHTML = message;
	  if(itsMe == ${udata.wdmid})
	  {
	    className = "me";
	    scrollToBottom = true;
	  }else
	  {
		    className = "not-me";
		}
	  
	  if(lastMessage && lastMessage.classList.contains(className))
	  {
	    lastMessage.appendChild(document.createElement("br"));
	    lastMessage.appendChild(newMessage);
	  }
	  else
	  {
	    var messageBlock = document.createElement("div");
	    messageBlock.classList.add(className);
	    messageBlock.appendChild(newMessage);
	    messageList.appendChild(messageBlock);
	  }
 	
     if(scrollToBottom)
       messageList.scrollTop = messageList.scrollHeight;
     
     //var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value;
       ws.send(text);
     text = "";
 }*/

 var className;
 var messageList = document.getElementById("messages");
 var sender;
 function send(){
     // var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
      var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value;
      sender = document.getElementById("sender").value;
      
      if(sender == ${udata.wdmid}){
    	  console.log(sender);
    	  className = "me";
      }else{
    	  console.log(sender);
    	  className = "not-me";
      }
      
      ws.send(text);
      text = "";
  }
 
 function closeSocket(){
     ws.close();
 }
 
 function writeResponse(text){
	 if(sender == ${udata.wdmid}){
		 console.log(sender);
		 className = "me";
	 }else{
   	  console.log(sender);
	  className = "not-me";
  	 }
	 var messageBlock = document.createElement("div");
	 var newMessage = document.createElement("span");
	 messageBlock.classList.add(className);
	 messageBlock.appendChild(newMessage);
	 newMessage.innerHTML+= text+"<br/>"+"<br/>";
	 messageList.appendChild(messageBlock);
	 
     //messages.innerHTML += text+"<br/>"+"<br/>";
 }
</script>
</body>
</html>