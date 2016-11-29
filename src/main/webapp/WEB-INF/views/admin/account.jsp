<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>admin_물품정산</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background: #6699DC; color: white; height: 100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/box.png" style="margin-right: 10px;"> 
		<font style="margin-right: 30px; font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px;">물 품 정 산</font>
	</div>

	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; width: 70%; background-color: #fafafa" class="w3-card-8">
			<table style="padding: 20px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
				<tr class="bottom-border2" style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
			        <td width=120 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">대여자</td>
			        <td width=130 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">대여일자</td>
			        <td width=130 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">반납일자</td>
			        <td width=100 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">대여일수</td>
			        <td width=100 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">대여비</td>
			        <td width=100 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000;">결제금액</td>
			    </tr>

				<c:forEach items="${storagelist}" var="storagelist" begin="0" end="${fn:length(storagelist)}" varStatus="status">
					<tr onMouseOver="this.style.backgroundColor='#eff7fc'" onMouseOut="this.style.backgroundColor='#fafafa'">
				    	<td style="border-bottom: 3px solid #fff;">${storagelist.rentter} 님</td>
			            <td style="border-bottom: 3px solid #fff;">${storagelist.startDate}</td>
			            <td style="border-bottom: 3px solid #fff;">${storagelist.endDate}</td>
			            <td style="border-bottom: 3px solid #fff;">${rentDate[status.index]} 일</td>
			            <td style="border-bottom: 3px solid #fff;">${storagelist.bill} 원</td>
			            <td style="border-bottom: 3px solid #fff;">${pay[status.index]} 원</td>
			        </tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>