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
	
	if(confirm('결제회원만 접근 가능합니다.\n 결제하시겠습니까?')){
		location.href='/mypay/mypay'
	} else {
		window.history.back()
	}
	
})

</script>
</head>
<body>
</body>
</html>