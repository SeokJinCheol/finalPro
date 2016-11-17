<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>munu2</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height:500px; vertical-align:middle; display:table-cell;">
		<input type="hidden" name="bnum" value="${vo.bnum}">
		
		<div>
			<table border="1" align=center>
				<tr>
					<td>글번호</td>
					<td>${vo.bnum}</td>
				</tr>
	
				<tr>
					<td>조회수</td>
					<td>${vo.count}</td>
				</tr>
				
				<tr>
					<td>제목</td>
					<td>${vo.title}</td>
				</tr>
				
				<tr>
					<td>작성자</td>
					<td>${vo.id}</td>
				</tr>
				
				<tr>
		         	<td>이&nbsp;미&nbsp;지</td>
      				<td>
       					<img src="/team4/resources/BoardImg/${vo.img }" style="width: 100%; height: 300px;">
       				</td>
				</tr>
				
				<tr>
					<td>내&nbsp;&nbsp;용</td>
					<td>${vo.contents}</td>
				</tr>
			</table>
			<br>
		</div>
		
		<!-- 댓글이 없을 경우 / 있을 경우 -->
		<div align=center>
			<table border="1" style="text-align: center; cellpadding:0; cellspacing:0;">
				<tr>
					<td colspan="3">Reply</td>
				</tr>
	
				<c:forEach items="${list}" var="reply">
					<tr>
						<td>${reply.id}</td>
						<td>${reply.contents}</td>
						<td>
							<!-- 자신의 리플인 경우 -->
							<c:if test="${reply.id == session_id}">
								<form action="freeboard_re_delete" method=post>
									<input type="submit" value="리플삭제">
									<input type="hidden" name="reply_bnum" value="${reply.bnum}">
									<input type="hidden" name="bnum" value="${vo.bnum}">
								</form>
							</c:if>
							
							<!-- 자신의 리플이 아닌 경우 -->
							<c:if test="${reply.id != session_id}">
								<input type="button" value="리플삭제" readonly>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			
			<!-- 로그인 됬을 경우에 Reply 가능 -->
			<security:authorize ifAnyGranted="role_user, role_com, role_master">
				<input type="button" value="답변달기" onclick="location.href='freeboard_write?bnum=${vo.bnum}'">
				
				<!-- 내 게시물일 경우 가능!! -->
				<c:if test="${vo.id == session_id}">
					<!-- 게시물 삭제 -->	
					<form action="freeboard_delete" method=post>
						<input type="submit" value="게시글삭제">
						<input type="hidden" name="bnum" value="${vo.bnum}">
					</form>
					
					<form action="freeboard_update_get">
						<input type="submit" value="게시글수정">
						<input type="hidden" name="bnum" value="${vo.bnum}">
					</form>
				</c:if>
			</security:authorize>
			
			<input type="button" value="List" onclick="location.href='freeboard_list'">
		</div>
	</div>
</body>
</html>