<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>요청게시판_상세보기</title>
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
						<tr  height="35">
							<td class="top-border" style="font-family: 'Jeju Gothic', sans-serif;">&nbsp;&nbsp;물　품　사　진</td>
							
							<td width=30 class="top-bottom-border">
		                    	<select name="category" readonly style="border-radius:4px; text-align:center; height:27px; width:82px;">
		                        	<option style="text-align:center;">${result.category}</option>
		                     	</select>
		                  	</td>
			            
			                <td class="top-bottom-border">
			                	<input type="text" class="free-insert-title" name="title" style="margin-left: 12px;" readonly value="${result.title }">
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

					<div align=center>
						<!-- 관리자는 모든 글을 수정/삭제 가능 -->
						<security:authorize ifAnyGranted="role_master">
							<form action="updateForm" method="post" style="float: left; width: 18%; margin-left: 32%;">
					            <input type="submit" class="free_update-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수　정" /> 
					            
					            <input type="hidden" name="bNum" value="${result.bNum}"> 
					            <input type="hidden" name="bgnum" value="${result.bgnum}"> 
					            <input type="hidden" name="id" value="${result.id}">
	         				</form>
						
							<form action="deleteForm" style="float: left; width: 18%;">
					            <input type="submit" class="free_delete-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭　제" /> 
					            
					            <input type="hidden" name="bNum" value="${result.bNum}"> 
					            <input type="hidden" name="bgnum" value="${result.bgnum}"> 
					            <input type="hidden" name="id" value="${result.id}">
					        </form>
						</security:authorize>
						
						<!-- 비회원인 경우, 일반회원인데 자신의 글인 경우 -->
						<security:authorize ifNotGranted="role_master">
							<c:if test="${result.id == session_id}">
								<form action="updateForm" method="post" style="float: left; width: 18%; margin-left: 32%;">
						            <input type="submit" class="free_update-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수　정" /> 
						            
						            <input type="hidden" name="bNum" value="${result.bNum}"> 
						            <input type="hidden" name="bgnum" value="${result.bgnum}"> 
						            <input type="hidden" name="id" value="${result.id}">
		         				</form>
							
								<form action="deleteForm" style="float: left; width: 18%;">
						            <input type="submit" class="free_delete-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭　제" /> 
						            
						            <input type="hidden" name="bNum" value="${result.bNum}"> 
						            <input type="hidden" name="bgnum" value="${result.bgnum}"> 
						            <input type="hidden" name="id" value="${result.id}">
						        </form>
							</c:if>
							
							<c:if test="${result.id != session_id}">
								<p style="margin-top: 30px;"></p>
							</c:if>
						</security:authorize>
					</div>

					<security:authorize ifAnyGranted="role_user, role_com, role_master">
						<!-- 리플 달기!! -->
						<form action="insertForm2" method="post">
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
					</security:authorize>
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
								
							<td width="50%">
								${result.contents} 
								<input type="hidden" value="${result.contents}" name="contents">
							</td>
							
							<!-- 날짜 -->							
							<td width="25%">
								<fmt:formatDate value="${result.bDate}" pattern="yyyy-MM-dd"/>
							</td>
						
							<%-- <td>
								<!-- 댓글에 댓글버튼 -->
								<form action="insert_reply" method=post style="width:20px;">
			                        <input class="reply-btn2" type="submit" style="background-image: url('/team4/resources/images/arrow.png'); width:30px; background-repeat: no-repeat; background-position: center;" value="">
			                        <input type="hidden" name="bNum" value="${result.bNum}">
			                        <input type="hidden" name="bgnum" value="${result.bgnum}">
			                        <input type="hidden" name="groupnum" value="${result.groupnum}">
			                        <input type="hidden" name="ranknum" value="${result.ranknum}">
		                   		</form>
							</td> --%>
							
							<td>
								<!-- 내가 쓴 리플 수정/삭제 -->
								<security:authorize ifNotGranted="role_master">
									<c:if test="${result.id == session_id}">
 										<%-- <!-- 수정버튼 -->
										<form action="update_reply" method=post>
					                        <input class="reply-btn2" type="submit" style="background-image: url('/team4/resources/images/reupdate.png'); width:30px; background-repeat: no-repeat; background-position: center;" value="">
					                        <input type="hidden" name="bNum" value="${result.bNum}">
					                        <input type="hidden" name="bgnum" value="${result.bgnum}">
					                        <input type="hidden" name="id" value="${result.id}">
				                   		</form> --%>
										
										<!-- 삭제버튼 -->
										<form action="deleteForm" method=post style="width:20px;">
					                        <input class="reply-btn2" type="submit" style="background-image: url('/team4/resources/images/redelete.png'); width:30px; background-repeat: no-repeat; background-position: center;" value="">
					                        <input type="hidden" name="bNum" value="${result.bNum}">
					                        <input type="hidden" name="bgnum" value="${result.bgnum}">
					                        <input type="hidden" name="id" value="${result.id}">
				                   		</form>
				                   	</c:if>
			                   	</security:authorize>
	
								<!-- 관리자일 경우 모든 댓글 삭제 가능 -->
								<security:authorize ifAnyGranted="role_master">
									<%-- <!-- 수정버튼 -->
									<form action="update_reply" method=post>
				                        <input class="reply-btn2" type="submit" style="background-image: url('/team4/resources/images/reupdate.png'); width:30px; background-repeat: no-repeat; background-position: center;" value="">
				                        <input type="hidden" name="bNum" value="${result.bNum}">
				                        <input type="hidden" name="bgnum" value="${result.bgnum}">
				                        <input type="hidden" name="id" value="${result.id}">
			                   		</form> --%>
									
									<!-- 삭제버튼 -->
									<form action="deleteForm" method=post style="width:20px;">
				                        <input class="reply-btn2" type="submit" style="background-image: url('/team4/resources/images/redelete.png'); width:30px; background-repeat: no-repeat; background-position: center;" value="">
				                        <input type="hidden" name="bNum" value="${result.bNum}">
					                    <input type="hidden" name="bgnum" value="${result.bgnum}">
					                    <input type="hidden" name="id" value="${result.id}">
			                   		</form>
			                   	</security:authorize>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>