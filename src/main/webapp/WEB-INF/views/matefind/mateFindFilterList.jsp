<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:forEach items="${mateFindFilterList }" var="list">

<div class="thumbnail-wrapper">

	<a href="/matefind/view?article_no=${list.article_no }">
	
		<img class="thumbnail-img" style="margin-bottom: 10px;" alt="썸네일이미지" src="https://www.bloter.net/wp-content/uploads/2016/08/%EC%8A%A4%EB%A7%88%ED%8A%B8%ED%8F%B0-%EC%82%AC%EC%A7%84.jpg">
		<h2 id="title" style="white-space:nowrap; text-overflow: ellipsis; overflow: hidden;">${list.article_title }</h2>
		
	</a>
		<div align="left" class="info">
		
			<p style="	white-space:nowrap;	
					text-overflow: ellipsis;
					overflow: hidden;"># ${list.party_location }</p>
			<fmt:parseDate value="${list.meet_time }" var="parseDateMeetTime" pattern="yyyyMMddHHmm" scope="page"/>
			<p># <fmt:formatDate value="${parseDateMeetTime }" pattern ="yyyy년 MM월 dd일 HH시 mm분"/></p>
<%-- 			<p># <fmt:formatDate value="${parseDateMeetTime }" pattern ="HH시 mm분"/></p> --%>
			<p># ${list.category }</p>
			
		</div>
		
		<div class="user">
		<hr style="margin: 4px 0px;">
			<p class="span-parent">
				<ul id="userMenuList">
					<li id="userMenu">
				<span class="user-left" style="float: right;">
<%-- 					<img style="width: 50px; height: 50px;" src="${list.user.user_profilestored }" alt="유저프로필사진"> --%>
					<img id="pof_pic" style="width: 50px; height: 50px;" src="/resources/upload/${list.user.user_profilestored }" alt="유저프로필사진" />
				</span>
				
						<span>
						${list.user.user_id } <br>
						${list.user.user_nick }
						</span>
						<ul id="userHiddenMenu" >
							<li onclick="createChat(this);" user_no="${list.user.user_no }">채팅하기</li>
						</ul>
					</li>
				</ul>
			</p>
		
		</div>
	</div>
	

</c:forEach>

<div class="row">
	<div class="col" style="text-align: center;">
		<jsp:include page="./filterPaging.jsp" />
	</div>
</div>