<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>Mail 전송완료화면</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body style="background-color: #F0F0f0;" >
	<div class="w3-row w3-wide" align=center style="padding: 80px; padding-top:100px;">
         Mail이 전송되었습니다.<br><br>

		<input type="button" class="mail-btn2 w3-card-8" onclick="window.close()" value="">
	</div>
</body>
</html>