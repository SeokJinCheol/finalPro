<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>admin_update</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div align=center class="main-table" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align:middle; display:table-cell;">
		<div style="width: 40%;" align=center>
			<div class="w3-rest w3-container w3-round-large w3-card-4" style="background-color: #F0F0f0;margin-bottom:20px; margin-top:20px;">
				<div style="margin-bottom:20px; margin-top:20px;">
					<h3> 회원 정보 수정 </h3>
				</div>

				<form action="admin_update" method="post">
					<table>
						<tr>
							<td>&nbsp;ID</td>
							<td>
								<input type="text" name="id" class="w3-input" value="${result.id}" style="width:85%; border-radius: 6px;" readonly> 
							</td>
						</tr>

						<tr>
							<td>&nbsp;PWD</td>
							<td>
								<input type="password" name="pwd" class="w3-left w3-input" style="width:85%; border-radius: 6px;" value="${result.pwd}" required>
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;NAME</td>
							<td>
								<input type="text" value="${result.name}" name="name" class="w3-left w3-input" style="width:85%; border-radius: 6px;" required>
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;BirthDay</td>
							<td>
								<input type="date" name="birthday" value="${result.birthday }" class="w3-left w3-input" style="width:85%; border-radius: 6px;" required>
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;Phone&nbsp;Number</td>
							<td>
								<input type="text" value="${result.phoneNum1 }" name="phoneNum1" class="w3-left w3-input" style="width:85%; border-radius: 6px;" required>
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;Home&nbsp;Number</td>
							<td>
								<input type="text" value="${result.phoneNum2 }" class="w3-left w3-input" style="width:85%; border-radius: 6px;" name="phoneNum2">
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;E-mail</td>
							<td>
								<input type="text" value="${result.email }"  name="email" class="w3-left w3-input" style="width:85%; border-radius: 6px;" required>
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;Adress</td>
							<td>
								<input type="text" name="adress" value="${result.adress }" class="w3-left w3-input" style="width:85%; border-radius: 6px;" required>
							</td>
						</tr>

						<tr>
							<td>&nbsp;Member&nbsp;Rank</td>
							<td>
								<input type="text" name="memberRank" value="${result.memberRank }" class="w3-left w3-input" style="width:85%; border-radius: 6px;" readonly>
							</td>
						</tr>

						<security:authorize ifAnyGranted="role_com, role_master">
							<tr>
								<td>&nbsp;Company</td>
								<td><input type="text" class="w3-left w3-input" style="width:85%; border-radius: 6px;" name="company" value="${result.company}"></td>
							</tr>
						</security:authorize>
					</table>
					
					<p>
						<input type="submit" class="update-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Update"/>
						&nbsp;&nbsp;&nbsp;
						<input type="button" class="cancel-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cancel" onclick="location.href='list'"/>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>