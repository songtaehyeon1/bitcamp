<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
a {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

.container {
	width: 500px;
	background-color: #fff;
	border: 1px solid #DDD;
	padding: 50px;
	margin-top: 10%;
}

.container>h2 {
	text-align: center;
	margin-bottom: 50px;
}

.btn {
	width: 400px;
	margin: 20px 0;
}

.info>span {
	float: right;
}

.info span, .info span a {
	color: #757575;
}
</style>

<script>
$(function(){
	$(".submitBtn").click(function(){
		//이름 검사
		if($("input[name='username']").val()==""||$("input[name='username']").val()==null){     
			alert("이름을 입력해주세요.");
			$("input[name='username']").focus()
			return false;
		}	
		//주문번호 검사
		if($("input[name='o_no']").val()==""||$("input[name='o_no']").val()==null){
			alert("주문번호를 입력해주세요.");
			$("input[name='o_no']").focus()
			return false;
		}
		//비밀번호 검사
		if($("input[name='opassword']").val()==""||$("input[name='opassword']").val()==null){
			alert("주문번호를 입력해주세요.");
			$("input[name='opassword']").focus()
			return false;
		}
		return true;
	})	
});
</script>
<div class="container">
	<h2>비회원 결제 조회</h2>
	<h6>
		<b>비회원의 경우 주문시의 주문번호로 조회가 가능합니다.</b>
	</h6>
	<form method="post">
		<div class="form-group">
			<input type="text" class="form-control" id="username" name="username"
				placeholder="주문자명을 입력해주세요" autofocus />
		</div>
		<div class="form-group">
			<input type="text" class="form-control" id="o_no" name="o_no"
				placeholder="주문번호를 입력해주세요" />
		</div>
		<div class="form-group">
			<input type="password" class="form-control" id="opassword"
				name="opassword" placeholder="주문 비밀번호를 입력해주세요" />
		</div>
		<input type="submit" id="submitBtn" style="display: none;"
			formaction="/bitcamp/nonSearchHistory"> 
			<a id="submitA"	class="submitBtn btn btn-secondary">
			<label class="submitBtn"for="submitBtn"	style="margin: 0; width: 100%; cursor: pointer; color: #fff">조회</label>
			</a>

		<button type="button" style="margin-top: 0px"
			onclick="location.href='/bitcamp'" class="btn btn-secondary">홈으로</button>
	</form>

</div>




