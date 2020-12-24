<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
 src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
 
<script type="text/javascript">

$(document).ready(function(){
	
	alert('로그인하셔야 접근 가능합니다.')
	location.href='/login/login'
	
})

</script>

</head>
<body>
<%-- <div style="text-align:center; width:50%; margin:0 auto;" id="searchMsg" >
	<br>
	<img alt="" src="/resources/img/error.jpg">
	<h4>로그인하셔야 접속이 가능합니다...</h4>
	<a href="/"><span>로그인할래요..</span></a>
</div> --%>
</body>
</html>