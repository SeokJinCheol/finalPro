<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>자유게시판_상세보기</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right;line-height: 130px;">
		<img src="/team4/resources/images/free_content.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">상 세 보 기</font>
	</div>

	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; width: 73%; margin-top:40px;">		
			<table  style="border-collapse: collapse; border-spacing: 0;">
				<c:forEach items="${result}" var="result">
					<c:if test="${result.bNum==result.bgnum }">
						<tr height="35">
							<td class="top-border" style="font-family: 'Jeju Gothic', sans-serif;">&nbsp;&nbsp;물　품　사　진</td>
							
							<td width=30 class="top-bottom-border">
		                    	<select name="category" readonly style="border-radius:4px; text-align:center; height:27px;">
		                        	<option style="text-align:center;">${result.category}</option>
		                     	</select>
		                  	</td>
			            
			                <td class="top-bottom-border">
			                	<input type="text" class="free-insert-title" name="title" style="margin-left: 13px;" readonly value="${result.title }">
			                </td>
						</tr>
						
						<tr align=center >
							<td style="margin-right:50px;" rowspan="4" class="bottom-border2" ><img src="/team4/resources/FreeBoardImg/${result.img}" style="width: 300px; height: 300px;"></td>
						</tr>
					
					   <tr align="center" height="35">
		               		<td style="text-align: center; font-family: 'Jeju Gothic', sans-serif; border-right:1px solid white;" class="bottom-border">작　성　자</td>
		               		<td class="bottom-border"><input type="text" name="id" class="free-insert-title" value = "${result.id }" style="text-align:center;" readonly></td>
		               </tr>
		               
						<tr height="35">
							<td colspan="2" style="font-family: 'Jeju Gothic', sans-serif;">　내　　용　</td>
						</tr>

						<tr align="center" > 
		                  <td colspan="2" class="bottom-border2">
		                  	<textarea class="free-insert-content-title" style="resize: none;" name="contents" rows="10" cols="35" readonly>${result.contents }</textarea>
		                  </td>
		               </tr>
					</table>

					<p>
						<input type="button" class="free_update-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수　정" onclick="window.location='updateForm?bNum=${result.bNum}&bgnum=${result.bgnum }&id=${result.id } '"/>
						&nbsp;&nbsp;&nbsp;
						<input type="button" class="free_delete-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭　제" onclick="window.location='deleteForm?bNum=${result.bNum}&bgnum=${result.bgnum }&id=${result.id } '"/>
						&nbsp;&nbsp;&nbsp;
						<input type="button" class="free_insert-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취　소" onclick="window.location='free_list'"/>
					</p>

					<!-- 리플 달기!! -->
					<form action="insertForm" method="post">
						<table style="border-collapse: collapse; border-spacing: 0; margin-bottom:15px;">
							<tr>
								<td>
									<textarea class="free-insert-content-title" style="resize: none;" name="contents" rows="3" cols="60" required></textarea>
								</td>
								
								<td>
									<input class="reply-btn" type="submit" value="답글">
								</td>
							</tr>
						</table>
		
						<input type="hidden" name="bNum" value="${result.bNum }"> 
						<input type="hidden" name="bgnum" value="${result.bgnum }"> 
						<input type="hidden" name="groupnum" value="${result.groupnum }">
						<input type="hidden" name="ranknum" value="${result.ranknum }">
						<input type="hidden" name="id" value="${session_id}" />
					</form>
				</c:if>
			</c:forEach>

			<!-- 리플 리스트 -->
			<table style="border-collapse: collapse; border-spacing: 0; width: 559px; height: 40px; text-align: center;">
				<c:forEach items="${result}" var="result">
					<c:if test="${result.groupnum != 0}">
						<tr style="border-top:2px solid black; border-bottom:2px solid black;">
							<td width="15%">
								<c:if test="${ result.ranknum>1}">
									<c:forEach begin="1" end="${ result.ranknum -1}">ㅡ>&nbsp;&nbsp;</c:forEach>
								</c:if>
								
								${result.id }
							</td>
								
							<td width="40%">
								${result.contents }
							</td>
							
							<!-- 날짜 -->							
							<td width="17%">
								<fmt:formatDate value="${result.bDate}" pattern="yyyy-MM-dd"/>
							</td>
						
							<td>
								<input type="button" style="background-image: url('/team4/resources/images/arrow.png'); width:30px; background-repeat: no-repeat; background-position: center;" class="reply-btn2" onclick="window.location='insertForm?bNum=${result.bNum}&bgnum=${result.bgnum }&groupnum=${result.groupnum}&ranknum=${result.ranknum} '">
								<input type="button" style="background-image: url('/team4/resources/images/reupdate.png'); width:30px; background-repeat: no-repeat; background-position: center;" onclick="window.location='updateForm?bNum=${result.bNum}&bgnum=${result.bgnum }&id=${result.id } '" class="reply-btn2">
								<input type="button" style="background-image: url('/team4/resources/images/redelete.png'); width:30px; background-repeat: no-repeat; background-position: center;" onclick="window.location='deleteForm?bNum=${result.bNum}&bgnum=${result.bgnum }&id=${result.id } '" class="reply-btn2">
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>