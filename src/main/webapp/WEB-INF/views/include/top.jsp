<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Top</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="w3-container" style="background: #fff;">
		<ul class="main-logo w3-large w3-center" style="padding: 30px 0 0 0; margin-top:20px;">
		    <!-- 인증 NO -->
			<security:authorize ifNotGranted="role_user, role_com, role_master">
				<li style="width:8%; padding: 45px 0 3px 0; font-size: 1px;"><a href="main"><img src="/team4/resources/images/home18.png">&nbsp;H o m e</a></li>
				<li style="width:7%; padding: 45px 0 3px 0; font-size: 1px;"><a href="about_us"><img src="/team4/resources/images/korea18.png">&nbsp;About us</a></li>
				<li style="width:6%; padding: 45px 0 3px 0; font-size: 1px;"><a href="QnA_list"><img src="/team4/resources/images/qanda18.png">&nbsp;Q & A</a></li>
				<li style="width:7%"><p></p></li>
				<li style="width:30%; padding: 0 0 3px 0;"><img class="w3-animate-opacity" src="/team4/resources/images/test-top.png" onclick="location.href='main'"></li>
				<li style="width:25%"><p></p></li>

		   		<li style="width:8%; padding: 45px 0 3px 0; font-size: 1px;"><a href="Login"><img src="/team4/resources/images/login18.png">&nbsp;L o g i n</a></li>
		   		<li style="width:1%"><p></p></li>
		    	<li style="width:8%; padding: 45px 0 3px 0; font-size: 1px;"><a href="joinForm"><img src="/team4/resources/images/join18.png">&nbsp;J o i n</a></li>
		    </security:authorize>
		    
		    <!-- 인증 Yes ==> 관리자가 아닐 경우 -->
			<security:authorize ifAnyGranted="role_user, role_com">
				<li style="width:8%; padding: 45px 0 3px 0; font-size: 1px;"><a href="main"><img src="/team4/resources/images/home18.png">&nbsp;H o m e</a></li>
				<li style="width:7%; padding: 45px 0 3px 0; font-size: 1px;"><a href="about_us"><img src="/team4/resources/images/korea18.png">&nbsp;About us</a></li>
				<li style="width:6%; padding: 45px 0 3px 0; font-size: 1px;"><a href="QnA_list"><img src="/team4/resources/images/qanda18.png">&nbsp;Q & A</a></li>
				<li style="width:7%"><p></p></li>
				<li style="width:30%; padding: 0 0 3px 0;"><img class="w3-animate-opacity" src="/team4/resources/images/test-top.png" onclick="location.href='main'"></li>
				<li style="width:25%"><p></p></li>
				
		   		<li style="width:9%; padding: 45px 0 3px 0; font-size: 1px;"><a href="<c:url value="j_spring_security_logout"/>"><img src="/team4/resources/images/logout18.png">&nbsp;L o g o u t</a></li>
		    	<li style="width:8%; padding: 45px 0 3px 0; font-size: 1px;"><a href="mypage"><img src="/team4/resources/images/mypage18.png">&nbsp;My Page</a></li>
		    </security:authorize>
		    
		    <!-- 인증 Yes ==> 관리자일 경우 -->
			<security:authorize ifAnyGranted="role_master">
				<li style="width:8%; padding: 45px 0 3px 0; font-size: 1px;"><a href="main"><img src="/team4/resources/images/home18.png">&nbsp;H o m e</a></li>
				<li style="width:7%; padding: 45px 0 3px 0; font-size: 1px;"><a href="about_us"><img src="/team4/resources/images/korea18.png">&nbsp;About us</a></li>
				<li style="width:6%; padding: 45px 0 3px 0; font-size: 1px;"><a href="QnA_list"><img src="/team4/resources/images/qanda18.png">&nbsp;Q & A</a></li>
				<li style="width:7%"><p></p></li>
				<li style="width:30%; padding: 0 0 3px 0;"><img class="w3-animate-opacity" src="/team4/resources/images/test-top.png" onclick="location.href='main'"></li>
				<li style="width:17%"><p></p></li>

		   		<li style="width:9%; padding: 45px 0 3px 0; font-size: 1px;"><a href="<c:url value="j_spring_security_logout"/>"><img src="/team4/resources/images/logout18.png">&nbsp;L o g o u t</a></li>	
		    	<li style="width:8%; padding: 45px 0 3px 0; font-size: 1px;"><a href="mypage"><img src="/team4/resources/images/mypage18.png">&nbsp;My Page</a></li>
		    	<li style="width:8%; padding: 45px 0 3px 0; font-size: 1px;"><a href="list"><img src="/team4/resources/images/setting.png">&nbsp;A d m i n</a></li>																																	
		    </security:authorize>
		</ul>
	</div>
	
	<div class="w3-container" style="height:50px;">
		<ul class="w3-navbar w3-center" style="height:50px; border-top:0.5px solid black; ">
			<li style="width:2%"><p></p></li>
			
			<!-- Menu1_관리자가 아닌 경우 -->
			<security:authorize ifNotGranted="role_master">
				<!-- 비회원인 경우 -->
				<security:authorize ifNotGranted="role_user, role_com, role_master">
					<li style="width:15%; margin-top: 3px;" class="w3-dropdown-hover"><a href="Login">물 품 등 록&nbsp;<i class="fa fa-caret-down"></i></a>
						<div class="w3-dropdown-content w3-white w3-card-4">
				        	<a href="Login">업 체 등 록 현 황</a>
				        	<a href="Login">개 인 등 록 현 황</a>
				    		<a href="Login">나 의 등 록 현 황</a>
				    	</div>
				    </li>
		    	</security:authorize>
		    	
		    	<!-- 회원인 경우 -->
				<security:authorize ifAnyGranted="role_user, role_com">
					<li style="width:15%; margin-top: 3px;" class="w3-dropdown-hover"><a href="menu1">물 품 등 록&nbsp;<i class="fa fa-caret-down"></i></a>
						<div class="w3-dropdown-content w3-white w3-card-4">
				        	<a href="menu1_1">업 체 등 록 현 황</a>
				        	<a href="menu1_2">개 인 등 록 현 황</a>
				    		<a href="menu1_3">나 의 등 록 현 황</a>
				    	</div>
				    </li>
		    	</security:authorize>
	        </security:authorize>
	        
	        <!-- Menu1_관리자인 경우 -->
	        <security:authorize ifAnyGranted="role_master">
	       		<li style="width:15%; margin-top: 3px;" class="w3-dropdown-hover"><a href="menu1">물 품 등 록&nbsp;<i class="fa fa-caret-down"></i></a>
					<div class="w3-dropdown-content w3-white w3-card-4">
	       				<a href="rentready">심 사 대 기 현 황</a>
	       				<a href="rentend">대 여 종 료 대 기</a>
	       			</div>
	       		</li>
	    	</security:authorize>
			
			<li style="width:5%"><p></p></li>
			
			<!-- Menu2_관리자가 아닌 경우 -->
			<security:authorize ifNotGranted="role_master">
				<!-- 비회원인 경우 -->
				<security:authorize ifNotGranted="role_user, role_com, role_master">
					<li style="width:15%; margin-top: 3px;" class="w3-dropdown-hover"><a href="Login">물 품 대 여&nbsp;<i class="fa fa-caret-down"></i></a>
						<div class="w3-dropdown-content w3-white w3-card-4" >
				        	<a href="Login">대 여 가 능 현 황</a>
				        	<a href="Login">나 의 대 여 현 황</a>
				    	</div>
				    </li>
		    	</security:authorize>
		    	
		    	<!-- 회원인 경우 -->
				<security:authorize ifAnyGranted="role_user, role_com">
					<li style="width:15%; margin-top: 3px;" class="w3-dropdown-hover"><a href="menu2">물 품 대 여&nbsp;<i class="fa fa-caret-down"></i></a>
						<div class="w3-dropdown-content w3-white w3-card-4" >
				        	<a href="menu2_1">대 여 가 능 현 황</a>
				        	<a href="menu2_2">나 의 대 여 현 황</a>
				    	</div>
			    	</li>
		    	</security:authorize>
	        </security:authorize>
	        
	        <!-- Menu2_관리자인 경우 -->
	        <security:authorize ifAnyGranted="role_master">
	       		<li style="width:15%; margin-top: 3px;" class="w3-dropdown-hover"><a href="menu2">물 품 대 여&nbsp;<i class="fa fa-caret-down"></i></a>
					<div class="w3-dropdown-content w3-white w3-card-4" >
	       				<a href="rentreadylist">대 여 신 청</a>
	       				<a href="rentoutlist">반 납 신 청</a>
	       			</div>
	       		</li>
	    	</security:authorize>
			
			<li style="width:5%"><p></p></li>
			
			<li style="width:15%; margin-top: 3px;" class="w3-dropdown-hover"><a href="menu3">장 소 대 여&nbsp;<i class="fa fa-caret-down"></i></a>
				<div class="w3-dropdown-content w3-white w3-card-4">
			        <a href="menu3_1">menu3_1</a>
			        <a href="menu3_2">menu3_2</a>
			    	<a href="menu3_3">menu3_3</a>
			    	<a href="menu3_4">menu3_4</a>
			    	<a href="menu3_5">menu3_5</a>
			    </div>
			</li>
			
			<li style="width:5%"><p></p></li>
			
			<li style="width:15%; margin-top: 3px;" class="w3-dropdown-hover"><a href="free_list">게 시 판&nbsp;<i class="fa fa-caret-down"></i></a>
				<div class="w3-dropdown-content w3-white w3-card-4">
			        <a href="free_list">자 유 게 시 판</a>
			    	<a href="menu4_2">menu4_2</a>
			    	<a href="menu4_3">menu4_3</a>
			    	<a href="menu4_4">menu4_4</a>
			    	<a href="menu4_5">menu4_5</a>
			    </div>	
			</li>
			
			<li style="width:5%"><p></p></li>
			
			<li style="width:15%; margin-top: 3px;" class="w3-dropdown-hover"><a href="siteintro">서 비 스 소 개&nbsp;<i class="fa fa-caret-down"></i></a>
				<div class="w3-dropdown-content w3-white w3-card-4">
			        <a href="siteintro">서 비 스 소 개</a>
			        <a href="use">이 용 방 법</a>
			    	<a href="rule">이 용 규 칙</a>
			    	<a href="menu5_3">menu5_3</a>
			    	<a href="menu5_4">menu5_4</a>
			    </div>	
			</li>
		</ul>
	</div>
</body>
</html>