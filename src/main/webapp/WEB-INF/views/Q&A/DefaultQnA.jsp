<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>QnA_자주묻는질문</title>
<!-- CSS 연결-->
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/fag.css"/>"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/w3.css" type="text/css" media="screen">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login.css" type="text/css" media="screen">

<script type="text/javascript" src="<c:url value="/resources/js/jquery-1.4.2.min.js"/>"></script>
<script type='text/javascript'>
	$(function() {
		var article = $('.faq .article');

		article.addClass('hide');
		article.find('.a').slideUp(100);

		$('.faq .article .trigger').click(function() {
			var myArticle = $(this).parents('.article:first');

			if (myArticle.hasClass('hide')) {
				myArticle.removeClass('hide').addClass('show');
				myArticle.find('.a').slideDown(100);
			} else {
				myArticle.removeClass('show').addClass('hide');
				myArticle.find('.a').slideUp(100);
			}
		});

		$('.faq .hgroup .trigger').click(function() {
			var hidden = $('.faq .article.hide').length;

			if (hidden > 0) {
				article.removeClass('hide').addClass('show');
				article.find('.a').slideDown(100);
			} else {
				article.removeClass('show').addClass('hide');
				article.find('.a').slideUp(100);
			}
		});
	});
</script>
</head>
<body>
	<div class="row" style="background: #6699DC; color: white; height: 100px; text-align: right; line-height: 130px;">
		<img src="/team4/resources/images/left-question2.png" style="margin-right: 10px;"> 
		<font style="margin-right: 30px; font-family: 'Hanna', fantasy; font-style: bold; font-size: 30px;">자주 묻는 질문</font>
	</div>
	
	<div align=center style="background: #f5f6f7; width: 1350px; height: 500px; vertical-align: middle; display: table-cell;">
		<div class="faq" style="margin-top:50px;margin-left:80px;margin-right:80px;">
			<ul>
				<c:forEach items="${list}" var="question">
					<li class="article">
						<p class="q" style="height: 50px; font-size: 15px;">
							<a href="#a${question.bnum} " class="trigger">${question.question}</a>
						</p>
						
						<p class="a">${question.answer}</p>
					</li>
				</c:forEach>
			</ul>
		</div>
	
		<!-- 전체 페이지의 수를 연산 -->
		<div align="center">
			<c:if test="${count>0}">
				<c:set var="pageCount" value="${pageCount}" />
				<c:set var="startPage" value="${1}" />
				<c:set var="pageBlock" value="${5}" />

				<fmt:parseNumber var="result" value="${currentPage/pageBlock}" integerOnly="true" />

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
							<a style="text-decoration:none;" href="defaultQA?pageNum=${startPage-5}">&laquo;</a>
						</c:if>
						<c:if test="${word != null && keyword != null}">
							<a style="text-decoration:none;" href="defaultQA?pageNum=${startPage-5}&word=${word}&keyword=${keyword}">&laquo;</a>
						</c:if>
					</c:if>

					<table>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<c:if test="${word == null}">
								<td style="background: #6699DC; color:white; width:20px; text-align: center;border-radius: 5px;">
									<a style="text-decoration:none;" href="defaultQA?pageNum=${i}" >${i}</a>
								</td>
							</c:if>

							<c:if test="${word != null }">
								<td style="background: #6699DC; color:white; width:20px; text-align: center;border-radius: 5px;">
									<a style="text-decoration:none;" href="defaultQA?pageNum=${i}&word=${word}&keyword=${keyword}">${i}</a>
								</td>
							</c:if>
						</c:forEach>
					</table>

					<c:if test="${endPage<pageCount}">
						<c:if test="${word == null}">
							<a style="text-decoration:none;" href="defaultQA?pageNum=${startPage+5}">&raquo;</a>
						</c:if>

						<c:if test="${word != null }">
							<a style="text-decoration:none;" href="defaultQA?pageNum=${startPage+5}&word=${word}&keyword=${keyword}">&raquo;</a>
						</c:if>
					</c:if>
				</ul>
			</c:if>
		</div>
	</div>
</body>
</html>