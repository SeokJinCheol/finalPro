<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Billy Bury</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
</head>
<body>
	<div align=center class="w3-container" style="width: 1350px; height:500px; background-image: url('/team4/resources/images/back6.png'); background-repeat: no-repeat; background-size:cover; vertical-align:middle; display:table-cell;">

		
	<table>
		<tr>
			<td colspan="2" align=center style="margin-top:30px;">
				<form action="mainSearch" method="post" style="margin-bottom:15px;">   
					<select name="keyword" style="width:15%; border-radius:4px; text-align:center; height:27px;">
						<option value="title" style="text-align:center;">Title</option>
						<option value="id" style="text-align:center;">I D</option>
					</select>
					
		   			<input type="text" name="word" value="${word}" placeholder="&nbsp;Search . . . " class="free-search-title" style="border-color: rgb(169, 169, 169); " />
		   			<input type="submit" class="list-search" value ="Search" style="width:8%;">
		  		</form>
			</td>
		</tr>	
	
		<tr>
			<td width=650 height="408" rowspan=4 class="img-margin-right w3-section">
				<img width=650 height="408" class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/computer1.jpg">
				<img width=650 height="408" class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/val1.jpg">
				<img width=650 height="408" class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/kitchen1.jpg">
				<img width=650 height="408" class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/vacuum1.jpg">
				<img width=650 height="408" class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/cup1.jpg">
				<img width=650 height="408" class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/compu1.jpg">
				<img width=650 height="408"class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/piano1.jpg">
			</td>
		</tr>
		
		<tr>
			<td width="200" height="135" style="" class="w3-section">	
				<img width="200" height="135" style="margin-left:5px;" class="mySlides2  w3-round-large" src="/team4/resources/images/baby2.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides2  w3-round-large" src="/team4/resources/images/kitchen2.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides2  w3-round-large" src="/team4/resources/images/vacuum2.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides2  w3-round-large" src="/team4/resources/images/computer2.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides2  w3-round-large" src="/team4/resources/images/m1.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides2  w3-round-large" src="/team4/resources/images/m2.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides2  w3-round-large" src="/team4/resources/images/m3.jpg">
			</td>
		</tr>
		
		<tr>
			<td width="200" height="135" style="" class="w3-section">	
				<img width="200" height="135" style="margin-left:5px;" class="mySlides3  w3-round-large" src="/team4/resources/images/kitchen2.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides3  w3-round-large" src="/team4/resources/images/vacuum2.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides3  w3-round-large" src="/team4/resources/images/computer2.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides3  w3-round-large" src="/team4/resources/images/baby2.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides3  w3-round-large" src="/team4/resources/images/m3.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides3  w3-round-large" src="/team4/resources/images/m4.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides3  w3-round-large" src="/team4/resources/images/m5.jpg">
			</td>
		</tr>

		<tr>
			<td width="200" height="135" style="" class="w3-section">	
				<img width="200" height="135" style="margin-left:5px;" class="mySlides4  w3-round-large" src="/team4/resources/images/vacuum2.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides4  w3-round-large" src="/team4/resources/images/computer2.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides4  w3-round-large" src="/team4/resources/images/baby2.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides4  w3-round-large" src="/team4/resources/images/kitchen2.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides4  w3-round-large" src="/team4/resources/images/m5.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides4  w3-round-large" src="/team4/resources/images/m6.jpg">
				<img width="200" height="135" style="margin-left:5px;" class="mySlides4  w3-round-large" src="/team4/resources/images/m1.jpg">
			</td>
		</tr>
	</table>
	</div>
	<%-- 
	<br><hr><br>
	<div>
		[물품]
	</div>
	<div>
		<table>
			<tr>
				<td>
					<c:forEach items="${registervo1}" var="registervo1" begin="0" end="0">
					<form action="menu2_1" method="post">
						<table>
							<tr>
								<td align="left">[DIY용품]</td>
								<td align="right"><button onclick="script:submit()">+더보기</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<a href="requestcontent?codeNum=${registervo1.codeNum}"> 
										<img alt="" src="/team4/resources/RequestImg/${registervo1.img}">
									</a>
								</td>
							</tr>
						</table>
						<input type="hidden" name="keyword" value="category">
						<input type="hidden" name="word" value="DIY용품">
					</form>
					</c:forEach>
				</td>
				<td>
					<c:forEach items="${registervo2}" var="registervo2" begin="0" end="0">
					<form action="menu2_1" method="post">
						<table>
							<tr>
								<td align="left">[공구]</td>
								<td align="right"><button onclick="script:submit()">+더보기</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<a href="requestcontent?codeNum=${registervo2.codeNum}"> 
										<img alt="" src="/team4/resources/RequestImg/${registervo2.img}">
									</a>
								</td>
							</tr>
						</table>
						<input type="hidden" name="keyword" value="category">
						<input type="hidden" name="word" value="공구">
					</form>
					</c:forEach>
				</td>
				<td>
					<c:forEach items="${registervo3}" var="registervo3" begin="0" end="0">
					<form action="menu2_1" method="post">
						<table>
							<tr>
								<td align="left">[주방용품]</td>
								<td align="right"><button onclick="script:submit()">+더보기</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<a href="requestcontent?codeNum=${registervo3.codeNum}"> 
										<img alt="" src="/team4/resources/RequestImg/${registervo3.img}">
									</a>
								</td>
							</tr>
						</table>
						<input type="hidden" name="keyword" value="category">
						<input type="hidden" name="word" value="주방용품">
					</form>
					</c:forEach>
				</td>
				<td>
					<c:forEach items="${registervo4}" var="registervo4" begin="0" end="0">
					<form action="menu2_1" method="post">
						<table>
							<tr>
								<td align="left">[전자기기]</td>
								<td align="right"><button onclick="script:submit()">+더보기</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<a href="requestcontent?codeNum=${registervo4.codeNum}"> 
										<img alt="" src="/team4/resources/RequestImg/${registervo4.img}">
									</a>
								</td>
							</tr>
						</table>
						<input type="hidden" name="keyword" value="category">
						<input type="hidden" name="word" value="전자기기">
					</form>
					</c:forEach>
				</td>
				<td>
					<c:forEach items="${registervo5}" var="registervo5" begin="0" end="0">
					<form action="menu2_1" method="post">
						<table>
							<tr>
								<td align="left">[레져용품]</td>
								<td align="right"><button onclick="script:submit()">+더보기</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<a href="requestcontent?codeNum=${registervo5.codeNum}"> 
										<img alt="" src="/team4/resources/RequestImg/${registervo5.img}">
									</a>
								</td>
							</tr>
						</table>
						<input type="hidden" name="keyword" value="category">
						<input type="hidden" name="word" value="레져용품">
					</form>
					</c:forEach>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- 대관  -->
	
		<div>
		<table>
			<tr>
				<td>
					<form action="menu3_3" method="post">
						<table>
							<tr>
								<td align="left">[강당]</td>
								<td align="right"><button onclick="script:submit()">+더보기</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<img alt="" src="/team4/resources/BoardImg/${vo1.img}" onclick="showContents(${vo1.codeNum })">
								</td>
							</tr>
						</table>
						<input type="hidden" name="category" value="강당">
						<input type="hidden" name="codeNum" value="${vo1.codeNum }">
					</form>
				
				</td>
				<td>
					<form action="menu3_3" method="post">
						<table>
							<tr>
								<td align="left">[사무실]</td>
								<td align="right"><button onclick="script:submit()">+더보기</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<img alt="" src="/team4/resources/BoardImg/${vo2.img }" onclick="showContents(${vo2.codeNum })">
								</td>
							</tr>
						</table>
						<input type="hidden" name="category" value="사무실">
						<input type="hidden" name="codeNum" value="${vo2.codeNum }">
					</form>
				</td>
				<td>
					<form action="menu3_3" method="post">
						<table>
							<tr>
								<td align="left">[회의실]</td>
								<td align="right"><button onclick="script:submit()">+더보기</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<img alt="" src="/team4/resources/BoardImg/${vo3.img }" onclick="showContents(${vo3.codeNum })">
								</td>
							</tr>
						</table>
						<input type="hidden" name="category" value="회의실">
						<input type="hidden" name="codeNum" value="${vo3.codeNum }">
					</form>
				</td>
				<td>
					<form action="menu3_3" method="post">
						<table>
							<tr>
								<td align="left">[공터]</td>
								<td align="right"><button onclick="script:submit()">+더보기</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<img alt="" src="/team4/resources/BoardImg/${vo4.img }" onclick="showContents(${vo4.codeNum })">
								</td>
							</tr>
						</table>
						<input type="hidden" name="category" value="category">
						<input type="hidden" name="codeNum" value="${vo4.codeNum }">
					</form>
				</td>
				<td>
					<form action="menu3_3" method="post">
						<table>
							<tr>
								<td align="left">[기타]</td>
								<td align="right"><button onclick="script:submit()">+더보기</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<img alt="" src="/team4/resources/BoardImg/${vo5.img }" onclick="showContents(${vo5.codeNum })">
								</td>
							</tr>
						</table>
						<input type="hidden" name="category" value="기타">
						<input type="hidden" name="codeNum" value="${vo5.codeNum }">
					</form>
				</td>
			</tr>
		</table>
	</div>
	
		<form action="showContentsForm" name="vo" method="post">
						<input type="hidden" name="codeNum">
					</form>
	 --%>
</body>
<script>
	var myIndex = 0;
	carousel();
	
	function carousel() {
		var i;
		
	    var x = document.getElementsByClassName("mySlides");
	    var x2 = document.getElementsByClassName("mySlides2");
	    var x3 = document.getElementsByClassName("mySlides3");
	    var x4 = document.getElementsByClassName("mySlides4");
	    
	    for (i = 0; i < x.length; i++) {
	       x[i].style.display = "none";
	    }
	    
	    for (i = 0; i < x2.length; i++) {
		       x2[i].style.display = "none";
		    }
	    
	    for (i = 0; i < x3.length; i++) {
		       x3[i].style.display = "none";
		    }
	    
	    for (i = 0; i < x4.length; i++) {
		       x4[i].style.display = "none";
		    }
	    
	    myIndex++;
	    if (myIndex > x.length && myIndex > x2.length && myIndex > x3.length && myIndex > x4.length) {
	    	myIndex = 1
	    }
	    
	    x[myIndex-1].style.display = "block";
	    x2[myIndex-1].style.display = "block";
	    x3[myIndex-1].style.display = "block";
	    x4[myIndex-1].style.display = "block";
	    
	    setTimeout(carousel, 2500);
	}
	
	function showContents(codeNum){
		document.vo.codeNum.value=codeNum;
		document.vo.submit();
	}
	
</script>
</html>