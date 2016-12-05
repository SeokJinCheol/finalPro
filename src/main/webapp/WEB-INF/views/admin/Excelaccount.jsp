<%@ page language="java" contentType="application/vnd.ms-excel;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
    response.setHeader("Content-Disposition","attachment;filename=account.xls");
    response.setHeader("Content-Description", "JSP Generated Data");
 %>

<title>Insert title here</title>
</head>
<body>
			<table>
					<tr class="bottom-border2" style=" height:30px; margin-bottom: 20px; background-color: #80b5ea; color:white; text-align: center;">
				        <td>대 여 자</td>
				        <td>대여일자</td>
				        <td>반납일자</td>
				        <td>대여일수</td>
				        <td>대 여 비</td>
				        <td>결제금액</td>
				    </tr>
					<c:forEach items="${storagelist}" var="storagelist" begin="0" end="${fn:length(storagelist)}" varStatus="status">
						<c:set var="total" value="${total+pay[status.index] }" />
							<tr>
						    	<td>${storagelist.rentter} 님</td>
					            <td>${storagelist.startDate}</td>
					            <td>${storagelist.endDate}</td>
					            <td>${rentDate[status.index]} 일</td>
					            <td><fmt:formatNumber value="${storagelist.bill}" pattern="￦ ###,###"/> 원</td>
					            <td><fmt:formatNumber value="${pay[status.index]}" pattern="￦ ###,###"/> 원</td>
					        </tr>
					</c:forEach>
					<tr>
						<td>
							총 금액　:　<fmt:formatNumber value="${total}" pattern="￦ ###,###"/> 원
						</td>
					</tr>
			</table>
</body>
</html>