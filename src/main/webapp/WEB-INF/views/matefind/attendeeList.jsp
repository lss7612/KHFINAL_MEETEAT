<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<div class="row">
	<div class="col">
		<h3 style="float: left;">guest [ ${attendeeCount } / ${attendeeMax } ]</h3>
	</div>
</div>

<div class="row">
<c:forEach items="${attendUserList }" var="attendUserList">
	
	<!-- user_no는 나중에 사진으로 대체 되어야함 -->
	<div class="col-2">
<%-- 		<img class="pof_pic" style="width: 50px; height: 50px;" src="${attendUserList.user.user_profilestored }" alt="유저프로필사진">	 --%>
		<img class="pof_pic" style="width: 50px; height: 50px;" src="/resources/upload/${attendUserList.user.user_profilestored }" alt="유저프로필사진">	
	</div>
	
	<div class="col-2">
		<h3>${attendUserList.user.user_id }</h3>
	</div>
	
	<div class="col-2">
		<h3>${attendUserList.user.user_nick }</h3>
	</div>
	
</c:forEach>
</div>


