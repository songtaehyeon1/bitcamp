<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bitcamp/css/bootstrap.min.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/bitcamp/js/bootstrap.min.js"></script>
<style>
.container>h2{
	text-align:center;
	margin-bottom:50px;
}
.container{
	width:500px;
	border:1px solid #DDD;
	padding:50px;
	margin-top: 10%;
}
.btn{
	width:400px;
	margin-top:20px;
}
</style>
<script>
$(function(){
	$("#logFrm").submit(function(){
		//이메일(아이디) 검사
		if($("#userid").val()==""){     
			alert("아이디를 입력해주세요.");
			return false;
		}	
		//비밀번호 검사
		if($("#userpwd").val()==""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
	});
});	
</script>
</head>

<body>
<div class="container">
	<h2>LOGIN</h2>
	<form id="logFrm" method="post" action="/bitcamp/loginOk">
		<div class="form-group">
			<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디"/>
		</div>
		<div class="form-group">
      		<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="비밀번호"/>
      	</div>
      	<button type="submit" class="btn btn-secondary">로그인</button>
  	</form>
</div>
</body>
</html>

