<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>admin_회원목록</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div class="row" style="background: #6699DC; color: white; height: 100px; text-align: right; line-height: 130px;">
      	<img src="/team4/resources/images/left-admin.png" style="margin-right: 10px;"> 
      	<font style="margin-right: 30px; font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px;">회 원 목 록</font>
	</div>

   	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
	    <!-- 검색 -->
		<div class="w3-row" style="margin-top:50px;">	
			<form action="list" method=post>
				<select name="keyword" style="width:15%; border-radius:4px; text-align:center; height:27px;">
					<option value="#" style="text-align:center;">선택하세요.</option>
					<option value="id" style="text-align:center;">I D</option>
					<option value="name" style="text-align:center;">N A M E</option>
					<option value="memberRank" style="text-align:center;">등 급</option>
				</select>
				
				<input type="text" name="word" value="${word}" placeholder="&nbsp;Search . . . " class="free-search-title" required="required"/>
				
				<input type="submit" class="list-search" value ="Search" style="width:8%;">
			</form>
			<br>
		</div>
   
		<div style="margin-bottom: 20px; width: 95%; background-color: #fafafa" class="w3-card-8">
			<table style="padding: 20px; text-align:center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
				<tr class="bottom-border2" style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
					<td width=120 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">I　　D</td>
	                <td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">이　름</td>
	                <td width=130 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">생년월일</td>
	                <td width=180 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">E-mail</td>
	                <td width=300 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">주　 　소</td>
	                <td width=80 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">등　급</td>
	                <td width=60 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">Update</td>
	                <td width=60 style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000;">Delete</td>
				</tr>
	
	            <c:forEach items="${result}" var="member">
	               	<tr onMouseOver="this.style.backgroundColor='#eff7fc'" onMouseOut="this.style.backgroundColor='#fafafa'">
	                   	<td style="border-bottom: 3px solid #fff;">${member.id}</td>
	                    <td style="border-bottom: 3px solid #fff;">${member.name }</td>
						<td style="border-bottom: 3px solid #fff;">${member.birthday }</td>
	                    <td style="border-bottom: 3px solid #fff;">${member.email }</td>
	                    <td style="border-bottom: 3px solid #fff; font-size: 1;">${member.address} ${member.address2}</td>
	                    <td style="border-bottom: 3px solid #fff;">${member.memberRank }</td>
	                    <td style="border-bottom: 3px solid #fff;">
	                    	<form action="admin_update" method="post" name="adminupdate" >
	                        	<input type="submit" value="" class="update-btn2 w3-card-4" >
	                            
	                            <input type="hidden" name="id" value="${member.id}"/>
	                        </form>
	                    </td>
	                    <td style="border-bottom: 3px solid #fff;">
	                    	<form action="admin_delete" method=post name="${member.id}">
	                           	<input type="submit" value="" class="cancel-btn3 w3-card-4" onclick="checkDel('${member.id}'); return false;">
	                           
	                           	<input type="hidden" name="m_id" value="${member.id}"/>
	                        </form>
	                    </td>
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
	                	<!-- 화살표 -->
	                	<c:if test="${startPage>5}">
		                    <c:if test="${word == null}">
		                    	<a href="list?pageNum=${startPage-5}" >&laquo;</a>
		                    </c:if>
	                        
	                        <c:if test="${word != null && keyword != null}">
	                        	<a href="list?pageNum=${startPage-5}&word=${word}&keyword=${keyword}" >&laquo;</a>
	                        </c:if>
	                    </c:if>
	      
		     			<table>
		     				<!-- 페이지 번호 생성 -->
		                    <c:forEach var="i" begin="${startPage}" end="${endPage}">
		                    	<c:if test="${word == null}">
		                        	<td style="background: #6699DC; color:white; width:20px; text-align: center;border-radius: 5px;"><a style="text-decoration:none;" href="list?pageNum=${i}" >${i}</a></td>
		                        </c:if>
		                        
		                        <c:if test="${word != null }">
		                        	<td style="background: #6699DC; color:white; width:20px; text-align: center;border-radius: 5px;"><a href="list?pageNum=${i}&word=${word}&keyword=${keyword}" >${i}</a></td>
		                        </c:if>
		                    </c:forEach>
		                </table>
		                    
		                <c:if test="${endPage<pageCount}">
		                	<c:if test="${word == null}">
		                    	<a href="list?pageNum=${startPage+5}" >&raquo;</a>
		                    </c:if>
		                    
		                    <c:if test="${word != null }">
		                        <a href="list?pageNum=${startPage+5}&word=${word}&keyword=${keyword}" >&raquo;</a>
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
   function checkDel(a) {
      var name = a;

      if (confirm("정말 탈퇴시키시겠습니까??") == true){      
          document.forms[name].submit();
      }
      
      else{
         return false;
      }
   }
</script>
</html>