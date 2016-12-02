<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 물품 대여관리/반납관리 page</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<!-- 물품대여관리 타이틀 -->
	<c:if test="${possibility == '대여신청'}">
		<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
			<img src="/team4/resources/images/left-menu72.png" style="margin-right:10px;">
		    <font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">물 품 대 여 관 리</font>
		</div>
	</c:if>
	
	<!-- 물품반납관리 타이틀 -->
	<c:if test="${possibility == '반납신청'}">
		<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
			<img src="/team4/resources/images/left-menu82.png" style="margin-right:10px;">
		    <font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">물 품 반 납 관 리 </font>
		</div>
	</c:if>

	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; width:550px; background-color: #fafafa;" class="w3-card-8">
			<table style="height:403px; width:550px; padding: 20px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
				<thead style="height:30px; table-layout:fixed">
					<tr class="bottom-border2" style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
			        	<td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">No.</td>
			        	<td width=140 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">물품사진</td>
			         	<td width=140 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">제　목</td>
			        	<td width=110 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">현　황</td>
			         	<td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000;">비　고</td>
			    	</tr>
				</thead>
				
				<tbody style="height:370px; overflow-y: auto; position: absolute;">
					<c:forEach items="${rentreadylist}" var="rentterlist">
						<tr onMouseOver="this.style.backgroundColor='#requestboardstatus'" onMouseOut="this.style.backgroundColor='#fafafa'" style="height:30px;">
					    	<td width=80 style="border-bottom: 3px solid #fff;">${rentterlist.codeNum}</td>
					    	<td width=140 style="border-bottom: 3px solid #fff;">
								<img src="/team4/resources/RequestImg/${rentterlist.img}" style="width: 100%; height: 110px;">
							</td>
					    	
							<!-- 제목이 12자 이상일 경우 줄여쓰기 기능 -->
		             		<c:choose>
			             		<c:when test="${fn:length(rentterlist.title) > 12}">
									<td width=140 style="border-bottom: 3px solid #fff; font-size: 1;">
										<c:out value="${fn:substring(rentterlist.title,0,12)}" />...
									</td>
								</c:when>
								
								<c:otherwise>
									<td width=140 style="border-bottom: 3px solid #fff; font-size: 1;">
										<c:out value="${rentterlist.title}"/>
									</td>
								</c:otherwise>
							</c:choose>
					
							<td width=110 style="border-bottom: 3px solid #fff;">${requestboardstatus.packageStatus}</td>
							
							<td width=80 style="border-bottom: 3px solid #fff;">
				            	<c:if test="${rentterlist.packageStatus == '대여신청'}">
									<form action="startrentForm" method="post">
										<input type="hidden" value="${rentterlist.codeNum}" name="codeNum">
										
										<input type="submit" value="" class="mycancel77-btn w3-card-4" onclick="in(${rentterlist.codeNum});	return false;">
									</form>
								</c:if>
				            	
				        		<c:if test="${rentterlist.packageStatus == '반납신청'}">
									<form action="storageendrent" method="post">
										<input type="hidden" value="${rentterlist.codeNum}" name="codeNum">
										
										<input type="submit" value="" class="mycancel2-btn w3-card-4" onclick="del(${rentterlist.codeNum});	return false;">
									</form>
								</c:if>
								
								<c:if test="${rentterlist.packageStatus == '대여신청'}">
									<div style="margin-top:10px; font-family: 'Jeju Gothic', sans-serif;">[ 대여시작 ]</div>
								</c:if>
								
								<c:if test="${rentterlist.packageStatus != '대여신청'}">
									<div style="margin-top:10px; font-family: 'Jeju Gothic', sans-serif;">[ 반납신청 ]</div>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>

<script type="text/javascript">
function in(name){
	var myselect= "mySelect"+name;
	
	if(confirm("대여를 시작하시겠습니까?") == true) {
		document.getElementById(name).status.value=document.getElementById(myselect).value;

		document.forms(name).submit();
	}
	
	else {
		return false;
	}
}

function del(name){
	var myselect= "mySelect"+name;
	
	if(confirm("반납신청을 하시겠습니까?") == true) {
		document.getElementById(name).status.value=document.getElementById(myselect).value;

		document.forms(name).submit();
	}
	
	else {
		return false;
	}
}
</script>
</html>