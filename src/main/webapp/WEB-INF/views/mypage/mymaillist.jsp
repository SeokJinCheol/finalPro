<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Mail</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background: #6699DC; color: white; height: 100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/mail2.png" style="margin-right: 10px;"> 
		<font style="margin-right: 30px; font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px;">M a i l</font>
	</div>

	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
	    <table style="padding: 70px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
			<c:forEach items="${maillist}" var="maillist">
				<tr class="top-bottom-border" style="margin-bottom: 20px; text-align: center;">
			    	<td style="border-bottom: 3px solid #fff; width: 10%; ">
			    		<img src="/team4/resources/images/mail4444.png" style="width: 40%; height: 30px;">
			    	</td>
			    	
			    	<td style="border-bottom: 3px solid #fff; width:20%;" class="top-bottom-border">
			    		${maillist.sid}
			    	</td>
			    	
			    	<td style="border-bottom: 3px solid #fff; width:45%;" class="top-bottom-border">
			    		${maillist.text}
			    	</td>
			    	
			    	<td style="border-bottom: 3px solid #fff; width:15%;" class="top-bottom-border">
			    		${maillist.senddate}
			    	</td>
			    	
			    	<td style="border-bottom: 3px solid #fff; width:10%;" >
			    		<img src="/team4/resources/images/remail2.png" onmouseover="this.src='/team4/resources/images/remail.png'" onmouseout="this.src='/team4/resources/images/remail2.png'" style="width: 40%; height: 20px;" onclick="window.open('mail?rid=${maillist.sid}', '','left=100, top=150, width=400, height=350, status=1')">
			    	</td>
			    </tr>
		    </c:forEach>
		</table>
    </div>
</body>
</html>