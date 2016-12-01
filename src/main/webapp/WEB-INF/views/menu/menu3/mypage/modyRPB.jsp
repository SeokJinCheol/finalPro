<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>menu3_admin이 장소 대여 수정</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right;line-height: 130px;">
		<img src="/team4/resources/images/free_update.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">대 여 정 보 수 정</font>
	</div>
	
		<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
			<div style="margin-bottom: 20px; width: 73%; margin-top:40px;">
					<table style="border-collapse: collapse; border-spacing: 0; margin-bottom: 30px;">
						<tr>
		               		<td colspan="2" style="font-family: 'Jeju Gothic', sans-serif;">&nbsp;&nbsp;등록자 정보 현황</td>
		                </tr>
						
						<tr align="center" height="35">
			            	<td width=80 class="top-bottom-border">
			            		<input type="text" style="text-align: center;" class="free-insert-title" value="No. ${vo.codeNum}" name="codeNum" readonly>
		                  	</td>
			            
			                <td class="top-bottom-border">
			                	<input type="text" value=" ${vo.adress}" class="free-insert-title" name="adress" readonly>
			                </td>
		             	</tr>
							
						<tr align="center" height="35">
		               		<td style="text-align: center; font-family: 'Jeju Gothic', sans-serif; border-right:1px solid white;" class="bottom-border">등　록　자</td>
		               		<td class="bottom-border"><input type="text" name="registerId" class="free-insert-title" value="${vo.registerId}" style="text-align:center;" readonly></td>
		               	</tr>
						
						<tr>
		               		<td colspan="2" style="font-family: 'Jeju Gothic', sans-serif;">&nbsp;&nbsp;대 여 가 능 일 자　&　장 소 소 개</td>
		                </tr>
	
						<tr height="20">
		                	<td colspan="2">
		                  		&nbsp;<input type="text" class="free-insert-title" style="width:22%; text-align: center" name="startDate" value="${vo.startDate}" readonly/>
		                  		<!-- ~ 앞뒤로 ㄱ한자 1 숨겨져 있음 -->
		                  		　~　
		                  		<input type="text" class="free-insert-title" style="width:22%; text-align: center" name="endDate" value="${vo.endDate}" readonly/>
		                  	</td>
		               	</tr>
	
						<tr height="35"> 
		                  	<td colspan="2" class="bottom-border2">
		                  		&nbsp;<textarea class="free-insert-content-title" style="resize: none;" name="contents" rows="3" cols="45" readonly>${dto.contents}</textarea>
		                  	</td>
		               	</tr>
					</table>
					<form name="RPBupdate" action="RPBupdate" method="post">
						<input type="hidden" value="${vo.codeNum}" name="codeNum">
						<input type="hidden" value="${vo.seqNum}" name="seqNum">
					<table style="border-collapse: collapse; border-spacing: 0;">
						<tr>
		               		<td colspan="2" style="font-family: 'Jeju Gothic', sans-serif;">&nbsp;&nbsp;대여자 정보 현황</td>
		                </tr>
						
						<tr align="center" height="35">
		               		<td width=80 style="text-align: center; font-family: 'Jeju Gothic', sans-serif; border-right:1px solid white;" class="top-bottom-border">대　여　자</td>
		               		<td class="top-bottom-border"><input type="text" name="reaquestId" class="free-insert-title" value="${vo.reaquestId}" style="text-align:center;" readonly></td>
		               	</tr>
						
						<tr>
		               		<td colspan="2" style="font-family: 'Jeju Gothic', sans-serif;">&nbsp;&nbsp;신 청 일 자　&　내 용</td>
		                </tr>
						
						<tr height="20">
		                	<td colspan="2">
		                  		&nbsp;<input type="date" class="free-insert-title" style="width:34%; text-align: center" name="userstartDate" value="${vo.userstartDate}"/>
		                  		<!-- ~ 앞뒤로 ㄱ한자 1 숨겨져 있음 -->
		                  		　~　
		                  		<input type="date" class="free-insert-title" style="width:34%; text-align: center" name="userendDate" value="${vo.userendDate}"/>
		                  	</td>
		               	</tr>
	
						<tr height="35"> 
		                  	<td colspan="2" class="bottom-border">
		                  		&nbsp;<textarea class="free-insert-content-title" style="resize: none;" name="contents" rows="3" cols="45" maxlength="350">${vo.contents}</textarea>
		                  	</td>
		               	</tr>
						
						<tr align="center" height="20">
		                  	<td class="bottom-border2 top-border" colspan="2">
		                  		<b>결 제 금 액　:　</b><fmt:formatNumber value="${vo.bill}" pattern="￦ ###,###"/> 원
		                  		<input type="hidden" value="${vo.bill}" name="bill">
		                  	</td>
		               	</tr>
		            </table>
					
					<p>
						<input type="submit" class="free_update-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수　정" />
						&nbsp;&nbsp;&nbsp;
						<input type="button" class="free_insert-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취　소" onclick="location.href='myRPBlist'"/>
					</p>
			</div>
		</div>
</body>
</html>