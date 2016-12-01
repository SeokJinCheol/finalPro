<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>장소등록하기</title>
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Jeju Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:95%;height:450px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:280px;margin:0 0 0 19px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.8);z-index: 1;font-size:5px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px; font-family: 'Jeju Gothic', sans-serif; height:auto;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:25px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:blue;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:5px 0 0 5px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px; color:black;}
#pagination .on {font-weight: bold; cursor: default; color:blue;}
</style>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">

<script type="text/javascript">
	//날짜처리
	window.onload = function() {
    	var now = new Date();
    
    	var date= (now.getYear()+1900)+'-'+fncLPAD((now.getMonth()+1)+'-'+ fncLPAD(now.getDate()));
    	
    	document.RR.startDate.min=date;
		document.RR.endDate.min=date;
	}
	
	function getdate() {
    	document.RR.startDate.max=document.RR.endDate.value;
	
	}

	function getMin() {
		document.RR.endDate.min=document.RR.startDate.value;
	
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

</head>
<body>
	<div class="row" style="background: #6699DC; color: white; height: 100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/map12.png" style="margin-right: 10px;"> 
		<font style="margin-right: 30px; font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px;">장 소 등 록</font>
	</div>
	
	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<!-- 위치 지정 -->
		<div class="map_wrap row" align=center style="margin-bottom:15px; margin-top:20px;">
			<!-- 지도 표시 -->
			<div class="w3-card-8" id="map" style="width: 95%; height: 450px; border-radius:10px ; position: relative; overflow: hidden;"></div>
	
			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<div>
						<form onsubmit="searchPlaces(); return false;" style="font-family: 'Jeju Gothic', sans-serif; height: 25px;">
							<b>장 소 명　:　</b>
							<input type="text" style="font-family: 'Jeju Gothic', sans-serif; height: 25px;" value="　한국소프트웨어기술진흥협회" id="keyword" size=10 class="free-search-title">
							
							<input type="submit" class="list-search" value="찾 기" style="font-size:12px; font-family: 'Jeju Gothic', sans-serif; width:20%; line-height: 21px; border:solid 1px #80b5ea">
						</form>
					</div>
				</div>
				<hr>
				
				<ul id="placesList"></ul>
				
				<div id="pagination"></div>
			</div>
		</div>

		<!-- 등록 입력 화면 -->
		<div style="margin-bottom: 20px; width: 70%; margin-top:40px;">	
			<form action="RRboardinsert" name="RR" method="post" enctype="multipart/form-data">
				<table style="padding: 20px; width: 70%; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 40px; padding-bottom: 20px;">
					<tr align="center" height="38">
				        <!-- 장소 카테고리 -->
				        <td width=75 class="top-bottom-border" style="padding-left:7px; padding-right:5px;">
				        	<select name="category" required style="height:27px; border-radius:4px; text-align:center;">
								<option value="강당" style="text-align:center;">강　당</option>
								<option value="사무실" style="text-align:center;">사 무 실</option>
								<option value="회의실" style="text-align:center;">회 의 실</option>
								<option value="공터" style="text-align:center;">공　터</option>
								<option value="기타" style="text-align:center;">기　타</option>
							</select>
						</td>
						
						<!-- 장소용도 -->
						<td width=65 class="top-bottom-border" style="">
							<select name="company" required style="height:27px; border-radius:4px; text-align:center;">
								<option value="개인">개　인</option>
								<option value="업체">업　체</option>
							</select>
						</td>
						
						<!-- 장소명 -->
						<td class="top-bottom-border">
							<input style="width: 97%;" type="text" name="title" class="free-insert-title" placeholder=" 장소명을 입력하세요." maxlength="30" required>
						</td>
				    </tr>

					<!-- 상세주소 표시 -->
					<tr>
	               		<td colspan="3" style="text-align:left; font-family: 'Jeju Gothic', sans-serif; padding-bottom:3px;">
	               			&nbsp;&nbsp;상 세 주 소
	               		</td>
	                </tr>
					
					<tr height=34>
						<td colspan="3" style="padding-left:2px; padding-top:0px;" class="bottom-border">
							<input type="hidden" name="adress" id="adress" required>
							<input type="hidden" name="spotNum" id="spotNum" required>
								
		                	<input type="text" id="inpo" class="free-insert-title" style="text-align: center; width:410px;" placeholder="　* 지도에서 위치를 선택하시면 자동으로 지정됩니다. *" readonly>
		                </td>
					</tr>
					
					<!-- 외관사진 -->
					<tr height=38>
	               		<td style="text-align:left; font-family: 'Jeju Gothic', sans-serif;" class="bottom-border">
	               			&nbsp;&nbsp;외 관 사 진
	               		</td>
	               		
	               		<td colspan="2" class="bottom-border">
	               			<input type="file" name="file" style="margin-left: 10px;">
	               		</td>
	                </tr>
		
					<!-- 대여가능한일자 -->
					<tr>
	               		<td colspan="3" style="text-align:left; font-family: 'Jeju Gothic', sans-serif; padding-bottom:3px;">
	               			&nbsp;&nbsp;대 여 가 능 일 자
	               		</td>
	                </tr>
					
					<tr height=34>
						<td colspan="3" style="padding-left:2px; padding-top:0px;" class="bottom-border">
							&nbsp;<input type="date" class="free-insert-title" style="width:35%; text-align: center" onclick="getdate()" name="startDate" required/>
		                  	<!-- ~ 앞뒤로 ㄱ한자 1 숨겨져 있음 -->
		                  	　~　
		                  	<input type="date" class="free-insert-title" onclick="getMin()" style="width:35%; text-align: center" min="" name="endDate" required/>
		                </td>
					</tr>
		
					<!-- 일일요금 설정 -->
					<tr height=38>
	               		<td style="text-align:left; font-family: 'Jeju Gothic', sans-serif;" class="bottom-border">
	               			&nbsp;&nbsp;요 금 설 정
	               		</td>
	               		
	               		<td colspan="2" class="bottom-border">
	               			<input type="text" name="bill" class="free-insert-title" required style="text-align: center; margin-left: 10px; width:150px;" maxlength="10"> 원
	               		</td>
	                </tr>
		
					<!-- 장소소개 -->
					<tr>
	               		<td colspan="3" style="text-align:left; font-family: 'Jeju Gothic', sans-serif; padding-bottom:3px;">
	               			&nbsp;&nbsp;장 소 소 개
	               		</td>
	                </tr>
					
					<tr height=34>
						<td colspan="3" style="padding-left:2px; padding-top:0px;" class="bottom-border2">			
		                	<textarea class="free-insert-content-title" style="resize: none;" name="contents" cols="48" rows="5" required maxlength="350"></textarea>
		                </td>
					</tr>
				</table>
				
				<p>
					<input type="submit" class="free_update-btn222 w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등　록" />
					&nbsp;&nbsp;&nbsp;
					<input type="button" class="free_insert-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취　소" onclick="location.href='menu3'"/>
				</p>
			</form>
		</div>
	</div>
</body>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=d8a783ab647cf241b46707bc4e31d1ac&libraries=services"></script>
<script>
	// 마커를 담을 배열입니다
	var markers = [];
	
	var addresses = [];
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places();  
	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({zIndex:1});
	
	// 키워드로 장소를 검색합니다
	searchPlaces();
	
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
	    var keyword = document.getElementById('keyword').value;
	
	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
	
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(status, data, pagination) {
	    if (status === daum.maps.services.Status.OK) {
	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data.places);
	
	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);
	
	    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
	        alert('검색 결과가 존재하지 않습니다.');
	       
	        return;
	
	    } else if (status === daum.maps.services.Status.ERROR) {
	        alert('검색 결과 중 오류가 발생했습니다.');
	       
	        return;
	    }
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new daum.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i], marker);
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
	
	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            daum.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });
	
	            daum.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });
	            
	            daum.maps.event.addListener(marker,'click', function(){
	            	 
	            	 searchDetailAddrFromCoords(marker.getPosition(), function(status, result) {
	            	        if (status === daum.maps.services.Status.OK) {
	            	          
	            	        }   
	            	        
	            	        document.forms["RR"].elements["inpo"].value = result[0].jibunAddress.name;
	            	        
	            	        document.forms["RR"].elements["adress"].value=result[0].jibunAddress.name;
	            	        document.forms["RR"].elements["spotNum"].value=marker.getPosition();
	            	        
	            	    });
	            })      
	            
	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };
	
	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].title);
	
	        fragment.appendChild(itemEl);
	    }
	
	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5><b>' + places.title + '</b></h5>';
	
	    if (places.newAddress) {
	        itemStr += '    <span>' + places.newAddress + '</span>' +
	                    '   <span class="jibun gray">' +  places.address  + '</span>';
	                    
	    } else {
	        itemStr += '    <span>' +  places.address  + '</span>'; 
	    }
	                 
	    itemStr += '  <span class="tel">' + places.phone  + '</span>' +
					'</div>';           
	
	    el.innerHTML = itemStr;
	    el.className = 'item';
	    
	    return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new daum.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	    
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
	    return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    
	    markers = [];
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	
	var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	    infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	
	// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	daum.maps.event.addListener(map, 'click', function(mouseEvent) {
		var latlng = mouseEvent.latLng;
		
	    searchDetailAddrFromCoords(mouseEvent.latLng, function(status, result) {
	        if (status === daum.maps.services.Status.OK) {
	        	var detailAddr = !!result[0].roadAddress.name ? '<div>도로명주소 : ' + result[0].roadAddress.name + '</div>' : '';
	            detailAddr += '<div>지번 주소 : ' + result[0].jibunAddress.name + '</div>';
	            
	            var content = '<div class="bAddr">' +
	                            '<span class="title">법정동 주소정보</span>' + 
	                            detailAddr + 
	                        '</div>';             
	                        
	            // 마커를 클릭한 위치에 표시합니다 
	            marker.setPosition(mouseEvent.latLng);
	            marker.setMap(map);
	
	            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	            infowindow.setContent(content);
	            infowindow.open(map, marker);
	        }   
	        
	        document.forms["RR"].elements["inpo"].value = result[0].jibunAddress.name;
	        
	        document.forms["RR"].elements["adress"].value=result[0].jibunAddress.name;
	        document.forms["RR"].elements["spotNum"].value=latlng.toString();
	         
	    });
	});

	function searchAddrFromCoords(coords, callback) {
	    // 좌표로 행정동 주소 정보를 요청합니다
	    geocoder.coord2addr(coords, callback);         
	}

	function searchDetailAddrFromCoords(coords, callback) {
    	// 좌표로 법정동 상세 주소 정보를 요청합니다
    	geocoder.coord2detailaddr(coords, callback);
	}
</script>
</html>