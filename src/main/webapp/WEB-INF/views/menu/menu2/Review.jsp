<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Review 작성</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background: #6699DC; color: white; height: 100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/review.png" style="margin-right: 10px;"> 
		<font style="margin-right: 30px; font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px;">Review 작성</font>
	</div>
	
	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
	    <form action="endrent" method="post">
		    <table style="padding: 70px; text-align:center; border-collapse: collapse; margin-bottom: 20px; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
				<tr class="top-bottom-border" style=" height:30px; margin-bottom: 20px;">
		        	<td width=80 style="font-family: 'Jeju Gothic', sans-serif; text-align: center; border-right: 1px solid #fff;">평 　 점</td>
		        	<td align="center" height="33">	
		    			<select name="reviewpoint" style="height:27px; border-radius:4px; text-align:center;" required>
							<option>선택하세요.</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select>
					</td>
		        </tr>
		        
		        <tr>
		        	<td colspan="2" style="text-align: left; font-family: 'Jeju Gothic', sans-serif;">
		        	&nbsp;&nbsp;게　시　글
		        	</td>
		        </tr>
		        	
		        <tr align="center" height="35"> 
                	<td colspan="2" class="bottom-border2">
                  		<textarea class="free-insert-content-title" style="resize: none;" name="reviewtext" rows="10" cols="25" required></textarea>
                	</td>
               	</tr>
			</table>
			
			<input type="hidden" value="${codeNum}" name="codeNum">
			<input type="hidden" value="${mypage}" name="mypage">
			
			<p>
				<input type="submit" class="free_insert w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게　시" />
				&nbsp;&nbsp;&nbsp;
				<input type="button" class="free_insert-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취　소" onclick="javascript:window.history.back();"/>
			</p>
		</form>
	</div>
</body>
</html>