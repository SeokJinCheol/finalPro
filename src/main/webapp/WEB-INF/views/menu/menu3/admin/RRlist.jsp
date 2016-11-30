<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>장소등록관리</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background: #6699DC; color: white; height: 100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/map42.png" style="margin-right: 10px;"> 
		<font style="margin-right: 30px; font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px;">장 소 등 록 관 리</font>
	</div>

	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div class="row" align=center style="margin-bottom:15px; margin-top:20px;">
			<!-- 카테고리별 검색 -->
			<form action="RRlist" method="post" style=" margin-right: 5px; display:inline;">
				<input type="hidden" name="status" value="대여대기">
				
				<input type="submit" class="button-write22" value="대 여 대 기">
			</form>

			<form action="RRlist" method="post" style=" margin-right: 5px; display:inline;">
				<input type="hidden" name="status" value="대여가능">
				
				<input type="submit" class="button-write22" value="대 여 가 능">
			</form>

			<form action="RRlist" method="post" style=" margin-right: 5px; display:inline;">
				<input type="hidden" name="status" value="대여완료">
				
				<input type="submit" class="button-write22" value="대 여 완 료">
			</form>

			<form action="RRlist" method="post" style="display:inline;">
				<input type="hidden" name="status" value="대여불가">
				
				<input type="submit" class="button-write22" value="대 여 불 가">
			</form>
		</div>

		<div style="margin-bottom: 20px; width:820px; background-color: #fafafa;" class="w3-card-8">
			<table style="height:400px; width:820px; padding: 20px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 20px; padding-bottom: 20px;">
				<thead style="height:30px; table-layout:fixed">
					<tr class="bottom-border2" style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
				        <td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">외관사진</td>
				        <td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">등록자</td>
				        <td width=140 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">가능일자</td>
		                <td width=212 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">주　소</td>
				        <td width=100 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">일일요금</td>
				        <td width=138 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">현　황</td>
				        <td width=70 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000;">수　정</td>
				    </tr>
			    </thead>
			    
			    <tbody style="height:340px; overflow-y: auto; position: absolute;">
					<c:forEach items="${list}" var="vo">
						<c:set var="total" value="${total+vo.bill }" />
						<tr onMouseOver="this.style.backgroundColor='#eff7fc'" onMouseOut="this.style.backgroundColor='#fafafa'" height="65">
							<td width=80 style="border-bottom: 3px solid #fff;">
								<img src="/team4/resources/BoardImg/${vo.img}" style="width: 80px; height: 65px;">
							</td>
							
							<td width=80 style="border-bottom: 3px solid #fff;">
								${vo.registerId}
							</td>
	
							<td width=140 style="border-bottom: 3px solid #fff; text-align: left;">
								　${vo.startDate}<br>　　~　${vo.endDate}
							</td>
							
							<td width=212 style="border-bottom: 3px solid #fff;">
								${vo.adress}
							</td>

							<td width=100 style="border-bottom: 3px solid #fff;">
								<fmt:formatNumber value="${vo.bill}" pattern="￦ ###,###"/> 원
							</td>
							
							<td width=138 align=center style="border-bottom: 3px solid #fff;">
								<select id="mySelect${vo.codeNum }" size="1">
									<option>${vo.packageStatus }</option>
										
									<c:if test="${vo.packageStatus=='대여가능'}">
										<option>대여대기</option>
									  	<option>대여완료</option>
									  	<option>대여불가</option>
									</c:if>
									
									<c:if test="${vo.packageStatus=='대여대기'}">
									  	<option>대여가능</option>
									  	<option>대여완료</option>
									  	<option>대여불가</option>
									</c:if>
									  
									<c:if test="${vo.packageStatus=='대여완료'}">
									  	<option>대여가능</option>
									  	<option>대여대기</option>
									  	<option>대여불가</option>
									</c:if>
									   
									<c:if test="${vo.packageStatus=='대여불가'}">
									  	<option>대여가능</option>
									  	<option>대여완료</option>
									  	<option>대여대기</option>
									</c:if>
								</select>
								
								<form name="${vo.codeNum }" id="${vo.codeNum }" action="setRRBstatus">
									<input type="hidden" name="codeNum" value="${vo.codeNum }">
									<input type="hidden" name="status" id="status">
									
									<input type="submit" class="update-menu3 w3-card-8" value="" onclick="setpakageStatus(${vo.codeNum });	return false;">
								</form>
							</td>
							
							<td width=70 align=center style="border-bottom: 3px solid #fff;">
								<form action="showContentsForm" method=post>
									<input type="hidden" name="codeNum" value="${vo.codeNum }">
									
									<input type="submit" value="" class="update-btn2 w3-card-4" name="mody">
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
					
				<tfoot style="height:30px; table-layout:fixed">
					<tr>
						<th colspan="2"  style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000;">총 결 산</th>
						<td colspan="5" style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000;">
							총 금액　:　<fmt:formatNumber value="${total}" pattern="￦ ###,###"/> 원
						</td>
					</tr>
				</tfoot>	
			</table>		
		</div>
	</div>
</body>

<script type="text/javascript">
function setpakageStatus(name){
	var myselect= "mySelect"+name;
	
	if(confirm("수정하시겠습니까?") == true) {
		document.getElementById(name).status.value=document.getElementById(myselect).value;

		document.forms(name).submit();
	}
	
	else {
		return false;
	}
}
</script>
</html>