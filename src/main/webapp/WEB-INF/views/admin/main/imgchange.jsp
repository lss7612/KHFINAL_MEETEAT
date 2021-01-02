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
<h1>메인 이미지 변경</h1>
</div>
<div class="base_padding">
	<h2>아래 태그에서 이미지를 선택하세요</h2>
	<form id="mainForm"action="">
		<div class="form-group">
		    <label for="form_previewImg">변경할 이미지를 선택하세요. jpg 파일만 가능합니다.<br>높이 400px의 이미지가 적당해요</label>
		    <input type="file" id="form_previewImg" name="previewImg" accept=".jpg" />
		</div>
	</form>
</div>

<div>

	
	
	<h2 style="text-align:center;"><a id="changeMain">아래 이미지을 실제 메인에 적용하기</a></h2>
	<h4 style="text-align:center;">미리보기에 선택한 이미지가 적용되지 않았을 시 컨트롤 f5로 새로고침하세요 (맥은 강력새로고침)</h4>
	
	<div style="height:1200px">
	
		<div id="previewCover" style="height:1100px;">
		
		</div>
		
		<div id="preview">
		
		</div>
		
	</div>

</div>


</div>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp"/>