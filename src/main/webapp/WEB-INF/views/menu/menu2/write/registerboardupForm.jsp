<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>물품대여신청</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/in99.png" style="margin-right:10px;">
	    <font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">물 품 대 여</font>
	</div>
		
    <div align=center style="background: #f5f6f7; width: 1350px; height: 600px; vertical-align: middle; display: table-cell;">		
		<div style="margin-bottom: 20px; width: 75%; margin-top: 30px;">
			<c:forEach items="${registerform}" var="registerform" >
				<form action="registerboardup" name ="insert" method="post" style="display: inline;">
					<table style="border-collapse: collapse; border-spacing: 0;">
						<tr height="35">
							<td class="top-border" style="font-family: 'Jeju Gothic', sans-serif;">&nbsp;&nbsp;물 품 사 진</td>
		
							<td width=30 class="top-bottom-border">
								<select name="category" readonly style="border-radius: 4px; text-align: center; height: 27px; width: 82px;">
									<option style="text-align: center;">${registerform.category}</option>
								</select>
							</td>
		
							<td class="top-bottom-border">
								<input type="text" class="free-insert-title" name="title" style="text-align:center; margin-left: 12px;" readonly value="${registerform.title}">
							</td>
						</tr>
						
						<tr align="center" height="35">
							<td align=right>
								<input type="text" style="width:100px; margin-right:14px; background-color: #80b5ea; cursor: default;" value="${registerform.packageStatus}" class="good1 w3-card-4" name="packageStatus" readonly>
							</td>						
							
							<td style="text-align: center; font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid white;" class="bottom-border">작 성 자</td>
							
							<td class="bottom-border">
								<input type="text" name="id" class="free-insert-title" value="${registerform.reaquestId}" style="text-align: center;" readonly>
							</td>
						</tr>
						
						<tr align=center>
							<td style="" rowspan="9" class="bottom-border2">
								&nbsp;<img src="/team4/resources/RequestImg/${registerform.img}" style="margin-right: 5px; border-radius:5px; width: 330px; height: 380px;" class="w3-card-4">
							</td>
						</tr>
			
						<tr height="35">
							<td colspan="2" style="font-family: 'Jeju Gothic', sans-serif;">
								대 여 가 능 일 자<br>
							</td>
						</tr>
						
						<tr>
							<td colspan="2" class="bottom-border" style="padding-bottom:10px;" align=center>
		                  		&nbsp;<input type="text" class="free-insert-title" style="width:41%; text-align: center;" name="startDate" value="${registerform.startDate}" readonly/>
		                  		<!-- ~ 앞뒤로 ㄱ한자 1 숨겨져 있음 -->
		                  		　~　
		                  		<input type="text" class="free-insert-title" style="width:41%; text-align: center;" name="endDate" value="${registerform.endDate}" readonly/>
		                	</td>
						</tr>
			
						<!-- 신청일자 -->
						<tr height="35">
							<td colspan="2" style="font-family: 'Jeju Gothic', sans-serif;" >
								신 청 일 자<br>
							</td>
						</tr>
						
						<tr>
							<td colspan="2" class="bottom-border" style="padding-bottom:10px;" align=center>
		                  		&nbsp;<input type="date" class="free-insert-title" style="width:41%; font-size:2px; text-align: center;" name="userstartDate" min="${registerform.startDate}" max="${registerform.endDate}" required/>
		                  		<!-- ~ 앞뒤로 ㄱ한자 1 숨겨져 있음 -->
		                  		　~　
		                  		<input type="date" class="free-insert-title" style="width:41%; font-size:2px; text-align: center;" name="userendDate" min="${registerform.startDate}" max="${registerform.endDate}" required/>
		                	</td>
						</tr>
	
						<!-- 일일요금 -->
						<tr height="35">
		               		<td style="text-align:left; font-family: 'Jeju Gothic', sans-serif;" class="bottom-border">
		               			일 일 요 금
		               		</td>
		               		
		               		<td class="bottom-border" style="text-align: center; margin-left: 10px; width:150px;">
		               			<fmt:formatNumber value="${registerform.bill}" pattern="￦ ###,###"/> 원
		               		</td>
		                </tr>
		                
		                <!-- 보증금 -->
						<tr height="35">
		               		<td style="text-align:left; font-family: 'Jeju Gothic', sans-serif;" class="bottom-border">
		               			보 증 금
		               		</td>
		               		
		               		<td class="bottom-border" style="text-align: center; margin-left: 10px; width:150px;">
		               			<fmt:formatNumber value="${registerform.deposit}" pattern="￦ ###,###"/> 원
		               		</td>
		                </tr>
				
						<tr height="35">
							<td colspan="2" style="font-family: 'Jeju Gothic', sans-serif;">
								물 품 소 개<br>
							</td>	
						</tr>
						
						<tr>
							<td colspan="2" class="bottom-border2">
								<textarea class="free-insert-content-title" style="resize: none;" name="contents" rows="6" cols="35" readonly>${registerform.contents}</textarea>
							</td>
						</tr>
					</table>
					
					<input type="hidden" value="${registerform.codeNum}" name="codeNum">	
					<input type="submit" class="free_update-btn222 w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신　청" />
				
<%-- 			    	<table>
						<!-- 대여가능일자 & 신청일자 타이틀 -->
						<tr height="35">
							<td style="font-family: 'Jeju Gothic', sans-serif; padding-bottom:0px;">　　대 여 가 능 일 자</td>
							<td style="font-family: 'Jeju Gothic', sans-serif; padding-bottom:0px;">　　신 청 일 자</td>
						</tr>
						
						<!-- 날짜 선택 -->
						<tr align=center >
							<!-- 대여가능일자 -->
							<td class="bottom-border" align=center width=300 style="padding-bottom:10px;">
		                  		&nbsp;<input type="text" class="free-insert-title" style="width:35%; text-align: center; font-size:3px;" name="startDate" value="${registerform.startDate}" readonly/>
		                  		<!-- ~ 앞뒤로 ㄱ한자 1 숨겨져 있음 -->
		                  		　~　
		                  		<input type="text" class="free-insert-title" style="width:35%; text-align: center; font-size:3px;" name="endDate" value="${registerform.endDate}" readonly/>
		                  	</td>
		                  	
		                  	<!-- 신청일자 -->
		                  	<td class="bottom-border" width=300 style="padding-bottom:10px;">
		                  		&nbsp;<input type="date" class="free-insert-title" style="width:35%; text-align: center; font-size:3px;"  name="userstartDate" min="${registerform.startDate}" max="${registerform.endDate}" required/>
		                  		<!-- ~ 앞뒤로 ㄱ한자 1 숨겨져 있음 -->
		                  		　~　
		                  		<input type="date" class="free-insert-title" style="width:35%; text-align: center; font-size:3px;" name="userendDate" min="${registerform.startDate}" max="${registerform.endDate}" required/>
		                	</td>
						</tr>
						
						<tr align="center" height="30" style="padding-top:10px;">
		                  	<td  class="bottom-border2 top-border" colspan="2" onclick="test();return false;">
		                  		<b id="days">총 금 액 확 인 PUSH</b>
		                  	</td>
		               	</tr>
	               </table>
					
					 --%>
				</form>
				
				&nbsp;&nbsp;&nbsp;
				<input type="button" class="free_insert-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취　소" onclick="javascript:window.history.back();"/>
			</c:forEach>
		</div>
	</div>
</body>

<script>
	function test() {
	var startDay = new Date(document.insert.elements["userstartDate"].value);
	
	var endDay = new Date(document.insert.elements["userendDate"].value);
	
	if(document.insert.elements["userstartDate"].value.length < 1 || document.insert.elements["userendDate"].value.length < 1){
	
		alert("신청일자를 지정해주세요!!")
	
	}else{
	var totalDay = Math.round(((endDay-startDay)/(1000 * 60 * 60 * 24)) + 1);

	var bill = ${registerform[0].bill} * (totalDay);  

	document.getElementById("days").innerHTML = "￦ " + bill + " 원" +" ("+totalDay+"일)" ;
	return false;}
	}
</script>
</html>