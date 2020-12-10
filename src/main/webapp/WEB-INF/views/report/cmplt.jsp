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

<style type="text/css">
#closeBtn{
	position : absolute;
	left:35%;
}

</style>
<script type="text/javascript">
function popupClose(){
	console.log("클릭");
	window.open('','_self').close();

}

var closeTimer = setTimeout(function(){
	window.close();
}, 5000);


var count = 4;
var countdown = setInterval(function(){
	$("#countdown").html("<strong>"+count+"</strong>초 후에 창이 닫힙니다.");
	count--;
}, 1000);

</script>
</head>
<body>
<h1>🚨신고가 완료되었습니다. </h1>
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