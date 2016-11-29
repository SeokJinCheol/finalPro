<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>mypage</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right;line-height: 130px;">
		<img src="/team4/resources/images/left-mypage.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">My Page</font>
	</div>

	<div align=center class="main-table" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align:middle; display:table-cell;">
		<div style="width: 60%;" align=center>
			<div class="w3-rest w3-container w3-round-large w3-card-4" style="background-color: #fff">
				<div style="margin-bottom:30px; margin-top:50px;">
					※ 원하시는 기능을 선택하여 계속 진행해주세요. ※
				</div>
				
				<div style="margin-bottom:50px;">
					<a href="mypage_update" class=join-btn style="width:35%; height:100px; line-height: 90px;">회원 정보 수정</a>
					&nbsp;&nbsp;&nbsp;
					<a href="mypage_delete" class=join-btn style="width:35%; height:100px; line-height: 90px;">회 원 탈 퇴</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>