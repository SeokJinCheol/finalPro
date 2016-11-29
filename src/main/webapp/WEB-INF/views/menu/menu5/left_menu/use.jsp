<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>use</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right;line-height: 130px;">
		<img src="/team4/resources/images/left-use12.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">이 용 방 법</font>
	</div>

	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; width: 85%; margin-top:10px;">	
			<table  style="padding: 70px; padding-top: 30px;">
				<tr style="margin-bottom: 20px;">
					<td><img src="/team4/resources/images/use1.png" style="margin-right:40px;"></td>
					<td><h5><b>1. 회 원 가 입</b></h5>&nbsp;- Billy Bury는 서로의 신뢰를 중요시합니다.<br>&nbsp;- 간단한 정보와 주소, 카드 등으로 보다 쉽게 회원가입이 가능합니다.</td>
				</tr>
				
				<tr style="height: 20px;"></tr>
				
				<tr style="margin-bottom: 20px;">
					<td><img src="/team4/resources/images/use2.png" style="margin-right:40px;"></td>
					<td><h5><b>2. 대여 & 등록</b></h5>&nbsp;- 회원가입 후 빌리고 싶은 물품이 있는지 대여 게시판에서 확인합니다.<br>&nbsp;- 물품등록을 하고 싶다면 절차에 맞게 물품을 등록해주세요.</td>
				</tr>
				
				<tr style="height: 20px;"></tr>
				
				<tr style="margin-bottom: 20px;">
					<td><img src="/team4/resources/images/use3.png" style="margin-right:40px;"></td>
					<td><h5><b>3. 물 품 수 령</b></h5>&nbsp;- 대여 신청한 물품은 택배로 빠른시일 내에 배송됩니다.<br>&nbsp;- 반드시 수령 후, 수령확인을 눌러주세요.</td>
				</tr>
				
				<tr style="height: 20px;"></tr>
				
				<tr style="margin-bottom: 20px;">
					<td><img src="/team4/resources/images/use4.png" style="margin-right:40px;"></td>
					<td><h5><b>4. 물 품 반 납</b></h5>&nbsp;- 대여 기간이 끝난 물품은 포장하여 본사로 반납해주세요.<br>&nbsp;- 대여 기간을 잘 지켜주세요. 대여 기간을 초과하면 연체료가 부가 됩니다.</td>
				</tr>
				
				<tr style="height: 20px;"></tr>

				<tr style="margin-bottom: 20px;">
					<td><img src="/team4/resources/images/use5.png" style="margin-right:40px;"></td>
					<td><h5><b>5. 물 품 결 제</b></h5>&nbsp;- 대여료, 연체료 등은 개인정보에 등록된 카드에서 자동결제 됩니다.<br>&nbsp;- 상황에 따라 이용에 제한이 발생 할 수 있습니다.</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>