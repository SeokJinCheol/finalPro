<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
    <table border="1">
        <tr>
            <td>보낸사람</td>
            <td>내용</td>
            <td>답장</td>
        </tr>
        <c:forEach items="${maillist}" var="maillist">
            <tr>
                <td>${maillist.sid}</td>
                <td>${maillist.text}</td>
                <td><a onclick="window.open('mail?rid=${maillist.sid}', '','width=400, height=300, status=1')">답장하기</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
