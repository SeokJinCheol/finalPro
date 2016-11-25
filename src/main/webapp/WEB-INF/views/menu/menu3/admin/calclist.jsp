<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Menu3</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; margin-top: 70px;">
			<h4>- MENU3_5 -</h4>
			<form action="menu3_4" method="post">
		<table border="1">
		
		<tr><td>
			<select name="keyField">
								<c:if test="${keyField == 'codeNum'}">
									<option value="codeNum" selected="selected">코드넘버</option>
								</c:if>
	
								<c:if test="${keyField != 'codeNum'}">
									<option value="codeNum">코드넘버로 검색</option>
								</c:if>
	
								<c:if test="${keyField == 'registerDate'}">
									<option value="registerDate" selected="selected">등록날자로 검색</option>
								</c:if>
	
								<c:if test="${keyField != 'registerDate'}">
									<option value="registerDate">등록날자로 검색</option>
								</c:if>
	
								<c:if test="${keyField == 'reaquestId'}">
									<option value="reaquestId" selected="selected">아이디로 검색</option>
								</c:if>
	
								<c:if test="${keyField != 'reaquestId'}">
									<option value="reaquestId">아이디로 검색</option>
								</c:if>
								
								<c:if test="${keyField == 'adress'}">
									<option value="adress" selected="selected">주소로 검색</option>
								</c:if>
	
								<c:if test="${keyField != 'adress'}">
									<option value="adress">주소로 검색</option>
								</c:if>
							</select></td><td>	<input type="search" name="keyWord"></td><td>
		<input type="submit" value="검색 ">
		</td></tr></table>
		</form>
				<table border="1">
		
		<tr><th>codeNum</th><th>company</th> <th>startDate</th> <th>endDate</th>
		<th>UserstartDateate</th><th>UserendDate</th> <th>bill</th> <th>contents</th><th>reaquestId</th> 
		<th>registerId</th> <th>adress</th><th>packageStatus</th><th>버튼</th>
		</tr>
		<c:forEach items="${list}" var="list">
		<c:set var="total" value="${total+list.bill }"/>
		<tr><td>${list.codeNum }</td><td>${list.company }</td>
		<td>${list.startDate }</td><td>${list.endDate }</td><td>${list.userstartDate }</td><td>${list.userendDate }</td>
			<td>${list.bill }</td><td>${list.contents }</td>
		<td>${list.reaquestId }</td><td>${list.registerId }</td><td>${list.adress }</td>
		<td>${list.packageStatus }
		</td>
		<td>	<form action="modifyRPB" method="post"><input type="hidden" name="seqNum" value="${list.seqNum }">
		<input type="submit" value="내용확인"></form>
		</td>
		</tr>
		


		</c:forEach>
		<tr><th>총결산</th><td>${total }</td></tr>
			</table>
			
			
			
			
			
			
			
			
			
			
		</div>
	</div>
</body>
</html>