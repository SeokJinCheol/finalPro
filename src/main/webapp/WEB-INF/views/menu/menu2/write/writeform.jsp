<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>등록된 물품을 대여현황에 등록하기</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/left-menu72.png" style="margin-right:10px;">
	    <font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">등록 → 대여</font>
	</div>

	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; width: 70%; margin-top:40px;">	
			<c:forEach items="${RegisterBoardform}" var="RegisterBoardform">
				<form action="RegisterBoardWrite" method="post" style="display: inline;">
					<input type="hidden" name="img" value="${RegisterBoardform.img}">
					<input type="hidden" name="codeNum" value="${RegisterBoardform.codeNum}">
					
					<table style="padding: 20px; width: 70%; border-collapse: collapse; border-spacing: 0; padding-top: 40px; padding-bottom: 20px;">
						<tr height="35">
							<td class="top-border" style="font-family: 'Jeju Gothic', sans-serif;">&nbsp;&nbsp;물 품 사 진</td>
		
							<td width=30 class="top-bottom-border">
								<select name="category" required style="border-radius: 4px; text-align: center; height: 27px; width: 82px;">
									<option value="${RegisterBoardform.category}" style="text-align:center;">${RegisterBoardform.category}</option>
									<option value="DIY용품" style="text-align:center;">DIY용품</option>
									<option value="공구" style="text-align:center;">공　　구</option>
									<option value="주방용품" style="text-align:center;">주방용품</option>
									<option value="전자기기" style="text-align:center;">전자기기</option>
									<option value="레져용품" style="text-align:center;">레져용품</option>
								</select>
							</td>
							
							<!-- 물품 소유자 -->
							<td width=65 class="top-bottom-border">
								<select name="company" required style="height:27px; border-radius:4px; text-align:center;">
									<option value="${RegisterBoardform.company}">${RegisterBoardform.company}</option>
									<option value="개인">개　인</option>
									<option value="업체">업　체</option>
								</select>
							</td>
		
							<td class="top-bottom-border">
								<input type="text" class="free-insert-title" name="title" style="width:140px; text-align:center;" required value="${RegisterBoardform.title}" maxlength="50">
							</td>
						</tr>
	
						<tr align=center>
							<td style="" rowspan="8" class="bottom-border2">
								&nbsp;<img src="/team4/resources/RequestImg/${RegisterBoardform.img}" style="margin-right: 5px; border-radius:5px; width: 300px; height: 310px;" class="w3-card-4">
							</td>
							
							<td style="text-align: center; font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid white;" class="bottom-border">작 성 자</td>
							
							<td class="bottom-border" colspan="2" align=center>
								<input type="text" value="${RegisterBoardform.reaquestId}" name="reaquestId" class="free-insert-title" style="text-align: center;" readonly>
							</td>
						</tr>
	
						<tr height="35">
							<td colspan="3" style="font-family: 'Jeju Gothic', sans-serif;">
							&nbsp;&nbsp;대 여 가 능 일 자<br>
							</td>
						</tr>
	
						<tr height=35>
							<td colspan="3" style="padding-left:2px; padding-top:0px;" class="bottom-border">
								&nbsp;<input type="date" class="free-insert-title" style="width:35%; text-align: center" name="startDate" value="${RegisterBoardform.startDate}" required/>
			                  	<!-- ~ 앞뒤로 ㄱ한자 1 숨겨져 있음 -->
			                  	　~　
			                  	<input type="date" class="free-insert-title" style="width:35%; text-align: center" value="${RegisterBoardform.endDate}" name="endDate" required/>
			                </td>
						</tr>
	
						<!-- 일일요금 설정 -->
						<tr height=38>
		               		<td style="text-align:left; font-family: 'Jeju Gothic', sans-serif;" class="bottom-border">
		               			&nbsp;&nbsp;요 금 설 정
		               		</td>
		               		
		               		<td colspan="2" class="bottom-border">
		               			<input type="number" name="bill" class="free-insert-title" required value="${RegisterBoardform.bill}" style="text-align: center; margin-left: 10px; width:150px;" min="10"> 원
		               		</td>
		                </tr>
		                
		                <!-- 보증금 설정 -->
						<tr height=38>
		               		<td style="text-align:left; font-family: 'Jeju Gothic', sans-serif;" class="bottom-border">
		               			&nbsp;&nbsp;보 증 금
		               		</td>
		               		
		               		<td colspan="2" class="bottom-border">
		               			<input type="number" name="deposit" class="free-insert-title" required style="text-align: center; margin-left: 10px; width:150px;" min="10" value="${RegisterBoardform.deposit}"> 원
		               		</td>
		                </tr>
						
						<!-- 물품소개 -->
						<tr>
		               		<td colspan="3" style="text-align:left; font-family: 'Jeju Gothic', sans-serif; padding-bottom:3px;">
		               			&nbsp;&nbsp;물 품 소 개
		               		</td>
		                </tr>
		                
						<tr>
							<td colspan="3" class="bottom-border2">
								<textarea class="free-insert-content-title" style="resize: none;" name="contents" rows="6" cols="35" required>${RegisterBoardform.contents}</textarea>
							</td>
						</tr>
					</table>
	               
	               	<input type="submit" class="free_update-btn222 w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전　환">
	            </form>
	            
	            &nbsp;&nbsp;&nbsp;
	            <input type="button" class="free_insert-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취　소" onclick="javascript:window.history.back();"/>
			</c:forEach>
		</div>
	</div>
</body>
</html>