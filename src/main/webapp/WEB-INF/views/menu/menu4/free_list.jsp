<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>free_list</title>
<!-- CSS 연결-->
 <link href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/free_list.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">자 유 게 시 판</font>
	</div>	

	<div align=center  style="background: #f5f6f7; width: 1000px; height: 500px; vertical-align: middle; display: table-cell;">
		<!-- 검색 -->
		<div class="w3-row">	
			<form action="free_list" method=post class="searchform cf">
				<select name="keyword" style="width:15%; text-align:center; height:27px;">
					<option value="#" style="text-align:center;">선택하세요.</option>
					<option value="title" style="text-align:center;">Title</option>
					<option value="id" style="text-align:center;">I D</option>
				</select>
				
				<input type="text" name="word" value="${word}" placeholder="&nbsp;Search..." style="width:50%;" required="required"/>
				
				<input type="submit" value ="검색" class=" " style="width:8%">
			</form>
		</div>
		
		<security:authorize ifAnyGranted="role_user, role_com, role_master">
			<div class="w3-row">
				<div class="w3-col w3-right w3-centered" style="width: 10%; margin-bottom:30px;">
					<input type="button" value ="글쓰기" onclick="location='insertForm'">
				</div>
			</div>
		</security:authorize>
		
	
		<div style="margin-bottom: 20px; margin-top: 70px;">
			   <table border=1>
			     <tr>
			         <td width="50px" align="center">ID</td>
			         <td width="50px" align="center">Category</td>
			         <td width="50px" align="center">Title</td>
			         <td width="50px" align="center">Contents</td>
			         <td width="50px" align="center">Img</td>
			         <td width="50px" align="center">bDate</td>
			         <td width="50px" align="center">조회수</td>
			     </tr>
			     
			     <!-- result는 contoller의 addObject로 부터 가져온다. -->
					<c:forEach items="${result}" var="member">
			        	<tr>
			            	<td>${member.id}</td>
			            	<td>${member.category }</td>
			             	<td><a href="content?bNum=${member.bNum}&pageNum=${currentPage}&bgnum=${member.bgnum}">${member.title }</a></td>
			             	<td>${member.contents }</td>
			             	<td style="width: 10%"><img src="/team4/resources/FreeBoardImg/${member.img }" style="width: 100%; height: 50px;"></td>
			             	<td>${member.bDate }</td>
			             	<td>${member.readcount }</td>
			         	</tr>
					</c:forEach>
				</table>
			 
			   	<!-- 전체 페이지의 수를 연산 -->
			    	<div align="center">
	                	<c:if test="${count>0}" >
			            	<c:set var="pageCount" value="${pageCount}"/>
			            	<c:set var="startPage" value="${1}" />
			            	<c:set var="pageBlock" value="${5}" />
			         
			                <fmt:parseNumber var="result" value="${currentPage/pageBlock}" integerOnly="true" /><!-- result=2 -->
			                     
			                <c:if test="${(currentPage%pageBlock)!=0}">
			                	<c:set var="startPage" value="${result*pageBlock+1}" />
			                </c:if>
			         
		                    <c:if test="${(currentPage%pageBlock)==0}">
		                  		<c:set var="startPage" value="${(result-1)*pageBlock+1}" />
		                    </c:if>
			                  
			                <c:set var="endPage" value="${startPage+pageBlock-1}" />
			                <c:if test="${endPage>=pageCount}">
			                    <c:set var="endPage" value="${pageCount}" />
			                </c:if>            
			                  
			                <ul>
			                	<c:if test="${startPage>5}">
				                    <c:if test="${word == null}">
				                    	<a href="free_list?pageNum=${startPage-5}" >&laquo;</a>
				                    </c:if>
			                        
			                        <c:if test="${word != null && keyword != null}">
			                        	<a href="free_list?pageNum=${startPage-5}&word=${word}&keyword=${keyword}" >&laquo;</a>
			                        </c:if>
			                    </c:if>
			      
				     			<table>
				                    <c:forEach var="i" begin="${startPage}" end="${endPage}">
				                    	<c:if test="${word == null}">
				                        	<td><a href="free_list?pageNum=${i}" >${i}</a></td>
				                        </c:if>
				                        
				                        <c:if test="${word != null }">
				                        	<td><a href="free_list?pageNum=${i}&word=${word}&keyword=${keyword}" >${i}</a></td>
				                        </c:if>
				                    </c:forEach>
				                </table>
				                    
				                <c:if test="${endPage<pageCount}">
				                	<c:if test="${word == null}">
				                    	<a href="free_list?pageNum=${startPage+5}" >&raquo;</a>
				                    </c:if>
				                    
				                    <c:if test="${word != null }">
				                        <a href="free_list?pageNum=${startPage+5}&word=${word}&keyword=${keyword}" >&raquo;</a>
				                    </c:if>
				                </c:if>                  
			                </ul>
			                
			                <br>
						</c:if>
					</div>   
				</form>
			</div>
		</div>
</body>
</html>