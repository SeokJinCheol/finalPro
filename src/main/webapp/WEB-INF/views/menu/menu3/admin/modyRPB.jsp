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
			<h4>- modyRPB -</h4>

<form name="updateRPB" action="updateRPB" method="post">	
	<table border="1">
	
	<tr>	<th>정보 띄우기</th></tr>
	<tr>
	<th>codeNum</th><td><input type="text" value="${vo.codeNum}" name="codeNum">
	<input type="hidden" value="${vo.seqNum}" name="seqNum"></td>	</tr>
	<tr><th>제공자 id</th><td><input type ="text" name="registerId" value="${vo.registerId }"></td></tr>
	<tr><th>주소</th><td><input type ="text" name="adress" value="${vo.adress }"></td></tr>
	<tr><th>대여 가능한 날짜 </th><td><input type="date" name="startDate" value="${vo.startDate }" required/>~<input type="date" name="endDate" value="${vo.endDate  }" required/></td></tr>
	<tr><th>내용</th><td><input type ="text" name="contents" value="${vo.contents }"></td></tr>
	<tr><th>신청자</th><td><input type ="text" name="reaquestId" value="${vo.reaquestId }"></td></tr>
	<tr><th>신청일</th><td><input type="date" name="userstartDate" value="${vo.userstartDate }" required/>~<input type="date" name="userendDate" value="${vo.userendDate  }" required/></td></tr>
	<tr><th>행사명 및 세부 사항</th><td><input type ="text" name="contents" value="${vo.contents }"></td></tr>
	<tr><th>총요금(선택 일수)</th><td><input type ="text" name="bill" value="${vo.bill }"></td></tr>
	<tr><td><input type="submit" value="신청하기"></td></tr>
	</table>
	</form>


			
			
			
			
			
			
			
		</div>
	</div>
</body>
</html>