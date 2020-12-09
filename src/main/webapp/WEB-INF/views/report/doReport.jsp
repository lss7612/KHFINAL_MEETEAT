<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">
label {
	display : block;
}
#report_content{
	height : 80px;
	width : 450px;
	margin : 0 0 0 2.5%;
	resize : none;
}
#buttonDiv{
	position : absolute;
	left : 35%;
}
</style>

<script type="text/javascript">
function popupClose(){
	console.log("클릭");
	window.open('','_self').close();

}

</script>
</head>
<body>
<h1>🚨신고하기</h1>
<hr>
<div>
	대상 : ${user.USER_NICK }(${user.USER_ID })<br>
	신고 글 : ${url }
</div>
<form name="summit" action="/report/doReport/cmplt" method="post">
<div class="checkbox" id="formList">
<c:forEach items="${list }" var="hashmap">
<c:choose>
	<c:when test="${hashmap.REASON_NO eq 1 }">
		<label>
		<input type="radio" name="reason_no" value="${hashmap.REASON_NO }" checked = "checked"/> 
		${hashmap.REASON_NO }. ${hashmap.REASON_CONTENT }<br>
		</label>
	</c:when>
	<c:when test="${hashmap.REASON_NO eq 5 }">
		<label>
		<input type="radio" name="reason_no" value="${hashmap.REASON_NO }"/> 
		${hashmap.REASON_NO }. ${hashmap.REASON_CONTENT }<br>
		</label>
	</c:when>
	<c:otherwise>
		<label>
		<input type="radio" name="reason_no" value="${hashmap.REASON_NO }"/> 
		${hashmap.REASON_NO }. ${hashmap.REASON_CONTENT }<br>
		</label>
	</c:otherwise>
</c:choose>
</c:forEach>
	<input type="hidden" name= "user_no" value="${user.USER_NO }">
	<input type="hidden" name= "board_url" value="${url }"/>
</div>
<textarea id="report_content" name="report_content" class="form-control" ></textarea><br>
<div id="buttonDiv">
	<button id="reportDo" class="btn btn-primary" >신고</button>
	<input type="button" id="reportCancel"class="btn btn-danger" onclick="popupClose();" value="취소"/>
</div>
</form>
</body>
</html>