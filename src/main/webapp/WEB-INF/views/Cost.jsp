<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<center>
<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right;line-height: 130px;">
		<img src="/team4/resources/images/service2.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">예상 대여 비용 계산</font>
	</div>   
	              <form action="Cost" method="post" style="margin-top:20px;">
	                <table class="w3-table w3-centered" style="margin-top:30px;">
						<tr>
							<td>
							<select name="keyword" style="width:100%; border-radius:4px; text-align:center; height:27px;">
                                <option value="#" style="text-align:center;">대여품목</option>
                                <option value="category1" style="text-align:center;">유아장난감(소)</option>
                                <option value="category2" style="text-align:center;">유아장난감(중)</option>
                                <option value="category3" style="text-align:center;">유아장난감(대)</option>
                                <option value="category4" style="text-align:center;">애기옷(~12개월)</option>
                                <option value="category5" style="text-align:center;">애기옷(12~24개월)</option>
                                <option value="category6" style="text-align:center;">애기옷(24~36개월)</option>
                                <option value="category7" style="text-align:center;">애기옷(36~48개월)</option>
                                <option value="category8" style="text-align:center;">전자제품:TV</option>
                                <option value="category9" style="text-align:center;">전자제품:컴퓨터</option>
                                <option value="category10" style="text-align:center;">전자제품:청소기</option>
                                <option value="category11" style="text-align:center;">가구:식탁</option>
                                <option value="category12" style="text-align:center;">가구:쇼파</option>
                                <option value="category13" style="text-align:center;">가구:옷장</option>
                                <option value="category14" style="text-align:center;">장소대여(10평)</option>
                                <option value="category15" style="text-align:center;">장소대여(20평)</option>
                                <option value="category16" style="text-align:center;">장소대여(30평)</option>
                                <option value="category17" style="text-align:center;">장소대여(40평)</option>
                                <option value="category18" style="text-align:center;">장소대여(50평)</option>
                                <option value="category19" style="text-align:center;">장소대여(60평)</option>
                                <option value="category20" style="text-align:center;">장소대여(70평)</option>
                                <option value="category21" style="text-align:center;">장소대여(80평)</option>
                                <option value="category22" style="text-align:center;">장소대여(90평)</option>
           
                            </select>
							</td>
							
							<td rowspan="2">
								<p>
									<input type="submit" class="login-btn w3-card-4"  value="계산하기" style="height:75px; font-family: Roboto sans-serif;" id="btnLogin" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Login" />
								</p>
							</td>
						</tr>
						
						<tr>
							<td>
								<input type="text" name="times"  placeholder="대여일수" class="w3-card-2 login-pwd" style="background-color: #f2f2f2; font-family: Roboto sans-serif;" required>
							</td>
						</tr>
					</table>
				</form>
				<c:if test="${check == 0}">
				------------------------------------------------------------------
				<br>
				<table>
				   <h4>예상 대여 비용계산</h4>
				
				</table>
				------------------------------------------------------------------
				<br><br>
				
				대여비용은 대여 상품의 품질과 상태에 따라 다르게 책정되므로,<br>
				실제 대여비용과 예상 대여비용은 차이가 있을 수 있습니다. <br>
				 ( 예상 대여 비용은 참고 사항입니다.)
				
				</c:if>
				
				<c:if test="${check != 0}">
				------------------------------------------------------------------
				<br>
				<table>
				   <h4>예상 대여 비용계산</h4>
				   <tr><td>예상 대여 비용은 : ${check }\ 입니다</td></tr>
				
				</table>
				------------------------------------------------------------------
				<br>
				
				대여비용은 대여 상품의 품질과 상태에 따라 다르게 책정되므로,<br>
				실제 대여비용과 예상 대여비용은 차이가 있을 수 있습니다. <br>
				 ( 예상 대여 비용은 참고 사항입니다.)
				
				</c:if>
		<center>
</body>
</html>