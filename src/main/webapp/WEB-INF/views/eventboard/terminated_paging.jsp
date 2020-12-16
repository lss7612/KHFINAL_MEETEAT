<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="searchQueryString" value="searchBoard_no=3&searchKeyword=${searchParam.searchKeyword }&searchCategory=${searchParam.searchCategory}&searchLocation=${searchParam.searchLocation }" />

<style>
.active > a {
	background-color: #ffa000 !important;
	border-color: #ffa000 !important;
}
</style>

<div class="paging text-center">

<ul class="pagination">

	<!-- 첫페이지로 가기 -->
	<c:if test="${paging.curPage != 1 }">
 		<li><a href="/eventboard/terminated?${searchQueryString }">&larr;</a></li>
	</c:if>
	
	<!-- 이전페이지로 가기 -->
	<c:if test="${paging.curPage != 1 }">
		<li><a href="/eventboard/terminated?${searchQueryString }&curPage=${paging.curPage - 1 }">&lt;</a></li>
	</c:if>
	
	<!-- 페이징 리스트 -->
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="page">
		<c:if test="${paging.curPage eq page }">
			<li class="active"><a href="/eventboard/terminated?${searchQueryString }&curPage=${page }">${page }</a></li>
		</c:if>
		<c:if test="${paging.curPage ne page }">
			<li><a href="/eventboard/terminated?${searchQueryString }&curPage=${page }">${page }</a></li>
		</c:if>
	</c:forEach>
	
	<!-- 다음 페이지로 가기 -->
	<c:if test="${paging.curPage != paging.totalPage }">
		<li><a href="/eventboard/terminated?${searchQueryString }&curPage=${paging.curPage + 1 }">&gt;</a></li>
	</c:if>
	
	<!-- 마지막 페이지로 가기 -->
	<c:if test="${paging.curPage != paging.totalPage }">
		<li><a href="/eventboard/terminated?${searchQueryString }&curPage=${paging.totalPage }">&rarr;</a></li>
	</c:if>
	
	
</ul>
</div>
