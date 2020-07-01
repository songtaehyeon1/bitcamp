<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/member/contFind.css"/>

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
