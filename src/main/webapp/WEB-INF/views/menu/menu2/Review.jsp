<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form action="endrent" method="post">
	<select name="reviewpoint">
		<option>1</option>
		<option>2</option>
		<option>3</option>
		<option>4</option>
		<option>5</option>
	</select>
	<input type="text" name="reviewtext">
	<input type="hidden" value="${codeNum}" name="codeNum"><br>
	<input type="submit" value="리뷰 작성">
</form>
</body>
</html>