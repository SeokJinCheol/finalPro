<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>menu2_1</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/w3.css"
   type="text/css" media="screen">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/login.css"
   type="text/css" media="screen">
</head>
<script type="text/javascript">
   function visible() {
      document.getElementById('moreview').style.display = "block";
   }
</script>
<style>
.left {
   height: 270px;
   float: left;
   margin-left: 15px;
   margin-bottom: 15px;
   border: 1px solid;
}
</style>
<body>
   <a href="window().open"></a>
   <div align=center class="w3-container"
      style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
   <div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
      <img src="/team4/resources/images/free_list.png" style="margin-right:10px;">
      <font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">대 여 가 능 현 황</font>
   </div>   

    <div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
      <!-- 검색 -->
      <div class="w3-row" style="margin-top:50px;">   
         <form action="menu2_1" method=post>
            <select name="keyword" style="width:15%; border-radius:4px; text-align:center; height:27px;">
               <option value="#" style="text-align:center;">선택하세요.</option>
               <option value="title" style="text-align:center;">Title</option>
               <option value="category" style="text-align:center;">카테고리</option>
            </select>
            
            <input type="text" name="word" value="${word}" placeholder="&nbsp;Search . . . " class="free-search-title" style="border-color: rgb(169, 169, 169);" required="required"/>
            
            <input type="submit" class="list-search" value ="Search" style="width:8%;">
         </form>
      </div>
         <br>
         
         <div>
            <c:forEach items="${Registerpossibility}" var="Registerpossibility"
               begin="0" end="5">
               <div style="width: 30%" class="left">
                  <table>
                     <tr>
                        <td>[${Registerpossibility.category}]</td>
                        <td colspan="2" align="left">${Registerpossibility.title}</td>
                     </tr>
                     <tr>
                        <td style="width: 20%" colspan="3" align="center">
                        <img src="/team4/resources/RequestImg/${Registerpossibility.img }" style="width: 85%; height: 170px;">
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
                           <form action="RegisterUpForm" method="post">
                              <input type="hidden" value="${Registerpossibility.codeNum}"
                                 name="codeNum"> <input type="submit" value="신청">
                           </form>
                        </td>
                        <td style="width: 170px;" align="right">${Registerpossibility.reaquestId}<a onclick="window.open('mail?rid=${Registerpossibility.reaquestId}', '','width=400, height=350, status=1')">사진</a></td>
                     </tr>
                  </table>
               </div>
            </c:forEach>
         </div>

         <!-- 숨긴내용 보기 -->
         <div  style="display: none" id="moreview">
            <c:forEach items="${Registerpossibility}" var="Registerpossibility" begin="6">
               <div style="width: 30%" class="left">
                  <table>
                     <tr>
                        <td>[${Registerpossibility.category}]</td>
                        <td colspan="2" align="left">${Registerpossibility.title}</td>
                     </tr>
                     <tr>
                        <td style="width: 20%" colspan="3" align="center">
                        <img src="/team4/resources/RequestImg/${Registerpossibility.img }" style="width: 85%; height: 170px;">
                        </td>
                     </tr>
                     <tr>
                        <td align="left">
                           <form action="RegisterUpForm" method="post">
                              <input type="hidden" value="${Registerpossibility.codeNum}"
                                 name="codeNum"> <input type="submit" value="신청">
                           </form>
                        </td>
                        <td style="width: 170px;" align="right">${Registerpossibility.reaquestId}<a onclick="window.open('mail?rid=${Registerpossibility.reaquestId}', '','width=400, height=350, status=1')">사진</a></td>
                     </tr>
                  </table>
               </div>
            </c:forEach>
         </div>
         <!-- 숨긴내용 보기 종료 -->
      </div>
   </div>
   <button onclick="visible()">더보기</button>
</body>
</html>