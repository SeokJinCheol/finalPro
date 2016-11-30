<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>menu2</title>
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
   float: left;
   margin-left: 15px;
   margin-bottom: 15px;
}
</style>
<body>
   <a href="window().open"></a>
   <div align=center class="w3-container"
      style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/free_list.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">물 품 대 여</font>
	</div>	

    <div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<!-- 검색 -->
		<div class="w3-row" style="margin-top:50px;">	
			<form action="menu2" method=post>
				<select name="keyword" style="width:15%; border-radius:4px; text-align:center; height:27px;">
					<option value="#" style="text-align:center;">선택하세요.</option>
					<option value="title" style="text-align:center;">Title</option>
					<option value="category" style="text-align:center;">카테고리</option>
				</select>
				
				<input type="text" name="word" value="${word}" placeholder="&nbsp;Search . . . " class="free-search-title" required="required"/>
				
				<input type="submit" class="list-search" value ="Search" style="width:8%;">
			</form>
		</div>
         <br>
 
         <div class="w3-row" >
            <c:forEach items="${Registerselect}" var="Registerselect" begin="0" end="5">
               <div style="width: 30%" class="left">
                  <table border="1">
                     <tr>
                        <td colspan="3" align="center">${Registerselect.title}</td>
                     <tr>
                     <tr>
                        <td style="width: 20%" colspan="3"><a href="registercontent?codeNum=${Registerselect.codeNum}">
                        <img src="C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/RequestImg/${Registerselect.img }" style="width: 100%; height: 100px;"></td>
                     </tr>
                     <tr>
                        <td style="width: 10%">${Registerselect.category}</td>
                        <td style="width: 15%">NO.${Registerselect.codeNum}</td>
                        <td style="width: 8%">${Registerselect.packageStatus}</td>
                     </tr>

                     <!-- 일반유저 -->
                     <c:if test="${session_id != 'admin'}">
                        <c:if test="${Registerselect.packageStatus == '대여가능'}">
                           <td colspan="3" align="center">
                              <form action="RegisterUpForm" method="post">
                                 <input type="hidden" value="${Registerselect.codeNum}" name="codeNum">
                                 <input type="submit" value="신청하기">
                              </form>
                           </td>
                        </c:if>

                        <c:if test="${Registerselect.packageStatus != '대여가능'}">
                           <td colspan="3" align="center" style="WIDTH: 60px; HEIGHT: 20px">신청불가</td>
                        </c:if>
                     </c:if>

                     <!-- admin 버튼 -->
                     <c:if test="${session_id == 'admin'}">
                        <c:if test="${Registerselect.packageStatus == '대여신청'}">
                           <td colspan="3" align="center">
                              <form action="startrentForm" method="post">
                                 <input type="hidden" value="${Registerselect.codeNum}" name="codeNum"> 
                                 <input type="submit" style="WIDTH: 60px; HEIGHT: 20px" value="대여시작">
                              </form>
                           </td>
                        </c:if>
                        
                        <c:if test="${Registerselect.packageStatus == '대여가능'}">
                            <td colspan="3" align="center" style="WIDTH: 60px; HEIGHT: 22px">미신청</td></tr>
                        </c:if>
                        
                        <c:if test="${Registerselect.packageStatus == '대여중'}">
                            <td colspan="3" align="center" style="WIDTH: 60px; HEIGHT: 22px">대여중</td></tr>
                        </c:if>

                        <c:if test="${Registerselect.packageStatus == '반납신청'}">
                           <td colspan="3" align="center">
                              <form action="storageendrent" method="post">
                                 <input type="hidden" value="${Registerselect.codeNum}"  name="codeNum">
                                 <input type="submit" value="반납완료하기">
                              </form>
                           </td>
                        </c:if>

                        <c:if test="${Registerselect.packageStatus == '대여종료신청'}">
                           <td colspan="3" align="center">
                              <form action="" method="post">
                                 <input type="hidden" value="${Registerselect.codeNum}" name="codeNum"> 
                                 <input type="submit" value="대여종료">
                              </form>
                           </td>
                        </c:if>
                     </c:if>
                  </table>
               </div>
            </c:forEach>
            </div>
            <!-- 숨긴 내용 -->
            <div style="display: none" id="moreview">
            <c:forEach items="${Registerselect}" var="Registerselect" begin="6">
               <div style="width: 30%" class="left">
                  <table border="1">
                     <tr>
                        <td colspan="3" align="center">${Registerselect.title}</td>
                     <tr>
                     <tr>
                        <td style="width: 20%" colspan="3"><a href="registercontent?codeNum=${requestlist.codeNum}">
                        <img src="C:/finalproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/team4/resources/RequestImg/${Registerselect.img }" style="width: 100%; height: 100px;"></td>
                     </tr>
                     <tr>
                        <td style="width: 10%">${Registerselect.category}</td>
                        <td style="width: 15%">NO.${Registerselect.codeNum}</td>
                        <td style="width: 8%">${Registerselect.packageStatus}</td>
                     </tr>

                     <!-- 일반유저 -->
                     <c:if test="${session_id != 'admin'}">
                        <c:if test="${Registerselect.packageStatus == '대여가능'}">
                           <td colspan="3" align="center">
                              <form action="RegisterUpForm" method="post">
                                 <input type="hidden" value="${Registerselect.codeNum}"
                                    name="codeNum"> <input type="submit" value="신청하기">
                              </form>
                           </td>
                        </c:if>

                        <c:if test="${Registerselect.packageStatus != '대여가능'}">
                           <td colspan="3" align="center" style="WIDTH: 60px; HEIGHT: 20px">신청불가</td>
                        </c:if>
                     </c:if>

                     <!-- admin 버튼 -->
                     <c:if test="${session_id == 'admin'}">
                        <c:if test="${Registerselect.packageStatus == '대여신청'}">
                           <td colspan="3" align="center">
                              <form action="startrentForm" method="post">
                                 <input type="hidden" value="${Registerselect.codeNum}"
                                    name="codeNum"> <input type="submit" style="WIDTH: 60px; HEIGHT: 20px" value="대여시작">
                              </form>
                           </td>
                        </c:if>
                        
                        <c:if test="${Registerselect.packageStatus == '대여가능'}">
                            <td colspan="3" align="center" style="WIDTH: 60px; HEIGHT: 22px">미신청</td></tr>
                        </c:if>
                        
                        <c:if test="${Registerselect.packageStatus == '대여중'}">
                            <td colspan="3" align="center" style="WIDTH: 60px; HEIGHT: 22px">대여중</td></tr>
                        </c:if>

                        <c:if test="${Registerselect.packageStatus == '반납신청'}">
                           <td colspan="3" align="center">
                              <form action="storageendrent" method="post">
                                 <input type="hidden" value="${Registerselect.codeNum}"
                                    name="codeNum"> <input type="submit" value="반납완료하기">
                              </form>
                           </td>
                        </c:if>

                        <c:if test="${Registerselect.packageStatus == '대여종료신청'}">
                           <td colspan="3" align="center">
                              <form action="" method="post">
                                 <input type="hidden" value="${Registerselect.codeNum}"
                                    name="codeNum"> <input type="submit" value="대여종료">
                              </form>
                           </td>
                        </c:if>
                     </c:if>
                  </table>
               </div>
            </c:forEach>
            </div>
            <!-- 숨긴내용 끝 -->
      </div>
   </div>
   <button onclick="visible()">더보기</button>
</body>
</html>