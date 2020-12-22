<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 완료</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="/resources/js/report/cmplt.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/report/cmplt.css"></link>

</head>
<body>
<h1 id="reportTitle">🚨신고가 완료되었습니다. </h1>
<hr>
<br>
<div id="content">
	<p id="countdown"><strong>5</strong>초 후에 창이 닫힙니다.</p>
</div>
<br><br><br><br><br><br><br><br><br>
<div id="buttonArea">
	<button id="closeBtn" onclick="popupClose();" class="btn btn-primary" >창 닫기</button>
</div>
</body>
</html>