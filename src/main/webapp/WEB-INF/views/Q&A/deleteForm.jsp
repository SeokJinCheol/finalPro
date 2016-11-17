<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<div align=center>
	<h3>게시물이 삭제 되었습니다.</h3>
					
	<c:if test="${bNum== bgnum }">			
		<meta  http-equiv="Refresh" content="1; url=QandA_list">
	</c:if>
	
	<c:if test="${bNum != bgnum }">			
		<meta  http-equiv="Refresh" content="1; url=content?bNum=${bNum}&bgnum=${bgnum}">
	</c:if>
</div>
</body>
</html>