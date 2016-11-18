<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
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

			</c:forEach>
		</table>
	</center>

</body>
</html>