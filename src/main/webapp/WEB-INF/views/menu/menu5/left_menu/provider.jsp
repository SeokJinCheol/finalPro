<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<head>
<title>use</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div align=center class="w3-container" style="background: #f5f6f7; width: 1350px; height:500px; vertical-align:middle; display:table-cell;">
	     <div style="margin-bottom: 20px; margin-top: 70px;">
	       <table>
		       <td><input type="button" value ="공급자물품 등록과정" onclick="location='provider'">></td>
		       <td><input type="button" value ="대여자물품 대여과정" onclick="location='lender'">></td>
		       <br><br>
		    </table>
            <table style="padding: 70px; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px; width:550px; height:250px;">
				<center>
				<tr>
					<td colspan="4" style="height:27px;">
						<h5><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;■ 공 급 자 물 품 등 록 과 정 </b></h5>
					</td>
				</tr>
				
				<tr>
				    <td><img src="/team4/resources/images/ttt2.png"></td>
				</tr>
				
				<tr>
				    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공급자가 물품등록 페이지에 대여가능한 물품의 사진과 상세내용을 첨부하여 올리게<br>
				          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;되면, 물품의 상태와 대여비용 등의 심사를 거쳐서 모든 이용자에게 보여지게 됩니다
				    </td>
				</tr>
			    </center>
			</table>	
			<br><br>
			<table  style="padding: 70px; padding-top: 30px;">
				<tr style="margin-bottom: 20px;">
					<h5><b>S T E P 1. 물 품 등 록</b></h5>
			    </tr>
			    <tr>
					<td><img src="/team4/resources/images/ttt3.png" style="margin-right:40px;"></td>
				</tr>
				<tr>
				    <td>물품등록 메뉴를 클릭하고 물품에 대한 상세내용에 대해서 작성해주세요</td>
				</tr>
				
			</table>
			
			<br><br>
			<table  style="padding: 70px; padding-top: 30px;">
				<tr style="margin-bottom: 20px;">
					<h5><b>S T E P 2. 물 품 배 송</b></h5>
			    </tr>
			    <tr>
					<td><img src="/team4/resources/images/ttt9.png" style="margin-right:40px;"></td>
				</tr>
				<tr>
				    <td>경기고 성남시 분당구 삼평동 대왕판교로 670길 유스페이스2 B동 8층</td>
				</tr>
				<tr>
                    <td>TEL : 070-5039-5805     FAX : 070-7614-3450</td>
                </tr>
                <tr>
                    <td>위 주소로 등록한 물품을 보내주세요.</td>
                </tr>
			</table>
			
			<br><br>
			<table  style="padding: 70px; padding-top: 30px;">
				<tr style="margin-bottom: 20px;">
					<h5><b>S T E P 3. 심 사</b></h5>
			    </tr>
				<tr>
				    <td>공급자와 사이트 관리자간에 협의를 통해서 물품의 상태와 대여기간, 보증금, 대여비용,</td>
				</tr>
				
				<tr>
				    <td> 사이트에 어떻게 게시되어질지 등을 심사 하게 됩니다.  </td>
                </tr>
                
                <tr>
				    <td> (회원등록시 연락가능한 번호, 이메일을 정확히 입력해주세요~)  </td>
                </tr>
				
			</table>
			
			<br><br>
			<table  style="padding: 70px; padding-top: 30px;">
				<tr style="margin-bottom: 20px;">
					<h5><b>S T E P 4. 물 품 대 여</b></h5>
			    </tr>
			    <tr>
					<td><img src="/team4/resources/images/ttt10.png" style="margin-right:40px;"></td>
				</tr>
				<tr>
				    <td>심사가 완료되면 물품대여 페이지에 등록되어 모든 이용자들이 볼 수 있습니다.</td>
				</tr>
				
			</table>
		</div>
	</div>
</body>
</html>