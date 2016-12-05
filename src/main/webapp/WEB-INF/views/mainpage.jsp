<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Billy Bury</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
</head>
<body>
	<!-- 패턴사진 -->
	<div align=center class="w3-container" style="width: 1350px; background-image: url('/team4/resources/images/main_back1.png'); background-repeat: no-repeat; background-size:cover; vertical-align:middle; display:table-cell;">
		<table style="margin-top:30px; margin-bottom:10px;">
		<tr>
			<td colspan="2" align=center style="margin-top:30px;">
				<form action="mainSearch" method="post" style="margin-bottom:15px;">   
					<select name="keyword" style="width:15%; border-radius:4px; text-align:center; height:27px;">
						<option value="goods" style="text-align:center;">물품대여</option>
						<option value="place" style="text-align:center;">장소대여</option>
					</select>
					
		   			<input type="text" name="word" value="${word}" placeholder="&nbsp;Search . . . " class="free-search-title" style="border-color: rgb(169, 169, 169);" required="required" />
		   			<input type="submit" class="list-search" value ="Search" style="width:8%;">
		  		</form>
			</td>
		</tr>	
		
			<tr>
				<td width=650 height="408" rowspan=4 class="img-margin-right w3-section">
					<img width=650 height="408" class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/computer1.jpg">
					<img width=650 height="408" class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/val1.jpg">
					<img width=650 height="408" class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/kitchen1.jpg">
					<img width=650 height="408" class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/vacuum1.jpg">
					<img width=650 height="408" class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/cup1.jpg">
					<img width=650 height="408" class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/compu1.jpg">
					<img width=650 height="408"class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/piano1.jpg">
				</td>
			</tr>
			
			<tr>
				<td width="200" height="135" style="" class="w3-section">	
					<img width="200" height="135" style="margin-left:5px;" class="mySlides2  w3-round-large" src="/team4/resources/images/baby2.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides2  w3-round-large" src="/team4/resources/images/kitchen2.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides2  w3-round-large" src="/team4/resources/images/vacuum2.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides2  w3-round-large" src="/team4/resources/images/computer2.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides2  w3-round-large" src="/team4/resources/images/m1.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides2  w3-round-large" src="/team4/resources/images/m2.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides2  w3-round-large" src="/team4/resources/images/m3.jpg">
				</td>
			</tr>
			
			<tr>
				<td width="200" height="135" style="" class="w3-section">	
					<img width="200" height="135" style="margin-left:5px;" class="mySlides3  w3-round-large" src="/team4/resources/images/kitchen2.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides3  w3-round-large" src="/team4/resources/images/vacuum2.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides3  w3-round-large" src="/team4/resources/images/computer2.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides3  w3-round-large" src="/team4/resources/images/baby2.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides3  w3-round-large" src="/team4/resources/images/m3.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides3  w3-round-large" src="/team4/resources/images/m4.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides3  w3-round-large" src="/team4/resources/images/m5.jpg">
				</td>
			</tr>
	
			<tr>
				<td width="200" height="135" style="" class="w3-section">	
					<img width="200" height="135" style="margin-left:5px;" class="mySlides4  w3-round-large" src="/team4/resources/images/vacuum2.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides4  w3-round-large" src="/team4/resources/images/computer2.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides4  w3-round-large" src="/team4/resources/images/baby2.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides4  w3-round-large" src="/team4/resources/images/kitchen2.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides4  w3-round-large" src="/team4/resources/images/m5.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides4  w3-round-large" src="/team4/resources/images/m6.jpg">
					<img width="200" height="135" style="margin-left:5px;" class="mySlides4  w3-round-large" src="/team4/resources/images/m1.jpg">
				</td>
			</tr>
		</table>
		<br><br><br><br>
		
		<!-- 물품 카테고리별 최신글 -->
		<div class="w3-row" align=left style="padding-bottom:5px; margin-left:20px;border-bottom:2px solid #03a5e9;">
			<img src="/team4/resources/images/in9999.png"><b style="font-size:23px; text-decoration: bolder;">　최　신　물　품</b>
		</div>
		
		<table style="margin-bottom:80px;">
			<tr>
				<!-- DIY용품 카테고리 -->
				<td width="210" height="250" style="padding-right:6px;">
					<!-- 회원일 경우 -->
					<security:authorize ifAnyGranted="role_user, role_com, role_master">
						<form action="menu2_1" method="post">
							<c:forEach items="${registervo1}" var="registervo1" begin="0" end="0">
								<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
									<tr style="background-color: #8DBAF5;" align=center height=30>
										<td style="width: 40%;">
											<b><input type=text class="free-insert-title" value="[ DIY용품 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left; margin-top: 1px;" readonly></b>
										</td>
										
										<!-- 더보기 버튼 -->
										<td align="right" style="padding-right:10px;">
											<button class=plus9999 >
												<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
											</button>
										</td>
									</tr>
									
									<tr>
										<td colspan="2" align="center">
											<a href="requestcontent?codeNum=${registervo1.codeNum}"> 
												<img width="200" height="180" src="/team4/resources/RequestImg/${registervo1.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;">
											</a>
										</td>
									</tr>
								</table>
								
								<input type="hidden" name="keyword" value="category">
								<input type="hidden" name="word" value="DIY용품">
							</c:forEach>
						</form>
					</security:authorize>
					
					<!-- 비회원일 경우 -->
					<security:authorize ifNotGranted="role_user, role_com, role_master">
						<form action="Login" method="post">
							<c:forEach items="${registervo1}" var="registervo1" begin="0" end="0">
								<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
									<tr style="background-color: #8DBAF5;" align=center height=30>
										<td style="width: 40%;">
											<b><input type=text class="free-insert-title" value="[ DIY용품 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left; margin-top: 1px;" readonly></b>
										</td>
										
										<!-- 더보기 버튼 -->
										<td align="right" style="padding-right:10px;">
											<button class=plus9999 >
												<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
											</button>
										</td>
									</tr>
									
									<tr>
										<td colspan="2" align="center">
											<a href="Login"> 
												<img width="200" height="180" src="/team4/resources/RequestImg/${registervo1.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;">
											</a>
										</td>
									</tr>
								</table>
								
								<input type="hidden" name="keyword" value="category">
								<input type="hidden" name="word" value="DIY용품">
							</c:forEach>
						</form>
					</security:authorize>
				</td>
				
				<!-- 공구 카테고리 -->
				<td width="210" height="250" style="padding-right:6px;">
					<!-- 회원일 경우 -->
					<security:authorize ifAnyGranted="role_user, role_com, role_master">
						<form action="menu2_1" method="post">
							<c:forEach items="${registervo2}" var="registervo2" begin="0" end="0">
								<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
									<tr style="background-color: #8DBAF5;" align=center height=30>
										<td style="width: 40%;">
											<b><input type=text class="free-insert-title" value="[ 공　구 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left;" readonly></b>
										</td>
										
										<td align="right" style="padding-right:10px;">
											<button class=plus9999 >
												<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
											</button>
										</td>
									</tr>
									
									<tr>
										<td colspan="2" align="center">
											<a href="requestcontent?codeNum=${registervo2.codeNum}"> 
												<img width="200" height="180" src="/team4/resources/RequestImg/${registervo2.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;">
											</a>
										</td>
									</tr>
								</table>
								
								<input type="hidden" name="keyword" value="category">
								<input type="hidden" name="word" value="공구">
							</c:forEach>
						</form>
					</security:authorize>
					
					<!-- 비회원일 경우 -->
					<security:authorize ifNotGranted="role_user, role_com, role_master">
						<form action="Login" method="post">
							<c:forEach items="${registervo2}" var="registervo2" begin="0" end="0">
								<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
									<tr style="background-color: #8DBAF5;" align=center height=30>
										<td style="width: 40%;">
											<b><input type=text class="free-insert-title" value="[ 공　구 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left;" readonly></b>
										</td>
										
										<td align="right" style="padding-right:10px;">
											<button class=plus9999 >
												<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
											</button>
										</td>
									</tr>
									
									<tr>
										<td colspan="2" align="center">
											<a href="Login"> 
												<img width="200" height="180" src="/team4/resources/RequestImg/${registervo2.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;">
											</a>
										</td>
									</tr>
								</table>
								
								<input type="hidden" name="keyword" value="category">
								<input type="hidden" name="word" value="공구">
							</c:forEach>
						</form>
					</security:authorize>
				</td>
				
				<!-- 주방용품 카테고리 -->
				<td width="210" height="250" style="padding-right:6px;">
					<!-- 회원일 경우 -->
					<security:authorize ifAnyGranted="role_user, role_com, role_master">
						<form action="menu2_1" method="post">
							<c:forEach items="${registervo3}" var="registervo3" begin="0" end="0">
								<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
									<tr style="background-color: #8DBAF5;" align=center height=30>
										<td style="width: 40%;">
											<b><input type=text class="free-insert-title" value="[ 주방용품 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left;" readonly></b>
										</td>
										
										<td align="right" style="padding-right:10px;">
											<button class=plus9999 >
												<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
											</button>
										</td>
									</tr>
									
									<tr>
										<td colspan="2" align="center">
											<a href="requestcontent?codeNum=${registervo3.codeNum}"> 
												<img width="200" height="180" src="/team4/resources/RequestImg/${registervo3.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;">
											</a>
										</td>
									</tr>
								</table>
								
								<input type="hidden" name="keyword" value="category">
								<input type="hidden" name="word" value="주방용품">
							</c:forEach>
						</form>
					</security:authorize>
					
					<!-- 비회원일 경우 -->
					<security:authorize ifNotGranted="role_user, role_com, role_master">
						<form action="Login" method="post">
							<c:forEach items="${registervo3}" var="registervo3" begin="0" end="0">
								<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
									<tr style="background-color: #8DBAF5;" align=center height=30>
										<td style="width: 40%;">
											<b><input type=text class="free-insert-title" value="[ 주방용품 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left;" readonly></b>
										</td>
										
										<td align="right" style="padding-right:10px;">
											<button class=plus9999 >
												<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
											</button>
										</td>
									</tr>
									
									<tr>
										<td colspan="2" align="center">
											<a href="Login"> 
												<img width="200" height="180" src="/team4/resources/RequestImg/${registervo3.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;">
											</a>
										</td>
									</tr>
								</table>
								
								<input type="hidden" name="keyword" value="category">
								<input type="hidden" name="word" value="주방용품">
							</c:forEach>
						</form>
					</security:authorize>
				</td>
				
				<!-- 전자기기 카테고리 -->
				<td width="210" height="250" style="padding-right:6px;">
					<!-- 회원일 경우 -->
					<security:authorize ifAnyGranted="role_user, role_com, role_master">
						<form action="menu2_1" method="post">
							<c:forEach items="${registervo4}" var="registervo4" begin="0" end="0">
								<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
									<tr style="background-color: #8DBAF5;" align=center height=30>
										<td style="width: 40%;">
											<b><input type=text class="free-insert-title" value="[ 전자기기 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left;" readonly></b>
										</td>
										
										<td align="right" style="padding-right:10px;">
											<button class=plus9999 >
												<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
											</button>
										</td>
									</tr>
									
									<tr>
										<td colspan="2" align="center">
											<a href="requestcontent?codeNum=${registervo4.codeNum}"> 
												<img width="200" height="180" src="/team4/resources/RequestImg/${registervo4.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;">
											</a>
										</td>
									</tr>
								</table>
								
								<input type="hidden" name="keyword" value="category">
								<input type="hidden" name="word" value="전자기기">
							</c:forEach>
						</form>
					</security:authorize>
					
					<!-- 비회원일 경우 -->
					<security:authorize ifNotGranted="role_user, role_com, role_master">
						<form action="Login" method="post">
							<c:forEach items="${registervo4}" var="registervo4" begin="0" end="0">
								<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
									<tr style="background-color: #8DBAF5;" align=center height=30>
										<td style="width: 40%;">
											<b><input type=text class="free-insert-title" value="[ 전자기기 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left;" readonly></b>
										</td>
										
										<td align="right" style="padding-right:10px;">
											<button class=plus9999 >
												<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
											</button>
										</td>
									</tr>
									
									<tr>
										<td colspan="2" align="center">
											<a href="Login"> 
												<img width="200" height="180" src="/team4/resources/RequestImg/${registervo4.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;">
											</a>
										</td>
									</tr>
								</table>
								
								<input type="hidden" name="keyword" value="category">
								<input type="hidden" name="word" value="전자기기">
							</c:forEach>
						</form>
					</security:authorize>
				</td>
				
				<!-- 레저용품 카테고리 -->
				<td width="210" height="250">
					<!-- 회원일 경우 -->
					<security:authorize ifAnyGranted="role_user, role_com, role_master">
						<form action="menu2_1" method="post">
							<c:forEach items="${registervo5}" var="registervo5" begin="0" end="0">
								<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
									<tr style="background-color: #8DBAF5;" align=center height=30>
										<td style="width: 40%;">
											<b><input type=text class="free-insert-title" value="[ 레저용품 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left;" readonly></b>
										</td>
	
										<td align="right" style="padding-right:10px;">
											<button class=plus9999 >
												<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
											</button>
										</td>
									</tr>
									
									<tr>
										<td colspan="2" align="center">
											<a href="requestcontent?codeNum=${registervo5.codeNum}"> 
												<img width="200" height="180" src="/team4/resources/RequestImg/${registervo5.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;">
											</a>
										</td>
									</tr>
								</table>
								
								<input type="hidden" name="keyword" value="category">
								<input type="hidden" name="word" value="레져용품">
							</c:forEach>
						</form>
					</security:authorize>
					
					<!-- 비회원일 경우 -->
					<security:authorize ifNotGranted="role_user, role_com, role_master">
						<form action="Login" method="post">
							<c:forEach items="${registervo5}" var="registervo5" begin="0" end="0">
								<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
									<tr style="background-color: #8DBAF5;" align=center height=30>
										<td style="width: 40%;">
											<b><input type=text class="free-insert-title" value="[ 레저용품 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left;" readonly></b>
										</td>
	
										<td align="right" style="padding-right:10px;">
											<button class=plus9999 >
												<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
											</button>
										</td>
									</tr>
									
									<tr>
										<td colspan="2" align="center">
											<a href="Login"> 
												<img width="200" height="180" src="/team4/resources/RequestImg/${registervo5.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;">
											</a>
										</td>
									</tr>
								</table>
								
								<input type="hidden" name="keyword" value="category">
								<input type="hidden" name="word" value="레져용품">
							</c:forEach>
						</form>
					</security:authorize>
				</td>
			</tr>
		</table>
		
		<!-- 장소 카테고리별 최신글 -->
		<div class="w3-row" align=left style="padding-bottom:5px; margin-left:20px;border-bottom:2px solid #03a5e9;">
			<img src="/team4/resources/images/in7777.png"><b style="font-size:23px; text-decoration: bolder;">　최　신　장　소</b>
		</div>
		
		<table style="margin-bottom:60px;">
			<tr>
				<!-- 강당 카테고리 -->
				<td width="210" height="250" style="padding-right:6px;">
					<!-- 회원일 경우 -->
					<security:authorize ifAnyGranted="role_user, role_com, role_master">
						<form action="menu3_3" method="post">
							<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
								<tr style="background-color: #8DBAF5;" align=center height=30>
									<td style="width: 40%;">
										<b><input type=text class="free-insert-title" value="[ 강　당 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left; margin-top: 1px;" readonly></b>
									</td>
									
									<!-- 더보기 버튼 -->
									<td align="right" style="padding-right:10px;">
										<button class=plus9999 onclick="script:submit()">
											<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
										</button>
									</td>
								</tr>
								
								<tr>
									<td colspan="2" align="center"> 
										<img width="200" height="180" src="/team4/resources/BoardImg/${vo1.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;" onclick="showContents(${vo1.codeNum })">
									</td>
								</tr>
							</table>
							
							<input type="hidden" name="category" value="강당">
							<input type="hidden" name="codeNum" value="${vo1.codeNum }">
						</form>
					</security:authorize>
					
					<!-- 비회원일 경우 -->
					<security:authorize ifNotGranted="role_user, role_com, role_master">
						<form action="Login" method="post">
							<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
								<tr style="background-color: #8DBAF5;" align=center height=30>
									<td style="width: 40%;">
										<b><input type=text class="free-insert-title" value="[ 강　당 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left; margin-top: 1px;" readonly></b>
									</td>
									
									<!-- 더보기 버튼 -->
									<td align="right" style="padding-right:10px;">
										<button class=plus9999 onclick="script:submit()">
											<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
										</button>
									</td>
								</tr>
								
								<tr>
									<td colspan="2" align="center">
										<img width="200" height="180" src="/team4/resources/BoardImg/${vo1.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;" onclick="location.href='Login'">
									</td>
								</tr>
							</table>
							
							<input type="hidden" name="category" value="강당">
							<input type="hidden" name="codeNum" value="${vo1.codeNum }">
						</form>
					</security:authorize>
				</td>
				
				<!-- 사무실 카테고리 -->
				<td width="210" height="250" style="padding-right:6px;">
					<!-- 회원일 경우 -->
					<security:authorize ifAnyGranted="role_user, role_com, role_master">
						<form action="menu3_3" method="post">
							<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
								<tr style="background-color: #8DBAF5;" align=center height=30>
									<td style="width: 40%;">
										<b><input type=text class="free-insert-title" value="[ 사 무 실 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left; margin-top: 1px;" readonly></b>
									</td>
									
									<!-- 더보기 버튼 -->
									<td align="right" style="padding-right:10px;">
										<button class=plus9999 onclick="script:submit()">
											<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
										</button>
									</td>
								</tr>
								
								<tr>
									<td colspan="2" align="center">
										<img width="200" height="180" src="/team4/resources/BoardImg/${vo2.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;" onclick="showContents(${vo2.codeNum})">
									</td>
								</tr>
							</table>
							
							<input type="hidden" name="category" value="사무실">
							<input type="hidden" name="codeNum" value="${vo2.codeNum }">
						</form>
					</security:authorize>
					
					<!-- 비회원일 경우 -->
					<security:authorize ifNotGranted="role_user, role_com, role_master">
						<form action="Login" method="post">
							<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
								<tr style="background-color: #8DBAF5;" align=center height=30>
									<td style="width: 40%;">
										<b><input type=text class="free-insert-title" value="[ 사 무 실 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left; margin-top: 1px;" readonly></b>
									</td>
									
									<!-- 더보기 버튼 -->
									<td align="right" style="padding-right:10px;">
										<button class=plus9999 onclick="script:submit()">
											<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
										</button>
									</td>
								</tr>
								
								<tr>
									<td colspan="2" align="center">
										<img width="200" height="180" src="/team4/resources/BoardImg/${vo2.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;" onclick="location.href='Login'">
									</td>
								</tr>
							</table>
							
							<input type="hidden" name="category" value="사무실">
							<input type="hidden" name="codeNum" value="${vo2.codeNum}">
						</form>
					</security:authorize>
				</td>
				
				<!-- 회의실 카테고리 -->
				<td width="210" height="250" style="padding-right:6px;">
					<!-- 회원일 경우 -->
					<security:authorize ifAnyGranted="role_user, role_com, role_master">
						<form action="menu3_3" method="post">
							<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
								<tr style="background-color: #8DBAF5;" align=center height=30>
									<td style="width: 40%;">
										<b><input type=text class="free-insert-title" value="[ 사 무 실 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left; margin-top: 1px;" readonly></b>
									</td>
									
									<!-- 더보기 버튼 -->
									<td align="right" style="padding-right:10px;">
										<button class=plus9999 onclick="script:submit()">
											<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
										</button>
									</td>
								</tr>
								
								<tr>
									<td colspan="2" align="center">
										<img width="200" height="180" src="/team4/resources/BoardImg/${vo3.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;" onclick="showContents(${vo3.codeNum})">
									</td>
								</tr>
							</table>
							
							<input type="hidden" name="category" value="회의실">
							<input type="hidden" name="codeNum" value="${vo3.codeNum }">
						</form>
					</security:authorize>
					
					<!-- 비회원일 경우 -->
					<security:authorize ifNotGranted="role_user, role_com, role_master">
						<form action="Login" method="post">
							<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
								<tr style="background-color: #8DBAF5;" align=center height=30>
									<td style="width: 40%;">
										<b><input type=text class="free-insert-title" value="[ 사 무 실 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left; margin-top: 1px;" readonly></b>
									</td>
									
									<!-- 더보기 버튼 -->
									<td align="right" style="padding-right:10px;">
										<button class=plus9999 onclick="script:submit()">
											<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
										</button>
									</td>
								</tr>
								
								<tr>
									<td colspan="2" align="center">
										<img width="200" height="180" src="/team4/resources/BoardImg/${vo3.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;" onclick="location.href='Login'">
									</td>
								</tr>
							</table>
							
							<input type="hidden" name="category" value="회의실">
							<input type="hidden" name="codeNum" value="${vo3.codeNum }">
						</form>
					</security:authorize>
				</td>
				
				<!-- 공터 카테고리 -->
				<td width="210" height="250" style="padding-right:6px;">
					<!-- 회원일 경우 -->
					<security:authorize ifAnyGranted="role_user, role_com, role_master">
						<form action="menu3_3" method="post">
							<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
								<tr style="background-color: #8DBAF5;" align=center height=30>
									<td style="width: 40%;">
										<b><input type=text class="free-insert-title" value="[ 사 무 실 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left; margin-top: 1px;" readonly></b>
									</td>
									
									<!-- 더보기 버튼 -->
									<td align="right" style="padding-right:10px;">
										<button class=plus9999 onclick="script:submit()">
											<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
										</button>
									</td>
								</tr>
								
								<tr>
									<td colspan="2" align="center">
										<img width="200" height="180" src="/team4/resources/BoardImg/${vo4.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;" onclick="showContents(${vo4.codeNum})">
									</td>
								</tr>
							</table>
							
							<input type="hidden" name="category" value="공터">
							<input type="hidden" name="codeNum" value="${vo4.codeNum }">
						</form>
					</security:authorize>
					
					<!-- 비회원일 경우 -->
					<security:authorize ifNotGranted="role_user, role_com, role_master">
						<form action="Login" method="post">
							<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
								<tr style="background-color: #8DBAF5;" align=center height=30>
									<td style="width: 40%;">
										<b><input type=text class="free-insert-title" value="[ 사 무 실 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left; margin-top: 1px;" readonly></b>
									</td>
									
									<!-- 더보기 버튼 -->
									<td align="right" style="padding-right:10px;">
										<button class=plus9999 onclick="script:submit()">
											<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
										</button>
									</td>
								</tr>
								
								<tr>
									<td colspan="2" align="center">
										<img width="200" height="180" src="/team4/resources/BoardImg/${vo4.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;" onclick="location.href='Login'">
									</td>
								</tr>
							</table>
							
							<input type="hidden" name="category" value="공터">
							<input type="hidden" name="codeNum" value="${vo4.codeNum }">
						</form>
					</security:authorize>
				</td>
				
				<!-- 기타 카테고리 -->
				<td width="210" height="250" style="padding-right:6px;">
					<!-- 회원일 경우 -->
					<security:authorize ifAnyGranted="role_user, role_com, role_master">
						<form action="menu3_3" method="post">
							<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
								<tr style="background-color: #8DBAF5;" align=center height=30>
									<td style="width: 40%;">
										<b><input type=text class="free-insert-title" value="[ 기　타 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left; margin-top: 1px;" readonly></b>
									</td>
									
									<!-- 더보기 버튼 -->
									<td align="right" style="padding-right:10px;">
										<button class=plus9999 onclick="script:submit()">
											<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
										</button>
									</td>
								</tr>
								
								<tr>
									<td colspan="2" align="center">
										<img width="200" height="180" src="/team4/resources/BoardImg/${vo5.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;" onclick="showContents(${vo5.codeNum})">
									</td>
								</tr>
							</table>
							
							<input type="hidden" name="category" value="기타">
							<input type="hidden" name="codeNum" value="${vo5.codeNum }">
						</form>
					</security:authorize>
					
					<!-- 비회원일 경우 -->
					<security:authorize ifNotGranted="role_user, role_com, role_master">
						<form action="Login" method="post">
							<table class="w3-card-8" style="background-color: white; border-radius: 7px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
								<tr style="background-color: #8DBAF5;" align=center height=30>
									<td style="width: 40%;">
										<b><input type=text class="free-insert-title" value="[ 기　타 ]" style="width:90%; background-color: #8DBAF5; color: white; border: 0px; height: 23px; text-align: left; margin-top: 1px;" readonly></b>
									</td>
									
									<!-- 더보기 버튼 -->
									<td align="right" style="padding-right:10px;">
										<button class=plus9999 onclick="script:submit()">
											<img width="28" height="28"  src="/team4/resources/images/plus9999.png" onmouseover="this.src='/team4/resources/images/plus8888.png'" onmouseout="this.src='/team4/resources/images/plus9999.png'">
										</button>
									</td>
								</tr>
								
								<tr>
									<td colspan="2" align="center">
										<img width="200" height="180" src="/team4/resources/BoardImg/${vo5.img}" style="border-radius: 7px; margin-bottom:2px; margin-top:4px;" onclick="location.href='Login'">
									</td>
								</tr>
							</table>
							
							<input type="hidden" name="category" value="기타">
							<input type="hidden" name="codeNum" value="${vo5.codeNum }">
						</form>
					</security:authorize>
				</td>
			</tr>
		</table>
		
		<form action="showContentsForm" name="vo" method="post">
			<input type="hidden" name="codeNum">
		</form>
	</div>			
</body>

<script>
	var myIndex = 0;
	carousel();
	
	function carousel() {
		var i;
		
	    var x = document.getElementsByClassName("mySlides");
	    var x2 = document.getElementsByClassName("mySlides2");
	    var x3 = document.getElementsByClassName("mySlides3");
	    var x4 = document.getElementsByClassName("mySlides4");
	    
	    for (i = 0; i < x.length; i++) {
	       x[i].style.display = "none";
	    }
	    
	    for (i = 0; i < x2.length; i++) {
		       x2[i].style.display = "none";
		    }
	    
	    for (i = 0; i < x3.length; i++) {
		       x3[i].style.display = "none";
		    }
	    
	    for (i = 0; i < x4.length; i++) {
		       x4[i].style.display = "none";
		    }
	    
	    myIndex++;
	    
	    if (myIndex > x.length && myIndex > x2.length && myIndex > x3.length && myIndex > x4.length) {
	    	myIndex = 1
	    }
	    
	    x[myIndex-1].style.display = "block";
	    x2[myIndex-1].style.display = "block";
	    x3[myIndex-1].style.display = "block";
	    x4[myIndex-1].style.display = "block";
	    
	    setTimeout(carousel, 2500);
	}
	
	function showContents(codeNum){
		document.vo.codeNum.value=codeNum;
		document.vo.submit();
	}
</script>
</html>