<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>mypage_update</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">
</head>
<body>
   <div class="row" style="background:#6699DC; color:white; height:100px; text-align: right;line-height: 130px;">
      <img src="/team4/resources/images/left-mypage12.png" style="margin-right:10px;">
      <font style="margin-right: 30px;font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px; ">회 원 정 보 수 정</font>
   </div>


   <div align=center class="main-table" style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align:middle; display:table-cell;">
      <div style="width: 40%;" align=center>
         <form action="mypage_update" method="post" style="margin-top:40px; margin-bottom:20px;">
               <table style="border-collapse: collapse; border-spacing: 0;">
               <tr height="40">
                     <td width=80 class="top-bottom-border">&nbsp;&nbsp;&nbsp;ID</td>
                  <td class="top-bottom-border">
                     <input type="text" name="id" class="free-insert-title w3-left" value="${result.id}" style="width:85%; height:35px; border-radius: 6px; margin-left:5px;" readonly> 
                  </td>
               </tr>
               
                     <tr height="40">
                     <td width=80 class="bottom-border">&nbsp;&nbsp;&nbsp;PWD</td>
                  <td class="bottom-border" align=center>
                     <input type="password" name="pwd" class="free-insert-title w3-left" value="${result.pwd}" style="width:85%; height:35px; border-radius: 6px; margin-left:5px;" readonly> 
                  </td>
               </tr>

               <tr height="40">
                     <td width=80 class="bottom-border">&nbsp;&nbsp;이　름</td>
                  <td class="bottom-border">
                     <input type="text" name="name" class="free-insert-title w3-left" value="${result.name}" style="width:85%; height:35px; border-radius: 6px; margin-left:5px;" required> 
                  </td>
               </tr>
               
               <tr height="40">
                     <td width=80 class="bottom-border">&nbsp;&nbsp;생년월일</td>
                  <td class="bottom-border">
                     <input type="date" name="birthday" value="1990-01-01" value="${result.birthday}" class="free-insert-title w3-left" style="width:85%; height:35px; border-radius: 6px; margin-left:5px;" required> 
                  </td>
               </tr>

               <tr height="40">
                     <td width=80 class="bottom-border">&nbsp;&nbsp;휴대전화</td>
                  <td class="bottom-border">
                     <input type="text" value="${result.phoneNum1}" name="phoneNum1" class="free-insert-title w3-left" style="width:85%; height:35px; border-radius: 6px; margin-left:5px;" required> 
                  </td>
               </tr>
               
               <tr height="40">
                     <td width=80 class="bottom-border">&nbsp;&nbsp;일반전화</td>
                  <td class="bottom-border">
                     <input type="text" value="${result.phoneNum2}" name="phoneNum2" class="free-insert-title w3-left" style="width:85%; height:35px; border-radius: 6px; margin-left:5px;"> 
                  </td>
               </tr>
   
               <tr height="40">
                     <td width=80 class="bottom-border">&nbsp;&nbsp;&nbsp;E-mail</td>
                  <td class="bottom-border">
                     <input type="text" value="${result.email }" name="email" class="free-insert-title w3-left" style="width:85%; height:35px; border-radius: 6px; margin-left:5px;" required> 
                  </td>
               </tr>

               <tr height="40">
                     <td width=80 class="bottom-border">　주　소</td>
                  <td class="bottom-border">
                     <form id="FrmSave" name="FrmSave">
                        <input type="text" id="postcode" name="postcode" value="${result.postcode}" class="free-insert-title w3-left" style="width:35%; height:35px; border-radius: 6px; margin-left:5px;" required placeholder="　우편번호">
                                    <input type="button" class="join-btna w3-card-4 w3-right" value="검　색" style="margin-right:50px; margin-bottom:5px;" onclick="execDaumPostcode()">
                                    <input type="text" id="address" name="address" value="${result.address}" class="free-insert-title w3-left" style="width:85%; height:35px; border-radius: 6px; margin-bottom:5px; margin-left:5px;" required placeholder="　주　소">
                                  <input type="text" id="address2" name="address2" value="${result.address2}" class="free-insert-title w3-left" style="width:80%; height:35px; border-radius: 6px; margin-bottom:5px; margin-left:5px;" required placeholder="　상　세　주　소">
                            </form>
                        </td>
               </tr>

               <security:authorize ifAnyGranted="role_com, role_master">
                  <tr>
                         <td width=80 class="bottom-border2">　회　사</td>
                         <td class="bottom-border2">
                        <input type="text" name="company" class="free-insert-title w3-left" style="width:85%; height:35px; border-radius: 6px; margin-left:5px;" value="${result.company}"> 
                     </td>
                      </tr>
                     </security:authorize>
            </table>
            
                <p>
               <input type="submit" class="free_update-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수　정" />
               &nbsp;&nbsp;&nbsp;
               <input type="button" class="free_insert-btn w3-card-4" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;취　소" onclick="location.href='mypage'"/>
            </p>
         </form>
      </div>
   </div>
</body>

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