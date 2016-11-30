<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>content</title>
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
			<h4>- content -</h4>

			<table border=1 width="500">
				<c:forEach items="${result}" var="result">
					<tr>
						<td width="50px" align="center">codeNum</td>
						<td>${result.codeNum }</td>
					</tr>
					<tr>
						<td width="50px" align="center">ID</td>
						<td>${result.reaquestId }</td>
					</tr>
					<tr>
						<td width="50px" align="center">Category</td>
						<td>${result.category }</td>
					</tr>
					<tr>
						<td width="50px" align="center">Title</td>
						<td>${result.title }</td>
					</tr>
					<tr>
						<td width="50px" align="center">Img</td>
						<td><img src="/team4/resources/RequestImg/${result.img }"
							style="width: 100%; height: 300px;"></td>
					</tr>
					<tr>
						<td width="50px" align="center">Contents</td>
						<td style="width: 100%; height: 200px;" align="center">${result.contents }</td>
					</tr>
					<tr>
						<td width="50px" align="center">startDate</td>
						<td>${result.startDate }</td>
					</tr>
					<tr>
						<td width="50px" align="center">endDate</td>
						<td>${result.endDate }</td>
					</tr>
					<tr>
						<td width="50px" align="center">bill</td>
						<td>${result.bill }</td>
					</tr>
					<tr>
						<td width="50px" align="center">deposit</td>
						<td>${result.deposit }</td>
					</tr>
					<tr>
						<td width="50px" align="center">packageStatus</td>
						<td>${result.packageStatus }</td>
					</tr>
					
					<!-- 일반유저 -->
                     <c:if test="${session_id != 'admin'}">
                        <c:if test="${result.packageStatus == '대여가능'}">
                           <td colspan="3" align="center">
                              <form action="RegisterUpForm" method="post">
                                 <input type="hidden" value="${result.codeNum}" name="codeNum"> 
                                 <input type="submit" value="신청하기">
                              </form>
                           </td>
                        </c:if>

                        <c:if test="${result.packageStatus != '대여가능'}">
                           <td colspan="3" align="center" style="WIDTH: 60pt; HEIGHT: 20pt">신청불가</td>
                        </c:if>
                     </c:if>

                     <!-- admin 버튼 -->
                     <c:if test="${session_id == 'admin'}">
                        <c:if test="${result.packageStatus == '대여신청'}">
                           <td colspan="3" align="center">
                              <form action="startrentForm" method="post">
                                 <input type="hidden" value="${result.codeNum}" name="codeNum">
                                 <input type="submit" style="WIDTH: 60pt; HEIGHT: 20pt" value="대여시작">
                              </form>
                           </td>
                        </c:if>
                      </c:if>

				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>