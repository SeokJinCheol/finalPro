<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>admin_장소정산</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background: #6699DC; color: white; height: 100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/left-location.png" style="margin-right: 10px;"> 
		<font style="margin-right: 30px; font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px;">장 소 정 산</font>
	</div>

	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<!-- 검색 -->
		<div class="w3-row" style="margin-top:50px; margin-bottom:20px;" >
			<form action="menu3_4" method=post id="search">
				<input type="month" style="border-radius: 6px; width:16%;" class="free-insert-title" name="month1" id="month1" max="">
				<input type="hidden" name="month2" id="month2">
				
				<select name="keyField" style="width:13%; border-radius:4px; text-align:center; height:27px;">
					<option value="#" style="text-align:center;">선택하세요.</option>
					<option value="codeNum" style="text-align:center;">CodeNum</option>
					<option value="reaquestId" style="text-align:center;">I D</option>
					<option value="adress" style="text-align:center;">장소</option>
				</select>
				
				<input type="search" name="keyWord" placeholder="&nbsp;Search . . . " class="free-search-title" required="required"/>
				
				<input type="submit" class="list-search" value ="Search" onclick="getMonth(); return false;" style="width:8%;">
			</form>
		</div>

		<div style="margin-bottom: 20px; width:816px; background-color: #fafafa;" class="w3-card-8">
			<table style="height:400px; width:816px; padding: 20px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
				<thead style="height:30px; table-layout:fixed">
					<tr class="bottom-border2" style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
				        <td width=66 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">No.</td>
				        <td width=100 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">대여자</td>
				        <td width=110 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">대여일자</td>
				        <td width=110 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">반납일자</td>
				        <td width=100 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">대여비</td>
				        <td width=170 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">장　소</td>
				        <td width=100 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">현　황</td>
				        <td width=60 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000;">비　고</td>
				    </tr>
			    </thead>
			    
				<tbody style="height:340px; overflow-y: auto; position: absolute;">
					<c:forEach items="${list}" var="list">
						<c:set var="total" value="${total+list.bill }" />
							<tr onMouseOver="this.style.backgroundColor='#eff7fc'" onMouseOut="this.style.backgroundColor='#fafafa'" style="height:30px;">
						    	<td width=66 style="border-bottom: 3px solid #fff;">${list.codeNum }</td>
						    	<td width=100 style="border-bottom: 3px solid #fff;">${list.reaquestId } 님</td>
					            <td width=110 style="border-bottom: 3px solid #fff;">${list.userstartDate }</td>
					            <td width=110 style="border-bottom: 3px solid #fff;">${list.userendDate }</td>
					            <td width=100 style="border-bottom: 3px solid #fff;"><fmt:formatNumber value="${list.bill}" pattern="￦ ###,###"/> 원</td>
					            
					            <!-- 주소가 10자 이상일 경우 줄여쓰기 기능 -->
			             		<c:choose>
				             		<c:when test="${fn:length(list.adress) > 12 }">
										<td width=170 style="border-bottom: 3px solid #fff; font-size: 1;">
											<c:out value="${fn:substring(list.adress,0,12)}" />...
										</td>
									</c:when>
									
									<c:otherwise>
										<td width=170 style="border-bottom: 3px solid #fff; font-size: 1;">
											<c:out value="${list.adress }"/>
										</td>
									</c:otherwise>
								</c:choose>
					            
					            <td width=100 style="border-bottom: 3px solid #fff;">${list.packageStatus }</td>
					            <td width=60 style="border-bottom: 3px solid #fff;">
					            	<form action="modifyRPB" method="post">
										<input type="hidden" name="seqNum" value="${list.seqNum }">
										<input type="submit" value="OK">
									</form>
					            </td>
					        </tr>
					</c:forEach>   
				</tbody>
				
				<tfoot style="height:30px; table-layout:fixed">
					<tr>
						<th width=66 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000;">총 결 산</th>
						<td colspan="7" style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000;">
							총 금액　:　<fmt:formatNumber value="${total}" pattern="￦ ###,###"/> 원
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
	window.onload = function() {
		var now = new Date();
		var date = (now.getYear() + 1900) + '-' + fncLPAD((now.getMonth() + 1));

		document.getElementById('search').elements['month1'].value = date;
		document.getElementById('search').elements['month1'].max = date;
	}

	function fncLPAD(num) {
		if (num < 10) {
			return '0' + num;
		} else {
			return num;
		}
	}

	function getMonth() {

		var month = new Date(
				document.getElementById('search').elements["month1"].value);
		if (month.getMonth() == 11) {
			var date2 = (month.getYear() + 1901) + '-01';
		} else {
			var date2 = (month.getYear() + 1900) + '-'
					+ fncLPAD((month.getMonth() + 2));
		}
		document.getElementById('search').elements['month2'].value = date2;

		document.getElementById('search').submit();
	}
</script>
</html>