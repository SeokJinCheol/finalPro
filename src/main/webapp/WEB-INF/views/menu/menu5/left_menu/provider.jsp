<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>provider</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right;line-height: 130px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">물 품 등 록 과 정</font>
	</div>
	
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div style="margin-bottom: 20px; width: 90%; margin-top:50px; margin-bottom:50px;">	
		    <div style="border-top:2px solid black; border-bottom:2px solid black; width: 300px;">
			    <p>
			    	<input type="button" class="intro-button-write" value ="물품등록 과정" onclick="location='provider'">
			    	&nbsp;&nbsp;&nbsp;
			    	<input type="button" class="intro-button-write" value ="물품대여 과정" onclick="location='lender'">
			    </p>
		    </div>
		    
		    <table  style="padding: 70px; padding-top: 20px;padding-bottom: 15px;">
				<tr>
					<td colspan="4" style="height:27px;">
						<h5><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※ 물 품 등 록 과 정 ※</b></h5>
					</td>
				</tr>
				
				<tr>
				    <td><img src="/team4/resources/images/ttt2.png"></td>
				</tr>
				
				<tr>
				    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공급자가 물품등록 페이지에 대여가능한 물품의 사진과 상세내용을 첨부하여 올리면,<br>
				        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;물품의 상태와 대여비용 등의 심사를 거쳐서 모든 이용자에게 보여지게 됩니다.
				    </td>
				</tr>
			</table>	

			<table  style="padding: 90px; padding-top: 20px;padding-bottom: 15px; width: 590px;">
				<tr style="margin-bottom: 20px;">
					<td>
						<img src="/team4/resources/images/one.png">
						<font size="5"><b>물 품 등 록</b></font>
					</td>
			    </tr>
			    
			    <tr>
					<td style="padding-top:10px;"><img src="/team4/resources/images/ttt3.png" style="margin-right:40px; width:576px;"></td>
				</tr>
				
				<tr >
				    <td style="padding-left:60px; padding-top:10px;">물품등록 메뉴를 클릭하고 물품에 대한 상세내용에 대해서 작성해주세요</td>
				</tr>
			</table>
			
			<table  style="padding: 90px; padding-top: 40px;padding-bottom: 15px; width: 590px;">
				<tr style="margin-bottom: 20px;">
					<td>
						<img src="/team4/resources/images/two.png">
						<font size="5"><b>물 품 배 송</b></font>
					</td>
			    </tr>
			    
			    <tr>
					<td style="padding-top:10px;"><img src="/team4/resources/images/ttt9.png" style="margin-right:40px;"></td>
				</tr>
				
				<tr>
				    <td style="padding-left:60px; padding-top:10px;">경기도 성남시 분당구 삼평동 대왕판교로 670길 유스페이스2 B동 8층</td>
				</tr>
				
				<tr>
                    <td style="padding-left:60px;">TEL : 070 - 5039 - 5805　　　　FAX : 070 - 7614 - 3450</td>
                </tr>
                
                <tr>
                    <td style="padding-left:60px;">위 주소로 등록한 물품을 보내주세요.</td>
                </tr>
			</table>

			<table  style="padding: 90px; padding-top: 40px;padding-bottom: 15px;">
				<tr style="margin-bottom: 20px;">
					<td>
						<img src="/team4/resources/images/three.png">
						<font size="5"><b>심　사</b></font>
					</td>
			    </tr>

				<tr>
				    <td style="padding-left:30px; padding-top:20px;">&nbsp;공급자와 홈페이지 관리자간의 협의를 통해서 물품의 상태를 파악하고 대여기간, 보증금, 대여비용, 사이트에 어떻게 게시되어질지 등을 심사 하게 됩니다.</td>
				</tr>
                
                <tr>
				    <td style="padding-left:95px; padding-top:5px;"><b>※ 회원등록시 연락 가능한 번호, 이메일을 정확히 입력해주세요. ※</b></td>
                </tr>
			</table>

			<table  style="padding: 90px; padding-top: 40px;padding-bottom: 15px; width: 590px;">
				<tr style="margin-bottom: 20px;">
					<td>
						<img src="/team4/resources/images/four.png">
						<font size="5"><b>물 품 대 여</b></font>
					</td>
			    </tr>
			    
			    <tr>
					<td style="padding-top:10px;"><img src="/team4/resources/images/ttt10.png" style="margin-right:40px;"></td>
				</tr>
				
				<tr>
				    <td style="padding-left:18px; padding-top:10px;">심사가 완료되면 물품대여 카테고리에 등록되어 모든 이용자들이 이용 할 수 있습니다.</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>