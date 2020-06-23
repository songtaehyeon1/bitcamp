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

<c:if test="${cnt<=0}">
	<script>
		alert("비밀번호를 다시 확인하여 입력해주세요.");
		history.back();        
	</script>
</c:if>

<script>
$(function(){
	$(".btnOK").on('click',function(){
		if($("#userpwd").val()==""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}	
	});	
});
</script>

<div id="container">
		<h2>비밀번호 확인</h2>
		<p><small>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 입력해 주세요.</small></p> 
		<form method="post" action="/bitcamp/pwdChkOk" id="pwdChkOk">
			<div>
				<table>
					<tbody>
						<tr>
							<th scope="row">아이디</th>
							<td>
								<strong>${userid}</strong>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label for="userpwd">비밀번호</label>
							</th>
							<td>
								<input type="password" id="userpwd" name="userpwd" maxlength="20" autofocus/>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<button type="submit" class="btn btn-secondary btn-lg btnOK">확인</button>
			<button type="button" class="btn btn-outline-secondary btn-lg btnCancel" onclick="location.href='/bitcamp'">취소</button>
		</form>
</div>