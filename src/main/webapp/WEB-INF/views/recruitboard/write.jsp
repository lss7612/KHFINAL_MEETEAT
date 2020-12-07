<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/forTest/header.jsp"/>
<!-- 적용css, js -->
<link rel="stylesheet" href="/resources/css/recruitboard/write.css">
<script type="text/javascript" src="/resources/js/recruitboard/write.js"></script>

<div id="write_wrapper">

<h2 class=""><a href="/recruitboard/list">모집게시판</a></h2>
<hr>
<div class="border">
<div class="base_bar_height color_primary light_padding">&nbsp;&nbsp;&nbsp;&nbsp;<i style="font-size:30px;" class="fas fa-pencil-alt"></i></i></div>
<div class="horizontal_base_padding">
<form class="" action="/recruitboard/write" method="POST">
<!-- 글제목 인풋영역 -->
	<input type="text" name="user_no" value="${user_no }" readonly="readonly" class="invisible"/>
	<div class="form-group">
		<label id="labebforform_article_title"for="form_article_title">글제목</label>
		<input type="text" id="form_article_title" name="article_title" class="form-control" alertComment="글제목"/>
	</div>
	<hr>
	<div class="pull-left form-group" style="min-width:155px; width:20%; margin:0 30px 0 0;">
		<label for="form_meet_time">날짜</label>
		<input type="date" id="form_meet_time" name="meet_time_date" class="form-control" alertComment="날짜"/>
	</div>
	
	<div class="pull-left form-group small_form">
		<label for="form_time_area">오전,오후</label>
		<select id="form_time_area" name="meet_time_area" class="form-control" alertComment="만날시간(시간대)">
			<option value="">시간대</option>
			<option value="am">오전</option>
			<option value="pm">오후</option>
		</select>
	</div>
	<div class="pull-left form-group small_form">
		<label for="form_time_time">시</label>
		<select id="form_time_time" name="meet_time_clock" class="form-control" alertComment="만날시간(시각)">
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
	<div class="pull-left form-group small_form">
		<label for="form_time_minute">분</label>
		<select id="form_time_minute" name="meet_time_min" class="form-control" alertComment="만날시각(분)" >
			<option value="">선택</option>
			<option value="00">00분</option>
			<option value="10">10분</option>
			<option value="20">20분</option>
			<option value="30">30분</option>
			<option value="40">40분</option>
			<option value="50">50분</option>
		</select>
	</div>
	<div class='clearfix'></div>
	<hr>
	<div class="pull-left form-group small_form">
		<label for="form_party_location" >지역</label>
		<select id="form_party_location" name="party_location" class="form-control" alertComment="지역">
			<option value="">선택</option>
			<option value="서울">서울</option>
			<option value="인천">인천</option>
			<option value="경기">경기</option>
			<option value="경상">경상</option>
			<option value="전라">전라</option>
			<option value="충청">충청</option>
			<option value="강원">강원</option>
			<option value="제주">제주</option>
		</select>
	</div>
	<div class="pull-left form-group small_form">
		<label for="form_maxium_member" >최대인원</label>
		<input type="text" id="form_maxium_member" name="maxium_member" class="form-control" alertComment="최대인원" placeholder="미구현"/>
	</div>
	<div class="clearfix"></div>
	<hr>
	<div class="form-group" style="min-width:550px;"> 
		<label for="form_article_content">내용</label>
		<textarea rows="10" id="form_article_content" name="article_content" style="min-width:550px; width:100%;" alertComment="내용"></textarea>
	</div>

	
</form>
<div class="base_bar_height light_padding"><button id="btn_submit" type="button" class="pull-right btn btn-primary">글쓰기</button></div>
</div>
</div>
</div>


<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "form_article_content", //에디터가 적용될 <textarea>의 id
	sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
	fCreator: "createSEditor2"
})

$('.se2_inputarea').css('min-width','550px');

</script>

</body>
</html>
























