<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>siteintro</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right;line-height: 130px;">
		<img src="/team4/resources/images/service2.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">서 비 스 소 개</font>
	</div>

	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; width: 85%; margin-top:10px;">	
		    <table  style="padding: 70px; padding-top: 30px;padding-bottom: 15px;">
				<tr>
				    <td><B>Billy Bury</B>는 공유경제를 바탕으로 만들어진 사이트입니다.</td>
				</tr>
				
				<tr><td></td></tr>
				
				<tr>
				    <td>공유경제란 ? </td>
				</tr>
				
				<tr><td></td></tr>
				
				<tr>
				    <td>물품을 소유의 개념이 아닌 서로 대여해 주고 차용해 쓰는 개념으로 인식하여 </td>
				</tr>
				
				<tr><td></td></tr>
				
			    <tr>
				    <td>경제활동을 하는 것을 가리키는 표현입니다. </td>
				</tr>
				
				<tr><td></td></tr>
				
				<tr>
				    <td>물건이나 공간, 서비스를 빌리고 나눠 쓰는 인터넷 기반의 사회적 경제 모델입니다. </td>
				</tr>
				
				<tr><td></td></tr>
				
				<tr>
				    <td><B>Billy Bury</B>는 물건 또는 장소를 빌려주는 공급자와 </td>
				</tr>
				
				<tr><td></td></tr>
				
				<tr>
				    <td>물건을 빌려 사용하는 대여자로 구분됩니다. </td>
				</tr>
				
				<tr><td></td></tr>
				
				<tr>
				    <td>또한 <B>Billy Bury</B>는 공급자과 대여자간의 신뢰를 중요시합니다. </td>
				</tr>
				
				<tr ><td style="margin-bottom:20px;"></td></tr>
				<tr ><td style="margin-bottom:20px;"></td></tr>
				<tr ><td style="margin-bottom:20px;"></td></tr>
				<tr ><td style="margin-bottom:20px;"></td></tr>
				
				<tr align=center>
				    <td><B>많은 이용 부탁드립니다.</B></td>
				</tr>
			</table>
		    
		    <p>
		    	<input type="button" class="intro-button-write" value ="물품등록 과정" onclick="location='provider'">
		    	&nbsp;&nbsp;&nbsp;
		    	<input type="button" class="intro-button-write" value ="물품대여 과정" onclick="location='lender'">
		    </p>
	    </div>
	</div>
</body>
</html>