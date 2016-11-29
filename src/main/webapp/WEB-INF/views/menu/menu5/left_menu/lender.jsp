<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>lender</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right;line-height: 130px;">
		<img src="/team4/resources/images/intro11.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">물 품 등 록 과 정</font>
	</div>
	
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; width: 90%; margin-top:50px; margin-bottom:50px;">	
		    <div style="border-top:2px solid black; border-bottom:2px solid black; width: 300px;">
			    <p>
			    	<input type="button" class="intro-button-write" value ="물품등록 과정" onclick="location='provider'">
			    	&nbsp;&nbsp;&nbsp;
			    	<input type="button" class="intro-button-write" value ="물품대여 과정" onclick="location='lender'">
			    </p>
		    </div>
		    
		    <table  style="padding: 70px; padding-top: 20px;padding-bottom: 15px;">
				<tr>
					<td colspan="4" style="height:27px;">
						<h5><b>&nbsp;&nbsp;&nbsp;&nbsp;※ 물 품 대 여 과 정 ※</b></h5>
					</td>
				</tr>
				
				<tr>
				    <td><img src="/team4/resources/images/ttt8.png"></td>
				</tr>

				<tr>
				    <td style="padding-left:25px;">대여자는 물품대여 페이지에서 대여가능한 물품의 사진과 상세내용을 볼<br>
				        &nbsp;&nbsp;수 있으며 자신이 원하는 물품에 대해서 대여신청을 할 수 있습니다.
				    </td>
				</tr>
			</table>

			<table  style="padding: 90px; padding-top: 20px;padding-bottom: 15px; width: 590px;">
				<tr style="margin-bottom: 20px;">
					<td>
						<img src="/team4/resources/images/one.png">
						<font size="5"><b>물 품 선 택</b></font>
					</td>
			    </tr>

				<tr>
					<td style="padding-top:10px;"><img src="/team4/resources/images/ttt10.png" style="margin-right:40px;"></td>
				</tr>

				<tr>
				    <td style="text-align:center;padding-top:10px;">물품대여 메뉴를 누르시고 원하시는 물품을 선택합니다.</td>
				</tr>
			</table>
			
			<table  style="padding: 3px; padding-top: 40px;padding-bottom: 15px; width: 590px;">
				<tr style="margin-bottom: 20px;">
					<td>
						<img src="/team4/resources/images/two.png">
						<font size="5"><b>물 품 신 청</b></font>
					</td>
			    </tr>
			    
			    <tr>
					<td style="text-align:center; padding-top:10px;">원하시는 물품의 신청하기 버튼을 눌러서 신청합니다.</td>
				</tr>
				
				<tr>
				    <td style="text-align:center; padding-top:5px;"><b>※ 대여시작 날짜와 반납 날짜를 확인 후 지켜주시기 바랍니다. ※</b></td>
                </tr>
			</table>
			
			<table  style="padding: 3px; padding-top: 40px;padding-bottom: 15px; width: 590px;">
				<tr style="margin-bottom: 20px;">
					<td>
						<img src="/team4/resources/images/three.png">
						<font size="5"><b>물 품 대 여</b></font>
					</td>
			    </tr>
			    
			    <tr>
					<td style="text-align:center; padding-top:10px;">물품대여 신청시, 신청하신 날짜에 물품이 배송됩니다.</td>
				</tr>
			</table>
			
			<table  style="padding: 3px; padding-top: 40px;padding-bottom: 15px; width: 590px;">
				<tr style="margin-bottom: 20px;">
					<td>
						<img src="/team4/resources/images/four.png">
						<font size="5"><b>물 품 반 납</b></font>
					</td>
			    </tr>
			    
			    <tr>
					<td style="text-align:center; padding-top:10px;">반납 날짜에 맞춰 물품을 반납하고, 사이트에서 반납완료를 해주시기 바랍니다.</td>
				</tr>
				
				<tr>
					<td style="text-align:center; padding-top:10px;">물품반납 확인과정을 거쳐서 반납처리가 진행된 후 완료됩니다.</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>