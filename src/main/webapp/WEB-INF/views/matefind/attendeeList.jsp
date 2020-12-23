<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<body>
	<c:forEach var="resultHistory" items="${resultHistory}" >
		<li class="result-item">
		    <p class="result-day">${resultHistory.REG_DATE} <span>${resultHistory.ORDER_TYPE}</span></p>
		    <dl class="result-detail">
		        <dt>품명</dt>
		        <dd>${resultHistory.PRODUCT_TYPE}</dd>
		        <dt>금액</dt>
		        <dd>${resultHistory.AMOUNT}</dd>
		    </dl>
		</li>
	</c:forEach>


</body>
