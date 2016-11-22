<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardWrite</title>
</head>
<body class="w3-container" style="background: #f5f6f7;">
   <div class="w3-container">
      <form action="QnA_write2" method=post enctype="multipart/form-data">
         <table border="1">
            <tr>
               <td>category:</td>
               <td>
                  <select name="category" required>
                     <c:if test="${bnum == null }">
                        <option value="">선택하세요</option>
                        <option value="질문">질문</option>
                        <option value="건의사항">건의사항</option>
                     </c:if>
                     
                     <c:if test="${bnum != null}">
                        <option value="답변">답변</option>
                     </c:if>
                  </select>
               </td>
            </tr>
            
            <tr>
               <td>이미지파일:</td>
               <td><input type="file" name="file"></td>
            </tr>
            
            <tr>
               <td>제목:</td>
               <td><input type="text" name="title" value="${title}" required></td>
            </tr>
            
            <tr>
               <td>id :</td>
               <td><input type="text" name="id" value="${session_id}" readonly /></td>
            </tr>
            
            <tr>
               <td>contents:</td>
               <td>
                  <textarea cols="10" rows="5" name="contents" required></textarea>
               </td>
            </tr>
         </table>
         
         <input type="hidden" name="bnum" value="${bnum}">
         <input type="submit" value="글쓰기">
         <input type="button" value="List" onclick="location.href='QnA_list'">
      </form>
   </div>
</body>
</html>