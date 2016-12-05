<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>나의 등록 현황</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/left-menu32.png" style="margin-right:10px;">
	    <font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">나 의 등 록 현 황</font>
	</div>

	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<!-- 글쓰기 버튼 -->
		<div style="margin-bottom: 20px; width: 90%;">
			<security:authorize ifAnyGranted="role_user, role_com, role_master">
				<div class="w3-row">
					<div class="w3-col w3-right" style="margin-right: 88px; width: 10%; margin-bottom: 10px;">
						<br>
						<input type="button" class="button-write" value="글 쓰 기" onclick="location='requestwriteform'">
					</div>
				</div>
			</security:authorize>

			<security:authorize ifNotGranted="role_user, role_com, role_master">
				<div class="w3-row">
					<div class="w3-col w3-right" style="margin-right: 5px; width: 10%; margin-bottom: 7px;">
						<br>
					</div>
				</div>
			</security:authorize>

			<!-- 실질적인 리스트 뿌리기 -->
			<div style="margin-bottom: 20px; width:600px; background-color: #fafafa" class="w3-card-8">
			    <table style="width:603px; height:550px; padding: 70px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
					<thead style="table-layout:fixed; height:30px;">
						<tr class="top-border bottom-border2" style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
				        	<td width=70 style="font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid #fff;">No.</td>
				        	<td width=100 style="font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid #fff;">물품사진</td>
				         	<td width=170 style="font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid #fff;">제　 　목</td>
				         	<td width=100 style="font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid #fff;">현재상황</td>
				         	<td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid #fff;">수　정</td>
				         	<td width=80 style="font-family: 'Jeju Gothic', sans-serif;">종　료</td>
				    	</tr>
			    	</thead>
					
					<tbody style="height:520px; overflow-y: auto; position: absolute;">
			            <c:forEach items="${requestlist}" var="requestlist">
			            	<tr onMouseOver="this.style.backgroundColor='#eff7fc'" onMouseOut="this.style.backgroundColor='#fafafa'" style="height:100px;">
			                	<td width=70 style="border-bottom: 3px solid #fff;">${requestlist.codeNum}</td>
			                    <td width=100 style=" border-bottom: 3px solid #fff;"><img src="/team4/resources/RequestImg/${requestlist.img}" style="width: 100%; height: 95px;"></td>
			                    
			                    <!-- 제목이 12자 이상일 경우 줄여쓰기 기능 -->
			             		<c:choose>
				             		<c:when test="${fn:length(requestlist.title) > 12}">
										<td width=170 style="border-bottom: 3px solid #fff;">
											<c:out value="${fn:substring(requestlist.title,0,12)}" />...
										</td>
									</c:when>
									
									<c:otherwise>
										<td width=170 style="border-bottom: 3px solid #fff;">
											<c:out value="${requestlist.title}"/>
										</td>
									</c:otherwise>
								</c:choose>	

								<td width=100 style="border-bottom: 3px solid #fff;">${requestlist.packageStatus}</td>
								
								<!-- 수정 -->
								<td width=80 style="border-bottom: 3px solid #fff;">
			                        <form action="RequestBoardUpdateForm" method="post">
			                        	<input type="hidden" name="codeNum" value="${requestlist.codeNum}">
										<input type="hidden" name="mypage" value="nomypage">
			                            
			                            <input type="submit" value="" class="myfinish2-btn w3-card-4">
			                        </form>
		                    	</td>
			
								<!-- 종료 -->
		                    	<td width=80 style="border-bottom: 3px solid #fff;">
			                        <c:if test="${requestlist.packageStatus != '대여종료신청'}">
				                        <c:if test="${requestlist.packageStatus != '심사중'}">
				                            <form action="RequestEnd" method="post">
												<input type="hidden" name="codeNum" value="${requestlist.codeNum}">
												<input type="hidden" name="mypage" value="nomypage">
										
				                                <input type="submit" value="" class="myfinish-btn w3-card-4" onclick="stopStatus(); return false;">
				                            </form>
				                        </c:if>
			                        </c:if>
		                    	</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	function stopStatus() {
		if (confirm("대여 종료 하시겠습니까??") == true) {
			document.form.submit();
		} else { return false; }
	}
</script>
</html>