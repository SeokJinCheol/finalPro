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
			<div class="w3-rest w3-container w3-round-large w3-card-4" style="margin-bottom:30px; background-color: #F0F0f0">
				<div align=center style="margin-bottom:20px; margin-top:30px;">
					<h3> L o g i n </h3>
				</div>

				<c:url value="/j_spring_security_check" var="loginURL" />
				<form action="${loginURL}" method="post">
					<!-- 로그인 실패 시, 이유 표현 -->
					<c:if test="${param.error != null}">
						<script type="text/javascript">
							alert("\n                                    ※ 로 그 인 실 패 ※\n");
						</script>
					</c:if>
					
					<!-- 로그인 Form -->
					<table class="w3-table w3-centered">
						<tr>
							<td colspan="2">
								<div align=center >
									<table >
										<tr>
											<td>
												<input type="text" name="j_username" placeholder="I D" class="w3-input login-id" required>
											</td>
											
											<td rowspan="2">
												<p>
													<input type="submit" class="w3-right login-btn w3-card-4" style="height:70px; margin-top:0px" id="btnLogin" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Login" />
												</p>
											</td>
										</tr>
										
										<tr>
											<td>
												<input type="password" name="j_password" placeholder="Password" class="w3-input login-pwd" required>
											</td>
										</tr>					
									</table>
									
									<div style="margin-bottom:20px;">
										<a href="joinForm" style="padding-bottom: 10px"><img src="/team4/resources/images/join18.png"> J o i n</a>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>