<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보추가</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<script type="text/javascript">
	$(document).ready(function() { 
		$('#addBtn').on('click', function(e) {
			e.preventDefault();
			
			let name = $('input[name=name]').val().trim();
			if (name == '') {
				alert("이름을 입력하세요");
				return false;
			}
			
			let yyyymmdd = $('input[name=yyyymmdd]').val().trim();
			if (yyyymmdd == '') {
				alert("생년월일을 입력하세요");
				return false;
			}
			
			if(isNaN(yyyymmdd)) {
				alert("숫자만 입력해주세요");
				return false;
			}
			
			let email = $('input[name=email]').val().trim();
			let introduce = $('textarea[name=introduce]').val().trim();
			
			$.ajax({
				type: 'POST'
				, url: '/lesson06/ex01/add_user'
				, data: {"name":name, "yyyymmdd":yyyymmdd, "email":email, "introduce":introduce}
				, success: function(data) { /// AJAX 결과는 String이다
					alert(data);
					location.href = "/lesson06/ex01/after_add_user";
					// location.reload(); // 새로고침
				}
				, complete: function(data) {
					alert("완료");
				}
				, error: function(e) {
					alert("에러: " + e);
				}
			});
		})
	});
</script>	
<body>
	<div class="container">
		<h1>회원 정보 추가</h1>
		
		<form method="post" action="/lesson06/ex01/add_user">
			<b>이름:</b>
			<input type="text" class="form-control" name="name"><br>
			
			<b>생년월일:</b>
			<input type="text" class="form-control" name="yyyymmdd"><br>
			
			<b>이메일:</b>
			<input type="text" class="form-control" name="email"><br>
			
			<b>자기소개:</b>
			<textarea name="introduce" rows="10" cols="30" class="form-control"></textarea>
			
			<input type="submit" id="addBtn" class="btn btn-success" value="추가">
		</form>
	</div>

</body>
</html>