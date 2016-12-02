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
	    <div style="margin-bottom: 20px; width:660px; background-color: #fafafa" class="w3-card-8">
		    <table style="height:400px; width:660px; padding: 70px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
					<thead style="table-layout:fixed; height:30px;">
						<tr class="bottom-border2" style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
					        <td width=195 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">보 낸 이</td>
					        <td width=300 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">내 　 용</td>
					        <td width=100 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">보낸날짜</td>
					        <td width=65 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000;">답 장</td>
					    </tr>
					</thead>
	
					<tbody style="height:370px; overflow-y: auto; position: absolute;">
						<c:forEach items="${maillist}" var="maillist">
							<tr onMouseOver="this.style.backgroundColor='#eff7fc'" onMouseOut="this.style.backgroundColor='#fafafa'" style=" height:96px;">
						    	<td width=65  style="border-bottom: 3px solid #fff; ">
						    		<img src="/team4/resources/images/mail4444.png" style="width: 40%; height: 30px;">
						    	</td>
						    	
										<td width=130 style="border-bottom: 3px solid #fff;">
											<c:out value="${maillist.sid}"/>
										</td>
										<td width=300 style="border-bottom: 3px solid #fff;">
											<c:out value="${maillist.text}"/>
										</td>
						    	<td width=100  style="border-bottom: 3px solid #fff;">
						    		${maillist.senddate}
						    	</td>
						    	
						    	<td width=65 style="border-bottom: 3px solid #fff;" >
						    		<img src="/team4/resources/images/remail2.png" onmouseover="this.src='/team4/resources/images/remail.png'" onmouseout="this.src='/team4/resources/images/remail2.png'" style="width: 40%; height: 20px;" onclick="window.open('mail?rid=${maillist.sid}', '','left=100, top=150, width=400, height=350, status=1')">
						    	</td>
						    </tr>
					    </c:forEach>
					</tbody>
			</table>
		</div>
    </div>
</body>
</html>