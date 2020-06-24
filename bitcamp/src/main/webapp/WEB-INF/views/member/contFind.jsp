<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	a, a:hover{
		text-decoration:none;
		color:#6c757d;
	}
	.wrap{margin-top:150px;}
	small{padding-left:10px;}
	.find {width:40%;}
	.row{margin:0 auto;}
	form{	
		text-align:center; 
		border:1px solid #e8e8e8; 
		padding:20px;
		margin-bottom:32px;
	}
	table {
	    width:100%;
	    font-size:0.9em;  
	}
	thead{background-color:#e8e8e8;}
	thead td{
		font-size:1em;
		text-align:center; 
		font-weight:bold;
	}
	tr{border-bottom:1px solid #e5e5e5;}
	th{
		width:20%;
		text-align:left;
		background-color:#f9f9f9;  
		padding:10px;
	}
	td{
		text-align:left;
		padding:10px;
	}
	span div{
		margin-top:18px;
		width:100px;
		height:50px;
		text-align:center;
	}
	.a-left{
		float:left;
		font-weight:bold; 
	}
	.a-right{
		float:right;
		font-weight:bold;
	}
</style>

<script>
$(function(){
	//아이디 찾기
	$(document).on("submit","#findId",function(){
		//이름검사	
		if($("#name").val()==""){
			alert("이름을 입력해주세요.");
			return false;   
		}
		//이메일 검사	
		if($("#mail").val()==""){
			alert("이메일 주소를 입력해주세요.");
			return false;   
		}
		return true;
	});
	
	//비밀번호 찾기
	$(document).on("submit","#findPwd",function(){
		//이름 검사
		if($("#named").val()==""){
			alert("이름을 입력해주세요.");
			return false;   
		}
		//아이디 검사	
		if($("#userid").val()==""){
			alert("아이디를 입력해주세요.");
			return false;   
		}
		//이메일 검사	
		if($("#email").val()==""){
			alert("이메일 주소를 입력해주세요.");
			return false;   
		}
		return true;
	});
});
</script>

<div class="wrap">
	<div class="container find">
		<h2>아이디/비밀번호 찾기</h2>
		<p><small>가입한 아이디와 비밀번호를 잊으셨습니까?<br>&ensp;가입 시 입력한 본인정보를 입력해 주세요.</small></p>
	  	<br>
	
		<div>
			<!-- 개인회원 -->
			<div class="container"><br>
			<form method="post"  action="/bitcamp/idFindOk" id="findId" name="findId">
				<div>
					<table>
						<thead align="center">
						    <tr>
						        <td colspan="2">아이디 찾기</td>
						    </tr>
						</thead>
						
						<tbody>
							<tr>
								<th scope="row">이름</th>
								<td>
									<input type="text" class="form-control" id="name" placeholder="이름" name="name" maxlength="20">
								</td>
							</tr>
							
							<tr>
								<th scope="row">이메일</th>
								<td>
									<input type="email" class="form-control" id="mail" placeholder="이메일 주소" name="mail">
									<small>가입 시 등록했던 이메일주소로 아이디가 전송됩니다.</small>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<button type="submit" class="btn btn-secondary btn-block">이메일로 아이디 전송</button>
			</form>
			
			<form method="post" action="pwdFindOk" id="findPwd" name="findPwd">
				<div>
					<table>
						<thead align="center">
						    <tr>
						        <td colspan="2">비밀번호 찾기</td>
						    </tr>
						</thead>
						
						<tbody>
							<tr>
								<th scope="row">이름</th>
								<td>
									<input type="text" class="form-control" id="named" placeholder="이름" name="named" maxlength="20">
								</td>
							</tr>
							
							<tr>
								<th scope="row">아이디</th>
								<td>
									<input type="text" class="form-control" id="userid" placeholder="아이디" name="userid">
								</td>
							</tr>
							
							<tr>
								<th scope="row">이메일</th>
								<td>
									<input type="email" class="form-control" id="email" placeholder="이메일 주소" name="email">
									<small>가입 시 등록했던 이메일주소로 비밀번호가 전송됩니다.</small>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<button type="submit" class="btn btn-secondary btn-block">이메일로 비밀번호 전송</button>
			</form>
			
			
			<a href="/bitcamp/loginFrm" class="a-left">로그인</a>
			<a href="/bitcamp/joinFrm" class="a-right">회원가입</a>
			</div>
		</div>
	</div>
</div>
