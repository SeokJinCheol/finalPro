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
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right;line-height: 130px;">
		<img src="/team4/resources/images/left-mypage22.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">회 원 탈 퇴</font>
	</div>

	<div align=center class="main-table" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align:middle; display:table-cell;">
		<div style="width: 40%;" align=center>
			<div class="w3-rest w3-container w3-round-large w3-card-4" style="background-color: #fff;margin-bottom:20px; margin-top:20px;">
				<div style="margin-top:30px;">
					<h6>비밀번호를 입력해주세요.</h6>
				</div>
				
				<form action="mypage_delete" method="post" style="margin-bottom:20px;">
					<table align=center>				
						<tr>
							<td class="user_delete" width="13%"></td>
							<td width=3%></td>
							<td>
								<input type="password" name="pwd" class="free-insert-title w3-left" style="width:90%; height:29px; border-radius: 6px;" required="required">
							</td>
						</tr>
					</table>
					
					<p>
						<input type="submit" class="free_delete-btn222 w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;탈　퇴" onclick="setpakageStatus(); return false;"/>
						&nbsp;&nbsp;&nbsp;
						<input type="button" class="free_insert-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취　소" onclick="location.href='mypage'"/>
					</p>

					<input type="hidden" value="${session_id}">
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function setpakageStatus() {
		if (confirm("정말 탈퇴하시겠습니까??") == true) {
			document.form.submit();
		} else { return false; }
	}
</script>
</html>