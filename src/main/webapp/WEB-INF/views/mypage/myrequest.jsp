<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>나의 물건 목록</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background: #6699DC; color: white; height: 100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/mywrite2.png" style="margin-right: 10px;"> 
		<font style="margin-right: 30px; font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px;">나의 물품 목록</font>
	</div>
	
	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
	    <div style="margin-bottom: 20px; width:550px; background-color: #fafafa" class="w3-card-8">
		    <table style="width:550px; height:403px; padding: 70px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
				<thead style="table-layout:fixed; height:33px;">
					<tr class="top-border bottom-border2" style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
			        	<td width=70 style="font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid #fff;">물품번호</td>
			        	<td width=100 style="font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid #fff;">사　진</td>
			         	<td width=140 style="font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid #fff;">제　 　목</td>
			         	<td width=100 style="font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid #fff;">현재상황</td>
			         	<td width=60 style="font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid #fff;">수　정</td>
			         	<td width=80 style="font-family: 'Jeju Gothic', sans-serif;">종료신청</td>
			    	</tr>
		    	</thead>
	
				<tbody style="height:373px; overflow-y: auto; position: absolute;">
		            <c:forEach items="${myrequest}" var="requestlist">
		            	<tr onMouseOver="this.style.backgroundColor='#eff7fc'" onMouseOut="this.style.backgroundColor='#fafafa'" style="height:100px;">
		                	<td width=70 style="border-bottom: 3px solid #fff;">${requestlist.codeNum}</td>
		                    <td width=100 style=" border-bottom: 3px solid #fff;"><img src="/team4/resources/RequestImg/${requestlist.img }" style="width: 100%; height: 95px;"></td>
		                    
		                    <!-- 제목이 8자 이상일 경우 줄여쓰기 기능 -->
		             		<c:choose>
			             		<c:when test="${fn:length(requestlist.title) > 8}">
									<td width=140 style="border-bottom: 3px solid #fff;">
										<c:out value="${fn:substring(requestlist.title,0,8)}" />...
									</td>
								</c:when>
								
								<c:otherwise>
									<td width=140 style="border-bottom: 3px solid #fff;">
										<c:out value="${requestlist.title}"/>
									</td>
								</c:otherwise>
							</c:choose>

		                    <td width=100 style="border-bottom: 3px solid #fff;">${requestlist.packageStatus}</td>
		                    <td width=60 style="border-bottom: 3px solid #fff;">
		                        <form action="RequestBoardUpdateForm" method="post">
		                        	<input type="hidden" name="mypage" value="mypage">
		                            <input type="hidden" name="codeNum" value="${requestlist.codeNum}">
		                            <input type="hidden" name="leftcontroll" value="mypage">
		                            <input type="submit" value="" class="myfinish2-btn w3-card-4">
		                        </form>
		                    </td>
		                    <td width=80 style="border-bottom: 3px solid #fff;">
		                        <c:if test="${requestlist.packageStatus != '대여종료신청'}">
			                        <c:if test="${requestlist.packageStatus != '심사중'}">
			                            <form action="RequestEnd" method="post">
			                                <input type="hidden" name="codeNum" value="${requestlist.codeNum}">
			                                <input type="hidden" name="leftcontroll" value="mypage">
			                                <input type="hidden" name="mypage" value="mypage">
			                                <input type="submit" value="" class="myfinish-btn w3-card-4">
			                            </form>
			                        </c:if>
		                        </c:if>
		                        
		                        <c:if test="${requestlist.packageStatus == '대여종료신청'}">
		                            종료신청중
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