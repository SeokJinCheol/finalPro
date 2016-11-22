<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<head>
<title>use</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height:500px; vertical-align:middle; display:table-cell;">
	     <div style="margin-bottom: 20px; margin-top: 70px;">  
	       <table>
		       <td><input type="button" value ="공급자물품 등록과정" onclick="location='provider'">></td>
		       <td><input type="button" value ="대여자물품 대여과정" onclick="location='lender'">></td>
		       <br><br>
		    </table>  
		    <table style="padding: 70px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px; width:550px; height:250px;">
				<center>
				<tr>
					<td colspan="4" style="height:27px;">
						<h5><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;■ 대 여 자 물 품 대 여 과 정 </b></h5>
					</td>
				</tr>
				
				<tr>
				    <td><img src="/team4/resources/images/ttt8.png"></td>
				</tr>
				
				<tr>
				    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대여자는 물품대여 페이지에서 대여가능한 물품의 사진과 상세내용을 <br>
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;불 수 있으며 자신이 원하는 물품에 대해서 대여신청을 할 수 있습니다.
				    </td>
				</tr>
			    </center>
			</table>	
			
			<br><br>
			<table  style="padding: 70px; padding-top: 30px;">
				<tr style="margin-bottom: 20px;">
					<h5><b>S T E P 1. 물 품 선 택</b></h5>
			    </tr>
			    <tr>
					<td><img src="/team4/resources/images/ttt10.png" style="margin-right:40px;"></td>
				</tr>
				<tr>
				    <td> 물품대여 메뉴를 클릭하고 원하시는 물품을 선택합니다.</td>
				</tr>
				
			</table>
			
			<br><br>
			<table  style="padding: 70px; padding-top: 30px;">
				<tr style="margin-bottom: 20px;">
					<h5><b>S T E P 2. 물 품 신 청</b></h5>
			    </tr>
				<tr>
				    <td>원하시는 물품에 신청하기 버튼을 눌러서 신청합니다. </td>
				</tr>
				
				<tr>
				    <td> (대여시작 날짜와 반납 날짜를 지켜주세요)</td>
                </tr>
				
			</table>
			
			<br><br>
			<table  style="padding: 70px; padding-top: 30px;">
				<tr style="margin-bottom: 20px;">
					<h5><b>S T E P 3. 물 품 대 여</b></h5>
			    </tr>
				<tr>
				    <td>물품대여 신청시 신청하신 날짜에 물품이 배송되어 집니다.</td>
				</tr>				
			</table>
			
			<br><br>
			<table  style="padding: 70px; padding-top: 30px;">
				<tr style="margin-bottom: 20px;">
					<h5><b>S T E P 4. 물 품 반 납</b></h5>
			    </tr>
				<tr>
				    <td>물품반납 날짜에 물품을 반납하고, 사이트에서 반납완료 신청해주세요.</td>
				</tr>		
				<tr>
				    <td>물품확인 과정을 거쳐서 반납처리가 완료됩니다.</td>
				</tr>			
			</table>  
		</div>
	</div>
</body>
</html>