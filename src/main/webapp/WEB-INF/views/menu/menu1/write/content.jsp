<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>물품 등록 상세보기</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right;line-height: 130px;">
		<img src="/team4/resources/images/free_content.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">상 세 보 기</font>
	</div>

	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; width: 75%; margin-top: 30px;">
			<c:forEach items="${result}" var="result">
				<table style="border-collapse: collapse; border-spacing: 0;">
					<tr height="35">
						<td class="top-border" style="font-family: 'Jeju Gothic', sans-serif;">&nbsp;&nbsp;물 품 사 진</td>
	
						<td width=30 class="top-bottom-border">
							<select name="category" readonly style="border-radius: 4px; text-align: center; height: 27px; width: 82px;">
								<option style="text-align: center;">${result.category}</option>
							</select>
						</td>
	
						<td class="top-bottom-border">
							<input type="text" class="free-insert-title" name="title" style="text-align:center; margin-left: 12px;" readonly value="${result.title}">
						</td>
					</tr>
					
					<tr align="center" height="35">
						<td align=right>
							<input type="text" style="width:100px; margin-right:14px; background-color: #80b5ea; cursor: default;" value="${result.packageStatus}" class="good1 w3-card-4" name="packageStatus" readonly>
						</td>						
						
						<td style="text-align: center; font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid white;" class="bottom-border">작 성 자</td>
						
						<td class="bottom-border">
							<input type="text" name="id" class="free-insert-title" value="${result.reaquestId}" style="text-align: center;" readonly>
						</td>
					</tr>
					
					<tr align=center>
						<td style="" rowspan="7" class="bottom-border2">
							&nbsp;<img src="/team4/resources/RequestImg/${result.img}" style="margin-right: 5px; border-radius:5px; width: 300px; height: 310px;" class="w3-card-4">
						</td>
					</tr>
	
					<tr height="35">
						<td colspan="2" style="font-family: 'Jeju Gothic', sans-serif;">
							대 여 가 능 일 자<br>
						</td>
					</tr>
					
					<tr>
						<td colspan="2" class="bottom-border" style="padding-bottom:10px;">
	                  		&nbsp;<input type="text" class="free-insert-title" style="width:35%; text-align: center;" value="${result.startDate}" readonly/>
	                  		<!-- ~ 앞뒤로 ㄱ한자 1 숨겨져 있음 -->
	                  		　~　
	                  		<input type="text" class="free-insert-title" style="width:35%; text-align: center;" value="${result.endDate}" readonly/>
	                	</td>
					</tr>
					
					<!-- 일일요금 -->
					<tr height="35">
	               		<td style="text-align:left; font-family: 'Jeju Gothic', sans-serif;" class="bottom-border">
	               			일 일 요 금
	               		</td>
	               		
	               		<td class="bottom-border" style="text-align: center; margin-left: 10px; width:150px;">
	               			<fmt:formatNumber value="${result.bill}" pattern="￦ ###,###"/> 원
	               		</td>
	                </tr>
	                
	                <!-- 보증금 -->
					<tr height="35">
	               		<td style="text-align:left; font-family: 'Jeju Gothic', sans-serif;" class="bottom-border">
	               			보 증 금
	               		</td>
	               		
	               		<td class="bottom-border" style="text-align: center; margin-left: 10px; width:150px;">
	               			<fmt:formatNumber value="${result.deposit}" pattern="￦ ###,###"/> 원
	               		</td>
	                </tr>

					<tr height="35">
						<td colspan="2" style="font-family: 'Jeju Gothic', sans-serif;">
							물 품 소 개<br>
						</td>	
					</tr>
					
					<tr>
						<td colspan="2" class="bottom-border2">
							<textarea class="free-insert-content-title" style="resize: none;" name="contents" rows="6" cols="35" readonly>${result.contents}</textarea>
						</td>
					</tr>
				</table>
			</c:forEach>
		</div>
	</div>
</body>
</html>