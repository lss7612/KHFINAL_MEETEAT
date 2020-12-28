<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<%-- 스마트에디터 --%>
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

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


<div class="container">

<h1 class="pull-left">공지사항 글쓰기</h1>
<div class="clearfix"></div>
<hr>

	<form action="/notice/write" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" class="form-control" id="article_title" name="article_title" placeholder="제목을 입력하세요"/>
		</div>
		
		<div class="form-group">
			<label for="fileUpload">파일 첨부</label>
			<input type="file" class="form-control" id="noticeFile" name="noticeFile"/>
		</div>
		
		<div class="form-group">
			<label for="content">내용</label>
			<textarea rows="10" class="form-control" id="article_content" name="article_content" style="width: 100%" placeholder="내용을 입력하세요"></textarea>
		</div>
		
		<div class="text-center">
				<button class="btn btn-warning" id="writeBtn">작성</button>
				<input type="reset" class="btn btn-primary" id="cancel" value="취소" />
		</div>
		
	</form>
</div>

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