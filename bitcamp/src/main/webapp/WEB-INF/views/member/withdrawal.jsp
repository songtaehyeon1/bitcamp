<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>회원 탈퇴</title>

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
	width:105px;
	height:50px;
	text-align:center;
}
.btnDel, .btnCancel{
	font-size:1em;
	font-weight:bold; 
}
</style>

<script>
$(function(){
	//탈퇴 사유
	var reasonOption=["탈퇴사유를 선택해 주세요.", "시스템 이용불편", "서비스 불만", "이용빈도 저조", "개인정보의 노출우려", "기타"];    
	var tag="";
	for(i=0; i<reasonOption.length; i++){
		tag += "<option value='"+reasonOption[i]+"'+>"+reasonOption[i]+"</option>";
	}
	document.getElementById("reason").innerHTML = tag;
});
</script>

<div id="container">
		<h2>회원 탈퇴</h2>
		<p><small>THEBITCAMP 회원 탈퇴 진행 시 회원님의 개인정보와 서비스 이용 내역은 모두 삭제되며 복구 불가능합니다.</small></p> 
		<form method="post" action="/bitcamp/withdrawalOk">
			<div>
				<table>
					<tbody>
						<tr>
							<th scope="row">아이디</th>
							<td>
								<strong name="userid">${userid}</strong>
							</td>
						</tr>
						<tr>
							<th scope="row">가입일</th>
							<td>
								<strong>${vo.regdate} 가입</strong>
							</td>
						</tr>
						<tr>
							<th scope="row">총 잔여 마일리지</th>
							<td>
								<strong>${vo.usermile} 마일</strong>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<label>탈퇴 사유</label>
							</th>
							<td>
								<select id="reason" name="reason">
		    					</select>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		
			<button type="submit" class="btn btn-secondary btn-danger btnDel">회원 탈퇴</button>
			<button type="button" class="btn btn-outline-secondary btn-lg btnCancel" onclick="location.href='/bitcamp'">취소</button>
		</form>
</div>