<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Q & A_update</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right;line-height: 130px;">
		<img src="/team4/resources/images/free_update.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">글 수 정</font>
	</div>

	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; margin-top: 70px;">			
			<table border=1>
				<form action="updateForm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="bNum" value="${ bNum }"> <input
						type="hidden" name="bgnum" value="${ bgnum }">
					<input
						type="hidden" name="img" value="${result.img}">
					<c:if test="${bNum == bgnum  }">
						<tr>
							<td>ID</td>
							<td><input type="text" name="id" value="${result.id }"
								readonly></td>
						</tr>
	
						<tr>
							<td>CateGory</td>
							<td><select name="category">
									<option value="관리자">관리자</option>
									<option value="판매자">판매자</option>
									<option value="대여자">대여자</option>
							</select></td>
						</tr>
	
						<tr>
							<td>Title</td>
							<td><input type="text" name="title" value="${result.title }"
								required></td>
						</tr>
	
						<tr>
							<td>Contents</td>
							<td><input type="text" name="contents"
								value="${result.contents }" style="width: 100%; height: 200px;"
								required></td>
						</tr>
	
						<tr>
							<td>Img</td>
							<td><input type="file" name="file" required/></td>
						</tr>
	
						<tr>
							<td><input type="submit" value="입력">
							<td>
						</tr>
					</c:if>
	
					<c:if test="${bNum != bgnum  }">
						<tr>
							<td>ID</td>
							<td><input type="text" name="id" value="${result.id }"
								readonly></td>
						</tr>
	
						<tr>
							<td>Contents</td>
							<td><input type="text" name="contents"
								value="${result.contents }" style="width: 100%; height: 200px;"
								required></td>
						</tr>
	
						<tr>
							<td><input type="submit" value="입력">
							<td>
						</tr>
					</c:if>
				</form>
			</table>
		</div>
	</div>
</body>
</html>