<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/forTest/header.jsp"/>

<div class="wrapper">
<br>
<h1>모집게시판/글쓰기</h1>
<hr>

<form action="/recruitboard/write" method="POST">
<!-- 글제목 인풋영역 -->
	<input type="text" name="user_no" value="${user_no }" readonly="readonly" class="invisible"/>
	<div class="form-group">
		<label for="form_article_title">글제목</label>
		<input type="text" id="form_article_title" name="article_title" class="form-control"/>
	</div>
	
	<div class="pull-left form-group" style="width:30%; margin:0 30px 0 0;">
		<label for="form_meet_time">날짜</label>
		<input type="date" id="form_meet_date" name="meet_time_date" class="form-control"/>
	</div>
	
	<div class="pull-left form-group" style="width:30%;">
		<label for="form_meet_time">시간</label>
		<input type="text" id="form_meet_time" name="meet_time_time" class="form-control"/>
	</div>
	
	<div class="clearfix"></div>
	
	<div class="form-group">
		<label for="form_article_content">내용</label>
		<textarea rows="10" id="form_article_content" name="article_content" style="width:100%;" placeholder="내용을 입력하세요"></textarea>
	</div>
<button type="button" class="pull-right btn btn-primary">글쓰기</button>
	
</form>
</div>


<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "form_article_content", //에디터가 적용될 <textarea>의 id
	sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
	fCreator: "createSEditor2"
})

// <form>태그가 submit되면 스마트에디터에 작성된 내용이 <textarea>에
//적용되도록 하는 코드
function submitContents(elClickedObj) {
	
	oEditors.getById["form_article_content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) { }
	
}
</script>

</body>
</html>
























