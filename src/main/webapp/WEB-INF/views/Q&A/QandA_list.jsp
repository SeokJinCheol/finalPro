<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>QandA_list</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
<form action="QandA_list" method="post">
   <select name="keyword">
      <option value="title">Title</option>
      <option value="id">ID</option>
   </select>
   
   <input type="text" name="word" value="${word}"/><input type="submit" value ="검색"> 
   
   <!-- 글쓰기 버튼 테스트 -->
   <input type="button" value="글쓰기" onclick="location.href='insertForm'">
   <br>
   
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
             <td style="width: 10%"><img src="/team4/resources/QandAImg/${member.img }" style="width: 100%; height: 50px;"></td>
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
                        <a href="QandA_list?pageNum=${startPage-5}" >&laquo;</a>
                        </c:if>
                        <c:if test="${word != null && keyword != null}">
                        <a href="QandA_list?pageNum=${startPage-5}&word=${word}&keyword=${keyword}" >&laquo;</a>
                        </c:if>
                     </c:if>
      
                         <table>
                     <c:forEach var="i" begin="${startPage}" end="${endPage}">
                     <c:if test="${word == null}">
                        <td><a href="QandA_list?pageNum=${i}" >${i}</a></td>
                        </c:if>
                        <c:if test="${word != null }">
                        <td><a href="QandA_list?pageNum=${i}&word=${word}&keyword=${keyword}" >${i}</a></td>
                        </c:if>
                     </c:forEach>
                     </table>
                    
                     <c:if test="${endPage<pageCount}">
                        <c:if test="${word == null}">
                        <a href="QandA_list?pageNum=${startPage+5}" >&raquo;</a>
                        </c:if>
                        <c:if test="${word != null }">
                        <a href="QandA_list?pageNum=${startPage+5}&word=${word}&keyword=${keyword}" >&raquo;</a>
                        </c:if>
                     </c:if>                  
                  </ul>
                  <br>
               </c:if>
            </div>   
 </form>
</body>
</html>