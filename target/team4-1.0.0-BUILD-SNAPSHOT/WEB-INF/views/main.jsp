<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Main Page</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
</head>
<body style="background: #fff; margin-left:120px; margin-right:120px;">
		<!-- Top -->
		<jsp:include page="include/top.jsp" />
		
		<!-- Middle -->
		<div align=center class="w3-container" style="width: 1350px; vertical-align:middle; display:table-cell;">
			<div style="margin-bottom:5px; margin-top:5px;">
				<table style="border-collapse: collapse;  border-spacing: 0; width: 100%">
					<tr>
						<c:if test="${LEFT != null}">
							<td class="" width="20%" style="background: #f5f6f7; vertical-align:top; display:table-cell; margin-right:10px; border-right:2px solid #6699DC;">
								<jsp:include page="${LEFT}" />
							</td>
						</c:if>
			
						<td style="width: 80%;">
							<jsp:include page="${CONTENT}" />
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<!-- Bottom -->
		<jsp:include page="include/bottom.jsp" />
</body>
</html>