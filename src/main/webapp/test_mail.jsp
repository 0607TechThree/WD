<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="com.wooridoori.app.mail.MailSend"%>
<%@ page errorPage="error/error.jsp" %>
<%
MailSend ms = new MailSend();
ms.MailSend();
out.println("COMPLETE");
%>
