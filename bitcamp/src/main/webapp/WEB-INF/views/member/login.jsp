<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>로그인</title>

<style>
a{text-decoration:none;}
a:hover{text-decoration:none;}
.container{
	width:500px;
	background-color:#fff;
	border:1px solid #DDD;
	padding:50px;
	margin-top:10%;
}
.container>h2{
	text-align:center;
	margin-bottom:50px;
}
.btn{
	width:400px;
	margin:20px 0;
}
.info>span{
	float:right;
	
}
.info span, .info span a{
	color: #757575;
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

<div class="container">
	<h2>LOGIN</h2>
	<form id="logFrm" method="post" action="/bitcamp/loginOk">
		<div class="form-group">
			<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디를 입력해주세요" autofocus="autofocus"/>
		</div>
		<div class="form-group">
      		<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="비밀번호를 입력해주세요"/>
      	</div>
      	<button type="submit" class="btn btn-secondary">로그인</button>
  	</form>
  	
  	<div class="info">
  		<input type="checkbox" name="saveId" value="saveId"/>&nbsp;아이디 저장
  		<span>
  			<a href="#">아이디/비밀번호 찾기</a> 
  			&#124;
  			<a href="/bitcamp/joinFrm">회원가입</a>
  		</span>
  	</div>
</div>


