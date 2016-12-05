<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function setpakageStatus(name){
	var myselect= "mySelect"+name;
	
	if(confirm("수정하시겠습니까?")==true){
	
		document.getElementById(name).status.value=document.getElementById(myselect).value;

		
		 document.forms(name).submit();
	}else{		return false;		}
	}
	
</script>
<title>나의장소목록</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/mywrite2.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">나 의 장 소 목 록</font>
	</div>

	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 10px; width:800px; background-color: #fafafa;" class="w3-card-8">
			<table style="height:433px; width:800px; padding: 20px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
				<thead style="height:30px; table-layout:fixed">
					<tr class="bottom-border2" style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
				        <td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">등록자</td>
				        <td width=140 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">대여가능일자</td>
				        <td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">외관사진</td>
		                <td width=120 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">장　소</td>
		                <td width=240 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">주　소</td>
				        <td width=90 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">현　황</td>
				        <td width=50 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000;">수　정</td>
				    </tr>
			    </thead>

				<tbody style="height:400px; overflow-y: auto; position: absolute;">
					<c:forEach items="${list}" var="vo">
						<tr onMouseOver="this.style.backgroundColor='#eff7fc'" onMouseOut="this.style.backgroundColor='#fafafa'" height="60">
							<td width=80 style="border-bottom: 3px solid #fff;">
								${vo.registerId} 님
							</td>
							
							<td width=140 style="border-bottom: 3px solid #fff; text-align: left;">
								　${vo.startDate}<br>　　~　${vo.endDate}
							</td>
							
							<td width=80 style="border-bottom: 3px solid #fff;">
								<img src="/team4/resources/BoardImg/${vo.img}" style="width: 78px; height: 60px;">
							</td>
	
							<td width=120 style="border-bottom: 3px solid #fff;">
								${vo.title}
							</td>
							
							<!-- 주소가 20자 이상일 경우 줄여쓰기 기능 -->
		             		<c:choose>
			             		<c:when test="${fn:length(vo.adress) > 20}">
									<td width=240 style="border-bottom: 3px solid #fff;">
										<c:out value="${fn:substring(vo.adress,0,20)}" />...
									</td>
								</c:when>
								
								<c:otherwise>
									<td width=240 style="border-bottom: 3px solid #fff;">
										<c:out value="${vo.adress}"/>
									</td>
								</c:otherwise>
							</c:choose>
									<td width=90 style="border-bottom: 3px solid #fff;">
										${vo.packageStatus}
									</td>
							<td width=50 style="border-bottom: 3px solid #fff;" align=center>
								<c:if test="${vo.packageStatus == '대여가능'||vo.packageStatus == '정산완료'}">
									<form action="myModifyRRB" method="post">
										<input type="hidden" name="codeNum" value="${vo.codeNum }">
										
										<input type="submit" value="" class="update-btn2 w3-card-4" name="mody">
									</form>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>