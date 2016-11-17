<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
   <div align=center>
      <table border=1>
         <form action="insertForm" method="post" enctype="multipart/form-data">
            <input type="hidden" name="bNum" value="${ bNum }"> 
            <input type="hidden" name="bgnum" value="${ bgnum }"> 
            <input type="hidden" name="groupnum" value="${ groupnum }"> 
            <input type="hidden" name="ranknum" value="${ ranknum }">
         
            <c:if test="${bNum == 0}">
               <tr>
                  <td>Title</td>
                  <td><input type="text" name="title" required></td>
               </tr>
               
               <tr>
                  <td>ID</td>
                  <td><input type="text" name="id"  required></td>
               </tr>
                  
               <tr>
                  <td>CateGory</td>
                  <td>
                     <select name="category">
                        <option value="관리자">관리자</option>
                        <option value="판매자">판매자</option>
                        <option value="대여자">대여자</option>
                        </select>
                     </td>
               </tr>
               
               <tr>
                  <td>Contents</td>
                  <td><input  type="text" name="contents"  style=" width: 100%; height: 200px;" required></td>
               </tr>
               
               <tr>
                  <td>Img</td>
                  <td><input type="file" name="file"  ></td>
               </tr>
               
               <tr>
                  <td><input type="submit" value="입력"><td>
               </tr>
            </c:if>
         
            <c:if test="${bNum != 0}">
                   <tr>
                  <td>ID</td>
                  <td><input type="text" name="id" value="${session_id}" readonly></td>
               </tr>   
                        
               <tr>
                  <td>Contents</td>
                  <td><input  type="text" name="contents" required><input type="submit" value="입력"></td>
               </tr>
            </c:if>
         </form>
      </table>
   </div>
</body>
</html>