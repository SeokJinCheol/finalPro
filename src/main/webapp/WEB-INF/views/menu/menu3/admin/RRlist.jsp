<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function setpakageStatus(name){
	
	var myselect= "mySelect"+name;
	
	if(confirm("수정하시겠습니까?")==true){
	
		document.getElementById(name).status.value=document.getElementById(myselect).value;

		
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
			<h4>- RRlist -</h4>
			
			<form action="RRlist" method="post"><input type="hidden" name="status" value="대여대기"><input type="submit" value="허가대기"></form>
			<form action="RRlist" method="post"><input type="hidden" name="status" value="대여가능"><input type="submit" value="대여가능"></form>
			<form action="RRlist" method="post"><input type="hidden" name="status" value="대여완료"><input type="submit" value="대여완료"></form>
			<form action="RRlist" method="post"><input type="hidden" name="status" value="대여불가"><input type="submit" value="대여불가"></form>
			<table>
			<tr><th>제공자 id</th>
			<th>주소</th>
			<th>건물 사진</th>
			<th>일당 대여비</th>
			<th>대여 가능한 날짜 시작일</th>
			<th>대여 가능한 날짜 종료일</th>
			<th>제목</th>
			<th>내용</th>
			<th>수정</th>
			<th>상태</th>
			</tr>
			<c:forEach items="${ list}" var="vo">
		<tr><td>${vo.registerId }</td>
	<td>${vo.adress }</td>
	<td><img href="${vo.img }"></td>
	<td>${vo.bill }</td>
	<td>${vo.startDate }</td>
	<td>${vo.endDate }</td>
	<td>${vo.title }</td>
	<td>${vo.contents }</td>
	<td>
<select id="mySelect${vo.codeNum }" size="1">
			  <option>${vo.packageStatus }</option>
			  <c:if test="${vo.packageStatus=='대여가능' }">
			  <option>허가대기</option>
			  <option>대여완료</option>
			  <option>대여불가</option>
			  </c:if>
			  <c:if test="${vo.packageStatus=='대여대기' }">
			  <option>대여가능</option>
			  <option>대여완료</option>
			  <option>대여불가</option>
			  </c:if>
			  <c:if test="${vo.packageStatus=='대여완료' }">
			  <option>대여가능</option>
			  <option>대여대기</option>
			  <option>대여불가</option>
			  </c:if> 
			  <c:if test="${vo.packageStatus=='대여불가' }">
			  <option>대여가능</option>
			  <option>대여완료</option>
			  <option>대여대기</option>
			  </c:if>
			</select>
			<form name="${vo.codeNum }" id="${vo.codeNum }" action="setRRBstatus">
			<input type="hidden" name="codeNum" value="${vo.codeNum }">
			<input type="hidden" name="status" id="status">
			<input type="submit" value="변경" onclick="setpakageStatus(${vo.codeNum });	return false;">
			</form>
		</td>
		<td>
		<form action="showContentsForm" method="post">
		<input type="hidden" name="codeNum" value="${vo.codeNum }">
		<input type="submit" name="mody" value="수정"></form></td>
</tr>
</c:forEach>
		</table>		
			
			
			
			
			
			
			
			
			
		</div>
	</div>
</body>
</html>