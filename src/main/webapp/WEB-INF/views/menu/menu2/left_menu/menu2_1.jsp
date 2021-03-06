<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
   function visible() {
      document.getElementById('moreview').style.display = "block";
   }
</script>
<title>menu2</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/left-menu62.png" style="margin-right:10px;">
	    <font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-styl	e: bold; font-size: 30px; ">대 여 가 능 현 황</font>
	</div>

	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<!-- 검색 -->
		<div class="w3-row" style="margin-top: 30px;">
			<form action="menu2_1" method=post>
				<select name="keyword" style="width: 15%; border-radius: 4px; text-align: center; height: 27px;">
					<option value="title" style="text-align: center;">Title</option>
					<option value="category" style="text-align: center;">카테고리</option>
				</select> 
				
				<input type="text" name="word" value="${word}" placeholder="&nbsp;Search . . . " class="free-search-title" style="border-color: rgb(169, 169, 169);" required="required" /> 
				<input type="submit" class="list-search" value="Search" style="width: 8%;">
			</form>
		</div>
        <br>
 
         <!-- 글쓰기 버튼 -->
		<div style="margin-bottom: 20px; width: 90%;">

			<!-- 실질적인 리스트 뿌리기 -->
			<div>
				<c:forEach items="${Registerpossibility}" var="Registerpossibility" begin="0" end="5">
					<div style="width: 30%; border: 0px;" class="left">
						<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
							<!-- 카테고리 & 제목 -->
							<tr style="background-color: #8DBAF5;" align=center height=30>
								<td style="width: 40%;">
									<b><input type=text class="free-insert-title" value="[ ${Registerpossibility.category} ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: center; margin-top: 1px;" readonly></b>
								</td>
	
								<td colspan="2" align="center" style="width: 90%; padding-right:6px;">
									<input type=text class="free-insert-title" value="${Registerpossibility.title}" style="width:100%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: center; margin-top: 1px;" readonly>
								</td>
							</tr>

							<!-- 이미지 -->
							<tr>
								<td  height=175 colspan="3" align="center">
									<a class="effect" href="registercontent?codeNum=${Registerpossibility.codeNum}"> 
										<img src="/team4/resources/RequestImg/${Registerpossibility.img}" style="width: 85%; height: 170px; border-radius: 7px;">
									</a>
								</td>
							</tr>
							<tr height=33 style="padding-bottom:2px;">
								<c:if test="${session_id != Registerpossibility.reaquestId}">
											<td  height=30 style="width: 140px;" align="left">
												<form action="RegisterUpForm" method="post">
													<input type="hidden" value="${Registerpossibility.codeNum}" name="codeNum">
													　<b><input type="submit" class="good1 w3-card-4" value="신청하기" onMouseOver="this.style.backgroundColor='#4593e0'"onMouseOut="this.style.backgroundColor='#80b5ea'" style="background-color: #80b5ea;"></b>
												</form>
											</td>
								</c:if>
								<c:if test="${session_id == Registerpossibility.reaquestId}">
											<td height=30 style="width: 140px;" align="left">
												　<b><input type="text" class="good1 w3-card-4" value="본인품목" style="background-color: #80b5ea; cursor: default;" readonly></b>
											<td>
								</c:if>
								
								<!-- 쪽지보내기 -->
								<!-- ID가 4자 이상일 경우 줄여쓰기 기능 -->
			             		<c:choose>
				             		<c:when test="${fn:length(Registerpossibility.reaquestId) > 4 }">
										<td height=30 style="width: 150px; padding-right:20px;" align="right">
											<input type=text class="good11" value="${fn:substring(Registerpossibility.reaquestId,0,4)}.." onclick="window.open('mail?rid=${Registerpossibility.reaquestId}', '','width=400, height=350, status=1')">
										</td>
									</c:when>
									
									<c:otherwise>
										<td height=30 style="width: 150px; padding-right:20px;" align="right">
											<input type=text class="good11" value="${Registerpossibility.reaquestId}" onclick="window.open('mail?rid=${Registerpossibility.reaquestId}', '','width=400, height=350, status=1')">
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
				<c:forEach items="${Registerpossibility}" var="Registerpossibility" begin="6">
					<div style="width: 30%; border: 0px;" class="left">
						<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
							<!-- 카테고리 & 제목 -->
							<tr style="background-color: #8DBAF5;" align=center height=30>
								<td style="width: 40%;">
									<b><input type=text class="free-insert-title" value="[ ${Registerpossibility.category} ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: center; margin-top: 1px;" readonly></b>
								</td>
	
								<td colspan="2" align="center" style="width: 90%; padding-right:6px;">
									<input type=text class="free-insert-title" value="${Registerpossibility.title}" style="width:100%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: center; margin-top: 1px;" readonly>
								</td>
							</tr>

							<!-- 이미지 -->
							<tr >
								<td  height=175 colspan="3" align="center">
									<a href="registercontent?codeNum=${Registerpossibility.codeNum}"> 
										<img src="/team4/resources/RequestImg/${Registerpossibility.img}" style="width: 85%; height: 170px; border-radius: 7px;">
									</a>
								</td>
							</tr>
							
							<tr height=33 style="padding-bottom:2px;">
                                <c:if test="${session_id != Registerpossibility.reaquestId}">
											<td  height=30 style="width: 140px;" align="left">
												<form action="RegisterUpForm" method="post">
													<input type="hidden" value="${Registerpossibility.codeNum}" name="codeNum">
													　<b><input type="submit" class="good1 w3-card-4" value="신청하기" onMouseOver="this.style.backgroundColor='#4593e0'"onMouseOut="this.style.backgroundColor='#80b5ea'" style="background-color: #80b5ea;"></b>
												</form>
											</td>
								</c:if>
								<c:if test="${session_id == Registerpossibility.reaquestId}">
											<td height=30 style="width: 140px;" align="left">
												　<b><input type="text" class="good1 w3-card-4" value="본인품목" style="background-color: #80b5ea; cursor: default;" readonly></b>
											<td>
								</c:if>
								
								<!-- 쪽지보내기 -->
								<!-- ID가 4자 이상일 경우 줄여쓰기 기능 -->
			             		<c:choose>
				             		<c:when test="${fn:length(Registerpossibility.reaquestId) > 4 }">
										<td height=30 style="width: 150px; padding-right:20px;" align="right">
											<input type=text class="good11" value="${fn:substring(Registerpossibility.reaquestId,0,4)}.." onclick="window.open('mail?rid=${Registerpossibility.reaquestId}', '','width=400, height=350, status=1')">
										</td>
									</c:when>
									
									<c:otherwise>
										<td height=30 style="width: 150px; padding-right:20px;" align="right">
											<input type=text class="good11" value="${Registerpossibility.reaquestId}" onclick="window.open('mail?rid=${Registerpossibility.reaquestId}', '','width=400, height=350, status=1')">
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