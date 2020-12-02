<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/forTest/header.jsp"/>
<!-- 적용css, js -->
<link rel="stylesheet" href="/resources/css/recruitboard/write.css">
<script type="text/javascript" src="/resources/js/recruitboard/write.js"></script>

<div class="wrapper">
<br>
<h1>모집게시판/글쓰기</h1>
<hr>

<form action="/recruitboard/write" method="POST">
<!-- 글제목 인풋영역 -->
	<input type="text" name="user_no" value="${user_no }" readonly="readonly" class="invisible"/>
	<div class="form-group">
		<label id="labebforform_article_title"for="form_article_title">글제목</label>
		<input type="text" id="form_article_title" name="article_title" class="form-control"/>
	</div>
	<hr>
	<div class="pull-left form-group" style="width:20%; margin:0 30px 0 0;">
		<label for="form_meet_time">날짜</label>
		<input type="date" id="form_meet_time" name="meet_time_date" class="form-control"/>
	</div>
	
	<div class="pull-left form-group" style="width:10%; margin: 0 20px 0 0;">
		<label for="form_time_area">오전,오후</label>
		<select id="form_time_area" name="meet_time_area" class="form-control">
			<option value="">시간대</option>
			<option value="am">오전</option>
			<option value="pm">오후</option>
		</select>
	</div>
	<div class="pull-left form-group" style="width:10%; margin: 0 20px 0 0;">
		<label for="form_time_time">시</label>
		<select id="form_time_time" name="meet_time_clock" class="form-control">
			<option value="">선택</option>
			<option value="01">01시</option>
			<option value="02">02시</option>
			<option value="03">03시</option>
			<option value="04">04시</option>
			<option value="05">05시</option>
			<option value="06">06시</option>
			<option value="07">07시</option>
			<option value="08">08시</option>
			<option value="09">09시</option>
			<option value="10">10시</option>
			<option value="11">11시</option>
			<option value="12">12시</option>
		</select>
	</div>
	<div class="pull-left form-group" style="width:10%; margin: 0 20px 0 0;">
		<label for="form_time_minute">분</label>
		<select id="form_time_minute" name="meet_time_min" class="form-control">
			<option value="">선택</option>
			<option value="00">00분</option>
			<option value="10">10분</option>
			<option value="20">20분</option>
			<option value="30">30분</option>
			<option value="40">40분</option>
			<option value="50">50분</option>
		</select>
	</div>
	<div class="pull-left form-group" style="width:10%; margin: 0 20px 0 0;">
		<label for="form_maxium_member">최대인원</label>
		<input type="text" id="form_maxium_member" name="maxium_member" class="form-control"/>
	</div>
	<div class="clearfix"></div>
	<hr>
	<div class="form-group">
		<label for="form_article_content">내용</label>
		<textarea rows="10" id="form_article_content" name="article_content" style="width:100%;" placeholder="내용을 입력하세요"></textarea>
	</div>
<button id="btn_submit" type="button" class="pull-right btn btn-primary">글쓰기</button>
	
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


function putOnRealTextArea(){
	oEditors.getById["form_article_content"].exec("UPDATE_CONTENTS_FIELD", []);
}

</script>

</body>
</html>
























