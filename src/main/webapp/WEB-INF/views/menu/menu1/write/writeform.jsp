<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>requestboardwrite</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/w3.css"
	type="text/css" media="screen">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/login.css"
	type="text/css" media="screen">
</head>
<body>
	<div align=center class="w3-container"
		style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; margin-top: 70px;">
			<h4>- requestboardwrite -</h4>
		
			<form action="requestboardwrite" method="post" enctype="multipart/form-data">
				<table border="1">
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" required maxlength="30"></td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td><select name="category" required>
								<option value="DIY용품">DIY용품</option>
								<option value="공구">공구</option>
								<option value="주방용품">주방용품</option>
								<option value="전자기기">전자기기</option>
								<option value="레져용품">레져용품</option>
						</select></td>
					</tr>
					<tr>
					<td>업체</td>
						
						<security:authorize ifAnyGranted="role_user">
							<td>
								<select name="company" required>
									<option value="개인">개인</option>
								</select>
							</td>
						</security:authorize>
						
						<security:authorize ifAnyGranted="role_com">
							<td>
								<select name="company" required>
									<option value="업체">업체</option>
								</select>
							</td>
						</security:authorize>
						
						<security:authorize ifAnyGranted="role_master">
							<td>
								<select name="company" required>
									<option value="개인">개인</option>
									<option value="업체">업체</option>
								</select>
							</td>
						</security:authorize>
					</tr>
					<tr>
						<td>이미지</td>
						<td><input type="file" name="file"></td>
					</tr>
					<tr>
						<td>대여시작일</td>
						<td><input type="date" name="startDate" min="${CurrentTime}" required></td>
					</tr>
					<tr>
						<td>대여종료일</td>
						<td><input type="date" name="endDate" min="${CurrentTime}" required></td>
					</tr>
					<tr>
						<td>대여비</td>
						<td><input type="text" name="bill" required maxlength="10">원</td>
					</tr>
					<tr>
						<td>보증금</td>
						<td><input type="text" name="deposit" required maxlength="10">원</td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="contents" cols="30" rows="15" required maxlength="350"></textarea></td>
					</tr>
				</table>
				<input type="submit" value="글쓰기">
			</form>
		</div>
	</div>
</body>
</html>