<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script>

function setpakageStatus(name){
	
	
	if(confirm("수정하시겠습니까?")==true){
	
		document.getElementById(name).status.value=document.getElementById('mySelect').value;

		
		 document.forms(name).submit();
	}else{		return false;		}
	}


</script>
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
			
		<table border="1">
		<tr><th>codeNum</th><th>company</th> <th>startDate</th> <th>endDate</th>
		<th>UserstartDateate</th><th>UserendDate</th> <th>bill</th> <th>contents</th><th>reaquestId</th> 
		<th>registerId</th> <th>adress</th><th>packageStatus</th><th>버튼</th>
		</tr>
		<c:forEach items="${list}" var="list">
		<tr>
		<td>${list.codeNum }</td><td>${list.company }</td>
		<td>${list.startDate }</td><td>${list.endDate }</td><td>${list.userstartDate }</td><td>${list.userendDate }</td>
			<td>${list.bill }</td><td>${list.contents }</td>
		<td>${list.reaquestId }</td><td>${list.registerId }</td><td>${list.adress }</td>
		<td>
		<select id="mySelect" size="1">
			  <option>${list.packageStatus }</option>
			  <c:if test="${list.packageStatus=='허가대기' }">
			  <option>허가완료</option>
			  <option>정산완료</option>
			  <option>취소완료</option>
			  </c:if>
			  <c:if test="${list.packageStatus=='허가완료' }">
			  <option>허가대기</option>
			  <option>정산완료</option>
			  <option>취소완료</option>
			  </c:if>
			  <c:if test="${list.packageStatus=='정산완료' }">
			  <option>허가대기</option>
			  <option>허가완료</option>
			  <option>취소완료</option>
			  </c:if> 
			  <c:if test="${list.packageStatus=='취소완료' }">
			  <option>허가대기</option>
			  <option>정산완료</option>
			  <option>허가완료</option>
			  </c:if>
			</select>
			<form name="${list.seqNum }" id="${list.seqNum }" action="setRPBstatus">
			<input type="hidden" name="seqNum" value="${list.seqNum }">
			<input type="hidden" name="status" id="status">
			<input type="submit" value="변경" onclick="setpakageStatus(${list.seqNum });	return false;">
			</form>
		</td>
		<td>
		<form action="modifyRPB"><input type="hidden" name="seqNum" value="${list.seqNum }">
		<input type="submit" name="mody" value="수정"></form>
		</td>
		</tr>

		</c:forEach>
			</table>	
			
		</div>
	</div>
	
	
	
	
	
	
	
</body>
</html>