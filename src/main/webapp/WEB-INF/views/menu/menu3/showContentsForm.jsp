<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>장소 상세보기</title>
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
			<form name="insertSubmit" action="insertSubmit" method="post">
				<table  style="border-collapse: collapse; border-spacing: 0;">
					<tr height="35">
						<td class="top-border" style="font-family: 'Jeju Gothic', sans-serif;">&nbsp;&nbsp;위 　 치</td>
	                    	
			            <td class="top-border" style="font-family: 'Jeju Gothic', sans-serif;">&nbsp;&nbsp;대 여 가 능 일 자</td>
					</tr>
					
					<!-- 상세주소 & 대여가능일자 -->
					<tr>
						<td>
							<input type="text" style="width:280px;" value=" ${vo.adress}" class="free-insert-title" name="adress" readonly>
						</td>
						
						<td class="bottom-border" align=center>
	                  		&nbsp;<input type="text" class="free-insert-title" style="width:38%; text-align: center" name="startDate" value="${vo.startDate}" readonly/>
	                  		<!-- ~ 앞뒤로 ㄱ한자 1 숨겨져 있음 -->
	                  		　~　
	                  		<input type="text" class="free-insert-title" style="width:38%; text-align: center" name="endDate" value="${vo.endDate}" readonly/>
	                  	</td>
					</tr>
					
					<!-- 위치 지도로 표시 -->
					<tr align=center>
						<td style="margin-right:50px; padding-bottom:10px;" rowspan="5">
							<!-- 지도나오는 부분 -->
							<div class="w3-card-4" id="map" style="border-radius:5px ; width:280px; height:350px;"></div>
						</td>
					</tr>
					
					<!-- 신청일자 -->
					<tr height="35">
	                    <td style="font-family: 'Jeju Gothic', sans-serif;">&nbsp;&nbsp;신 청 일 자</td>
					</tr>
					
					<tr align=center height="35">
	                	<td class="bottom-border">
	                  		&nbsp;<input type="date" class="free-insert-title" style="width:38%; text-align: center" required name="userstartDate" min="${vo.startDate }" value="${vo.userstartDate}"/>
	                  		<!-- ~ 앞뒤로 ㄱ한자 1 숨겨져 있음 -->
	                  		　~　
	                  		<input type="date" class="free-insert-title" style="width:38%; text-align: center" required name="userendDate" min="${vo.startDate }" max="${vo.endDate}" value="${vo.userendDate}"/>
	                	</td>
	               	</tr>
					
					<!-- 행사내용 -->
					<tr height="35">
	                    <td style="font-family: 'Jeju Gothic', sans-serif;">&nbsp;&nbsp;행 사 내 용</td>
					</tr>
					
					<tr align="center" height="35"> 
	                  	<td>
	                  		<textarea class="free-insert-content-title" style="resize: none; padding-bottom:10px;" name="contents" rows="10" cols="30" required></textarea>
	                  	</td>
	               	</tr>
	               	
	               	<tr align="center" height="30" style="padding-top:10px;">
	                  	<td  class="bottom-border2 top-border" colspan="2" onclick="test();return false;">
	                  		<b id="days">총 금 액　:　</b>
	                  	</td>
	                  	
	                  	<!-- <td><p id="days"></p></td> -->
	               	</tr>
				</table>				
				
				<p>
					<input type="submit" class="free_update-btn222 w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신　청" />
					&nbsp;&nbsp;&nbsp;
					<input type="button" class="free_insert-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취　소" onclick="location.href='menu3'"/>
				</p>
				
				<input type="hidden" value="${vo.codeNum }" name="codeNum">
 				<%-- <input type="hidden" value="${id}" name="id"> --%>
				<input type="hidden" value="${vo}" name="vo">
				<input type="hidden" name="bill">
			</form>
		</div>
	</div>
</body>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d8a783ab647cf241b46707bc4e31d1ac&libraries=clusterer"></script>
<script>
	function test() {
	var startDay = new Date(document.forms["insertSubmit"].elements["userstartDate"].value);
	
	var endDay = new Date(document.forms["insertSubmit"].elements["userendDate"].value);
	
	if(document.forms["insertSubmit"].elements["userstartDate"].value.length < 1 || document.forms["insertSubmit"].elements["userendDate"].value.length < 1){
	
		alert("날짜를 채워 주세요!")
	
	/* 안돼네 */
	}else{
	var totalDay = Math.round(((endDay-startDay)/(1000 * 60 * 60 * 24)) + 1);

	var bill = ${vo.bill} * (totalDay);

	document.forms["insertSubmit"].elements["bill"].value = bill;
	
	document.getElementById("days").innerHTML = "￦ " + bill + " 원" +" ("+totalDay+"일)";
	return false;}
	}

    var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new daum.maps.LatLng${vo.spotNum}, // 지도의 중심좌표 
        level : 2 // 지도의 확대 레벨 
    });
    var mark = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: new daum.maps.LatLng${vo.spotNum}, // 마커를 표시할 위치
        title : '${vo.adress}', // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
    });
</script>
</html>