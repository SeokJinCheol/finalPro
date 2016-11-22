<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/fag.css"/>"/>
<style type='text/css'>

</style>
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

<title>FAQ</title>
</head>
<body>
	<div class="faq">
		<div class="hgroup">
			<h1>FAQ</h1>
			<button type="button" class="trigger">
				<span>답변 여닫기</span>
			</button>
		</div>
		<ul>
			<c:forEach items="${list}" var="question">
				<li class="article">
					<p class="q">
						<a href="#a${question.bnum} " class="trigger">${question.question}</a>
					</p>
					<p class="a">${question.answer}</p>
				</li>
			</c:forEach>

		</ul>
	</div>
	<!-- 페이지 번호 -->
	<div align="center" class="w3-row">
		<c:if test="${count>0}">
			<c:set var="pageCount" value="${pageCount}" />
			<!-- pagCount=15 -->
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
						<a href="defaultQnA?pageNum=${startPage-5}">&laquo;</a>
					</c:if>
					<c:if test="${word != null && keyword != null}">
						<a
							href="defaultQnA?pageNum=${startPage-5}&word=${word}&keyword=${keyword}">&laquo;</a>
					</c:if>
				</c:if>

				<table>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${word == null}">
							<td><a href="defaultQnA?pageNum=${i}">${i}</a></td>
						</c:if>

						<c:if test="${word != null }">
							<td><a
								href="defaultQnA?pageNum=${i}&word=${word}&keyword=${keyword}">${i}</a></td>
						</c:if>
					</c:forEach>
				</table>

				<c:if test="${endPage<pageCount}">
					<c:if test="${word == null}">
						<a href="defaultQnA?pageNum=${startPage+5}">&raquo;</a>
					</c:if>

					<c:if test="${word != null }">
						<a
							href="defaultQnA?pageNum=${startPage+5}&word=${word}&keyword=${keyword}">&raquo;</a>
					</c:if>
				</c:if>
			</ul>
			<br>
		</c:if>
	</div>
</body>
</html>