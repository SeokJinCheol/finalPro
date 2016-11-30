<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>요청게시판_글쓰기</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right;line-height: 130px;">
		<img src="/team4/resources/images/free_write.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">글 쓰 기</font>
	</div>

	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; width: 73%; margin-top:40px;">	
	  		<form action="insertForm2" method="post" enctype="multipart/form-data">
		        <input type="hidden" name="bNum" value="${ bNum }"> 
		        <input type="hidden" name="bgnum" value="${ bgnum }"> 
		        <input type="hidden" name="groupnum" value="${ groupnum }"> 
		        <input type="hidden" name="ranknum" value="${ ranknum }">
         
         		<c:if test="${bNum == 0}">
		        	<table style="border-collapse: collapse; border-spacing: 0;">
		            	<tr align="center" height="35">
			            	<td width=30 class="top-bottom-border">
		                    	<select name="category" required style="border-radius:4px; text-align:center; height:27px;">
		                        	<option value="물건요청" style="text-align:center;">물건요청</option>
		                        	<option value="장소요청" style="text-align:center;">장소요청</option>
		                     	</select>
		                  	</td>
			            
			                <td class="top-bottom-border">
			                	<input type="text" class="free-insert-title" name="title" required placeholder=" 제목을 입력하세요." maxlength="30">
			                </td>
		               </tr>
		               
		               <tr align="center" height="35">
		               		<td style="text-align: center; font-family: 'Jeju Gothic', sans-serif; border-right:1px solid white;" class="bottom-border">작　성　자</td>
		               		<td class="bottom-border"><input type="text" name="id" class="free-insert-title" value = "${session_id}" style="text-align:center;" readonly></td>
		               </tr>
		                  
		               <tr height="35">
		               		<td colspan="2" style="font-family: 'Jeju Gothic', sans-serif;">&nbsp;&nbsp;게　시　글</td>
		               </tr>
		               
		               <tr align="center" height="35"> 
		                  <td colspan="2" class="bottom-border">
		                  	<textarea class="free-insert-content-title" style="resize: none;" name="contents" rows="10" cols="43" required maxlength="350"></textarea>
		                  </td>
		               </tr>
		               
		               <tr align="center" height="35">
		                  <td style="text-align: center; width: 80;border-right:1px solid white; font-family: 'Jeju Gothic', sans-serif;" class="bottom-border2">사　진</td>
		                  <td class="bottom-border2"><input type="file" name="file" style="margin-left: 10px;" ></td>
		               </tr>
					</table>
		            
		            <p>
						<input type="submit" class="free_insert w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게　시" />
						&nbsp;&nbsp;&nbsp;
						<input type="button" class="free_insert-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취　소" onclick="location.href='free_list'"/>
					</p>
				</c:if>
			</form>
		</div>
   </div>
</body>
</html>