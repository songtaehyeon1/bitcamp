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

.findIdOk {
   position: fixed;
   top: 41%;
   left: 47%;
   z-index: 1000;
   width: 440px;
   max-width: 440px;
   height: 320px;
   margin: -72px 0 0 -150px;
   border: 1px solid #000;
   border-radius:6px;
   background: #fff;
   text-align: center;
   display:none;
}
.findIdOk h1 {
    font-size: 21px;
    text-align: center;
    color: #000;
    font-weight: bold;
    margin: 60px auto 30px;
}
.findIdOk .content p {
    color: #000;
    font-size: 16px;
    font-weight: 400;
    margin-bottom: 40px;
    line-height: 22px;
}
.findIdOk .btnArea a {
    display: inline-block;
    padding: 10px 20px;
    color: #000;
    border: 1px solid #000;
    box-sizing: border-box;
    margin: 0 5px;
    font-size: 15px;
    font-weight: 500;
}
.findIdOk .btnArea a.findIdOk-login {
    background: #000;
    color: #fff;
}
.findIdOk .close {
    position: absolute;
    right: 10px;
    top: 10px;
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
		
		//////////////////////////////////////////////////
		//ajax 아이디 찾기
		var url = "/bitcamp/idFindOk";
		var params = $("#findId").serialize();
		
		console.log(params);
		$.ajax({
			type : "POST",
			url : url,
			data : params,
			success : function(result){
				var jsonData = JSON.parse(result);
				
				if(result!="N"){  
				    $(".findIdOk").css("display","block");
				    $(".findIdOk span").html(jsonData.username);
				    $(".findIdOk strong").html(jsonData.userid);
				    $(".findIdOk font").html(jsonData.regdate);
				}
			},
			error : function(e){
				alert("입력하신 정보와 일치하는 아이디가 없습니다. \n다시 확인하여 진행해 주세요.");	
				console.log(e.responseText);
			}
		});
		return false;  
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

		//////////////////////////////////////////////////
		//ajax 비밀번호 찾기
		var url = "/bitcamp/pwdFindOk";
		var params = $("#findPwd").serialize();
		
		console.log(params);
		$.ajax({
			type : "POST",
			url : url,
			data : params,
			success : function(result){
				if(result=="Y"){  
					alert("해당 이메일 주소로 이메일을 전송하였습니다. \n메일함을 확인해주세요.");	
				}
			},
			error : function(e){
				alert("입력하신 정보와 일치하는 회원이 없습니다. \n다시 확인하여 진행해 주세요.");	
				console.log(e.responseText);
			}
		});
		return false;  
	});
});
</script>

<div class="wrap">
	<div class="container find">
		<h2>아이디/비밀번호 찾기</h2>
		<p><small>가입한 아이디와 비밀번호를 잊으셨습니까?<br> &emsp;가입 시 입력한 본인정보를 입력해 주세요.</small></p>
	  	<br>

		<div class="findIdOk">
	    	<h1>회원님의 아이디 찾기 결과입니다.</h1>
			<div class="content">
				<p><span></span>님께서 요청하신 아이디를 알려드립니다.<br> 아이디는 <strong></strong>입니다.<br/> (가입일 : <font></font>)</p>
			</div>
			<div class="btnArea">
				<a href="#" onclick="$('.findIdOk').hide();">닫기</a>
			    <a href="/bitcamp/loginFrm" class="findIdOk-login">로그인</a>
			</div>
			<div class="close"><a onclick="$('.findIdOk').hide();"><img src="<%=request.getContextPath()%>/resources/category/close_btn.png" alt="닫기 버튼"></a></div>
		</div>
	
		<div>
			<!-- 개인회원 -->
			<div class="container"><br>
			<form method="post" id="findId" name="findId">
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
									<small>가입 시 등록했던 이메일주소를 입력해주세요.</small>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<button type="submit" class="btn btn-secondary btn-block">확인</button>
			</form>
			
			<form method="post" id="findPwd" name="findPwd">
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
