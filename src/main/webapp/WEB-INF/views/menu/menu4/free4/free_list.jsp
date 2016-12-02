<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/freeboard2.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">자 유 게 시 판</font>
	</div>
	
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; margin-top: 70px;">
			<div class="w3-row" style="margin-top:50px;">
				<form action="free4_list" method=post>
		        	<select name="keyword" style="width:15%; border-radius:4px; text-align:center; height:27px;">
		        		<option value="#" style="text-align:center;">선택하세요.</option>
				       	<option value="title" style="text-align:center;">제목</option>
				       	<option value="id" style="text-align:center;">작성자</option>
			        </select> 
			        
			        <input type="text" name="word" value="${word}" placeholder="&nbsp;Search . . . " class="free-search-title" required="required"/>
			
			        <input type="submit" value="Search" class="list-search" style="width: 8%">
			    </form>
			</div>
   		</div>

		<div style="margin-bottom: 20px; width: 73%;">
			<security:authorize ifAnyGranted="role_user, role_com, role_master">
				<div class="w3-row">
					<div class="w3-col w3-right" style="margin-right:8px; width: 10%; margin-bottom:10px;">
						<br><br>
						<input type="button" class="button-write"  value ="글 쓰 기" onclick="location='free_write'">
					</div>
				</div>
			</security:authorize>
			
			<security:authorize ifNotGranted="role_user, role_com, role_master">
				<div class="w3-row">
					<div class="w3-col w3-right" style="margin-right:5px; width: 10%; margin-bottom:7px;">
						<br>
						<br>
					</div>
				</div>
			</security:authorize>

		    <table style="padding: 70px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
		    	<tr style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
		    		<td width=60 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">No.</td>
		            <td width=100 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">Img</td>
		            <td width=150 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">Title</td>
		            <td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">Writer</td>
		            <td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">Date</td>
		            <td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">Hit</td>
		         </tr>
		
				<form name="goLink">
               		<input type="hidden" name="bnum" /> 
               		
			        <c:forEach items="${list}" var="list">
			        	<tr height="40" onMouseOver="this.style.backgroundColor='#eff7fc'" onMouseOut="this.style.backgroundColor='#fafafa'" style="background-color: #fafafa;">
			            	<td style="border-bottom: 3px solid #fff;">${list.rnum}</td>
			            	<td style="width: 10%; border-bottom: 3px solid #fff;">
			            		<img src="/team4/resources/FreeBoardImg/${list.img}" style="width: 100%; height: 50px;">
			            	</td>
			
							<!-- 제목이 6자 이상일 경우 줄여쓰기 기능 -->
		             		<c:choose>
			             		<c:when test="${fn:length(list.title) > 6 }">
									<td style="border-bottom: 3px solid #fff;">
										<a href="javascript:void(0)" onclick="move(${list.bnum});">
											<c:out value="${fn:substring(list.title,0,6)}" />...
										</a>
									</td>
								</c:when>
								
								<c:otherwise>
									<td style="border-bottom: 3px solid #fff;">
										<a href="javascript:void(0)" onclick="move(${list.bnum});">
											<c:out value="${list.title}"/>
										</a>
									</td>
								</c:otherwise>
							</c:choose>
			                
			                <td style="border-bottom: 3px solid #fff;">${list.id}</td>
			                <td style="border-bottom: 3px solid #fff;">
			                	<fmt:formatDate value="${list.date}" pattern="yyyy-MM-dd" />
			                </td>
			                <td style="border-bottom: 3px solid #fff;">${list.count}</td>
			            </tr>
			         </c:forEach>
			  	</form>
		      </table>
		
			   <!-- 페이지 번호 -->
			   <div align="center" >
			      <c:if test="${count>0}">
			         <c:set var="pageCount" value="${pageCount}" />
			         <!-- pagCount=15 -->
			         <c:set var="startPage" value="${1}" />
			         <c:set var="pageBlock" value="${5}" />
			
			         <fmt:parseNumber var="result" value="${currentPage/pageBlock}"
			            integerOnly="true" />
			
			         <c:if test="${(currentPage%pageBlock)!=0}">
			            <c:set var="startPage" value="${result*pageBlock+1}" />
			            <!-- startpage=11 -->
			         </c:if>
			
			         <c:if test="${(currentPage%pageBlock)==0}">
			            <c:set var="startPage" value="${(result-1)*pageBlock+1}" />
			         </c:if>
			
			         <c:set var="endPage" value="${startPage+pageBlock-1}" />
			         <!-- endpage=15 -->
			         <c:if test="${endPage>=pageCount}">
			            <c:set var="endPage" value="${pageCount}" />
			         </c:if>
			
			         <ul>
			            <c:if test="${startPage>5}">
			               <c:if test="${word == null}">
			                  <a style="text-decoration:none;" href="free4_list?pageNum=${startPage-5}">&laquo;</a>
			               </c:if>
			               <c:if test="${word != null && keyword != null}">
			                  <a style="text-decoration:none;" href="free4_list?pageNum=${startPage-5}&word=${word}&keyword=${keyword}">&laquo;</a>
			               </c:if>
			            </c:if>
			
			            <table>
			               <c:forEach var="i" begin="${startPage}" end="${endPage}">
			                  <c:if test="${word == null}">
			                     <td style="background: #6699DC; color:white; width:20px; text-align: center;border-radius: 5px;"><a style="text-decoration:none;" href="free4_list?pageNum=${i}">${i}</a></td>
			                  </c:if>
			
			                  <c:if test="${word != null }">
			                     <td><a style="text-decoration:none;" href="free4_list?pageNum=${i}&word=${word}&keyword=${keyword}">${i}</a></td>
			                  </c:if>
			               </c:forEach>
			           </table>
			
			            <c:if test="${endPage<pageCount}">
			               <c:if test="${word == null}">
			                  <a style="text-decoration:none;" href="free4_list?pageNum=${startPage+5}">&raquo;</a>
			               </c:if>
			
			               <c:if test="${word != null }">
			                  <a style="text-decoration:none;" href="free4_list?pageNum=${startPage+5}&word=${word}&keyword=${keyword}">&raquo;</a>
			               </c:if>
			            </c:if>
			         </ul>
			         <br>
			      </c:if>
			   </div>
			</div>
	</div>
</body>
<script type="text/javascript">
	function move(bnum){
	      var f=document.goLink;  //폼 name
	     f.bnum.value =bnum;  //POST방식으로 넘기고 싶은 값
	     f.action="free_content";   //이동할 페이지
	     f.method="post";  //POST방식
	     f.submit();
	};
</script>
</html>