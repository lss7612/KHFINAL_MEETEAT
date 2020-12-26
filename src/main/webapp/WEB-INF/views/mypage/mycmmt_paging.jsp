<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="search" value="postCategory=${myParam.postCategory}&postSearch=${myParam.postSearch }"/>

<div class="paging text-center">
	<ul class="pagination">

		<%-- 처음 페이지 버튼 --%>
		<%-- 첫 페이지가 아닐 때 버튼 노출 --%>
		<c:if test="${myCmmtPaging.curPage ne 1 }">
			<li><a href="/mypage/mycmmt?search=${search }"> <span>&larr;</span></a></li>
<!-- 			<li><a href="/mypage/mypost"> <span>&larr;</span></a></li> -->
		</c:if>





		<%-- 이전 페이지 버튼 --%>
		<%-- 첫 페이지면 금지 표시 --%>
		<c:if test="${myCmmtPaging.curPage ne 1 }">
			<li><a href="/mypage/mycmmt?curPage=${myCmmtPaging.curPage-1 }&search=${search }" aria-label="Previous"> <span>&laquo;</span></a></li>
<%-- 			<li><a href="/mypage/mypost?curPage=${myPostPaging.curPage-1 }" aria-label="Previous"> <span>&laquo;</span></a></li> --%>
		</c:if>
		<c:if test="${myCmmtPaging.curPage eq 1 }">
			<li class="disabled"><span>&laquo;</span></li>
		</c:if>





		<%-- 페이징 번호 표시 --%>
		<%-- 현재 페이지 번호는 active 클래스 부여 -> 파랑 바탕 버튼 --%>
		<c:forEach begin="${myCmmtPaging.startPage }" end="${myCmmtPaging.endPage }" var="page"
			varStatus="stat">
			
			<c:if test="${myCmmtPaging.curPage eq page }">
				<li class="active"><a href="/mypage/mycmmt?curPage=${page }&search=${search }">${page }</a></li>
<%-- 				<li class="active"><a href="/mypage/mypost?curPage=${page }">${page }</a></li> --%>
			</c:if>
			
			<c:if test="${myCmmtPaging.curPage ne page }">
				<li><a href="/mypage/mycmmt?curPage=${page }&search=${search }">${page }</a></li>
<%-- 				<li><a href="/mypage/mypost?curPage=${page }">${page }</a></li> --%>
			</c:if>
			
		</c:forEach>





		<%-- 다음 페이지 버튼 --%>
		<%-- 마지막 페이지면 동작 안함 --%>
		<c:if test="${myCmmtPaging.curPage ne myCmmtPaging.totalPage }">
			<li><a href="/mypage/mycmmt?curPage=${myCmmtPaging.curPage+1 }&search=${search }" aria-label="Next"> <span>&raquo;</span></a></li>
<%-- 			<li><a href="/mypage/mypost?curPage=${myPostPaging.curPage+1 }" aria-label="Next"> <span>&raquo;</span></a></li> --%>
		</c:if>
		<c:if test="${myCmmtPaging.curPage eq myPostPaging.totalPage }">
			<li class="disabled"><span>&raquo;</span></li>
		</c:if>
		
		
		
		<%-- 마지막 페이지 버튼 --%>
		<%-- 마지막 페이지가 아닐 때 버튼 노출 --%>
		<c:if test="${myCmmtPaging.curPage ne myCmmtPaging.totalPage }">
			<li><a href="/mypage/mycmmt?curPage=${myCmmtPaging.totalPage }&search=${search }"> <span>&rarr;</span></a></li>
<%-- 			<li><a href="/mypage/mypost?curPage=${myPostPaging.totalPage }"> <span>&rarr;</span></a></li> --%>
		</c:if>
		
	</ul>
</div>