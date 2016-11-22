<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>freeboard</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height:500px; vertical-align:middle; display:table-cell;">
		<div style="margin-bottom:20px; margin-top:70px;">
			<h4> - 질 문 게 시 판 - </h4>
			
			<div class="w3-row">	
			<form action="QnA_list" method=post>
				<select name="keyword" style="width:20%; height:27px;">
					<option value="title">제목</option>
					<option value="id">작성자</option>
				</select>
				
				<input type="text" name="word" value="${word}" style="width:60%;"/>
				
				<input type="submit" value ="검색" class="select " style="width:8%">
			</form>
			</div>
		</div>
			
		<security:authorize ifAnyGranted="role_user, role_com, role_master">
			<div class="w3-row">
				<div class="w3-col w3-right w3-centered" style="width: 10%; margin-bottom:30px;">
					<input type="button" value ="글쓰기" onclick="location='QnA_write'">
				</div>
			</div>
		</security:authorize>
			
		<div class="w3-row" style="margin-top: 0px;">
		<table border="1">
			<tr>
				<td>글번호</td>
				<td>이미지</td>
				<td>카테고리</td>
				<td>글제목</td>
				<td>작성자</td>
				<td>조회수</td>
				
			</tr>
	
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.rnum}</td>
					<td style="width: 10%"><img src="/team4/resources/QandAImg/${list.img }" style="width: 100%; height: 50px;"></td>
					<td>${list.category}</td>
					<td><a href="QnA_content?bnum=${list.bnum}">${list.title}<c:if test="${list.replyCount != null}">(${list.replyCount})</c:if></a></td>
					<td>${list.id}</td>
					<td>${list.count}</td>
					
				</tr>
				
				<input type="hidden" name="bnum" value="${list.bnum}">
			</c:forEach>
		</table>
		</div>
		
		<!-- 페이지 번호 -->
		<div align="center" class="w3-row">
		   <c:if test="${count>0}" >
		      <c:set var="pageCount" value="${pageCount}"/><!-- pagCount=15 -->
		      <c:set var="startPage" value="${1}" />
		      <c:set var="pageBlock" value="${5}" />
		
		      <fmt:parseNumber var="result" value="${currentPage/pageBlock}" integerOnly="true" />
		         
		      <c:if test="${(currentPage%pageBlock)!=0}">
		         <c:set var="startPage" value="${result*pageBlock+1}" /><!-- startpage=11 -->
		      </c:if>
		
		      <c:if test="${(currentPage%pageBlock)==0}">
		         <c:set var="startPage" value="${(result-1)*pageBlock+1}" />
		      </c:if>
		      
		      <c:set var="endPage" value="${startPage+pageBlock-1}" /><!-- endpage=15 -->
		      <c:if test="${endPage>=pageCount}">
		         <c:set var="endPage" value="${pageCount}" />
		      </c:if>            
		      
		     <ul>
		         <c:if test="${startPage>5}">
		         <c:if test="${word == null}">
		            <a href="freeboard_list?pageNum=${startPage-5}" >&laquo;</a>
		            </c:if>
		            <c:if test="${word != null && keyword != null}">
		            <a href="freeboard_list?pageNum=${startPage-5}&word=${word}&keyword=${keyword}" >&laquo;</a>
		            </c:if>
		         </c:if>
		
		         <table>
			         <c:forEach var="i" begin="${startPage}" end="${endPage}">
			         	<c:if test="${word == null}">
			           		<td><a href="freeboard_list?pageNum=${i}" >${i}</a></td>
			            </c:if>
			            
			            <c:if test="${word != null }">
			            	<td><a href="freeboard_list?pageNum=${i}&word=${word}&keyword=${keyword}" >${i}</a></td>
			            </c:if>
			         </c:forEach>
		         </table>
		        
		         <c:if test="${endPage<pageCount}">
		            <c:if test="${word == null}">
		            	<a href="freeboard_list?pageNum=${startPage+5}" >&raquo;</a>
		            </c:if>
		            
		            <c:if test="${word != null }">
		            	<a href="freeboard_list?pageNum=${startPage+5}&word=${word}&keyword=${keyword}" >&raquo;</a>
		            </c:if>
		         </c:if>                  
		      </ul>
		      <br>
		   </c:if>
		</div>
	</div>
</body>
</html>