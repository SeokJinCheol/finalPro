<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>free_list</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/free_list.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">물 품 대 여</font>
	</div>	

	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<!-- 검색 -->
		<div class="w3-row" style="margin-top:50px;">	
			<form action="menu2" method=post>
				<select name="keyword" style="width:15%; border-radius:4px; text-align:center; height:27px;">
					<option value="#" style="text-align:center;">선택하세요.</option>
					<option value="title" style="text-align:center;">Title</option>
					<option value="category" style="text-align:center;">카테고리</option>
				</select>
				
				<input type="text" name="word" value="${word}" placeholder="&nbsp;Search . . . " class="free-search-title" required="required"/>
				
				<input type="submit" class="list-search" value ="Search" style="width:8%;">
			</form>
		</div>
			<table style="padding: 70px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
				<tr class="bottom-border2" style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
					<td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">글번</td>
					<td td width=80 style="border-top: 2px solid #000; border-right: 1px solid #fff;">이미지</td>
					<td width=60 style="border-top: 2px solid #000; border-right: 1px solid #fff;">카테고리</td>
					<td width=120 style="border-top: 2px solid #000; border-right: 1px solid #fff;">제목</td>
					<td width=80 style="border-top: 2px solid #000; border-right: 1px solid #fff;">상황</td>
					<td width=80 style="border-top: 2px solid #000; border-right: 1px solid #fff;">신청</td>
				<tr>
				
				<c:forEach items="${Registerselect}" var="Registerselect">
					<tr>
						<td>${Registerselect.codeNum}</td>
						<td style="width: 20%"><img src="/team4/resources/RequestImg/${Registerselect.img }" style="width: 100%; height: 100px;"></td>
						<td>${Registerselect.category}</td>
						<td>${Registerselect.title}</td>
						<td>${Registerselect.packageStatus}</td>
	
						<!-- 일반유저 -->
						<c:if test="${session_id != 'admin'}">
							<c:if test="${Registerselect.packageStatus == '대여가능'}">
								<td>
									<form action="RegisterUpForm" method="post">
										<input type="hidden" value="${Registerselect.codeNum}" name="codeNum">
										<input type="submit" value="신청하기">
									</form>
								</td>
							</c:if>
							
							<c:if test="${Registerselect.packageStatus != '대여가능'}">
								<td>신청불가</td>
							</c:if>
						</c:if>
						
						<!-- admin 버튼 -->
						<c:if test="${session_id == 'admin'}">
							<c:if test="${Registerselect.packageStatus == '대여신청'}">
								<td>
									<form action="startrentForm" method="post">
										<input type="hidden" value="${Registerselect.codeNum}" name="codeNum">
										<input type="submit" value="대여시작">
									</form>
								</td>
							</c:if>
							
							<c:if test="${Registerselect.packageStatus == '반납신청'}">
								<td>
									<form action="storageendrent" method="post">
										<input type="hidden" value="${Registerselect.codeNum}" name="codeNum">
										<input type="submit" value="반납완료하기">
									</form>
								</td>
							</c:if>
							
							<c:if test="${Registerselect.packageStatus == '대여종료신청'}">
								<td>
									<form action="" method="post">
										<input type="hidden" value="${Registerselect.codeNum}" name="codeNum">
										<input type="submit" value="대여종료">
									</form>
								</td>
							</c:if>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>