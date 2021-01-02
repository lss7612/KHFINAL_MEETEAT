<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/header.jsp"/>
<link rel="stylesheet" href="/resources/css/common/common.css"></link>
<link rel="stylesheet" href="/resources/css/admin/main/imgchange.css"></link>
<script type="text/javascript" src="/resources/js/admin/main/imgchange.js"></script>
<div id="divpage">

<div id="contentWrapper">


<div class="bold_height_bar color_primary base_padding">
메인 이미지 변경
</div>

<div class="light_height_bar color_light light_padding">
메인 이미지를 변경합니다
</div>

<div >

<form id="mainForm"action="">
	<div class="form-group">
	    <label for="form_previewImg">변경할 이미지를 선택하세요. jpg 파일만 가능합니다.<br>높이 400px의 이미지가 적당해요</label>
	    <input type="file" id="form_previewImg" name="previewImg" accept=".jpg" />
	</div>
</form>


<h1>메인 미리보기</h1>
<div>

	<div id="previewCover">
	
	</div>
	
	<div id="preview">
	
	</div>
	
</div>

</div>


</div>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>