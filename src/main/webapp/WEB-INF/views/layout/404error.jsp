<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	response.setStatus(HttpServletResponse.SC_OK);
%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<div id="divpage">

<br>
<img class="error404" src="/resources/img/404error.png"><br>
<button class="errorbtn"><a href="javascript:history.back();">Back</a></button>
<button class="errorbtn"><a href="http://localhost:8088/">Main</a></button>

<br><br>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />