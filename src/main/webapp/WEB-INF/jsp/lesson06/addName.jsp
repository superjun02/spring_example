<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이름 추가하기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<b>이름:</b>
		<label><input type="text" class="form-control" id="name"></label>
		<button type="button" id="nameCheckBtn" class="btn btn-success">중복확인</button>
		<br>
		
		<div id="nameStatusArea"></div><br>
		
		<button type="button" class="btn btn-primary" id="joinBtn">회원가입</button>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('#nameCheckBtn').on('click', function() {
				let name = $('#name').val().trim();
				
				$('#nameStatusArea').empty();
				
				// validation check
				// 이름이 있는지 확인
				if (name == '') {
					$('#nameStatusArea').append('<small class="text-danger">이름이 비어있습니다.</small>');
					return;
				}
				
				// 이름이 중복되는지 확인(DB 조회) -> AJAX 통신
				$.ajax({
					type: 'get'
					, url: '/lesson06/ex02/is_duplication'
					, data: {'name':name}
					, success: function(data) {
						if (data.is_duplication == true) {
							$('#nameStatusArea').append('<small class="text-danger">중복된 이름입니다.</small>')
						} else {
							$('#nameStatusArea').append('<small class="text-success">사용 가능한 이름입니다.</small>')
						}		
					}
					, error: function(e) {
						alert("실패:" + e);
					}
				});
				
			});
		});
	</script>
</body>
</html>