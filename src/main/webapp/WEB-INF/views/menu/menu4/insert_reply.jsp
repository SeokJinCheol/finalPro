<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>reply에 reply 쓰기</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right;line-height: 130px;">
		<img src="/team4/resources/images/free_write.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">댓 글 쓰 기</font>
	</div>

	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; width: 73%; margin-top:40px;">	
            <!-- 리플 달기!! -->
			<form action="insertForm2" method="post">
				<table style="border-collapse: collapse; border-spacing: 0; margin-bottom:15px;">
					<tr>
						<td>
							<textarea class="free-insert-content-title" style="resize: none;" name="contents" rows="3" cols="60" required maxlength="350">${contents}</textarea>
						</td>
						
						<td>
							<input class="reply-btn" type="submit" value="답글">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>