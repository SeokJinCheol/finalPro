<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="sendmail" method="post">
		<table>
			<tr>
				<td>받는 사람</td>
				<td><input type="text" value="${rid}" name="rid"></td>
			</tr>
			<tr>
				<td>내용</td>
			<td><textarea cols="21" rows="10" name="text"></textarea></td>
			</tr>
		</table>
		<input type="hidden" value="${sid}" name="sid">
		<input type="submit" value="전송">
	</form>
</body>
</html>