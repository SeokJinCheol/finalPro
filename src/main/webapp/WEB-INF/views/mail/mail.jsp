<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>Mail 답장</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body style="background-color: #F0F0f0;" align=center>
	<form action="sendmail" method="post">
		<table align=center style="padding: 70px; text-align:center; border-collapse: collapse; margin-bottom: 20px; border-spacing: 0; margin-top: 10px; padding-bottom: 10px;">
			<tr class="top-bottom-border" style=" height:30px; margin-bottom: 20px;">
	        	<td width=80 style="font-family: 'Jeju Gothic', sans-serif; text-align: center; border-right: 1px solid #fff;">받 는 사 람</td>
	        	<td>	
					<input type="text" class="free-insert-title" value="${rid}" name="rid" style="text-align: center" readonly>
				</td>
	        </tr>
		
			<tr>
	        	<td colspan="2" style="text-align: left; font-family: 'Jeju Gothic', sans-serif;">
	        	&nbsp;&nbsp;내　용
	        	</td>
	        </tr>
			
			<tr align="center" height="35"> 
             	<td colspan="2" class="bottom-border2">
               		<textarea class="free-insert-content-title" style="resize: none;" rows="10" cols="25" required></textarea>
             	</td>
            </tr>
		</table>
		
		<input type="hidden" value="${sid}" name="sid">
		<input type="submit" value="보내기" style="color: #006DF0;" class="mail-btn w3-card-8">
	</form>
</body>
</html>