<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>mypage_delete</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
</head>
<body>
	<div align=center class="main-table" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align:middle; display:table-cell;">
		<div style="width: 40%;" align=center>
			<div class="w3-rest w3-container w3-round-large w3-card-4" style="background-color: #F0F0f0;margin-bottom:20px; margin-top:20px;">
				<div style="margin-bottom:20px; margin-top:20px;">
					<h3> My Page </h3>
				</div>

				<form action="mypage_delete" method="post">
					<table align=center>				
						<tr>
							<td class="user_delete" width="13%"></td>
							<td width=3%></td>
							<td>
								<input type="password" name="pwd" class="w3-left w3-input" style="width:90%; border-radius: 6px;" required="required">
							</td>
						</tr>
					</table>
					
					<p>
						<input type="submit" class="delete-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;Delete" />
						&nbsp;&nbsp;&nbsp;
						<input type="button" class="cancel-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cancel" onclick="location.href='mypage'"/>
					</p>

					<input type="hidden" value="${session_id}">
				</form>
			</div>
		</div>
	</div>
</body>
</html>