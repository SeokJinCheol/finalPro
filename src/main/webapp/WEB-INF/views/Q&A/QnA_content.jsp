<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Q&A_상세보기</title>
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
		<input type="hidden" name="bnum" value="${vo.bnum}">
		
		<div style="margin-bottom: 20px; width: 73%; margin-top:40px;">	
			<table  style="border-collapse: collapse; border-spacing: 0;">
				<tr height="35">
					<td class="top-border" style="font-family: 'Jeju Gothic', sans-serif;">&nbsp;&nbsp;질　문　사　진</td>
					
					<td width=30 class="top-bottom-border">
                    	<select name="category" readonly style="border-radius:4px; text-align:center; height:27px; width:82px;">
                        	<option style="text-align:center;">${vo.category}</option>
                     	</select>
                  	</td>
	            
	                <td class="top-bottom-border">
	                	<input type="text" class="free-insert-title" name="title" style="margin-left: 12px;" readonly value="${vo.title }">
	                </td>
				</tr>
			
				<tr align=center >
					<td style="margin-right:50px;" rowspan="4" class="bottom-border2" >
						<img src="/team4/resources/QandAImg/${vo.img}" style="width: 300px; height: 300px;">
					</td>
				</tr>
			
				<tr align="center" height="35">
               		<td style="text-align: center; font-family: 'Jeju Gothic', sans-serif; border-right:1px solid white;" class="bottom-border">작　성　자</td>
               		<td class="bottom-border"><input type="text" name="id" class="free-insert-title" value = "${vo.id }" style="text-align:center;" readonly></td>
                </tr>
               
				<tr height="35">
					<td colspan="2" style="font-family: 'Jeju Gothic', sans-serif;">　내　　용　</td>
				</tr>
			
				<tr align="center" > 
                	<td colspan="2" class="bottom-border2">
                  		<textarea class="free-insert-content-title" style="resize: none;" name="contents" rows="10" cols="35" readonly>${vo.contents }</textarea>
                	</td>
                </tr>
			</table>
			
			<div align=center>
				<!-- 관리자는 모든 글을 수정 가능 -->
				<security:authorize ifAnyGranted="role_master">
						<form action="QnA_update_get" style="float: left; width: 18%; margin-left: 32%;" method=post>
							<input class="free_update-btn w3-card-4" type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수　정">
							<input type="hidden" name="bnum" value="${vo.bnum}">
						</form >
						&nbsp;&nbsp;&nbsp;
						<form action="QnA_delete" method=post style="float: left; width: 18%;">
							<input class="free_delete-btn w3-card-4" type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭　제">
							<input type="hidden" name="bnum" value="${vo.bnum}">
						</form>
						&nbsp;&nbsp;&nbsp;
				</security:authorize>
				
				<!-- 비회원인 경우, 일반회원인데 자신의 글인 경우 -->
				<security:authorize ifNotGranted="role_master">
					<c:if test="${vo.id == session_id}">
						<form action="QnA_update_get" style="float: left; width: 18%; margin-left: 32%;" method=post>
							<input class="free_update-btn w3-card-4" type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수　정">
							<input type="hidden" name="bnum" value="${vo.bnum}">
						</form>
						&nbsp;&nbsp;&nbsp;
						<form action="QnA_delete" method=post style="float: left; width: 18%;">
							<input class="free_delete-btn w3-card-4" type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭　제">
							<input type="hidden" name="bnum" value="${vo.bnum}">
						</form>
						&nbsp;&nbsp;&nbsp;
					</c:if>
				</security:authorize>
			</div>
		</div>
		
		<!-- 리플 달기!! -->
		<form action="QnA_reply" method="post">
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
	        
	        <input type="hidden" name="bnum" value="${vo.bnum}">
		    <input type="hidden" name="title" value="${vo.title}">
		    <input type="hidden" name="img" value="${vo.img}">
		</form>
      
        <input type="hidden" name="bNum" value="${vo.bnum }"> 
        
        <!-- 리플 리스트 -->
		<table style="border-collapse: collapse; border-spacing: 0; width: 559px; height: 40px; text-align: center;">
			<c:forEach items="${list}" var="reply">
				<c:if test="${result.groupnum != 0}">
					<tr style="border-top:2px solid black; border-bottom:2px solid black;">
						<td width="15%">
							${reply.id}
						</td>
							
						<td width="40%">
							${reply.contents}
						</td>
						
						<!-- 날짜 -->							
						<td width="17%">
							<fmt:formatDate value="${reply.date}" pattern="yyyy-MM-dd"/>
						</td>
					
						<td>
							<!-- 내가 쓴 리플 삭제 -->
							<security:authorize ifNotGranted="role_master">
								<c:if test="${reply.id == session_id}">
									<form action="QnA_re_delete" method=post>
				                        <input class="reply-btn2" type="submit" style="background-image: url('/team4/resources/images/redelete.png'); width:30px; background-repeat: no-repeat; background-position: center;" value="">
				                        <input type="hidden" name="reply_bnum" value="${reply.bnum}">
				                        <input type="hidden" name="bnum" value="${vo.bnum}">
			                   		</form>
			                   	</c:if>
		                   	</security:authorize>

							<!-- 관리자일 경우 모든 댓글 삭제 가능 -->
							<security:authorize ifAnyGranted="role_master">
								<form action="QnA_re_delete" method=post>
			                        <input class="reply-btn2" type="submit" style="background-image: url('/team4/resources/images/redelete.png'); width:30px; background-repeat: no-repeat; background-position: center;" value="">
			                        <input type="hidden" name="reply_bnum" value="${reply.bnum}">
			                        <input type="hidden" name="bnum" value="${vo.bnum}">
		                   		</form>
		                   	</security:authorize>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
</body>
</html>