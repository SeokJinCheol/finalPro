<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Q & A_Insert</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; margin-top: 70px;">
			<h4>- Q & A_Insert -</h4>
	
			등록 OK

			<!-- 새로운 글인 경우 -->
			<c:if test="${groupnum==0 }">			
				<meta http-equiv="Refresh" content="1; url=free_list">
			</c:if>

			<!-- 댓글일 경우 -->
			<c:if test="${groupnum!=0 }">			
				<meta http-equiv="Refresh" content="1; url=content?bNum=${bNum}&bgnum=${bgnum}">
			</c:if>
		</div>
	</div>
</body>
</html>