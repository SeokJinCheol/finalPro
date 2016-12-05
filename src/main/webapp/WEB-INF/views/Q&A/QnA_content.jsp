<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Q&A_상세보기</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/w3.css"
	type="text/css" media="screen">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/login.css"
	type="text/css" media="screen">
</head>
<body>
	<div class="row"
		style="background: #6699DC; color: white; height: 100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/free_content.png"
			style="margin-right: 10px;"> <font
			style="margin-right: 30px; font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px;">상
			세 보 기</font>
	</div>

	<div align=center class="w3-container"
		style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<input type="hidden" name="bnum" value="${vo.bnum}">

		<div style="margin-bottom: 20px; width: 73%; margin-top: 40px;">
			<table style="border-collapse: collapse; border-spacing: 0;">
				<tr height="35">
					<td class="top-border"
						style="font-family: 'Jeju Gothic', sans-serif;">&nbsp;&nbsp;질
						문 사 진</td>

					<td width=30 class="top-bottom-border"><select name="category"
						readonly
						style="border-radius: 4px; text-align: center; height: 27px; width: 82px;">
							<option style="text-align: center;">${vo.category}</option>
					</select></td>

					<td class="top-bottom-border"><input type="text"
						value="${vo.title}" class="free-insert-title" name="title"
						style="margin-left: 12px;" readonly></td>
				</tr>

				<tr align=center>
					<td style="margin-right: 50px;" rowspan="4" class="bottom-border2">
						<img src="/team4/resources/QandAImg/${vo.img}"
						style="width: 300px; height: 300px;">
					</td>
				</tr>

				<tr align="center" height="35">
					<td
						style="text-align: center; font-family: 'Jeju Gothic', sans-serif; border-right: 1px solid white;"
						class="bottom-border">작 성 자</td>
					<td class="bottom-border"><input type="text" name="id"
						class="free-insert-title" value="${vo.id }"
						style="text-align: center;" readonly></td>
				</tr>

				<tr height="35">
					<td colspan="2" style="font-family: 'Jeju Gothic', sans-serif;">
						내 용</td>
				</tr>

				<tr align="center">
					<td colspan="2" class="bottom-border2"><textarea
							class="free-insert-content-title" style="resize: none;"
							name="contents" rows="10" cols="35" readonly>${vo.contents }</textarea>
					</td>
				</tr>
			</table>

			<div align=center>
				<!-- 관리자는 모든 글을 수정 가능 -->
				<security:authorize ifAnyGranted="role_master">
					<form action="QnA_update_get"
						style="float: left; width: 18%; margin-left: 32%;" method=post>
						<input class="free_update-btn w3-card-4" type="submit"
							value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수　정"> <input
							type="hidden" name="bnum" value="${vo.bnum}">
					</form>
						&nbsp;&nbsp;&nbsp;
						<form action="QnA_delete" method=post
						style="float: left; width: 18%;">
						<input class="free_delete-btn w3-card-4" type="submit"
							value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭　제"> <input
							type="hidden" name="bnum" value="${vo.bnum}">
					</form>
						&nbsp;&nbsp;&nbsp;
				</security:authorize>

				<!-- 비회원인 경우, 일반회원인데 자신의 글인 경우 -->
				<security:authorize ifNotGranted="role_master">
					<c:if test="${vo.id == session_id}">
						<form action="QnA_update_get"
							style="float: left; width: 18%; margin-left: 32%;" method=post>
							<input class="free_update-btn w3-card-4" type="submit"
								value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수　정"> <input
								type="hidden" name="bnum" value="${vo.bnum}">
						</form>
						&nbsp;&nbsp;&nbsp;
						<form action="QnA_delete" method=post
							style="float: left; width: 18%;">
							<input class="free_delete-btn w3-card-4" type="submit"
								value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭　제"> <input
								type="hidden" name="bnum" value="${vo.bnum}">
						</form>
						&nbsp;&nbsp;&nbsp;
					</c:if>
				</security:authorize>
			</div>
		</div>

		<!-- 리플 달기!! -->
		<form>
			<table
				style="border-collapse: collapse; border-spacing: 0; margin-bottom: 15px;">
				<tr>
					<td><textarea class="free-insert-content-title" id="contents"
							style="resize: none;" name="contents" rows="3" cols="60" required></textarea>
					</td>

					<td><input class="reply-btn" type="button" id="replybutton"
						onclick="replywrite()" value="답글"></td>
				</tr>
			</table>

			<input type="hidden" name="bnum" id="bnum" value="${vo.bnum}">
			<input type="hidden" name="title" id="title" value="${vo.title}">
		</form>

		<input type="hidden" name="bNum" value="${vo.bnum }">

		<!-- 리플 리스트 -->
		<table id="replylist"
			style="border-collapse: collapse; border-spacing: 0; width: 559px; height: 43px; text-align: center;">

		</table>

	</div>
</body>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript">
getReplylist();
function replywrite() {
   $.ajax({
      type:"POST",
      url:"QnA_reply",
      cache:false,
      datatype:"json",
      data: {'bnum':$("#bnum").val(),'title':$("#title").val(),'contents':$("#contents").val()},
      success: function (data){
         
        
         getReplylist();
      },
      complete: function (data) {
         $("#contents").val('');
      }
   });
}
$("#replylist").on("click",".reply-btn2", function(){
	var replylist = $(this).parent();
	var replynum = replylist.attr("data-rno");
	console.log(this);
   $.ajax({
      type:"POST",
      url:"QnA_re_delete",
      cache:false,
      datatype:"json",
      data: {'reply_bnum': replynum},
      success: function (data){
         alert("답글삭제!!");
         getReplylist();
      }
      });
   }
   );
function getReplylist() {
   var bnum=${vo.bnum};
   var str="";
   var imglink="resources/images/redelete.png";
   var session_id="${session_id}";
   $.getJSON("/team4/QnA_replylist/"+bnum,function(data){
      console.log(data.length);
      if(data != null){
      $(data).each(
         function(){
        	
             str +="<tr style='border-top: 2px solid #000; border-bottom: 2px solid #000;'>"+"<td width='15%'>"
                +this.id+"</td>"+"<td width='40%'>"
                +this.contents+"</td>"+"<td width='17%'>"
                +this.date+"</td>";
            if((this.id == session_id) || (session_id == 'admin')){
               str+= "<td data-rno="+this.bnum+">"+
                "<input class='reply-btn2' type='button' style='background-image:url("+imglink+"); width: 30px; background-repeat: no-repeat; background-position: center;' value=''>"
                +"<input type='hidden' id='reply_bnum' name='reply_bnum' value="+this.bnum+">"
                +"</td></tr>";
            }else{
               str+="<td></td></tr>";
            }
         }
      );}else{
    	  str+="";  
      }
      $("#replylist").html(str);
   });
}

</script>
</html>