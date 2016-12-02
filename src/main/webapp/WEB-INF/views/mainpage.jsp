<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Billy Bury</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
</head>
<body>
	<table>
		<tr>
			<td width=700 height="660" rowspan=4 class="img-margin-right w3-section" style="border-cellspacing:20;">
				<img class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/computer1.jpg">
				<img class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/val1.jpg">
				<img class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/kitchen1.jpg">
				<img class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/vacuum1.jpg">
				<img class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/cup1.jpg">
				<img class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/compu1.jpg">
				<img class="mySlides w3-animate-fading w3-round-large" src="/team4/resources/images/piano1.jpg">
			</td>
		</tr>
		
		<tr>
			<td width="370" height="230" style="border-cellspacing:15;" class="w3-section">	
				<img style="margin-left:10px;" class="mySlides2  w3-round-large" src="/team4/resources/images/baby2.jpg">
				<img style="margin-left:10px;" class="mySlides2  w3-round-large" src="/team4/resources/images/kitchen2.jpg">
				<img style="margin-left:10px;" class="mySlides2  w3-round-large" src="/team4/resources/images/vacuum2.jpg">
				<img style="margin-left:10px;" class="mySlides2  w3-round-large" src="/team4/resources/images/computer2.jpg">
				<img style="margin-left:10px;" class="mySlides2  w3-round-large" src="/team4/resources/images/m1.jpg">
				<img style="margin-left:10px;" class="mySlides2  w3-round-large" src="/team4/resources/images/m2.jpg">
				<img style="margin-left:10px;" class="mySlides2  w3-round-large" src="/team4/resources/images/m3.jpg">
			</td>
		</tr>
		
		<tr>
			<td width="370" height="230" style="border-cellspacing:15;" class="w3-section">	
				<img style="margin-left:10px;" class="mySlides3  w3-round-large" src="/team4/resources/images/kitchen2.jpg">
				<img style="margin-left:10px;" class="mySlides3  w3-round-large" src="/team4/resources/images/vacuum2.jpg">
				<img style="margin-left:10px;" class="mySlides3  w3-round-large" src="/team4/resources/images/computer2.jpg">
				<img style="margin-left:10px;" class="mySlides3  w3-round-large" src="/team4/resources/images/baby2.jpg">
				<img style="margin-left:10px;" class="mySlides3  w3-round-large" src="/team4/resources/images/m3.jpg">
				<img style="margin-left:10px;" class="mySlides3  w3-round-large" src="/team4/resources/images/m4.jpg">
				<img style="margin-left:10px;" class="mySlides3  w3-round-large" src="/team4/resources/images/m5.jpg">
			</td>
		</tr>

		<tr>
			<td width="370" height="230" style="border-cellspacing:15;" class="w3-section">	
				<img style="margin-left:10px;" class="mySlides4  w3-round-large" src="/team4/resources/images/vacuum2.jpg">
				<img style="margin-left:10px;" class="mySlides4  w3-round-large" src="/team4/resources/images/computer2.jpg">
				<img style="margin-left:10px;" class="mySlides4  w3-round-large" src="/team4/resources/images/baby2.jpg">
				<img style="margin-left:10px;" class="mySlides4  w3-round-large" src="/team4/resources/images/kitchen2.jpg">
				<img style="margin-left:10px;" class="mySlides4  w3-round-large" src="/team4/resources/images/m5.jpg">
				<img style="margin-left:10px;" class="mySlides4  w3-round-large" src="/team4/resources/images/m6.jpg">
				<img style="margin-left:10px;" class="mySlides4  w3-round-large" src="/team4/resources/images/m1.jpg">
			</td>
		</tr>
	</table>
	<br><hr><br>
	<div>
		[물품]
	</div>
	<div>
		<table>
			<tr>
				<td>
					<form action="menu2_1" method="post">
						<table>
							<tr>
								<td align="left">[DIY용품]</td>
								<td align="right"><button onclick="script:submit()">+더보기</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<img alt="" src="/team4/resources/images/baby2.jpg" onclick="script:submit()">
								</td>
							</tr>
						</table>
						<input type="hidden" name="keyword" value="category">
						<input type="hidden" name="word" value="DIY용품">
					</form>
				</td>
				<td>
					<form action="menu2_1" method="post">
						<table>
							<tr>
								<td align="left">[공구]</td>
								<td align="right"><button onclick="script:submit()">+더보기</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<img alt="" src="/team4/resources/images/m2.jpg" onclick="script:submit()">
								</td>
							</tr>
						</table>
						<input type="hidden" name="keyword" value="category">
						<input type="hidden" name="word" value="공구">
					</form>
				</td>
				<td>
					<form action="menu2_1" method="post">
						<table>
							<tr>
								<td align="left">[주방용품]</td>
								<td align="right"><button onclick="script:submit()">+더보기</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<img alt="" src="/team4/resources/images/m3.jpg" onclick="script:submit()">
								</td>
							</tr>
						</table>
						<input type="hidden" name="keyword" value="category">
						<input type="hidden" name="word" value="주방용품">
					</form>
				</td>
				<td>
					<form action="menu2_1" method="post">
						<table>
							<tr>
								<td align="left">[전자기기]</td>
								<td align="right"><button onclick="script:submit()">+더보기</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<img alt="" src="/team4/resources/images/m5.jpg" onclick="script:submit()">
								</td>
							</tr>
						</table>
						<input type="hidden" name="keyword" value="category">
						<input type="hidden" name="word" value="전자기기">
					</form>
				</td>
				<td>
					<form action="menu2_1" method="post">
						<table>
							<tr>
								<td align="left">[레저용품]</td>
								<td align="right"><button onclick="script:submit()">+더보기</button></td>
							</tr>
							<tr>
								<td colspan="2">
									<img alt="" src="/team4/resources/images/m0.jpg" onclick="script:submit()">
								</td>
							</tr>
						</table>
						<input type="hidden" name="keyword" value="category">
						<input type="hidden" name="word" value="레저용품">
					</form>
				</td>
			</tr>
		</table>
	</div>
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
	    
	    setTimeout(carousel, 4000);
	}
</script>
</html>