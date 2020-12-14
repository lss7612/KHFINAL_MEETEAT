<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/forTest/header.jsp"/>
<!-- 적용css, js -->
<link rel="stylesheet" href="/resources/css/recruitboard/write.css">
<script type="text/javascript" src="/resources/js/recruitboard/write.js"></script>
<script type="text/javascript" src="/resources/js/recruitboard/modify.js"></script>

<%-- 로딩 모달 --%>
<div class="modal_img_upload invisible">
	<img alt="" src="/resources/img/loading.gif"><br>
	<span style="font-weight:bold; font-size:30px;">글 등록중입니다. 조금만 기다려주세요.</span>
</div>

<div id="write_wrapper">

<div class="invisible" style="height:0">
<input type="text" id="resultDate" value="${result.MEET_TIME_DATE }" >
<input type="text" id="resultClock" value="${result.MEET_TIME_CLOCK }">
<input type="text" id="resultMin" value="${result.MEET_TIME_MIN }">
<input type="text" id="resultArea" value="${result.MEET_TIME_AREA }">
<input type="text" id="resultArticleContent" value="${result.ARTICLE_CONTENT }">
<input type="text" id="resultLocation" value="${result.PARTY_LOCATION }">
</div>

<h2 class=""><a href="/recruitboard/list">모집게시판</a></h2>
<hr>
<div class="border">
<div class="base_bar_height color_primary light_padding">&nbsp;&nbsp;&nbsp;&nbsp;<i style="font-size:30px;" class="fas fa-pencil-alt"></i></i></div>
<div class="horizontal_base_padding">
<form id="articleSubmitForm" class="" action="/recruitboard/modify" method="POST">
<!-- 글제목 인풋영역 -->
	<%-- 글쓴이 부분 --%>
	<input type="text" name="user_no" value="${user_no }" readonly="readonly" class="invisible"/>
	<input type="text" name="article_no" value="${result.ARTICLE_NO }" readonly="readonly" class="invisible"/>
	
	<div class="form-group">
		<label id="labebforform_article_title" for="form_article_title">글제목</label>
		<input type="text" id="form_article_title" name="article_title" class="form-control" value="${result.ARTICLE_TITLE }"  alertComment="글제목"/>
	</div>
	<hr>
	<div class="pull-left form-group" style="min-width:155px; width:20%; margin:0 30px 0 0;">
		<label for="form_meet_time">날짜</label>
		<input type="date" id="form_meet_time" name="meet_time_date"  value="${result.MEET_TIME_DATE }" class="form-control" alertComment="날짜"/>
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
			<option value="01" >01시</option>
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
	<div class='clearfix'></div>
	<hr>
	
	
	
	
	<%-- 파일첨부 --%>
	
	<c:choose>
	<%-- 원래 첨부한 파일이 없을때 --%>
	<c:when test="${empty result.IMGLIST}">
	
		<div style="width:510px; margin: 0 auto;" >
	
			<%-- 이미지박스1 아래의 이미지폼과 연결 --%>
			<div id="imgBox1"class="light_margin imgBox none-image pull-left">
			<img class="upload-image" alt="" src="/resources/img/upload-image.png">
			</div>
		
			<%-- 이미지박스2 아래의 이미지폼과 연결--%>
			<div id="imgBox2"class="light_margin imgBox none-image pull-left">
			<img class="upload-image" alt="" src="/resources/img/upload-image.png">
			</div>
			
			<%-- 이미지박스3 아래의 이미지폼과 연결--%>
			<div id="imgBox3"class="light_margin imgBox none-image pull-left">
			<img class="upload-image" alt="" src="/resources/img/upload-image.png">
			</div>
	
		</div>
		
	</c:when>
	
	
	<%-- 원래 첨부한 파일이 있을 때 --%>
	<c:otherwise>
	
		<div style="width:510px; margin: 0 auto;" >
		
			<c:set var="imgPath" value="/resources/file/recruitboard/save/"/>
			<c:set var="cntImgBoxEnd" value="3"/>
			<c:set var="cntImgForm" value="3"/>
		
			<c:forEach items="${result.IMGLIST }" var="imglist" varStatus="stat" >
				<div id="imgBox${stat.count }"class="light_margin imgBox none-image pull-left">
				<img class="upload-image" alt="" src="${imgPath }${imglist.FILE_STOREDNAME }">
				</div>
				<c:set var="cntImgBoxStart" value="${stat.count+1 }"/>
			</c:forEach>
		
			<%-- 이미지박스1 아래의 이미지폼과 연결 --%>
			<c:forEach begin="${cntImgBoxStart }" end="${cntImgBoxEnd }" varStatus="status" >
			<div id="imgBox${cntImgBoxStart +(status.count-1) }"class="light_margin imgBox none-image pull-left">
			<img class="upload-image" alt="" src="/resources/img/upload-image.png">
			</div>
			</c:forEach>
		
		</div>
	
	</c:otherwise>
	
	</c:choose>
	
	<div class="over-img clearfix z-high" id=""></div>
	
	<%-- 파일확장자submit --%>
	<div class=" form-group small_form invisible none_height">
		<label for="form_ext01" >ext01</label>
		<input type="text" id="form_ext01" name="ext01" class="form-control"  placeholder="미구현"/>
		<label for="form_ext02" >ext02</label>
		<input type="text" id="form_ext02" name="ext02" class="form-control"  placeholder="미구현"/>
		<label for="form_ext03" >ext03</label>
		<input type="text" id="form_ext03" name="ext03" class="form-control"  placeholder="미구현"/>
	</div>
	
	<hr>
	<div class="clearfix none_height"></div>
	
	
	<div class="form-group" style="min-width:550px;"> 
		<label for="form_article_content">내용</label>
		<textarea rows="20" id="form_article_content" name="article_content" style="min-width:550px; width:100%;" alertComment="내용"></textarea>
	</div>

	
</form>
<div class="base_bar_height light_padding"><button id="btn_submit" type="button" class="pull-right btn btn-primary">글수정</button></div>
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

$('#form_article_content').html($('#resultArticleContent').val());
oEditors[0].exec("LOAD_CONTENTS_FIELD");

</script>

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
























