<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>freeboard</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height:500px; vertical-align:middle; display:table-cell;">
		<form action="QnA_update" method=post enctype="multipart/form-data">
			<input type="hidden" name="bnum" value="${bnum}">
			<input type="hidden" name="img" value="${img}">
			<table border="1">
				<tr>
					<td>category:</td>
					<td>
						<select name="category" required>
							<c:if test="${category == '질문'}">
								<option value="건의사항">건의사항</option>
							</c:if>
							
							<c:if test="${category == '건의사항'}">
								<option value="질문">질문</option>
							</c:if>
						</select>
					</td>
				</tr>
				
				<tr>
              	 	<td>이미지파일:</td>
               		<td><input type="file" name="file" required></td>
               		
            	</tr>

				
				<tr>
					<td>제목:</td>
					<td><input type="text" name="title" value="${title}" required></td>
				</tr>
				
				<tr>
					<td>id :</td>
					<td><input type="text" name="id" value="${session_id}" readonly /></td>
				</tr>
				
				<tr>
					<td>contents:</td>
					<td>
						<textarea cols="10" rows="5" name="contents" required>${contents}</textarea>
					</td>
				</tr>
			</table>
			
			<input type="hidden" name="bnum" value="${bnum}">
			<input type="submit" value="글수정">
			<input type="button" value="List" onclick="location.href='QnA_list'">
		</form>
	</div>
</body>
</html>