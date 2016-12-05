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
		<img src="/team4/resources/images/left-use22.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">이 용 규 칙</font>
	</div>

	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; width: 73%; margin-top:10px;">	
			<table style="padding: 70px; padding-top: 30px; padding-bottom: 10px;">
				<tr style="margin-bottom: 20px;">
					<td><img src="/team4/resources/images/num1.png" style="margin-right:40px;"></td>
					<td><h5><b>반 　 납</b></h5>&nbsp;- 대여한 물품 기한 내에 반납은 반드시 하셔야 합니다.<br>&nbsp;- 만약 물품이 파손 & 분실 시, 고객센터에 문의해 주세요.</td>
				</tr>
				
				<tr style="height: 20px;"></tr>
				
				<tr style="margin-bottom: 20px;">
					<td><img src="/team4/resources/images/num2.png" style="margin-right:40px;"></td>
					<td><h5><b>기 한 준 수</b></h5>&nbsp;- 반납기한을 반드시 지켜주시기 바랍니다.<br>&nbsp;- 반납기한을 연장하고 싶으시면 고객센터에 문의해 주세요.</td>
				</tr>
				
				<tr style="height: 20px;"></tr>
				
				<tr style="margin-bottom: 20px;">
					<td><img src="/team4/resources/images/num3.png" style="margin-right:40px;"></td>
					<td><h5><b>정 리 정 돈</b></h5>&nbsp;- 대관 & 대실, 물품 사용 후, 다음 사람을 위해 정리를 부탁드립니다.</td>
				</tr>
			</table>
		</div>
			
		<div style="margin-bottom:20px;">
			<table style="padding: 70px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px; width:550px; height:253px;">
				<tr>
					<td colspan="4" style="height:27px;">
						<h5><b>※ 패 널 티 규 정 ※</b></h5>
					</td>
				</tr>
							
				<tr style="margin-bottom: 20px; background-color: #6699DC; color:white; text-align: center;">
					<td colspan="3" style="border-top: 2px solid #000; border-right: 1px solid #f5f6f7;">
						대여자 준수사항 미이행 내용
					</td>
					
					<td style="border-top: 2px solid #000;">
						패널티 금액
					</td>
				</tr>
				
				<tr style="margin-bottom: 20px; text-align: center;">
		           <td rowspan="4" style="border-right: 1px solid #6699DC; border-bottom: 2px solid #000;">반 납 지 연</td>
		           <td rowspan="2" style="border-right: 1px solid #6699DC;">물　건</td>
		           <td style="border-right: 1px solid #6699DC; border-bottom:1px solid #6699DC;">1일 이하</td>
		           <td style="border-bottom: 1px solid #6699DC; ">본 대여료의 10%</td>
		        </tr>
		        
		        <tr style="margin-bottom: 20px; text-align: center;">
		           <td style="border-right: 1px solid #6699DC; border-bottom:1px solid #6699DC; ">1일 이상</td>
		           <td style="border-bottom: 1px solid #6699DC;">본 대여료의 150%</td>
		        </tr>
		        
		        <tr style="margin-bottom: 20px; text-align: center;">
		           <td rowspan="2" style="border-right: 1px solid #6699DC; border-top:1px solid #6699DC; border-bottom: 2px solid #000;">대　관</td>
		           <td style="border-right: 1px solid #6699DC; border-bottom:1px solid #6699DC;">1시간 이하</td>
		           <td style="border-bottom: 1px solid #6699DC;">1시간 상당의 대여료</td>
		        </tr>
		        
		        <tr style="margin-bottom: 20px; text-align: center;">
		           <td style="border-right: 1px solid #6699DC; border-bottom: 2px solid #000;">1시간 이상</td>
		           <td style="border-bottom: 2px solid #000;">본 대여료의 10%</td>
		        </tr>
			</table>
		</div>
			
		<div style="margin-bottom:20px;">
			<table style="padding: 70px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 5px;width:550px; height:253px;">
				<tr>
					<td colspan="3" style="height:27px;">
						<h5><b>※ 이 용 자 제 한 안 내 ※</b></h5>
					</td>
				</tr>
				
				<tr style="margin-bottom: 20px; background-color: #6699DC; color:white; text-align: center;">
					<td style="border-top: 2px solid #000; border-right: 1px solid #f5f6f7;">
						미이행 내용
					</td>
					
					<td colspan="2" style="border-top: 2px solid #000;">
						조 치 사 항
					</td>
				</tr>
			
				<tr style="margin-bottom: 20px;">
		       		<td style="text-align: center; width:130px; border-bottom: 1px solid #6699DC; border-right: 1px solid #6699DC;">위 반 횟 수</td>
		            <td colspan="2" style="border-bottom: 1px solid #6699DC;">
		            	&nbsp;&nbsp;&nbsp; - 1회 : 경고 <br>&nbsp;&nbsp;&nbsp; - 2회 : 패널티 금액 부과 <br>&nbsp;&nbsp;&nbsp; - 3회 이상 : 1개월 ~ 6개월 이용제한
		            </td>
		        </tr>
		        
		        <tr style="margin-bottom: 20px;">
		        	<td rowspan="3" style="text-align: center; width:130px; border-right: 1px solid #6699DC; border-bottom: 2px solid #000;">분 실　및　파 손</td>
		        	<td style="border-bottom: 1px solid #6699DC; border-right: 1px solid #6699DC; text-align: center;">분　실</td>
		        	<td style="border-bottom: 1px solid #6699DC;">&nbsp;&nbsp; - 1회 대여료 + 대여품목 단가 + 6개월 이용제한</td>
		        </tr>
		        
		        <tr style="margin-bottom: 20px;">
		        	<td rowspan="2" style="border-right: 1px solid #6699DC; border-bottom: 2px solid #000; text-align: center;">파　손</td>
		        	<td style="border-bottom: 1px solid #6699DC;">&nbsp;&nbsp; - 수리 불가 ==> 대여품목의 단가</td>
		        </tr>
		        
		        <tr style="margin-bottom: 20px;">
		        	<td style="border-bottom: 2px solid #000;">&nbsp;&nbsp; - 수리 가능 ==> 수리비 청구</td>
		        </tr>
			</table>
		</div>
	</div>
</body>
</html>