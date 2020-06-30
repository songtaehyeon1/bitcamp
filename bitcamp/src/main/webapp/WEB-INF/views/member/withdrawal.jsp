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
#reason{
	width:400px;
}
#reason_etc{
	display:none;
	margin-top:5px;   
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
	var reasonOption=["탈퇴 사유를 선택해 주세요.", "시스템 이용불편", "서비스 불만", "이용빈도 저조", "개인정보의 노출우려", "기타"];    
	var tag="";
	for(i=0; i<reasonOption.length; i++){
		tag += "<option value='"+reasonOption[i]+"'+>"+reasonOption[i]+"</option>";
	}
	document.getElementById("reason").innerHTML = tag;
	
	//탈퇴 사유 :기타
	$("#reason").change(function() {
		//console.log($("#reason").val());
		if($("#reason").val()=="기타"){
			$("#reason_etc").css("display","block");	
		}else{
			$("#reason_etc").css("display","none");	
		}
	});
	
	//회원탈퇴 폼 
	$("#wdFrm").submit(function(){
		//탈퇴 사유 검사
		if($("#reason").val()==reasonOption[0]){
			alert("탈퇴 사유를 선택해 주세요.");
			return false;
		}
		
		if($("#reason").val()=="기타"){
			if($("#reason_etc").val()==""){
				alert("탈퇴 사유를 기재해주세요.");
				return false;
			}
		}
		
		return true;
	});
});
</script>

<div id="container">
		<h2>회원 탈퇴</h2>
		<p><small>THEBITCAMP 회원 탈퇴 진행 시 회원님의 개인정보와 서비스 이용 내역은 모두 삭제되며 복구 불가능합니다.</small></p> 
		
		<form method="post" action="/bitcamp/withdrawalOk" id="wdFrm" name="wdFrm" >
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
		    					<textarea form="wdFrm" id="reason_etc" name="reason_etc" cols="54" rows="5" placeholder="탈퇴 사유를 기재해주세요. 소중한 의견으로 더 나은 서비스를 제공할 수 있도록 노력하겠습니다." autofocus></textarea>
							</td>
						</tr>
					
					</tbody>
				</table>
			</div>
		
			<button type="submit" class="btn btn-secondary btn-danger btnDel">회원 탈퇴</button>
			<button type="button" class="btn btn-outline-secondary btn-lg btnCancel" onclick="location.href='/bitcamp'">취소</button>
		</form>
</div>