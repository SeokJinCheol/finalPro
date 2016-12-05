<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>목록 찾기 & 대여</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/map32.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">목 록 찾 기 & 대 여</font>
	</div>
        
	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<!-- 검색 -->
		<div class="w3-row" style="margin-top: 30px;">
			<form action="mainSearch" method=post>
				<select name="keyword" style="width: 15%; border-radius: 4px; text-align: center; height: 27px;">
					<option value="place" style="text-align: center;">장　소　명</option>
				</select> 
				
				<input type="text" name="word" value="${word}" placeholder="&nbsp;Search . . . " class="free-search-title" style="border-color: rgb(169, 169, 169);" required="required" /> 
				<input type="submit" class="list-search" value="Search" style="width: 8%;">
			</form>
		</div>		
		<br>
		
		<div style="margin-bottom: 20px; width:825px; background-color: #fafafa" class="w3-card-8">
        	<table style="height:403px; width:825px; padding: 20px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
	            <thead style="height:30px; table-layout:fixed">
		            <tr class="bottom-border2" style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
		                <td width=82 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">외관사진</td>
		                <td width=120 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">장　소</td>
		                <td width=245 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">주　소</td>
		                <td width=210 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">대여가능일자</td>
		                <td width=115 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">일일요금</td>
		                <td width=53 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000;">신　청</td>
		            </tr>
		        </thead>
			
				<tbody style="height:370px; overflow-y: auto; position: absolute;">
					<c:forEach items="${ list}" var="vo">
						<form action="showContentsForm" method="post">
							<tr onMouseOver="this.style.backgroundColor='#eff7fc'" onMouseOut="this.style.backgroundColor='#fafafa'">
								<td width=82 style="border-bottom: 3px solid #fff;">
									<img src="/team4/resources/BoardImg/${vo.img}" style="width: 80px; height: 50px;">
								</td>
								
								<td width=120 style="border-bottom: 3px solid #fff;">
									${vo.title}
								</td>
								
								<td width=245 style="border-bottom: 3px solid #fff;">
									${vo.adress}
								</td>
								
								<td width=210 style="border-bottom: 3px solid #fff;">
									${vo.startDate}　~　${vo.endDate}
								</td>
								
								<td width=115 style="border-bottom: 3px solid #fff;">
									<fmt:formatNumber value="${vo.bill}" pattern="￦ ###,###"/> 원
								</td>
								
								<td width=53 style="border-bottom: 3px solid #fff;">
									<input type="submit" class="update-menu3 w3-card-4" value="">
								</td>
							</tr>
							
							<input type="hidden" name="codeNum" value="${vo.codeNum }">
						</form>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>