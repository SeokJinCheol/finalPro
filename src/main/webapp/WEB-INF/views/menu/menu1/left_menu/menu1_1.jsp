<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>menu1_1</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<script type="text/javascript">
   function visible() {
      document.getElementById('moreview').style.display = "block";
   }
</script>
<body>
	<!-- 업체별등록현황 타이틀 -->
	<c:if test="${company == '업체'}">
		<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
			<img src="/team4/resources/images/left-menu12.png" style="margin-right:10px;">
		    <font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">업 체 별 등 록 현 황</font>
		</div>
	</c:if>
	
	<!-- 개인별등록현황 타이틀 -->
	<c:if test="${company == '개인'}">
		<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
			<img src="/team4/resources/images/left-menu22.png" style="margin-right:10px;">
		    <font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">개 인 별 등 록 현 황</font>
		</div>
	</c:if>

	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<!-- 글쓰기 버튼 -->
		<div style="margin-bottom: 20px; width: 90%;">
			<security:authorize ifAnyGranted="role_user, role_com, role_master">
				<div class="w3-row">
					<div class="w3-col w3-right" style="margin-right: 30px; width: 10%; margin-bottom: 10px;">
						<br>
						<br> 
						<input type="button" class="button-write" value="글 쓰 기" onclick="location='requestwriteform'">
					</div>
				</div>
			</security:authorize>

			<security:authorize ifNotGranted="role_user, role_com, role_master">
				<div class="w3-row">
					<div class="w3-col w3-right" style="margin-right: 5px; width: 10%; margin-bottom: 7px;">
						<br> 
						<br>
					</div>
				</div>
			</security:authorize>

			<!-- 실질적인 리스트 뿌리기 -->
			<div>
				<c:forEach items="${requestlist}" var="requestlist" begin="0" end="5">
					<div style="width: 30%; border: 0px;" class="left">
						<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
							<!-- 카테고리 & 제목 -->
							<tr style="background-color: #8DBAF5;" align=center height=30>
								<td style="width: 40%;">
									<b><input type=text class="free-insert-title" value="[ ${requestlist.category} ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: center; margin-top: 1px;" readonly></b>
								</td>
	
								<td colspan="2" align="center" style="width: 90%; padding-right:6px;">
									<input type=text class="free-insert-title" value="${requestlist.title}" style="width:100%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: center; margin-top: 1px;" readonly>
								</td>
							</tr>

							<!-- 이미지 -->
							<tr >
								<td  height=175 colspan="3" align="center">
									<a class="effect" href="requestcontent?codeNum=${requestlist.codeNum}"> 
										<img src="/team4/resources/RequestImg/${requestlist.img }" style="width: 85%; height: 170px; border-radius: 7px;">
									</a>
								</td>
							</tr>

							<!-- 현황 버튼 -->
							<tr height=33 style="padding-bottom:2px;">
								<!-- user일때 -->
								<c:if test="${session_id != 'admin'}">
									<!-- 현황이 3자 이상일 경우 줄여쓰기 기능 -->
				             		<c:choose>
					             		<c:when test="${fn:length(requestlist.packageStatus) > 3 }">
											<td height=30 style="width: 140px;" align="left">
												<c:set value="${fn:substring(requestlist.packageStatus,0,4)}" var="packageStatus"/>
												
												<!-- 밑에 input submit 앞에 ㄱ한자 1 숨어잇음 -->
												　<b><input type="text" class="good1 w3-card-4" value="${packageStatus}" style="background-color: #80b5ea; cursor: default;" readonly></b>
											</td>
										</c:when>
										
										<c:otherwise>
											<td height=30 style="width: 140px;" align="left">
												<!-- 밑에 input submit 앞에 ㄱ한자 1 숨어잇음 -->
												　<b><input type="text" class="good1 w3-card-4" value="${requestlist.packageStatus}" style="background-color: #80b5ea; cursor: default;" readonly></b>
											</td>
										</c:otherwise>
									</c:choose>
								</c:if>
								
								<!-- admin 일때 -->
								<c:if test="${session_id == 'admin'}">
									<c:if test="${requestlist.packageStatus =='심사중'}">
										<td height=30 style="width: 140px;" align="left">
											<form action="RegisterBoardwrite" method="post" style="display:inline;">
												<input type="hidden" name="codeNum" value="${requestlist.codeNum}"> 
												
												<!-- 밑에 input submit 앞에 ㄱ한자 1 숨어잇음 -->
												　<b><input type="submit" class="good1 w3-card-4" value="심사하기" onMouseOver="this.style.backgroundColor='#4593e0'"onMouseOut="this.style.backgroundColor='#80b5ea'" style="background-color: #80b5ea;"></b>
											</form>
										</td>
									</c:if>

									<c:if test="${requestlist.packageStatus =='대여종료신청'}">
										<td  height=30 style="width: 140px;" align="left">
											<form action="Requestboardend" method="post" style="display:inline;">
												<input type="hidden" name="codeNum" value="${requestlist.codeNum}"> 
												
												<!-- 밑에 input submit 앞에 ㄱ한자 1 숨어잇음 -->
												　<b><input type="submit" class="good1 w3-card-4" value="대여종료" onMouseOver="this.style.backgroundColor='#4593e0'"onMouseOut="this.style.backgroundColor='#80b5ea'" style="background-color: #80b5ea;"></b>
											</form>
										</td>
									</c:if>

									<c:if test="${requestlist.packageStatus =='대여중'}">
										<td height=30 style="width: 140px;" align="left">
											<!-- 밑에 input submit 앞에 ㄱ한자 1 숨어잇음 -->
											　<b><input type="submit" class="good1 w3-card-4" value="대여중" onMouseOver="this.style.backgroundColor='#4593e0'"onMouseOut="this.style.backgroundColor='#80b5ea'" style="background-color: #80b5ea;"></b>
										</td>
									</c:if>
								</c:if>

								<!-- 쪽지보내기 -->
								<!-- ID가 4자 이상일 경우 줄여쓰기 기능 -->
			             		<c:choose>
				             		<c:when test="${fn:length(requestlist.reaquestId) > 4 }">
										<td height=30 style="width: 150px; padding-right:20px;" align="right">
											<input type=text class="good11" value="${fn:substring(requestlist.reaquestId,0,4)}.." onclick="window.open('mail?rid=${requestlist.reaquestId}', '','width=400, height=350, status=1')">
										</td>
									</c:when>
									
									<c:otherwise>
										<td height=30 style="width: 150px; padding-right:20px;" align="right">
											<input type=text class="good11" value="${requestlist.reaquestId}" onclick="window.open('mail?rid=${requestlist.reaquestId}', '','width=400, height=350, status=1')">
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</table>
					</div>
				</c:forEach>
			</div>

			<!-- 숨겨진 리스트 볼 경우 -->
			<div style="display: none" id="moreview">
				<c:forEach items="${requestlist}" var="requestlist" begin="6">
					<div style="width: 30%; border: 0px;" class="left">
						<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
							<!-- 카테고리 & 제목 -->
							<tr style="background-color: #8DBAF5;" align=center height=30>
								<td style="width: 40%;">
									<b><input type=text class="free-insert-title" value="[ ${requestlist.category} ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: center; margin-top: 1px;" readonly></b>
								</td>
	
								<td colspan="2" align="center" style="width: 90%; padding-right:6px;">
									<input type=text class="free-insert-title" value="${requestlist.title}" style="width:100%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: center; margin-top: 1px;" readonly>
								</td>
							</tr>

							<!-- 이미지 -->
							<tr >
								<td  height=175 colspan="3" align="center">
									<a href="requestcontent?codeNum=${requestlist.codeNum}"> 
										<img src="/team4/resources/RequestImg/${requestlist.img}" style="width: 85%; height: 170px; border-radius: 7px;">
									</a>
								</td>
							</tr>

							<!-- 현황 버튼 -->
							<tr height=33 style="padding-bottom:2px;">
								<!-- user일때 -->
								<c:if test="${session_id != 'admin'}">
									<!-- 현황이 3자 이상일 경우 줄여쓰기 기능 -->
				             		<c:choose>
					             		<c:when test="${fn:length(requestlist.packageStatus) > 3 }">
											<td height=30 style="width: 140px;" align="left">
												<c:set value="${fn:substring(requestlist.packageStatus,0,4)}" var="packageStatus"/>
												
												<!-- 밑에 input submit 앞에 ㄱ한자 1 숨어잇음 -->
												　<b><input type="text" class="good1 w3-card-4" value="${packageStatus}" style="background-color: #80b5ea; cursor: default;" readonly></b>
											</td>
										</c:when>
										
										<c:otherwise>
											<td height=30 style="width: 140px;" align="left">
												<!-- 밑에 input submit 앞에 ㄱ한자 1 숨어잇음 -->
												　<b><input type="text" class="good1 w3-card-4" value="${requestlist.packageStatus}" style="background-color: #80b5ea; cursor: default;" readonly></b>
											</td>
										</c:otherwise>
									</c:choose>
								</c:if>

								<!-- admin 일때 -->
								<c:if test="${session_id == 'admin'}">
									<c:if test="${requestlist.packageStatus =='심사중'}">
										<td height=30 style="width: 140px;" align="left">
											<form action="RegisterBoardwrite" method="post" style="display:inline;">
												<input type="hidden" name="codeNum" value="${requestlist.codeNum}"> 
												
												<!-- 밑에 input submit 앞에 ㄱ한자 1 숨어잇음 -->
												　<b><input type="submit" class="good1 w3-card-4" value="심사하기" onMouseOver="this.style.backgroundColor='#4593e0'"onMouseOut="this.style.backgroundColor='#80b5ea'" style="background-color: #80b5ea;"></b>
											</form>
										</td>
									</c:if>

									<c:if test="${requestlist.packageStatus =='대여종료신청'}">
										<td  height=30 style="width: 140px;" align="left">
											<form action="Requestboardend" method="post" style="display:inline;">
												<input type="hidden" name="codeNum" value="${requestlist.codeNum}"> 
												
												<!-- 밑에 input submit 앞에 ㄱ한자 1 숨어잇음 -->
												　<b><input type="submit" class="good1 w3-card-4" value="대여종료" onMouseOver="this.style.backgroundColor='#4593e0'"onMouseOut="this.style.backgroundColor='#80b5ea'" style="background-color: #80b5ea;"></b>
											</form>
										</td>
									</c:if>

									<c:if test="${requestlist.packageStatus =='대여중'}">
										<td height=30 style="width: 140px;" align="left">
											<!-- 밑에 input submit 앞에 ㄱ한자 1 숨어잇음 -->
											　<b><input type="submit" class="good1 w3-card-4" value="대여중" onMouseOver="this.style.backgroundColor='#4593e0'"onMouseOut="this.style.backgroundColor='#80b5ea'" style="background-color: #80b5ea;"></b>
										</td>
									</c:if>
								</c:if>
								
								<!-- 쪽지보내기 -->
								<!-- ID가 4자 이상일 경우 줄여쓰기 기능 -->
			             		<c:choose>
				             		<c:when test="${fn:length(requestlist.reaquestId) > 4 }">
										<td height=30 style="width: 150px; padding-right:20px;" align="right">
											<input type=text class="good11" value="${fn:substring(requestlist.reaquestId,0,4)}.." onclick="window.open('mail?rid=${requestlist.reaquestId}', '','width=400, height=350, status=1')">
										</td>
									</c:when>
									
									<c:otherwise>
										<td height=30 style="width: 150px; padding-right:20px;" align="right">
											<input type=text class="good11" value="${requestlist.reaquestId}" onclick="window.open('mail?rid=${requestlist.reaquestId}', '','width=400, height=350, status=1')">
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</table>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<!-- 더보기 버튼 -->
	<div class="w3-row" align=center style="background: #f5f6f7;">
		<b><input type="button" class="w3-card-4" onclick="visible()" value="더　보　기" style="height:40px; margin-bottom:20px; border-radius:5px;width:200px;margin-right:20px; background-color: #4593e0; color:white; border:0px;" onMouseOver="this.style.backgroundColor='#80b5ea'" onMouseOut="this.style.backgroundColor='#4593e0'"></b>
	</div>
</body>
</html>