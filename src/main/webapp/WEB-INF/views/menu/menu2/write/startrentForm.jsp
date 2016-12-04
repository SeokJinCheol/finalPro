<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>물품대여관리</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/left-menu72.png" style="margin-right:10px;">
	    <font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">물 품 대 여 관 리</font>
	</div>

	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; width:820px; background-color: #fafafa" class="w3-card-8">
        	<table style="height:453px; width:820px; padding: 20px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; margin-top:10px; padding-bottom: 10px;">
	            <thead style="height:30px; table-layout:fixed">
		            <tr class="bottom-border2" style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
		                <td width=60 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">대여횟수</td>
		                <td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">등록자</td>
		                <td width=140 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">대여가능일자</td>
		                <td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">대여자</td>
		                <td width=140 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">대여일자</td>
		                <td width=110 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">일일요금</td>
		                <td width=110 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">보 증 금</td>
		                <td width=50 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">비 고</td>
		                <td width=50 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000;">부적격</td>
		            </tr>
		        </thead>

				<tbody style="height:420px; overflow-y: auto; position: absolute;">
					<c:forEach items="${rentstartlist}" var="rentstartlist">
						<c:forEach items="${storagecount}" var="storagecount">
							<tr onMouseOver="this.style.backgroundColor='#eff7fc'" onMouseOut="this.style.backgroundColor='#fafafa'" style="height:48px;">
						    	<td width=60 style="border-bottom: 3px solid #fff;">${storagecount.sNum}</td>
						    	
						    	<!-- 등록자 이름이 5자 이상일 경우 줄여쓰기 기능 -->
			             		<c:choose>
				             		<c:when test="${fn:length(rentstartlist.resister) > 5}">
										<td width=80 style="border-bottom: 3px solid #fff; font-size: 1;">
											<c:out value="${fn:substring(rentstartlist.resister,0,5)}" />... 님
										</td>
									</c:when>
									
									<c:otherwise>
										<td width=80 style="border-bottom: 3px solid #fff; font-size: 1;">
											<c:out value="${rentstartlist.resister}"/> 님
										</td>
									</c:otherwise>
								</c:choose>
		        				
		        				<!-- 대여가능일자 -->
		        				<td width=140 style="border-bottom: 3px solid #fff; text-align: left;">
									　${rentstartlist.startDate}<br>　　~　${rentstartlist.endDate}
								</td>
				
								<!-- 대여자 이름이 5자 이상일 경우 줄여쓰기 기능 -->
			             		<c:choose>
				             		<c:when test="${fn:length(rentstartlist.rentter) > 5}">
										<td width=80 style="border-bottom: 3px solid #fff; font-size: 1;">
											<c:out value="${fn:substring(rentstartlist.rentter,0,5)}" />... 님
										</td>
									</c:when>
									
									<c:otherwise>
										<td width=80 style="border-bottom: 3px solid #fff; font-size: 1;">
											<c:out value="${rentstartlist.rentter}"/> 님
										</td>
									</c:otherwise>
								</c:choose>
	
								<!-- 대여일자 -->
		        				<td width=140 style="border-bottom: 3px solid #fff; text-align: left;">
									　${rentstartlist.userstartDate}<br>　　~　${rentstartlist.userendDate}
								</td>

								<!-- 일일요금 -->
								<td width=110 style="border-bottom: 3px solid #fff;">
									<fmt:formatNumber value="${rentstartlist.bill}" pattern="￦ ###,###"/> 원
								</td>
	
								<!-- 보증금 -->
								<td width=110 style="border-bottom: 3px solid #fff;">
									<fmt:formatNumber value="${rentstartlist.deposit}" pattern="￦ ###,###"/> 원
								</td>
								
								<!-- 대여승인 버튼 -->
								<td width=50 style="border-bottom: 3px solid #fff;">
					            	<form action="startrent" method="post">
										<input type="hidden" name="sNum"  value="${storagecount.sNum}">
										<input type="hidden" name="codeNum" value="${rentstartlist.codeNum}">
										<input type="hidden" name="rentter" value="${rentstartlist.rentter}">
										<input type="hidden" name="bill" value="${rentstartlist.bill}">
										<input type="hidden" name="deposit" value="${rentstartlist.deposit}">
										
										<input type="submit" value="" class="mycancel2-btn77 w3-card-4" >
									</form>
					            </td>

								<!-- 대여부적격 버튼 -->
								<td width=50 style="border-bottom: 3px solid #fff;">
					            	<form action="rentcancel" method="post">
										<input type="hidden" value="${rentstartlist.codeNum}" name="codeNum">
										<input type="hidden" name="rentter" value="${rentstartlist.rentter}">
										<input type="hidden" value="admin" name="pagecheck">
										<input type="hidden" value="nomypage" name="mypage">
										
										<input type="submit" value="" class="mycancel2-btn75 w3-card-4" >
									</form>
					            </td>
							</tr>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>