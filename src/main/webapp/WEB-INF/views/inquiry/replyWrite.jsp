<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#writeBtn").click(function() {
		//스마트에디터의 내용을 <textare>에 적용하기
		submitContents( $("#writeBtn") );
		
		//form submit 수행하기
		$("form").submit();
	})
	
	$("#cancel").click(function() {
		history.go(-1);
	})
})
</script>

<br>

<div class="container">

<h2 class="pull-left">문의사항 답글쓰기</h2>
<div class="clearfix"></div>

<br>

	<form action="/inquiry/replyWrite" method="post" enctype="multipart/form-data">
	
		<input type="hidden" name="article_no" value="${result.ARTICLE_NO }">
		<input type="hidden" name="board_no" value="${result.BOARD_NO }">
		<input type="hidden" name="user_no" value="${result.USER_NO }">
		<input type="hidden" name="post_group" value="${result.POST_GROUP }">
		<input type="hidden" name="post_step" value="${result.POST_STEP }">
		<input type="hidden" name="post_indent" value="${result.POST_INDENT }">
		
	
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" class="form-control" id="article_title" name="article_title" placeholder="제목을 입력하세요"/>
		</div>
		
		<!-- <div class="form-group">
			<label for="title">작성자</label>
			<input type="text" class="form-control" id="article_title" name="article_title" placeholder="제목을 입력하세요"/>
		</div> -->
		
		<!-- <div class="form-group">
			<label for="fileUpload">파일 첨부</label>
			<input type="file" class="form-control" id="noticeFile" name="noticeFile"/>
		</div> -->
		
		<div class="form-group">
			<label for="content">내용</label>
			<textarea rows="10" class="form-control" id="article_content" name="article_content" style="width: 100%" placeholder="내용을 입력하세요"></textarea>
		</div>
		
		<div class="text-center">
				<button class="btn btn-warning btn-sm" id="writeBtn">작성</button>
				<input type="reset" class="btn btn-primary btn-sm" id="cancel" value="취소" />
		</div>
		
	</form>
</div>

<br><br>

<!-- 스마트 에디터 적용하는 코드 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "article_content", //에디터가 적용될 <textarea>의 id
	sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
	fCreator: "createSEditor2"
})

// <form>태그가 submit되면 스마트에디터에 작성된 내용이 <textarea>에
//적용되도록 하는 코드
function submitContents(elClickedObj) {
	
	oEditors.getById["article_content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) { }
	
}
</script>


<c:import url="/WEB-INF/views/layout/footer.jsp"/>