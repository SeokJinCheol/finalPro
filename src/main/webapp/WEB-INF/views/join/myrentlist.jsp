<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>나의 대여 목록</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background: #6699DC; color: white; height: 100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/lend2.png" style="margin-right: 10px;"> 
		<font style="margin-right: 30px; font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px;">나의 대여 목록</font>
	</div>
	
	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
	    <div style="margin-bottom: 20px; width:600px; background-color: #fafafa" class="w3-card-8">
	    	<table style="width:603px; height:403px; padding: 70px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
				<thead style="table-layout:fixed; height:30px;">
					<tr class="top-border bottom-border2" style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
			        	<td width=70 style="font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid #fff;">물품번호</td>
			        	<td width=130 style="font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid #fff;">물품사진</td>
			         	<td width=170 style="font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid #fff;">제　 　목</td>
			         	<td width=150 style="font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid #fff;">대여기간</td>
			         	<td width=80 style="font-family: 'Jeju Gothic', sans-serif;">비　고</td>
			    	</tr>
			    </thead>
	
				<tbody style="height:370px; overflow-y: auto; position: absolute;">
					<c:forEach items="${MyRegisterselect}" var="MyRegisterselect">
						<tr onMouseOver="this.style.backgroundColor='#eff7fc'" onMouseOut="this.style.backgroundColor='#fafafa'" style="height:100px;">
		                	<td width=70 style="border-bottom: 3px solid #fff;">${MyRegisterselect.codeNum}</td>
		                    <td width=130 style="border-bottom: 3px solid #fff;"><img src="/team4/resources/RequestImg/${MyRegisterselect.img}" style="width: 100%; height: 95px;"></td>
		                    
		                    <!-- 제목이 12자 이상일 경우 줄여쓰기 기능 -->
		             		<c:choose>
			             		<c:when test="${fn:length(MyRegisterselect.title) > 12}">
									<td width=170 style="border-bottom: 3px solid #fff;">
										<c:out value="${fn:substring(MyRegisterselect.title,0,12)}" />...
									</td>
								</c:when>
								
								<c:otherwise>
									<td width=170 style="border-bottom: 3px solid #fff;">
										<c:out value="${MyRegisterselect.title}"/>
									</td>
								</c:otherwise>
							</c:choose>

		                    <!-- 대여기간 -->
							<td width=150 style="border-bottom: 3px solid #fff;">
								${MyRegisterselect.userstartDate}<br>　　~　${MyRegisterselect.userendDate}
							</td>
							
		                    <td width=80 style="border-bottom: 3px solid #fff;">								
								<c:if test="${MyRegisterselect.packageStatus == '대여중'}">
									<form action="reviewendrent" method="post">
										<input type="hidden" value="${MyRegisterselect.codeNum}" name="codeNum">
										<input type="hidden" value="mypage" name="mypage">
										
										<input type="submit" value="" class="mycancel2-btn w3-card-4">
									</form>
								</c:if>
								
								<c:if test="${MyRegisterselect.packageStatus == '대여신청'}">
									<form action="rentcancel" method="post">
										<input type="hidden" value="${MyRegisterselect.registerId}" name="rentter">
										<input type="hidden" value="${MyRegisterselect.codeNum}" name="codeNum">
										<input type="hidden" name="pagecheck" value="user">
										<input type="hidden" name="mypage" value="mypage">
										
										<input type="submit" value="" class="mycancel-btn w3-card-4">
									</form>
								</c:if>
								
								<c:if test="${MyRegisterselect.packageStatus != '대여신청'}">
									<div style="margin-top:10px; font-family: 'Jeju Gothic', sans-serif;">[ 반납신청 ]</div>
								</c:if>
								
								<c:if test="${MyRegisterselect.packageStatus == '대여신청'}">
									<div style="margin-top:10px; font-family: 'Jeju Gothic', sans-serif;">[ 신청취소 ]</div>
								</c:if>
		                    </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>