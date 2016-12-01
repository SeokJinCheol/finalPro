<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script>
/*클릭시 자료가 있는 지 체크 합니다.  */
function check() {
	
	if(document.forms["sendCode"].elements["codeNum"].value.length >= 1 ){

		document.forms["sendCode"].submit();
	}else{
		
		alert("보고싶은 장소를 선택해주세요!");
		
		return false;
 	}
}
</script>
<title>free_list</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/map22.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">지 도 찾 기 & 대 여</font>
	</div>
	
	<div align=center style="background: #f5f6f7; width: 1350px; height: 600px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; margin-top: 20px;">
			<!-- 지도나오는 부분 -->
			<div class="w3-card-8" id="map" style="border-radius:5px ; width:70%; height:400px;"></div>
		</div>
	
		<div>
			<form id="sendCode" action="showContentsForm" method=post >
				<input type="hidden" name="codeNum" value="" id="codeNum" >
				
				<table>
					<tr>
						<td>
							<!-- 위치 조절하느라 밀어놓은 거임~~ -->
			            	<textarea placeholder="&nbsp;&nbsp;* 장소를 선택한 후 버튼을 누르시면 더 상세정보 및 예약을 할 수 있습니다. *" class="free-insert-content-title" style="resize: none;" id="show" rows="4" cols="60" readonly required="required"></textarea>
						</td>
						
						<td>
							<input type="submit" class="mang-btn w3-card-8" value="" onclick="check(); return false;">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d8a783ab647cf241b46707bc4e31d1ac&libraries=clusterer"></script>
	<script>
	    var map = new daum.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	        center : new daum.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
	        level : 13 // 지도의 확대 레벨 
	    });
	    
	    //제이슨 정보 저장
	    var inpo=[${inpo}];
	    var marker = []
	    // 마커 클러스터러를 생성합니다 
	    // 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
	    // 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다 
	    // 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
	    // 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다 
	    var clusterer = new daum.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 10, // 클러스터 할 최소 지도 레벨 
	        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다 
	    });
	</script>
    
    <c:forEach end="${total-1}" begin="0" var="i" >
		<script>
			// 마커를 생성합니다
		    marker[${i}] = new daum.maps.Marker({
		    	map: map, // 마커를 표시할 지도
		    	position: inpo[${i}].spotNum, // 마커를 표시할 위치
		    	title : inpo[${i}].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			});
		        
			daum.maps.event.addListener(marker[${i}], 'click', function() {
		
		    var message = '\n　장 　 　 　 　 소　:　' + inpo[${i}].title + '\n';
		    message += '　대 여 가 능 일 자　:　' + inpo[${i}].startDate+'　~　' + inpo[${i}].endDate + '\n';
		        	    
		    var resultDiv = document.getElementById('show'); 
		    resultDiv.innerHTML = message;
		        	    
		    document.forms["sendCode"].elements["codeNum"].value=inpo[${i}].codeNum;
			});
		    // 클러스터러에 마커들을 추가합니다
		    clusterer.addMarkers(marker);
		</script>
	</c:forEach>
	
	<script>
		
	
	    // 마커 클러스터러에 클릭이벤트를 등록합니다 
	    // 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우 
	    // 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다 
	    daum.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
	
	    // 현재 지도 레벨에서 1레벨 확대한 레벨 
	    var level = map.getLevel()-1;
	
	    // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다 
	    	map.setLevel(level, {anchor: cluster.getCenter()});  
	    });
	</script>
</body>
</html>