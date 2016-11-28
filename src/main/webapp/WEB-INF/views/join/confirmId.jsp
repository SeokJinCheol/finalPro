<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<title>ID 중복 확인</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body style="background-color: #F0F0f0;" align=center>
   <div style="margin: 40px;">
      <h3> 중 복 확 인 </h3>
   </div>

   <!-- 입력한 ID값이 Member DB에 있을 경우 -->
   <c:if test="${check==2 }">
      <div class="w3-row w3-wide" align=center style="margin-bottom:20px;">
         ${id}는 이미 사용중인 ID 입니다.
      </div>

      <form action="ConfirmId" method="post" name="checkForm" >
         <table align=center>
            <tr>
               <td>
               <input type="text" name="id" placeholder="　Enter Your I D" class="free-insert-title w3-left" style="width:55%; height:35px; border-radius: 6px; margin-left:5px;"> 
                     <input type="submit" class="join-btna w3-card-4 w3-right" name="confirm_id" style="height:35px;" value="다른 ID 사용">
               </td>
            </tr>
         </table>
      </form>
   </c:if>

   <!-- 입력한 ID값이 Member DB에 없을 경우 -->
   <c:if test="${check==0 }">
      <div class="w3-row w3-wide" align=center style="margin-bottom:20px;">
         입력하신 ${id}는 사용할 수 있습니다.
         <input type="hidden" name="id" value="${id}">
      </div>
   
      <form action="menu1_2" method="post" onsubmit="return openConfirmid()">
         <table align=center>
            <tr>
               <td>
                  <input type="submit" class="join-btna w3-card-4" value="ID 사용" onclick="window.close()">
               </td>
            </tr>
         </table>
      </form>
   </c:if>
   
   <!-- 입력한 null인 경우 -->
   <c:if test="${check==1 }">
      <div class="w3-row w3-wide" align=center style="margin-bottom:20px;">
         id를 입력해주세요.
      </div>

      <form action="ConfirmId" method="post" name="checkForm" >
         <table align=center>
            <tr>
               <td>
                  <input type="text" name="id" placeholder="　Enter Your I D" class="free-insert-title w3-left" style="width:55%; height:35px; border-radius: 6px; margin-left:5px;">
                  <input type="submit" class="join-btna w3-card-4 w3-right" name="confirm_id" style="height:35px;" value="다른 ID 사용">
               </td>
            </tr>
         </table>
      </form>
   </c:if>  
</body>
<script type="text/javascript">
   //아이디 중복확인 후
   function openConfirmid() {
      opener.document.all.id.value = document.all.id.value;
   }
</script>
</html>