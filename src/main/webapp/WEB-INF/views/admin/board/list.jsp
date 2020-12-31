<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:import url="/WEB-INF/views/layout/header.jsp"/>

<link rel="stylesheet" href="/resources/css/boardAdmin/list.css">

<script type="text/javascript">
$(document).ready(function() {
	$("#inquiryWriteBtn").click(function(){
		location.href="/inquiry/write";
	})
	
	console.log('${boardAdminParam}')
	if('${boardAdminParam.manageCategory}'==$("#manageCategory > option").val())
		$(this).attr('selected','selected')
		
	
	//delete
	$(function() {
		var chkObj = document.getElementsByName("delmod");
		var rowCnt = chkObj.length;
		
		$("input[name='allCheck']").click(function() {
			var chk_listArr = $("input[name='delmod']");
			for(var i=0; i<chk_listArr.length; i++) {
				chk_listArr[i].checked = this.checked;
			}
		})
		
		$("input[name='delmod']").click(function(){
			if($("input[name='delmod']:checked").length == rowCnt) {
				$("input[name='allCheck']")[0].checked = true;
			}
			else {
				$("input[name='allCheck']")[0].checked = false;	
			}
		})
	});
	

})
</script>

<script type="text/javascript">
function isDelete() {

	var url = "delete";
	var boardNoArr = new Array();
	var articleNoArr = new Array();
	var list = $("input[name='delmod']");
	for (var i=0; i<list.length; i++){
		if(list[i].checked) {
			//console.log("board_no : " + $(list[i].attr("board_no")));
			console.log("article_no : " + list[i].value);
			
			//var idx = list[i].attr]
			boardNoArr.push(list.eq(i).attr("board_no"));
			
			var x = list.eq(i).val()
			console.log(x);
			
			//console.log(list.eq(i).value);
			articleNoArr.push(list[i].value);
			
		}
	}

	console.log(boardNoArr);
	console.log(articleNoArr);
	
	if (articleNoArr.length == 0 ) {
		alert("선택된 글이 없습니다.");
	}
	else {
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url : url
				, type : 'POST'
				, async: false
				, tranditional : true
				, data : {
					articleNoArr : articleNoArr
					, boardNoArr : boardNoArr
				}
				, success : function(is_delete){
					if(is_delete = 1) {
						alert("삭제가 완료되었습니다.");
						location.replace("list")
					}
					else {
						alert("삭제를 실패하였습니다.");
					}
				}
			})
		}
	}
}
</script>

<br>

<div class="container">
	<h2 class="pull-left">게시판 관리자 페이지</h2>
	<div class="clearfix"></div>
	<br>
	
<!-- 검색기능 -->
	<form action="/admin/board/list" method="get">
	
		<div class="col-md-4 form-group form-group-sm">
			<select class="form-control input-sm" name="manageCategory" id="manageCategory">
				<option value="">게시판 선택</option>
				
				<!-- 공지사항 게시판 -->
				<option value="1" 
					<c:if test="${boardAdminParam.manageCategory == '1' }">selected</c:if>>공지사항 게시판</option> 
				
				<!-- 메이트찾기 게시판 -->
				<option value="2" 
					<c:if test="${boardAdminParam.manageCategory == '2' }">selected</c:if>>메이트 찾기 게시판</option> 

				<!-- 파티모집 -->
				<option value="3"
					<c:if test="${boardAdminParam.manageCategory == '3' }">selected</c:if>>파티모집 게시판</option>
				
				<!-- 후기게시판 -->
				<option value="4"
					<c:if test="${boardAdminParam.manageCategory == '4' }">selected</c:if>>후기 게시판</option>
	
				<!-- 문의게시판 -->
				<option value="5"
					<c:if test="${boardAdminParam.manageCategory == '5' }">selected</c:if>>문의사항 게시판</option>
	
				<!-- 이벤트 등록 게시판 -->
<!-- 				<option value="6" -->
<%-- 					<c:if test="${boardAdminParam.manageCategory == '6' }">selected</c:if>>이벤트 게시판</option> --%>
					
			</select>
		</div>
		
		<div class="col-md-3">
			<select class="form-control input-sm form-group-sm" name="manageSearch" id="manageSearch">
				<option value="totalList"
				<c:if test="${boardAdminParam.manageSearch == 'totalList' || empty boardAdminParam.manageCategory}">selected</c:if>>전체</option>
				
				<option value="article_title" 
				<c:if test="${boardAdminParam.manageSearch == 'article_title' }">selected</c:if>>제목</option>
				
				<option value="article_content" 
				<c:if test="${boardAdminParam.manageSearch == 'article_content' }">selected</c:if>>내용</option>
				
				<option value="user_nick"
				<c:if test="${boardAdminParam.manageSearch == 'user_nink' }">selected</c:if>>작성자</option>
			</select>
		</div>
		
		<div class="col-md-4">
			<input type="text" class="form-control input-sm form-group-sm" name="manageKeyword" id="manageKeyword" placeholder="검색" value="${boardAdiminParam.manageKeyword }"/>
			
		</div>
		<div>
			<button type="submit" class="btn btn-sm" value="검색">검색</button>
		</div>
	</form>
	
	<br><br>
	
<!-- 게시물 목록 표시 -->
	<form action="/admin/board/list" method="post">
	<table class="table table-striped table-hover table-condensed">
		<thead>
			<tr>
				<th style="width: 5%"><input type="checkbox" id="allCheck" name="allCheck"></th>
				<th style="width: 5%">번호</th>
				<th style="width: 13%">게시판명</th>
				<th style="width: 40%">제목</th>
				<th style="width: 15%">작성자</th>
				<th style="width: 15%">작성일</th>
				<th style="width: 10%">조회수</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${list }" var="list">
				<tr>
					<td><input type="checkbox" name="delmod" value="${list.ARTICLE_NO }" board_no="${list.BOARD_NO }" /></td>
					<td style="text-align: center;" >${list.ARTICLE_NO }</td>
					<td>${list.BOARD_NAME }</td>
					<td style="text-align: left;">
						<c:if test="${list.POST_STEP > 0 }">
							<c:forEach begin="1" end="${list.POST_STEP }" >
								&nbsp;&nbsp;
							</c:forEach>
							RE : 
						</c:if>
						
						<c:choose>
							<c:when test="${list.BOARD_NO eq 1}">
								<a href="/notice/view?board_no=${list.BOARD_NO }&article_no=${list.ARTICLE_NO }">${list.ARTICLE_TITLE }</a>
							</c:when>
							
							<c:when test="${list.BOARD_NO eq 2}">
								<a href="/matefind/view?board_no=${list.BOARD_NO }&article_no=${list.ARTICLE_NO }">${list.ARTICLE_TITLE }</a>
							</c:when>
							
							<c:when test="${list.BOARD_NO eq 3}">
								<a href="/recruitboard/view?board_no=${list.BOARD_NO }&article_no=${list.ARTICLE_NO }">${list.ARTICLE_TITLE }</a>
							</c:when>
							
							<c:when test="${list.BOARD_NO eq 4 }">
								<a href="//view?board_no=${list.BOARD_NO }&article_no=${list.ARTICLE_NO }">${list.ARTICLE_TITLE }</a>
							</c:when>
							
							<c:when test="${list.BOARD_NO eq 5 }">
								<a href="/inquiry/view?board_no=${list.BOARD_NO }&article_no=${list.ARTICLE_NO }">${list.ARTICLE_TITLE }</a>
							</c:when>
							
							<c:otherwise>
								<a href="/admin/board/list">${list.ARTICLE_TITLE }</a>
							</c:otherwise>
						</c:choose>
					</td>
					<td>${list.USER_NICK }</td>
					<td>
						<fmt:formatDate value="${list.CREATE_DATE }" pattern="yy-MM-dd HH:mm" />
					</td>
					<td>${list.ARTICLE_HIT }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<div class="text-right">
		<c:choose>
			<c:when test="${result.BOARD_NO eq 1}">
			</c:when>
			<c:when test="${result.BOARD_NO eq 5}">
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${result.BOARD_NO eq 1}">
				<a href="/notice/write"><button id="noticeWriteBtn" class="btn btn-primary btn-sm">글작성</button></a>
			</c:when>
			<c:when test="${result.BOARD_NO eq 5}">
				<a href="/inquiry/write"><button id="inquiryWriteBtn" class="btn btn-primary btn-sm">글작성</button></a>
			</c:when>
			<c:otherwise>
<!-- 				<button id="inquiryWriteBtn" class="btn btn-primary">글작성</button> -->
				<input type="button" value="선택삭제" class="btn btn-danger btn-sm" onclick="isDelete()">
			</c:otherwise>
		</c:choose>
	</div>
	
	</form>
	
	<form action="" name="move" method="post">
		<div>
			<select class="col-md-2 input-sm form-group-sm" name="boardMove" id="boardMove" onchange="window.location.href=this.value">
				<option value="" selected>이동할 게시판을 선택해주세요.</option>
				<option value="http://localhost:8088/notice/list">공지사항 게시판 </option>
				<option value="http://localhost:8088/matefind/list">메이트찾기 게시판</option>
				<option value="http://localhost:8088/recruitboard/list">모집 게시판</option>
				<option value="http://localhost:8088/notice/list">후기 게시판</option>
				<option value="http://localhost:8088/inquiry/list">문의 게시판</option>
				<option value="http://localhost:8088/eventboard/holding">이벤트등록 게시판</option>
			</select>
		</div>
	
	</form>

<jsp:include page="/WEB-INF/views/admin/boardManagePaging.jsp" />

</div> <!-- container end  -->

<br><br>

<!-- footer 영역 -->
<c:import url="/WEB-INF/views/layout/footer.jsp"/>