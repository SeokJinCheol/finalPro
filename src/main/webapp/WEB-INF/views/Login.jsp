<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<title>Login Form</title>
<head>
<!-- CSS 연결-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>	
<body>
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height:500px; vertical-align:middle; display:table-cell;">
		<div style="width:35%;" align=center>
			<div class="w3-rest w3-container w3-round-large w3-card-8 login-page" style="margin-bottom:30px; background-color: #fff">
				<c:url value="/j_spring_security_check" var="loginURL" />
				<form action="${loginURL}" method="post">
					<!-- 로그인 실패 시, 이유 표현 -->
					<c:if test="${param.error != null}">
						<script type="text/javascript">
							alert("\n                                    ※ 로 그 인 실 패 ※\n");
						</script>
					</c:if>
					
					<!-- 로그인 Form -->
					<table class="w3-table w3-centered" style="margin-top:30px;">
						<tr>
							<td>
								<input type="text" name="j_username" placeholder="Username" class="w3-card-2 login-id" style="background-color: #f2f2f2; font-family: Roboto sans-serif;" required>
							</td>
							
							<td rowspan="2">
								<p>
									<input type="submit" class="login-btn w3-card-4" style="height:75px; font-family: Roboto sans-serif;" id="btnLogin" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Login" />
								</p>
							</td>
						</tr>
						
						<tr>
							<td>
								<input type="password" name="j_password" placeholder="Password" class="w3-card-2 login-pwd" style="background-color: #f2f2f2; font-family: Roboto sans-serif;" required>
							</td>
						</tr>
					</table>
					
					<p class="message" style="margin-bottom:30px; margin-top:0px;">Not registered? <a href="joinForm">Create an account</a></p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>