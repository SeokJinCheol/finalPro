<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>registeradminpage</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height:500px; vertical-align:middle; display:table-cell;">
		<div style="margin-bottom:20px; margin-top:70px;">
			<h4> - registeradminpage - </h4>
		
			<table border="1">
				<tr>
					<td>글번호</td>
					<td>이미지</td>
			        <td>제목</td>
			        <td>상황</td>
			        <td>작업</td>
			    </tr>
			    
			    <c:forEach items="${rentreadylist}" var="rentterlist">
					<tr>
			        	<td>${rentterlist.codeNum}</td>
			        	<td style="width: 20%"><img src="/team4/resources/RequestImg/${rentterlist.img}" style="width: 100%; height: 100px;"></td>
			            <td>${rentterlist.title}</td>
			            <td>${rentterlist.packageStatus}</td>
			            <td>
			            	<c:if test="${rentterlist.packageStatus == '대여신청'}">
			                	<form action="startrentForm" method="post">
			                    	<input type="hidden" value="${rentterlist.codeNum}" name="codeNum">
			                    	<input type="submit" value="대여시작">
			                	</form>
			                </c:if>
			                
			                <c:if test="${rentterlist.packageStatus == '반납신청'}">
			                  <form action="storageendrent" method="post">
			                     <input type="hidden" value="${rentterlist.codeNum}" name="codeNum">
			                     <input type="submit" value="반납완료하기">
			                  </form>
			                </c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>