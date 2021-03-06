<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="search" value="manageCategory=${boardAdminParam.manageCategory}&manageKeyword=${boardAdminParam.manageKeyword}&manageSearch=${boardAdminParam.manageSearch }&start_date=${boardAdminParam.start_date}&end_date=${boardAdminParam.end_date}"/>

<div class="paging text-center">
	<ul class="pagination">

		<%-- 처음 페이지 버튼 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/admin/board/list?${search}"><span><i class="fas fa-angle-double-left"></i></span></a></li>
		</c:if>


		<%-- 이전 페이지 버튼 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/admin/board/list?curPage=${paging.curPage-1 }&${search} aria-label="Previous"> <span><i class="fas fa-angle-left"></i></span></a></li>
		</c:if>
		<c:if test="${paging.curPage eq 1 }">
			<li class="disabled"><span><i class="fas fa-angle-double-left"></i></span></li>
		</c:if>


		<%-- 페이징 번호 표시 --%>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="page"
			varStatus="stat">
			
			<c:if test="${paging.curPage eq page }">
				<li class="active"><a href="/admin/board/list?curPage=${page }&${search}">${page }</a></li>
			</c:if>
			
			<c:if test="${paging.curPage ne page }">
				<li><a href="/admin/board/list?curPage=${page }&${search}">${page }</a></li>
			</c:if>
			
		</c:forEach>


		<%-- 다음 페이지 버튼 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a href="/admin/board/list?curPage=${paging.curPage+1 }&${search} aria-label="Next"> <span><i class="fas fa-angle-right"></i></span></a></li>
		</c:if>
		<c:if test="${paging.curPage eq paging.totalPage }">
			<li class="disabled"><span><i class="fas fa-angle-double-right"></i></span></li>
		</c:if>
		
		
		<%-- 마지막 페이지 버튼 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a href="/admin/board/list?curPage=${paging.totalPage }&${search}"> <span><i class="fas fa-angle-double-right"></i></span></a></li>
		</c:if>
		
	</ul>
</div>