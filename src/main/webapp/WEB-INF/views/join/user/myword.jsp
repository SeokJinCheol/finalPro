<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>myboard</title>
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
	<div class="row"
		style="background: #6699DC; color: white; height: 100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/free_list.png"
			style="margin-right: 10px;"> <font
			style="margin-right: 30px; font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px;">내가 쓴 글 목록</font>
	</div>
	<div align=center class="w3-container"
		style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">

		

		<div class="w3-row" style="margin-top: 0px;">
			<table style="padding: 70px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
				<tr style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
			         <td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">I　　D</td>
			         <td width=60 style="border-top: 2px solid #000; border-right: 1px solid #fff;">Category</td>
			         <td width=120 style="border-top: 2px solid #000; border-right: 1px solid #fff;">Title</td>
			         <td width=120 style="border-top: 2px solid #000; border-right: 1px solid #fff;">Contents</td>
			         <td width=80 style="border-top: 2px solid #000; border-right: 1px solid #fff;">Img</td>
			         <td width=80 style="border-top: 2px solid #000; border-right: 1px solid #fff;">Date</td>
			         <td width=50 style="border-top: 2px solid #000;">Hit</td>
			    </tr>
			     
			     <!-- result는 contoller의 addObject로 부터 가져온다. -->
					<c:forEach items="${list}" var="member">
			        	<tr>
			            	<td style="font-family: 'Nanum Gothic Coding', monospace; border-bottom: 3px solid #fff;">${member.id}</td>
			            	<td style="border-bottom: 3px solid #fff;">${member.category }</td>
			             	<td style="border-bottom: 3px solid #fff;"><a href="content?bNum=${member.bNum}&pageNum=${currentPage}&bgnum=${member.bgnum}">${member.title }</a></td>
			             	<td style="border-bottom: 3px solid #fff;">${member.contents }</td>
			             	<td style="border-bottom: 3px solid #fff; width: 10% "><img src="/team4/resources/FreeBoardImg/${member.img }" style="width: 100%; height: 50px;"></td>
			             	<td style="border-bottom: 3px solid #fff;">${member.bDate }</td>
			             	<td style="border-bottom: 3px solid #fff;">${member.readcount }</td>
			         	</tr>
					</c:forEach>
				</table>
		</div>

		<!-- 페이지 번호 -->
		<div align="center" class="w3-row">
			<c:if test="${count>0}">
				<c:set var="pageCount" value="${pageCount}" />
				<!-- pagCount=15 -->
				<c:set var="startPage" value="${1}" />
				<c:set var="pageBlock" value="${5}" />

				<fmt:parseNumber var="result" value="${currentPage/pageBlock}"
					integerOnly="true" />

				<c:if test="${(currentPage%pageBlock)!=0}">
					<c:set var="startPage" value="${result*pageBlock+1}" />
					<!-- startpage=11 -->
				</c:if>

				<c:if test="${(currentPage%pageBlock)==0}">
					<c:set var="startPage" value="${(result-1)*pageBlock+1}" />
				</c:if>

				<c:set var="endPage" value="${startPage+pageBlock-1}" />
				<!-- endpage=15 -->
				<c:if test="${endPage>=pageCount}">
					<c:set var="endPage" value="${pageCount}" />
				</c:if>

				<ul>
					<c:if test="${startPage>5}">
						<c:if test="${word == null}">
							<a href="user_myword?pageNum=${startPage-5}">&laquo;</a>
						</c:if>
						<c:if test="${word != null && keyword != null}">
							<a
								href="user_myword?pageNum=${startPage-5}&word=${word}&keyword=${keyword}">&laquo;</a>
						</c:if>
					</c:if>

					<table>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${word == null}">
								<td><a href="user_myword?pageNum=${i}">${i}</a></td>
							</c:if>

							<c:if test="${word != null }">
								<td><a
									href="user_myword?pageNum=${i}&word=${word}&keyword=${keyword}">${i}</a></td>
							</c:if>
						</c:forEach>
					</table>

					<c:if test="${endPage<pageCount}">
						<c:if test="${word == null}">
							<a href="user_myword?pageNum=${startPage+5}">&raquo;</a>
						</c:if>

						<c:if test="${word != null }">
							<a
								href="user_myword?pageNum=${startPage+5}&word=${word}&keyword=${keyword}">&raquo;</a>
						</c:if>
					</c:if>
				</ul>
				<br>
			</c:if>
		</div>
	</div>
</body>
</html>