<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>writeform</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height:500px; vertical-align:middle; display:table-cell;">
		<div style="margin-bottom:20px; margin-top:70px;">
			<h4> - writeform - </h4>		
		
			<c:forEach items="${RegisterBoardform}" var="RegisterBoardform">
				<form action="RegisterBoardWrite" method="post">
					<input type="hidden" name="img" value="${RegisterBoardform.img }">
					<table border="1">
						<tr>
							<td>글번호</td>
							<td>${RegisterBoardform.codeNum}<input type="hidden" name="codeNum" value="${RegisterBoardform.codeNum}"></td>
						</tr>
						
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" value="${RegisterBoardform.title}" maxlength="30"></td>
						</tr>
						
						<tr>
							<td>카테고리</td>
							<td>
								<select name="category" required>
									<option value="${RegisterBoardform.category}">${RegisterBoardform.category}</option>
									<option value="DIY용품">DIY용품</option>
									<option value="공구">공구</option>
									<option value="주방용품">주방용품</option>
									<option value="전자기기">전자기기</option>
									<option value="레져용품">레져용품</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td>업체</td>
							<td>
								<select name="company" required>
									<option value="${RegisterBoardform.company}">${RegisterBoardform.company}</option>
									<option value="개인">개인</option>
									<option value="업체">업체</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td>대여시작일</td>
							<td><input type="date" name="startDate" value="${RegisterBoardform.startDate}" required></td>
						</tr>
						
						<tr>
							<td>대여종료일</td>
							<td><input type="date" name="endDate" value="${RegisterBoardform.endDate}" required></td>
						</tr>
						<tr>
							<td>대여비</td>
							<td><input type="text" name="bill" value="${RegisterBoardform.bill}" required maxlength="10">원</td>
						</tr>
						
						<tr>
							<td>보증금</td>
							<td><input type="text" name="deposit" value="${RegisterBoardform.deposit}" required maxlength="10">원</td>
						</tr>
						<tr>
							<td>이미지</td>
							<td><img src="/team4/resources/RequestImg/${RegisterBoardform.img }" style="width: 100%; height: 300px;"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="contents" cols="30" rows="15" required maxlength="350">${RegisterBoardform.contents}</textarea></td>
						</tr>
						
						<tr>
							<td>판매자</td>
							<td><input type="text" value="${RegisterBoardform.reaquestId}" name="reaquestId" required></td>
						</tr>
					</table>
					
					<input type="submit" value="대여가능 등록하기">
				</form>
			</c:forEach>
		</div>
	</div>
</body>
</html>