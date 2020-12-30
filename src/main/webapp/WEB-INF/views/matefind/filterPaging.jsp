<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="paging text-center">
	<ul class="pagination">

		<%-- 처음 페이지 버튼 --%>
		<%-- 첫 페이지가 아닐 때 버튼 노출 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/matefind/filterlist?curPage=1&party_location=${party_location}&category=${category}&meet_time=${meet_time}"> <span>&larr;</span></a></li>
		</c:if>





		<%-- 이전 페이지 버튼 --%>
		<%-- 첫 페이지면 금지 표시 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><a href="/matefind/filterlist?curPage=${paging.curPage-1 }&party_location=${party_location}&category=${category}&meet_time=${meet_time}" aria-label="Previous"> <span>&laquo;</span></a></li>
		</c:if>
		<c:if test="${paging.curPage eq 1 }">
			<li class="disabled"><span>&laquo;</span></li>
		</c:if>





		<%-- 페이징 번호 표시 --%>
		<%-- 현재 페이지 번호는 active 클래스 부여 -> 파랑 바탕 버튼 --%>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="page"
			varStatus="stat">
			
			<c:if test="${paging.curPage eq page }">
				<li class="active"><a href="/matefind/filterlist?curPage=${page }&party_location=${party_location}&category=${category}&meet_time=${meet_time}">${page }</a></li>
			</c:if>
			
			<c:if test="${paging.curPage ne page }">
				<li><a href="/matefind/filterlist?curPage=${page }&party_location=${party_location}&category=${category}&meet_time=${meet_time}">${page }</a></li>
			</c:if>
			
		</c:forEach>





		<%-- 다음 페이지 버튼 --%>
		<%-- 마지막 페이지면 동작 안함 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a href="/matefind/filterlist?curPage=${paging.curPage+1 }&party_location=${party_location}&category=${category}&meet_time=${meet_time}" aria-label="Next"> <span>&raquo;</span></a></li>
		</c:if>
		<c:if test="${paging.curPage eq paging.totalPage }">
			<li class="disabled"><span>&raquo;</span></li>
		</c:if>
		
		
		
		<%-- 마지막 페이지 버튼 --%>
		<%-- 마지막 페이지가 아닐 때 버튼 노출 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><a href="/matefind/filterlist?curPage=${paging.totalPage }&party_location=${party_location}&category=${category}&meet_time=${meet_time}"> <span>&rarr;</span></a></li>
		</c:if>
		
	</ul>
</div>