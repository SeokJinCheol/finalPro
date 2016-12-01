<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>예상비용계산</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:80px; text-align: right; line-height: 100px;">
		<img src="/team4/resources/images/money99999.png" style="margin-right:10px;">
		<font style="margin-right: 20px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">예 상 비 용 계 산</font>
	</div>	

	<div align=center>
		<form action="Cost" method="post" style="margin-top:20px;">
			<table style="padding-left: 70px; padding-right:70px; text-align:center; border-collapse: collapse; border-spacing: 0;">
				<tr style="margin-top:0px; margin-bottom:0px;  height:45px;">
					<td style="margin-top:0px; margin-bottom:0px;  height:30px;">
						<select name="keyword" style="width:100%; border-radius:4px; margin-top:0px; margin-bottom:0px; text-align:center; height:30px;">
	                    	<option value="#" style="text-align:center;">대여품목</option>
	                       	<option value="category1" style="text-align:center;">유아장난감(소)</option>
	                       	<option value="category2" style="text-align:center;">유아장난감(중)</option>
	                       	<option value="category3" style="text-align:center;">유아장난감(대)</option>
	                       	<option value="category4" style="text-align:center;">애기옷(~12개월)</option>
	                       	<option value="category5" style="text-align:center;">애기옷(12~24개월)</option>
	                       	<option value="category6" style="text-align:center;">애기옷(24~36개월)</option>
	                       	<option value="category7" style="text-align:center;">애기옷(36~48개월)</option>
	                       	<option value="category8" style="text-align:center;">전자제품:TV</option>
	                       	<option value="category9" style="text-align:center;">전자제품:컴퓨터</option>
	                       	<option value="category10" style="text-align:center;">전자제품:청소기</option>
	                       	<option value="category11" style="text-align:center;">가구:식탁</option>
	                       	<option value="category12" style="text-align:center;">가구:쇼파</option>
	                       	<option value="category13" style="text-align:center;">가구:옷장</option>
	                       	<option value="category14" style="text-align:center;">장소대여(10평)</option>
	                       	<option value="category15" style="text-align:center;">장소대여(20평)</option>
	                       	<option value="category16" style="text-align:center;">장소대여(30평)</option>
	                       	<option value="category17" style="text-align:center;">장소대여(40평)</option>
	                       	<option value="category18" style="text-align:center;">장소대여(50평)</option>
	                       	<option value="category19" style="text-align:center;">장소대여(60평)</option>
	                       	<option value="category20" style="text-align:center;">장소대여(70평)</option>
	                       	<option value="category21" style="text-align:center;">장소대여(80평)</option>
	                       	<option value="category22" style="text-align:center;">장소대여(90평)</option>
						</select>
					</td>
					
					<td rowspan="2" style="margin-top:0px; margin-bottom:0px; height:90px;">
						<p style="height:90px;">
							&nbsp;<input type="submit" class="login-btn w3-card-4"  value="계산하기" style="height:90px; font-family: Roboto sans-serif;" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Login" />
						</p>
					</td>
				</tr>
							
				<tr>
					<td style="margin-top:0px; margin-bottom:0px; height:45px;">
						<input type="number" min="1" name="times"  placeholder=" 대여일수를 입력하세요." style="width:100%; height:30px; margin-top:0px; margin-bottom:0px; padding-top:0px; padding-bottom:0px; border-color: rgb(169, 169, 169)" class="free-search-title" required>
					</td>
				</tr>
			</table>
		</form>
		
		<c:if test="${check == 0}">
			<h4 style="margin-top:30px;">예상 대여 비용계산</h4>
			
			<p style="margin-bottom:25px;">
				예상되는 비용　:　<fmt:formatNumber value="${check}" pattern="￦ ###,###"/> 원
			</p>
			
			<hr style="border:1px solid black">
		</c:if>
				
		<c:if test="${check != 0}">
			<h4 style="margin-top:30px;">예상 대여 비용계산</h4>
			
			<p style="margin-bottom:25px;">
				예상되는 비용　:　<fmt:formatNumber value="${check}" pattern="￦ ###,###"/> 원
			</p>
			
			<hr style="border:1px solid black">
		</c:if>

		<p>
			대여비용은 대여 상품의 품질과 상태에 따라 다르게 책정되므로,<br>
			실제 대여비용과 예상 대여비용은 <b>차이가 있을 수 있습니다.</b> <br>
			 <font size="2">(예상 대여 비용은 참고 사항입니다.)</font>
		</p>
	</div>
</body>
</html>