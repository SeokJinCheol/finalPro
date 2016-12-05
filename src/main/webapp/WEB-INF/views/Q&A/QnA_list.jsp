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
<title>QnA_list</title>
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
		<img src="/team4/resources/images/left-question122.png"
			style="margin-right: 10px;"> <font
			style="margin-right: 30px; font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px;">1&nbsp;:&nbsp;1　질　문</font>
	</div>

	<div align=center
		style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<!-- 검색 -->
		<div class="w3-row" style="margin-top: 50px;">
			<form action="QnA_list" method=post>
				<select name="keyword"
					style="width: 15%; border-radius: 4px; text-align: center; height: 27px;">
					<option value="#" style="text-align: center;">선택하세요.</option>
					<option value="title" style="text-align: center;">Title</option>
					<option value="id" style="text-align: center;">I D</option>
				</select> <input type="text" name="word" value="${word}"
					placeholder="&nbsp;Search . . . "
					style="border-color: rgb(169, 169, 169);" class="free-search-title"
					required="required" /> <input type="submit" class="list-search"
					value="Search" style="width: 8%;">
			</form>
		</div>


		<div style="margin-bottom: 20px; width: 73%;">
			<security:authorize ifAnyGranted="role_user, role_com, role_master">
				<div class="w3-row">
					<div class="w3-col w3-right"
						style="margin-right: 8px; width: 10%; margin-bottom: 10px;">
						<br> <br> <input type="button" class="button-write"
							value="글 쓰 기" onclick="location='QnA_write'">
					</div>
				</div>
			</security:authorize>

			<security:authorize ifNotGranted="role_user, role_com, role_master">
				<div class="w3-row">
					<div class="w3-col w3-right"
						style="margin-right: 5px; width: 10%; margin-bottom: 7px;">
						<br> <br>
					</div>
				</div>
			</security:authorize>
			<form name="goLink">
				<input type="hidden" name="bnum" />
				<table
					style="padding: 70px; text-align: center; border-collapse: collapse; border-spacing: 0; padding-top: 5px; padding-bottom: 10px;">
					<tr class="bottom-border2"
						style="height: 30px; margin-bottom: 20px; background-color: #80b5ea; color: white; text-align: center;">
						<td width=80
							style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">No.</td>
						<td width=60
							style="border-top: 2px solid #000; border-right: 1px solid #fff;">Img</td>
						<td width=120
							style="border-top: 2px solid #000; border-right: 1px solid #fff;">Category</td>
						<td width=120
							style="border-top: 2px solid #000; border-right: 1px solid #fff;">Title</td>
						<td width=80
							style="font-family: 'Jeju Gothic', sans-serif; border-top: 2px solid #000; border-right: 1px solid #fff;">I
							D</td>
						<td width=50 style="border-top: 2px solid #000;">Hit</td>
						<td width=80
							style="border-top: 2px solid #000; border-right: 1px solid #fff;">Date</td>
					</tr>

					<!-- result는 contoller의 addObject로 부터 가져온다. -->


					<c:forEach items="${list}" var="list">
						<tr>
							<td
								style="font-family: 'Nanum Gothic Coding', monospace; border-bottom: 3px solid #fff;">${list.rnum}</td>
							<td style="border-bottom: 3px solid #fff; width: 10%;"><img
								src="/team4/resources/QandAImg/${list.img }"
								style="width: 100%; height: 50px;"></td>
							<td style="border-bottom: 3px solid #fff;">${list.category}</td>
							<!-- 제목이 15자 이상일 경우 줄여쓰기 기능 -->
							<c:choose>
								<c:when test="${fn:length(list.title)>15 }">
									<!-- 관리자인 경우_상세보기 가능!! -->
									<security:authorize ifAnyGranted="role_master">
										<td style="border-bottom: 3px solid #fff;"><a
											href="javascript:void(0)" onclick="move(${list.bnum});">
												<c:out value="${fn:substring(list.title,0,14)}" />... <c:if
													test="${list.replyCount != 0}">(${list.replyCount})</c:if>
										</a></td>
									</security:authorize>

									<!-- 일반회원인 경우_자신의 글만 상세보기 가능!! -->
									<security:authorize ifAnyGranted="role_user, role_com">
										<c:if test="${list.id == session_id}">
											<td style="border-bottom: 3px solid #fff;"><a
												href="javascript:void(0)" onclick="move(${list.bnum});">
													<c:out value="${fn:substring(list.title,0,14)}" />... <c:if
														test="${list.replyCount != 0}">(${list.replyCount})</c:if>
											</a></td>
										</c:if>

										<c:if test="${list.id != session_id}">
											<td style="border-bottom: 3px solid #fff;"><c:out
													value="${fn:substring(list.title,0,14)}" />... <c:if
													test="${list.replyCount != 0}">(${list.replyCount})</c:if>
											</td>
										</c:if>
									</security:authorize>

									<!-- 비회원인 경우_list 밖에 못 본다!! -->
									<security:authorize
										ifNotGranted="role_master, role_user, role_com">
										<td style="border-bottom: 3px solid #fff;"><c:out
												value="${fn:substring(list.title,0,14)}" />... <c:if
												test="${list.replyCount != 0}">(${list.replyCount})</c:if></td>
									</security:authorize>
								</c:when>

								<c:otherwise>
									<!-- 관리자인 경우_상세보기 가능!! -->
									<security:authorize ifAnyGranted="role_master">
										<td style="border-bottom: 3px solid #fff;"><a
											href="javascript:void(0)" onclick="move(${list.bnum});">
												<c:out value="${list.title}" /> 
											<c:if test="${list.replyCount != 0}">(${list.replyCount})</c:if>
										</a></td>
									</security:authorize>

									<!-- 비회원인 경우_list 밖에 못 본다!! -->
									<security:authorize
										ifNotGranted="role_master, role_user, role_com">
										<td style="border-bottom: 3px solid #fff;"><c:out
												value="${list.title}" /> <c:if
												test="${list.replyCount != 0}">(${list.replyCount})</c:if></td>
									</security:authorize>

									<!-- 일반회원인 경우_자신의 글만 상세보기 가능!! -->
									<security:authorize ifAnyGranted="role_user, role_com">
										<c:if test="${list.id == session_id}">
											<td style="border-bottom: 3px solid #fff;"><a
												href="javascript:void(0)" onclick="move(${list.bnum});">
													<c:out value="${list.title}" /> <c:if
														test="${list.replyCount != 0}">(${list.replyCount})</c:if>
											</a></td>
										</c:if>

										<c:if test="${list.id != session_id}">
											<td style="border-bottom: 3px solid #fff;"><c:out
													value="${list.title}" /> <c:if
													test="${list.replyCount != 0}">(${list.replyCount})</c:if>
											</td>
										</c:if>
									</security:authorize>
								</c:otherwise>
							</c:choose>
							<td style="border-bottom: 3px solid #fff;">${list.id}</td>
							<td style="border-bottom: 3px solid #fff;">${list.count}</td>
							<td style="border-bottom: 3px solid #fff;"><fmt:formatDate
									value="${list.date}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>

				</table>
			</form>
			<!-- 전체 페이지의 수를 연산 -->
			<div align="center">
				<c:if test="${count>0}">
					<c:set var="pageCount" value="${pageCount}" />
					<c:set var="startPage" value="${1}" />
					<c:set var="pageBlock" value="${5}" />

					<fmt:parseNumber var="result" value="${currentPage/pageBlock}"
						integerOnly="true" />

					<c:if test="${(currentPage%pageBlock)!=0}">
						<c:set var="startPage" value="${result*pageBlock+1}" />
						<!-- startpage=11 -->
					</c:if>

					<c:if test="${(currentPage%pageBlock)==0}">
						<c:set var="startPage" value="${(result-1)*pageBlock+1}" />
					</c:if>

					<c:set var="endPage" value="${startPage+pageBlock-1}" />
					<!-- endpage=15 -->
					<c:if test="${endPage>=pageCount}">
						<c:set var="endPage" value="${pageCount}" />
					</c:if>

					<ul>
						<c:if test="${startPage>5}">
							<c:if test="${word == null}">
								<a style="text-decoration: none;"
									href="QnA_list?pageNum=${startPage-5}">&laquo;</a>
							</c:if>
							<c:if test="${word != null && keyword != null}">
								<a style="text-decoration: none;"
									href="QnA_list?pageNum=${startPage-5}&word=${word}&keyword=${keyword}">&laquo;</a>
							</c:if>
						</c:if>

						<table>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<c:if test="${word == null}">
									<td
										style="background: #6699DC; color: white; width: 20px; text-align: center; border-radius: 5px;">
										<a style="text-decoration: none;" href="QnA_list?pageNum=${i}">${i}</a>
									</td>
								</c:if>

								<c:if test="${word != null }">
									<td
										style="background: #6699DC; color: white; width: 20px; text-align: center; border-radius: 5px;">
										<a style="text-decoration: none;"
										href="QnA_list?pageNum=${i}&word=${word}&keyword=${keyword}">${i}</a>
									</td>
								</c:if>
							</c:forEach>
						</table>

						<c:if test="${endPage<pageCount}">
							<c:if test="${word == null}">
								<a style="text-decoration: none;"
									href="QnA_list?pageNum=${startPage+5}">&raquo;</a>
							</c:if>

							<c:if test="${word != null }">
								<a style="text-decoration: none;"
									href="QnA_list?pageNum=${startPage+5}&word=${word}&keyword=${keyword}">&raquo;</a>
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
	function move(bnum){
	      var f=document.goLink;  //폼 name
	     f.bnum.value =bnum;  //POST방식으로 넘기고 싶은 값
	     f.action="QnA_content";   //이동할 페이지
	     f.method="post";  //POST방식
	     f.submit();
	};
</script>
</html>