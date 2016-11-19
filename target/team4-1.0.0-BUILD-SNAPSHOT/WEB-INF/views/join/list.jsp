<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>joinForm</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div align=center class="main-table" style="background: #f5f6f7; width: 1350px; height:500px; vertical-align:middle; display:table-cell;">
		<div align=center>
			<div class="w3-container w3-round-large w3-card-4" style="background-color: #F0F0f0; margin-left:50px; margin-right:50px;">
				<div style="margin-bottom:20px; margin-top:20px;">
					<h3> 회 원 목 록 </h3>
				</div>

				<div class="w3-container">
					<table class="w3-table w3-centered" style="margin-bottom:20px;">
					     <tr style="border-bottom:2px solid black;">
							<td align="center">ID</td>
							<%--<td align="center">PWD</td>--%>
							<td align="center">NAME</td>
							<td align="center">Birthday</td>
							<%-- <td align="center">Phone&nbsp;Number</td>
							<td align="center">Home&nbsp;Number</td> --%>
							<td align="center">E-mail</td>
							<td align="center">Adress</td>
							<td align="center">Member&nbsp;Rank</td>
							<%--<td align="center">Company</td>--%>
							<td align="center">Update</td>
							<td align="center">Delete</td>
					     </tr>
					     
					     <c:forEach items="${result}" var="member">
					         <tr>
					             <td>${member.id}</td>
					             <%--<td>${member.pwd}</td>--%>
					             <td>${member.name }</td>
					             <td>${member.birthday }</td>
					             <%-- <td>${member.phoneNum1 }</td>
					             <td>${member.phoneNum2 }</td> --%>
					             <td>${member.email }</td>
					             <td>${member.adress }</td>
					             <td>${member.memberRank }</td>
					             <%--<td>${member.company }</td>--%>
					             <td><input type=button value="" class="update-btn2 w3-card-4" onclick="location.href='admin_update?id=${member.id}'"></td>
					             <td>
					             	<input type=button value="" class="cancel-btn3 w3-card-4" onclick="checkDel('${member.id}')">
					             	
					             	<form action="admin_delete" method=post name="${member.id}">
					             		<input type="hidden" name="m_id" value="${member.id}"/>
					             	</form>
					             </td>
					         </tr>																	
					     </c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function checkDel(a) {
		var name = a;

		if (confirm("정말 탈퇴시키시겠습니까??") == true){		
	    	document.forms[name].submit();
		}
		
		else{
			return false;
		}
	}
</script>
</html>