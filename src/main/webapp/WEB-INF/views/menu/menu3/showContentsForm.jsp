<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>showPage</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; margin-top: 70px;">
			<h4>- 신청하기 -</h4>
		<div id="map" style="width:300px;height:300px;"></div>
		
		</div>
	</div>
	
	<div>
	<form name="insertSubmit" action="insertSubmit" method="post">	
	<table border="1">
	<tr>	<th>정보 띄우기</th>	</tr>
	<tr><th>제공자 id</th><td>${vo.registerId }</td></tr>
	<tr><th>주소</th><td>${vo.adress }</td></tr>
	<tr><th>건물 사진</th><td><img href="${vo.img }"></td></tr>
	<tr><th>일당 대여비</th><td>${vo.bill }</td></tr>
	<tr><th>대여 가능한 날짜 시작일</th><td>${vo.startDate }</td></tr>
	<tr><th>대여 가능한 날짜 종료일</th><td>${vo.endDate }</td></tr>
	<tr><th>제목</th><td>${vo.title }</td></tr>
	<tr><th>내용</th><td>${vo.contents }</td></tr>
	<!-- 로그인 된 사람의 ID값(세션 사용) -->
	<tr><th>신청자</th><td>${id }</td></tr>
	<tr><th>신청일</th><td><input type="date" name="startDate" min="${vo.startDate }" required/>~<input type="date" name="endDate" min="${vo.startDate }" max="${vo.endDate  }" required/></td></tr>
	<tr><th>행사명 및 세부 사항</th><td><input type ="text" name="contents"></td></tr>
	<tr><th onclick="test();return false;">총요금(선택 일수) 계산</th><td><p id="days"></p></td></tr>
	<tr><td><input onclick="test()" type="submit" value="신청하기"></td></tr>
	<input type="hidden" value="${vo.codeNum }" name="codeNum">
	<input type="hidden" value="${id }" name="id">
	<input type="hidden" value="${vo }" name="vo">
	<input type="hidden" name="bill">
	</form>
	</table>
		
		
	</div>

	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d8a783ab647cf241b46707bc4e31d1ac&libraries=clusterer"></script>
<script>
	function test() {
	var startDay = new Date(document.forms["insertSubmit"].elements["startDate"].value);
	
	var endDay = new Date(document.forms["insertSubmit"].elements["endDate"].value);
	
	if(startDay==null && endDay==null){
	alert("날짜를 채워 주세요!")
	
	/* 안돼네 */
	}else{
	var totalDay = Math.round(((endDay-startDay)/(1000 * 60 * 60 * 24)) + 1);

	var bill = ${vo.bill}*(totalDay);
	document.forms["insertSubmit"].elements["bill"].value = bill;
	document.getElementById("days").innerHTML=bill+"("+totalDay+")";
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
</body>
</html>