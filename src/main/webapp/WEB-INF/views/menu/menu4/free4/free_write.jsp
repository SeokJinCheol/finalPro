<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardWrite</title>
</head>
<body class="w3-container" style="background: #f5f6f7;">
	<div class="w3-container">
		<form action="free_write2" method=post enctype="multipart/form-data">
			<table border="1">
				<%-- <tr>

					<td><c:if test="${bnum != null}">
							<option value="Reply">Reply</option>
						</c:if></td>
				</tr> --%>

				<tr>
					<td>이미지파일:</td>
					<td><input type="file" name="file"></td>
				</tr>

				<tr>
					<td>제목:</td>
					<td><input type="text" name="title" value="${title}" required></td>
				</tr>

				<tr>
					<td>id :</td>
					<td><input type="text" name="id" value="${session_id}"
						readonly /></td>
				</tr>

				<tr>
					<td>contents:</td>
					<td><textarea cols="10" rows="5" name="contents" required></textarea>
					</td>
				</tr>
			</table>

			<input type="hidden" name="bnum" value="${bnum}"> <input
				type="submit" value="글쓰기"> <input type="button" value="List"
				onclick="location.href='free_list'">
		</form>
	</div>
</body>
</html>