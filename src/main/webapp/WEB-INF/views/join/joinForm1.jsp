<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>joinForm1</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>	
	<div class="row" style="background:#6699DC; color:white; height:100px; text-align: right;line-height: 130px;">
		<img src="/team4/resources/images/joinForm.png" style="margin-right:10px;">
		<font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">회 원 가 입</font>
	</div>

	<div align=center class="main-table" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align:middle; display:table-cell;">
		<div style="width: 40%;" align=center>
			<div class="w3-rest w3-container w3-round-large w3-card-8" style="background-color: #F0F0f0;margin-bottom:20px; margin-top:20px;">
				<form action="joinForm1" method="post" style="margin-top:20px;">
					<!-- 이용약관 동의 -->
					<div class="w3-row w3-wide" align=center style="margin-bottom:20px;">
						<input type="checkbox" name="check" required> 
						귀하는 해당사이트의 	
						<a href="join/agreement.jsp" target="_blank" onclick="window.open('agreement', 'agreement', 'left=100, top=0, width=900, height=600'); return false">이용약관</a>
						에 동의합니다.
					</div>
							
					<table style="border-collapse: collapse; border-spacing: 0;">
						<tr height="40">
			            	<td width=80 class="top-bottom-border">&nbsp;&nbsp;&nbsp;ID</td>
							<td class="top-bottom-border">
								<input type="text" name="id" placeholder="　ID" class="free-insert-title w3-left" style="width:55%; height:35px; border-radius: 6px; margin-left:5px;" required> 
								<input type="button" class="join-btna w3-card-4 w3-right" name="confirm_id" value="ID 중복확인" style="margin-right:5px;" onclick="openConfirmid(this.form)">
							</td>
						</tr>
						
						<tr height="40">
			            	<td width=80 class="bottom-border">&nbsp;&nbsp;&nbsp;PWD</td>
							<td class="bottom-border">
								<input type="password" name="pwd" placeholder="　비밀번호" class="free-insert-title w3-left" style="width:55%; height:35px; border-radius: 6px; margin-left:5px;" required> 
							</td>
						</tr>
						
						<tr height="40">
			            	<td width=80 class="bottom-border">&nbsp;&nbsp;이　름</td>
							<td class="bottom-border">
								<input type="text" name="name" placeholder="　이름" class="free-insert-title w3-left" style="width:55%; height:35px; border-radius: 6px; margin-left:5px;" required> 
							</td>
						</tr>
						
						<tr height="40">
			            	<td width=80 class="bottom-border">&nbsp;&nbsp;생년월일</td>
							<td class="bottom-border">
								<input type="date" name="birthday" value="1990-01-01" class="free-insert-title w3-left" style="width:65%; height:35px; border-radius: 6px; margin-left:5px;" required> 
							</td>
						</tr>

						<tr height="40">
			            	<td width=80 class="bottom-border">&nbsp;&nbsp;휴대전화</td>
							<td class="bottom-border">
								<input type="text" name="phoneNum1" class="free-insert-title w3-left" style="width:65%; height:35px; border-radius: 6px; margin-left:5px;" required> 
							</td>
						</tr>
						
						<tr height="40">
			            	<td width=80 class="bottom-border">&nbsp;&nbsp;일반전화</td>
							<td class="bottom-border">
								<input type="text" name="phoneNum2" class="free-insert-title w3-left" style="width:65%; height:35px; border-radius: 6px; margin-left:5px;" required> 
							</td>
						</tr>
						
						<tr height="40">
			            	<td width=80 class="bottom-border">&nbsp;&nbsp;&nbsp;E-mail</td>
							<td class="bottom-border">
								<input type="text" name="email" class="free-insert-title w3-left" style="width:65%; height:35px; border-radius: 6px; margin-left:5px;" required> 
							</td>
						</tr>
						
						<tr height="40">
			            	<td width=80 class="bottom-border2">　주　소</td>
							<td class="bottom-border2">
								<form id="FrmSave" name="FrmSave">
									<input type="text" id="postcode" name="postcode" class="free-insert-title w3-left" style="width:35%; height:35px; border-radius: 6px; margin-left:5px;" required placeholder="　우편번호">
                               		<input type="button" class="join-btna w3-card-4 w3-right" value="검　색" style="margin-right:100px; margin-bottom:5px;" onclick="execDaumPostcode()">
                               		<input type="text" id="address" name="address" class="free-insert-title w3-left" style="width:80%; height:35px; border-radius: 6px; margin-bottom:5px; margin-left:5px;" required placeholder="　주　소">
                                	<input type="text" id="address2" name="address2" class="free-insert-title w3-left" style="width:80%; height:35px; border-radius: 6px; margin-bottom:5px; margin-left:5px;" required placeholder="　상　세　주　소">
                                </form>
                            </td>
						</tr>
					</table>
		
					<p>
						<input type="submit" class="free_insert w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가　입" />
						&nbsp;&nbsp;&nbsp;
						<input type="button" class="free_insert-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취　소" onclick="location.href='joinForm'"/>
					</p>
					
					<input type="hidden" name="memberRank" value="일반회원">
					<input type="hidden" name="company" value=null>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	// 아이디 중복 여부 판단 함수
	function openConfirmid(joinForm) {
		url = "ConfirmId?id=" + joinForm.id.value;
		winObject = window.open(url, "id", "left=100, top=150, width=550, height=250");
		winObject.document.all.id.value = document.all.id.value;
	}
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
   //우편번호 검색
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address2').focus();
            }
        }).open();
    }
</script>

</html>