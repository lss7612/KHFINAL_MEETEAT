<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<!-- 스마트 에디터2 라이브러리 로드 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8">
</script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		//스마트에디터의 내용을 <textarea>에 적용하기
		submitContents($("#btnWrite"));
		
		var is_empty = false;
		$('#form').find('input[type!="hidden"]').each(function(){
		    if(!$(this).val()) {
				is_empty = true;
		    }
		});
		 
		if(is_empty) {
		    alert('내용을 입력하세요');
		    return false;
		} else {
			$("form").submit();
		}
	})
	
	
	$("#cancel").click(function() {
		history.go(-1);
	})
})
</script>

<div class="container" id="divpage">

<h1>글쓰기 페이지</h1>
<hr>

<form action="/review/update" method="post">
	<input type="hidden" name="article_no" value="${view.article_no }" />

	<div class="form-group">
		<label for="title">제목</label>
		<input type="text" id="title" name="article_title" class="form-control" value="${view.article_title}" />
	</div>
	
	<div class="form-group">
		<label for="content">내용</label>
		<textarea rows="10" style="width: 100%" id="content" name="article_content">${view.article_content }</textarea>
	</div>
	
	<div class="text-center">
		<button class="btn btn-primary" id="btnWrite">수정</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소" />
	</div>
	
</form>


</div>

<!-- 스마트 에디터 적용하는 코드 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content", //에디터가 적용될 <textarea>의 id
	sSkinURI: "/resources/se2/SmartEditor2Skin.html", //에디터 스킨
	fCreator: "createSEditor2"
})

//<form>태그가 submit되면 스마트에디터에 작성된 내용이 <textarea>에 적용되도록 하는 코드
function submitContents(elClickedObj) {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	try {
		elClickedObj.form.submit();
	} catch(e) { }
}
</script>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
