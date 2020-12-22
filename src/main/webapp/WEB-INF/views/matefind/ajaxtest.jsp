<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>
<body>

<input type="button" class="" id="btnAttend">



</body>

<script type="text/javascript">
$(document).ready(function() {
	
	$('#btnAttend').click(function() {
		
		$.ajax({
			url: '/matefind/attend',
			type: 'get',
			
			success: function(result) {
				
				if(result) {
					// 미참여중 참여시키기
					$('#btnAttend').val("참여중");
					$("#btnAttend").addClass("btn-secondary")
					$("#btnAttend").removeClass("btn-primary")
					
					
					// recommend - user join결과 불러오기

				} else {
					// 이미 참여중 참여취소시키기
					$('#btnAttend').val("참여하기");
					$("#btnAttend").removeClass("btn-secondary")
					$("#btnAttend").addClass("btn-primary")
					
					// recommend - user join결과 불러오기
				}
				
			},
			error: function() {
				console.log("[ajax] /matefind/attend 전송실패")
				
			}
			
			
			
			
		})
		
	})
	
})
</script>
</html>