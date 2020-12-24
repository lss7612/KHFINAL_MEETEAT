<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/forTest/header.jsp"/>


<script type="text/javascript">
//스마트 에디터 스크립트
function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["article_content"].exec("UPDATE_CONTENTS_FIELD", []);

    try {
        elClickedObj.form.submit();
    } catch(e) {}
}

$(document).ready(function() {
	$("#updateBtn").click(function() {
		submitContents($(this));
	});
	
	$("#article_title").focus();

	$("#cancel").click(function() {
		history.back(-1);
	});
});
</script>


<div class="container">

<h1 class="pull-left">문의사항 수정</h1>
<div class="clearfix"></div>
<hr>

	<form action="/inquiry/modify" method="post">
	
		<input type="text" name="article_no" value="${result.ARTICLE_NO }"/>
	
		<div class="form-group">
			<label for="title">제목</label>
			<input type="text" class="form-control" id="article_title" name="article_title" value="${result.ARTICLE_TITLE }"/>
		</div>
		
		<div class="form-group">
			<label for="content">내용</label>
			<textarea rows="10" class="form-control" id="article_content" name="article_content" style="width: 100%">${result.ARTICLE_CONTENT}</textarea>
		</div>
		
		<div class="text-center">
			<button class="btn btn-warning" id="updateBtn">수정</button>
			<input type="reset" class="btn btn-primary" id="cancel" value="취소" />
		</div>
		
	</form>
</div>

<!-- 스마트에디터 초기화코드 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "article_content",
	    sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
});
</script>

</body>
</html>