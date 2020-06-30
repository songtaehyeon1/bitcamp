<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
#container{
	width:960px;
	margin:0 auto;
	margin-top:150px;  
}
form{text-align:center;}
small{padding-left:10px;}
table {
    width:100%;
    border-top:2px solid #444;  
    font-size:0.9em;  
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
button{
	margin-top:38px;
	width:100px;
	height:50px;
	text-align:center;
}
.btnOK, .btnCancel{
	font-size:1em;
	font-weight:bold; 
}
</style>

<c:if test="${result>0}">
	<script>
		alert("비밀번호 변경이 완료되었습니다.");   
		location.href="/bitcamp/";
	</script>
</c:if>

<c:if test="${result<=0}">
	<script>
		alert("비밀번호 변경에 실패하였습니다. 다시 시도해주세요.");   
		location.href="/bitcamp/pwdChangeFrm";
	</script>
</c:if>

<script>
$(function(){
	$(document).on("submit", "#pwdChangeFrm", function(){
		//비밀번호 검사
		var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
		if($("#userpwd").val()==""){
			alert("비밀번호를 입력해주세요.");
			return false; 
		}
		if(!reg.test($("#userpwd").val())){
			alert("비밀번호는 8~20자의 최소 하나의 숫자, 영문 대소문자, 특수문자 조합으로 입력해주세요.");
			return false;
		}
		
		//비밀번호 재확인
		if($("#pwdChk").val()==""){
			alert("비밀번호 재확인을 입력해주세요.");
			return false; 
		}
		if($("#pwdChk").val()!=$("#userpwd").val()){
			alert("비밀번호가 일치하지않습니다. 다시 입력해주세요.");
			return false;  
		}
		
		return true;
	});
});
</script>

<div id="container">
		<h2>비밀번호 재설정</h2>
		<p><small><mark>새로운 비밀번호</mark>를 입력해 주세요.</small></p>
		
		<form method="post" action="/bitcamp/pwdChangeOk" id="pwdChangeFrm" name="pwdChangeFrm">
			<div>
				<table>
					<tbody>
						<tr>
							<th scope="row">
								<label>새로운 비밀번호</label>
							</th>
							<td>
								<input type="password" id="userpwd" name="userpwd" maxlength="20" autofocus/>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label>새로운 비밀번호 확인</label>
							</th>
							<td>
								<input type="password" id="pwdChk" name="pwdChk" maxlength="20"/>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<button type="submit" class="btn btn-secondary btn-lg btnOK">확인</button>
			<button type="button" class="btn btn-outline-secondary btn-lg btnCancel" onclick="location.href='/bitcamp'">취소</button>
		</form>
</div>