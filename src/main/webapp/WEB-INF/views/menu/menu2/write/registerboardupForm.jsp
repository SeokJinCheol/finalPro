<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>rantendForm</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/map22.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">대 여 신 청</font>
	</div>
		
    <div align=center style="background: #f5f6f7; width: 1350px; height: 600px; vertical-align: middle; display: table-cell;">		
		<div style="margin-bottom: 20px; width: 75%; margin-top:40px;">
		
			<c:forEach items="${registerform}" var="registerform">
				<table>
				    <tr height="35">
						<td colspan="2" class="top-border" style="font-family: 'Jeju Gothic', sans-serif;">　　T i t l e</td>
					</tr>
				    <tr>
						<td align=center style="padding-bottom:10px;" class="bottom-border">${registerform.title}</td>
					</tr>
					<tr height="35">
						<td colspan="2" class="top-border" style="font-family: 'Jeju Gothic', sans-serif;">     보 증 금 </td>
					</tr>
				    <tr>
						<td align=center style="padding-bottom:10px;" class="bottom-border">${registerform.bill}</td>
					</tr>
					<tr height="35">
						<td colspan="2" class="top-border" style="font-family: 'Jeju Gothic', sans-serif;">     대 여 료 </td>
					</tr>
				    <tr>
						<td align=center style="padding-bottom:10px;" class="bottom-border">${registerform.deposit}</td>
				    </tr>		
				    <tr height="35">
						<td colspan="2" class="top-border" style="font-family: 'Jeju Gothic', sans-serif;">     내 용 </td>
					</tr>
				    <tr>
						<td align=center style="padding-bottom:10px;" class="bottom-border">${registerform.contents}</td>
				    </tr>	
				    <tr>
				    	<td><img src="/team4/resources/RequestImg/${registerform.img}" style="width: 85%; height: 170px; border-radius: 7px;"></td>
				    </tr>
				</table>	
				
				<form action="registerboardup" name ="insert" method="post">
			    <table>
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
	                  		<input type="date" class="free-insert-title" style="width:35%; text-align: center; font-size:3px;" name="userendDate" min="${registerform.startDate}" max="${registerform.endDate}"  required/>
	                	</td>
					</tr>
					
					<tr align="center" height="30" style="padding-top:10px;">
	                  	<td  class="bottom-border2 top-border" colspan="2" onclick="test();return false;">
	                  		<b id="days">총 금 액 확 인 PUSH</b>
	                  	</td>
	               	</tr>
	               	
	               </table>
					<input type="hidden" value="${registerform.codeNum}" name="codeNum">
				<input type="submit" value="신청하기">
				</form>
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