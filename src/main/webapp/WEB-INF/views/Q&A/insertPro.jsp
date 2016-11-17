<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h3>게시물이 등록되었습니다.</h3>

	<c:if test="${groupnum==0 }">			
		<meta  http-equiv="Refresh" content="1; url=QandA_list">
	</c:if>

	<c:if test="${groupnum!=0 }">			
		<meta  http-equiv="Refresh" content="1; url=content?bNum=${bNum}&bgnum=${bgnum}">
	</c:if>
</body>
</html>