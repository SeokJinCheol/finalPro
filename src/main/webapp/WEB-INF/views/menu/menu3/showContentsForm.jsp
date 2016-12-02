<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	//날짜처리
	window.onload = function() {
    	var now = new Date();
  
    	var startDate= new Date(${vo.startDate});
  if(now < startDate){
    	var date= (now.getYear()+1900)+'-'+fncLPAD((now.getMonth()+1)+'-'+ fncLPAD(now.getDate()));
    	
    	document.insertSubmit.userstartDate.min=date;
		document.insertSubmit.userendDate.min=date;
  }
  }
	
	function getdate() {
    	document.insertSubmit.userstartDate.max=document.insertSubmit.endDate.value;
	
	}

	function getMin() {
		document.insertSubmit.userendDate.min=document.insertSubmit.userstartDate.value;
	
	}

	function fncLPAD(num) {
	    if(num < 10) { 
	    	return '0' + num;
	    }
	    
	    else {
	    	return num;
	    }
	}
	

</script>
<title>장소 상세보기</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/free_update.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">대관 신청 등록</font>
	</div>

	<div align=center style="background: #f5f6f7; width: 1350px; height: 600px; vertical-align: middle; display: table-cell;">		
		<div style="margin-bottom: 20px; width: 75%; margin-top:40px;">
			<form name="insertSubmit" action="insertSubmit" method="post">
				<table  style="border-collapse: collapse; border-spacing: 0;">
					<tr height="35">
						<td colspan="2" class="top-border" style="font-family: 'Jeju Gothic', sans-serif;">　　위 치　&　외 관 사 진</td>
					</tr>
					
					<!-- 상세주소 -->
					<tr align=center>
						<td colspan="2">
							<input type="text" style="padding-bottom:10px; width:540px;" value=" ${vo.adress}" class="free-insert-title" name="adress" readonly>
						</td>
					</tr>
					
					<!-- 지도 & 외관사진 표시 -->
					<tr align=center>
						<td style="padding-bottom:10px; padding-left:20px; padding-right:20px;" class="bottom-border">
							<!-- 지도 -->
							<div class="w3-card-4" id="map" style="border-radius:5px ; width:250px; height:300px;"></div>
						</td>
						
						<td align=center style="padding-bottom:10px;" class="bottom-border">
							<!-- 외관사진 -->
							<div class="w3-card-4" style="border-radius:5px; width:250px; height:300px;">
								<img src="/team4/resources/BoardImg/${vo.img}" style="border-radius:5px; width: 250px; height: 300px;">
							</div>
						</td>
					</tr>
					
					<!-- 대여가능일자 & 신청일자 타이틀 -->
					<tr height="35">
						<td style="font-family: 'Jeju Gothic', sans-serif; padding-bottom:0px;">　　대 여 가 능 일 자</td>
						<td style="font-family: 'Jeju Gothic', sans-serif; padding-bottom:0px;">　　신 청 일 자</td>
					</tr>
					
					<!-- 날짜 선택 -->
					<tr align=center >
						<!-- 대여가능일자 -->
						<td class="bottom-border" align=center width=300 style="padding-bottom:10px;">
	                  		&nbsp;<input type="text" class="free-insert-title" style="width:35%; text-align: center; font-size:3px;" name="startDate" value="${vo.startDate}" readonly/>
	                  		<!-- ~ 앞뒤로 ㄱ한자 1 숨겨져 있음 -->
	                  		　~　
	                  		<input type="text" class="free-insert-title" style="width:35%; text-align: center; font-size:3px;" name="endDate" value="${vo.endDate}" readonly/>
	                  	</td>
	                  	
	                  	<!-- 신청일자 -->
	                  	<td class="bottom-border" width=300 style="padding-bottom:10px;">
	                  		&nbsp;<input type="date" class="free-insert-title" style="width:35%; text-align: center; font-size:3px;" required name="userstartDate" onclick="getdate()" min="${vo.startDate }" max="${vo.endDate}" value="${vo.userstartDate}"/>
	                  		<!-- ~ 앞뒤로 ㄱ한자 1 숨겨져 있음 -->
	                  		　~　
	                  		<input type="date" class="free-insert-title" style="width:35%; text-align: center; font-size:3px;" required name="userendDate" onclick="getmin()" min="${vo.startDate }" max="${vo.endDate}" value="${vo.userendDate}"/>
	                	</td>
					</tr>
					
					<!-- 장소소개 & 사용용도 타이틀 -->
					<tr height="35">
						<td style="font-family: 'Jeju Gothic', sans-serif; padding-bottom:0px;">　　장 소 소 개</td>
						<td style="font-family: 'Jeju Gothic', sans-serif; padding-bottom:0px;">　　사 용 용 도</td>
					</tr>
					
					<tr align="center" height="35">
						<!-- 장소소개 -->
	                  	<td style="padding-bottom:3px;">
	                  		<textarea class="free-insert-content-title" style="resize: none;" name="readonlycontents" rows="6" cols="28" required readonly="readonly">${vo.contents}</textarea>
	                  	</td>
						
						<!-- 사용용도 -->
	                  	<td style="padding-bottom:3px;">
	                  		<textarea class="free-insert-content-title" style="resize: none;" name="contents" rows="6" cols="28" required maxlength="350"></textarea>
	                  	</td>
	               	</tr>
					
	               	<tr align="center" height="30" style="padding-top:10px;">
	                  	<td  class="bottom-border2 top-border" colspan="2" onclick="test(); return false;">
	                  		<b id="days">총 금 액　:　</b>
	                  	</td>
	               	</tr>
				</table>				
				
				<p>
					<input type="submit" class="free_update-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신　청" onclick="check(); return false;" />
					&nbsp;&nbsp;&nbsp;
					<input type="button" class="free_insert-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취　소" onclick="location.href='menu3'"/>
				</p>
				
				<input type="hidden" value="${vo.codeNum }" name="codeNum">
				<input type="hidden" name="bill">
			</form>
		</div>
	</div>
</body>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d8a783ab647cf241b46707bc4e31d1ac&libraries=clusterer"></script>
<script>

	function check(){
		
			var startDay = new Date(document.forms["insertSubmit"].elements["userstartDate"].value);
			
			var endDay = new Date(document.forms["insertSubmit"].elements["userendDate"].value);
			
			if(document.forms["insertSubmit"].elements["userstartDate"].value.length < 1 || document.forms["insertSubmit"].elements["userendDate"].value.length < 1){
			
				alert("신청일자를 지정해주세요!!")
				return false;
			}else if(document.insertSubmit.userstartDate.value>document.insertSubmit.userendDate.value){
						alert("대여가 끝나는 날짜가 시작한 날짜보다 빠를 수는 없습니다.");
						return false;
					}else if(document.insertSubmit.userstartDate.value<=document.insertSubmit.userendDate.value){

						var totalDay = Math.round(((endDay-startDay)/(1000 * 60 * 60 * 24)) + 1);

			var bill = ${vo.bill} * (totalDay);

			document.forms["insertSubmit"].elements["bill"].value = bill;
			
			document.getElementById("days").innerHTML = "￦ " + bill + " 원" +" ("+totalDay+"일)";
			
			document.insertSubmit.submit();
		}
	}
	
	function test() {
	var startDay = new Date(document.forms["insertSubmit"].elements["userstartDate"].value);
	
	var endDay = new Date(document.forms["insertSubmit"].elements["userendDate"].value);
	
	if(document.forms["insertSubmit"].elements["userstartDate"].value.length < 1 || document.forms["insertSubmit"].elements["userendDate"].value.length < 1){
	
		alert("신청일자를 지정해주세요!!")
		return false;
	}else if(document.insertSubmit.userstartDate.value>document.insertSubmit.userendDate.value){
				alert("대여가 끝나는 날짜가 시작한 날짜보다 빠를 수는 없습니다.");
				return false;
			}else if(document.insertSubmit.userstartDate.value<=document.insertSubmit.userendDate.value){

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