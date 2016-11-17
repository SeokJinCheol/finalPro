<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div align=center class="main-table" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align:middle; display:table-cell;">
		<div style="width: 40%;" align=center>
			<div class="w3-rest w3-container w3-round-large w3-card-4" style="background-color: #F0F0f0;margin-bottom:20px; margin-top:20px;">
				<div style="margin-bottom:20px; margin-top:20px;">
					<h3> J o i n </h3>
				</div>
			
				<form action="joinForm1" method="post">
					<!-- 이용약관 동의 -->
					<div class="w3-row w3-wide" align=center style="margin-bottom:20px;">
						<input type="checkbox" name="check" required> 
						귀하는 해당사이트의 	
						<a href="join/agreement.jsp" target="_blank" onclick="window.open('agreement', 'agreement', 'left=100, top=0, width=900, height=600'); return false">이용약관</a>
						에 동의합니다.
					</div>
							
					<table>
						<tr>
							<td>&nbsp;ID</td>
							<td>
								<input type="text" name="id" placeholder="Enter your ID" class="w3-left w3-input" style="width:55%; border-radius: 6px;" required> 
								<input type="button" class="join-btn w3-card-4 w3-right" name="confirm_id" value="ID 중복확인" onclick="openConfirmid(this.form)">
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;PWD</td>
							<td>
								<input type="password" name="pwd" class="w3-left w3-input" style="width:55%; border-radius: 6px;" placeholder="Enter your Pwd" required>
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;NAME</td>
							<td>
								<input type="text" name="name" class="w3-left w3-input" style="width:55%; border-radius: 6px;" placeholder="Enter your Name" required>
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;BirthDay</td>
							<td>
								<input type="date" name="birthday" value="1990-01-01" class="w3-left w3-input" style="width:65%; border-radius: 6px;" placeholder="Enter your BirthDay" required>
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;Phone&nbsp;Number</td>
							<td>
								<input type="text" name="phoneNum1" class="w3-left w3-input" style="width:65%; border-radius: 6px;" placeholder="Enter your Phone Number" required>
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;Home&nbsp;Number</td>
							<td>
								<input type="text" class="w3-left w3-input" style="width:65%; border-radius: 6px;" name="phoneNum2">
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;E-mail</td>
							<td>
								<input type="text" name="email" class="w3-left w3-input" style="width:65%; border-radius: 6px;" placeholder="Enter your E-mail" required>
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;Adress</td>
							<td>
								<input type="text" name="adress" class="w3-left w3-input" style="width:65%; border-radius: 6px;" placeholder="Enter your Adress" required>
							</td>
						</tr>
						
						<tr>
							<td>&nbsp;Company</td>
							<td>
								<input type="text" name="company" class="w3-left w3-input" style="width:65%; border-radius: 6px;" placeholder="Enter your Company" required>
							</td>
						</tr>
					</table>
		
					<p>
						<input type="submit" class="join-btn1 w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;J o i n" />
						&nbsp;&nbsp;&nbsp;
						<input type="button" class="cancel-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cancel" onclick="location.href='joinForm'"/>
					</p>
					
					<input type="hidden" name="memberRank" value="기업회원">
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	// 아이디 중복 여부 판단 함수
	function openConfirmid(joinForm) {
		url = "ConfirmId?id=" + joinForm.id.value;
		winObject = window.open(url, "id", "left=100, top=150, width=550, height=250");
		winObject.document.all.id.value = document.all.id.value;
	}
</script>
</html>