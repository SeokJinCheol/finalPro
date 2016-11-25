<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>joinForm1</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
	<div align=center class="main-table" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align:middle; display:table-cell;">
		<div style="width: 40%;" align=center>
			<div class="w3-rest w3-container w3-round-large w3-card-4" style="background-color: #F0F0f0;margin-bottom:20px; margin-top:20px;">
				<div style="margin-bottom:20px; margin-top:20px;">
					<h3> J o i n </h3>
				</div>
			
				<form action="joinForm1" method="post">
					<!-- 이용약관 동의 -->
					<div class="w3-row w3-wide" align=center style="margin-bottom:20px;">
						<input type="checkbox" name="check" required> 
						귀하는 해당사이트의 	
						<a href="join/agreement.jsp" target="_blank" onclick="window.open('agreement', 'agreement', 'left=100, top=0, width=900, height=600'); return false">이용약관</a>
						에 동의합니다.
					</div>
							
					<table>
						<tr>
							<td>&nbsp;ID</td>
							<td>
								<input type="text" name="id" placeholder="Enter your ID" class="w3-left w3-input" style="width:55%; border-radius: 6px;" required> 
								<input type="button" class="join-btn w3-card-4 w3-right" name="confirm_id" value="ID 중복확인" onclick="openConfirmid(this.form)">
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;PWD</td>
							<td>
								<input type="password" name="pwd" class="w3-left w3-input" style="width:55%; border-radius: 6px;" placeholder="Enter your Pwd" required>
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;NAME</td>
							<td>
								<input type="text" name="name" class="w3-left w3-input" style="width:55%; border-radius: 6px;" placeholder="Enter your Name" required>
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;BirthDay</td>
							<td>
								<input type="date" name="birthday" value="1990-01-01" class="w3-left w3-input" style="width:65%; border-radius: 6px;" placeholder="Enter your BirthDay" required>
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;Phone&nbsp;Number</td>
							<td>
								<input type="text" name="phoneNum1" class="w3-left w3-input" style="width:65%; border-radius: 6px;" placeholder="Enter your Phone Number" required>
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;Home&nbsp;Number</td>
							<td>
								<input type="text" class="w3-left w3-input" style="width:65%; border-radius: 6px;" name="phoneNum2">
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;E-mail</td>
							<td>
								<input type="text" name="email" class="w3-left w3-input" style="width:65%; border-radius: 6px;" placeholder="Enter your E-mail" required>
							</td>
						</tr>
		
						<tr>
							<td>&nbsp;Adress</td>
							<td>
                               <form id="FrmSave" name="FrmSave">
	                              <input type="text" id="postcode" name="postcode" placeholder="우편번호">
                                  <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
                                  <input type="text" id="address"  name="address" size="30" placeholder="주소">
                                  <input type="text" id="address2"  name="address2" size="30" placeholder="상세주소">
                               </form>
                            </td>
						</tr>
					</table>
		
					<p>
						<input type="submit" class="join-btn1 w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;J o i n" />
						&nbsp;&nbsp;&nbsp;
						<input type="button" class="cancel-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cancel" onclick="location.href='joinForm'"/>
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