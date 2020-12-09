<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 완료</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
function popupClose(){
	console.log("클릭");
	window.open('','_self').close();

}

var wintimer;
clearTimeout(wintimer);
wintimer= setTimeout("closewin()",5000);  

function closewin() {
   window.close();
}
window.onload=showWindow;




</script>
<style type="text/css">
#closeBtn{
	float : right;
}

</style>
</head>
<body>
<h1>신고완료 </h1>
5초뒤 자동으로 닫힙니다.
<hr>
<button id="closeBtn" onclick="popupClose();" class="btn btn-primary" >창 닫기</button>
</body>
</html>