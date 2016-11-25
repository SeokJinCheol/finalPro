<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form action="endrent" method="post">
		<table border="1">
			<tr>
				<td>점수</td>
				<td>리뷰 내용</td>
			</tr>
			<tr>
				<td><select name="reviewpoint">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
				</select></td>
				<td><input type="text" name="reviewtext"></td>
			</tr>
		</table>
		<input type="hidden" value="${codeNum}" name="codeNum">
		<input type="submit" value="확인">
	</form>
</body>
</html>