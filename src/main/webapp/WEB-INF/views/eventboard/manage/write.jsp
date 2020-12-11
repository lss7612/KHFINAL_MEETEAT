<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/WEB-INF/views/forTest/header.jsp"/>
<link rel="stylesheet" href="/resources/css/common/common.css" >
<link rel="stylesheet" href="/resources/css/eventboard/write.css" >
<script type="text/javascript" src="/resources/js/eventboard/write.js" ></script>

<%-- 로딩 모달 --%>
<div class="modal_img_upload invisible">
	<img alt="" src="/resources/img/loading.gif"><br>
	<span style="font-weight:bold; font-size:30px;">글 등록중입니다. 조금만 기다려주세요.</span>
</div>

<div id="eventWriteWrapper">

<div class="base_padding">
<h2>이벤트</h2>
</div>
<hr>

<div class="border">
<div class="base_bar_height color_primary light_padding">&nbsp;&nbsp;&nbsp;&nbsp;<i style="font-size:30px;" class="fas fa-pencil-alt"></i></i></div>
<div class="base_padding">
<form id="articleSubmitForm" action="/eventboard/manage/write" method="POST">

	<%-- 글제목 --%>
	<div class="form-group">
		<label id="labebforform_article_title"for="form_article_title">제목</label>
		<input type="text" id="form_article_title" name="article_title" class="form-control" alertComment="글제목"/>
	</div>
	<hr>
	
	<%-- 시작일 --%>
	<div class="pull-left form-group" style="min-width:155px; width:20%; margin:0 30px 0 0;">
		<label for="form_start_date">시작일</label>
		<input type="date" id="form_start_date" name="start_date" class="form-control" alertComment="시작일"/>
	</div>
	
	<%-- 종료일 --%>
	<div class="pull-left form-group" style="min-width:155px; width:20%; margin:0 30px 0 0;">
		<label for="form_terminate_date">종료일</label>
		<input type="date" id="form_terminate_date" name="terminate_date" class="form-control" alertComment="종료일"/>
	</div>
	
	<div class="clearfix"></div>
	<hr>

	<%-- 파일첨부 --%>
	<div class="pull-left form-group" style="min-width:155px; width:30%; margin:0 30px 0 0;">
		<label for="form_terminate_date">이벤트설명 이미지 첨부</label>
		<input type="hidden" class="form-control" />
	</div>
	<div style="width:100%; margin: 0 auto;" >
		<%-- 이미지박스1 아래의 이미지폼과 스크립트 코드로 연결 --%>
		<div id="bigImgBox"class="light_margin bigImgBox none-image pull-left">
		<img class="big-upload-image" alt="" src="/resources/img/upload-image.png">
		</div>
	</div>
	<div class="clearfix"></div>
	<hr>
	
	
	<%-- 안보이는 Form 영역 --%>	
	<div class=" form-group small_form invisible none_height">
		<%-- 파일확장자submit --%>
		<label for="form_ext01" >ext01</label>
		<input type="text" id="form_ext01" name="ext01" class="form-control"/>
	</div>
	
	
	<%-- 내용 --%>
	<div class="form-group" style="min-width:550px;"> 
		<label for="form_article_content">내용</label>
		<textarea rows="20" id="form_article_content" name="article_content" style="min-width:550px; width:100%;" alertComment="내용"></textarea>
	</div>
	
	<div class="base_bar_height light_padding"><button id="btn_submit" type="button" class="pull-right btn btn-primary">글쓰기</button></div>

</form>
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



</div>

<form id="imgForm" method="POST" enctype="multipart/form-data" >
	<%-- 이미지폼1 이미지박스1과 연결 --%>
	<div class=" form-group invisible none_height">
		<label for="form_img1" >이미지업로드</label>
		<input type="file" id="form_img1" name="img1" accept="image/gif, image/jpeg, image/jpg, image/png" class="form-control" alertComment="최대인원" placeholder="미구현"/>
	</div>
	<%-- 이미지폼2 이미지박스2와 연결 --%>
	<div class=" form-group invisible none_height invisible">
		<label for="form_img2" >이미지업로드</label>
		<input type="file" id="form_img2" name="img2" accept="image/gif, image/jpeg, image/jpg, image/png" class="form-control" alertComment="최대인원" placeholder="미구현"/>
	</div>
	
	<%-- 이미지폼3 이미지박스3와 연결 --%>
	<div class=" form-group invisible none_height invisible">
		<label for="form_img3" >이미지업로드</label>
		<input type="file" id="form_img3" name="img3" accept="image/gif, image/jpeg, image/jpg, image/png" class="form-control" alertComment="최대인원" placeholder="미구현"/>
	</div>
</form>

</body>
</html>