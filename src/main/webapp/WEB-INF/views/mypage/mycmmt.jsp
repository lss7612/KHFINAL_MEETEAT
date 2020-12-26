<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<link rel="stylesheet" href="/resources/css/mypage/mypost.css">

<script type="text/javascript">
$(document).ready(function() {
	console.log('${boardAdminParam}')
	if('${myParam.postCategory}'==$("#postCategory > option").val())
		$(this).attr('selected','selected')
		
	//검색 버틀 클릭
	$("#btnSearch").click(function() {
		
		if($("#search").value()==null){
			alert("검색어를 입력해주세요");
			return false;
		}else{
		location.href="/mypage/mypost?search="+$("#search").val();
		}
	});
	
	$("#deleteBtn").click(function(){
		if($("input:checkbox[name=checkbox]").is(":checked")==true){
			alert("삭제가 완료되었습니다.");			
			location.href="/mypage/mycmmt";		
		}else{
			alert("선택하신 글이 없습니다.");
			return false;
		}
	})
})
</script>

<style>
th, td, p {
	text-align: center;
}

</style>

<div id="divpage">
<div class="sh_header">
	<h2>내가 작성한 댓글</h2>
	<hr>
</div>

<div id="searchForm" style="text-align: right;">
<form action="/mypage/mycmmt" method="GET">
<!-- 	<select id ="postCategory" name="postCategory"> -->
<!--     	<option value="">전체</option> -->
<!--     	<option value="2" -->
<%--     		<c:if test="${myParam.postCategory == '2' }">selected</c:if>>메이트찾기</option> --%>
<!--     	<option value="3" -->
<%--     		<c:if test="${myParam.postCategory == '3' }">selected</c:if>>모집게시판</option> --%>
<!--     	<option value="4" -->
<%--     		<c:if test="${myParam.postCategory == '4' }">selected</c:if>>후기게시판</option> --%>
<!--     	<option value="5" -->
<%--     		<c:if test="${myParam.postCategory == '5' }">selected</c:if>>문의게시판</option> --%>
<!-- 	</select> -->

	<input type="text" id="postSearch" name="postSearch" placeholder="댓글 내용 검색"/>
<button class="btn btn-default btn-sm">검색</button>
</form>

</div><br>

<form action="/mypage/mycmmt" method="POST">
<table class="table table-condensed"	>
   <tr>
      <th style="width: 5%">선택</th>
      <th style="width: 10%">댓글번호</th>
      <th style="width: 10%">게시판 이름</th>
      <th style="width: 30%">글 제목</th>
      <th style="width: 40%">댓글 내용</th>
      <th style="width: 15%">작성일</th>
   </tr>

<c:forEach items="${cmmtAllList}" var="b">
   <tr>     
   			<c:choose>
   				<c:when test="${b.IS_DELETE eq 0 }">
		      		<td><input type="checkbox" name="checkbox" id="checkbox" value="${b.COMMENT_NO}"></td>
   				</c:when>
   				<c:otherwise>
   					<td></td>
   				</c:otherwise>
   			</c:choose>  		
      		<td>${b.COMMENT_NO }</td>
      		<td>${b.BOARD_NAME}</td>

			<td>
			   <c:choose>
			      	<c:when test="${b.BOARD_NO eq 2 }"> <!-- 메이트찾기 게시판 -->   	
			      		<a href="/matefind/view?article_no=${b.ARTICLE_NO}">${b.ARTICLE_TITLE}</a>    		
			      	</c:when>
				    <c:when test="${b.BOARD_NO eq 3 }"> <!-- 파티모집 -->	
				      	<a href="/recruitboard/view?board_no=3&article_no=${b.ARTICLE_NO}">${b.ARTICLE_TITLE}</a>     	
				    </c:when>
				    <c:when test="${b.BOARD_NO eq 4 }"> <!-- 후기게시판 -->
				      	<a href="/">${b.ARTICLE_TITLE}</a> 
				    </c:when>
				    <c:when test="${b.BOARD_NO eq 5 }"> <!-- 문의게시판 -->
				      	<a href="/inquiry/view?board_no=5&article_no=${b.ARTICLE_NO}">${b.ARTICLE_TITLE}</a> 
			      	</c:when>
			     </c:choose>
			</td>		
			<c:choose>
				<c:when test="${b.IS_DELETE eq 0 }">
					<td>${b.COMMENT_CONTENT}</td>
				</c:when>
				<c:otherwise>
   					<td style="text-align: center; color: red;">삭제된 댓글입니다.</td> 									
				</c:otherwise>
			</c:choose>
	      	<td><fmt:formatDate value="${b.CREATE_DATE}" pattern="yy/MM/dd HH:mm"/></td>   		
   </tr>
</c:forEach>
</table>
<button class="btn btn-danger btn-sm pull-right" id="deleteBtn">선택한 댓글 삭제</button>
</form>

 
<div class="form-inline">
	<a href="/mypage/mypage" role="button" class="btn btn-primary btn-sm pull-left">돌아가기</a>
 </div>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
    