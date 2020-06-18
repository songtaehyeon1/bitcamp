<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/bitcamp/css/bootstrap.min.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/bitcamp/js/bootstrap.min.js"></script>
<style>
	.wrap{margin-top:150px;}
	.container{
		margin-top:32px; 
		width:40%;
	}
	.content{border-top:2px solid #444;}
	form{margin-top:15px;}
	strong{color:#666;}
	label{	
		width:100%;
		background-color:#F6F6F6;  
	}
	.lbl_userid, .lbl_Birth, .lbl_tel{width:100%;}
	#userid, #code{border-radius:5px;}
	.row{margin:0 auto;}
	.gender{margin-top: 15px;}
	.btn-group-toggle{
		width:100%;
	}
	.btn-group-toggle label{border:1px solid #ced4da;}
	span button{
		margin-top:38px;
		width:100px;
		height:50px;
		position:relative;
		left:200px;
	}
	.btnModify, .btnCancel{
		font-size:1em;
		font-weight:bold; 
	}
</style>

<script>

//생년월일_월
function monthOption(){
	var optionTag="<option>"+"월"+"</option>";             
	for(i=1; i<=12; i++){
		if(i<10){
			optionTag += "<option value='0"+i+"'>0" +i +"</option>";
		}else{
			optionTag += "<option value='"+i+"'>" +i +"</option>";
		}
		
	}
	document.getElementById("month").innerHTML = optionTag;
	//월 선택된 값 가져오기            //※jq06_select_attribute.html
	$("#month").children("option[value*='${vo.month}']").prop("selected",true);
}
/*
//휴대전화_이동통신사
function codeOption(){
	var tagOption=["이동통신사", "SKT", "KT", "LGU+", "알뜰폰"];    
	var tag="";
	for(i=0; i<tagOption.length; i++){
		tag += "<option value='"+tagOption[i]+"+>" +tagOption[i] +"</option>";
	}
	document.getElementById("code").innerHTML = tag;
	//이동통신사 선택된 값 가져오기            
	$("#code").children("option[value*='']").prop("selected",true);
}

//휴대전화_자동 커서 이동
function cursorMove3(str) {
	if(str!="이동통신사"){
		document.getElementById("tel").focus();	
	}
}
*/
//생년월일_자동 커서 이동1+
function cursorMove1(){
		var inputYear = document.getElementById("year").value;
		if(inputYear.length==4){  //year에 4글자가 입력되면
			//(자동)커서 이동 : year  → month 
			document.getElementById("month").focus();  //focus() 함수
		}
}
//생년월일_자동 커서 이동2
function cursorMove2(month) {
	if(month!="월"){
		document.getElementById("day").focus();
	}
}

$(function(){
	$(document).on("submit","#personInf	oFrm",function(){
		//비밀번호 검사
		var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;
		if($("#pwd").val()==""){
			alert("비밀번호를 입력해주세요.");
			return false; 
		}
		if(!reg.test($("#pwd").val())){
			alert("비밀번호는 8~20자의 최소 하나의 숫자, 영문 대소문자, 특수문자 조합으로 입력해주세요.");
			return false;
		}
		
		//비밀번호 재확인
		if($("#pwdChk").val()==""){
			alert("비밀번호 재확인을 입력해주세요.");
			return false; 
		}
		if($("#pwdChk").val()!=$("#pwd").val()){
			alert("비밀번호가 일치하지않습니다. 다시 입력해주세요.");
			return false;  
		}
		
		//생년월일 검사
		var reg = /^(19|20)[0-9]{2}$/;  //년도 정규식
		var regExp = /^[1-9]|[1-2][0-9]|3[0-1]$/;  //일 정규식
		if($("#year").val()=="" &&  $("#month").val()=="월" && $("#day").val()==""){
			alert("생년월일을 입력해주세요.");
			return false;  
		}
		
		if($("#year").val()==""){
			alert("년도(4자리)를 입력해주세요.");
			return false;   
		}else if(!reg.test($("#year").val())){
			alert("년도 4자를 다시 입력해주세요.");
			return false;
		}else if($("#month").val()=="월"){
			alert("월을 선택해주세요.");
			return false;  
		}else if($("#day").val()==""){
			alert("일을 입력해주세요.");
			return false;  
		}else if(!regExp.test($("#day").val())){
			alert("일을 다시 입력해주세요.");
			return false;
		}
		
		//휴대전화 검사
		var reg = /^01[0|1|6|7|8|9][0-9]{7,8}$/;
		//var reg = /^(010|011|016|017|018|019)[1][0-9]{9,10}$/;
		/*if($("#code").val()=="이동통신사"){
			alert("이동통신사를 선택해주세요.");
			return false;  
		}else*/ if($("#tel").val()==""){
			alert("휴대전화번호를 입력해주세요.");
			return false;  
		}else if(!reg.test($("#tel").val())){			
			alert("휴대전화번호는 '-'없이 10~11자의 숫자만 입력해주세요.");
			return false;		
		}
		/*
		else if($("#num").val()==""){
			alert("인증번호를 입력해주세요.");
			return false;  
		}
		*/
		
		return true;
	});	
});
</script>
</head>

<body>
<body onload="monthOption();">
<div class="wrap">
	<div class="container p-3 my-3 bg-dark text-white title">
  	<h1>회원정보 수정</h1>
  	<p>회원님의 정보를 수정·확인하실 수 있습니다.</p>
	</div>

	<div class="container">
		<div class="content">
			<form method="post" id="infoFrm" action="/bitcamp/infoEditOk">
				<div class="form-group">
					<label for="userid" class="lbl_userid">아이디</label> 
					<div><strong>${vo.userid}</strong></div>
				</div>
	
				<div class="form-group">
					<label for="userpwd">비밀번호</label> 
					<input type="password" class="form-control" id="userpwd" placeholder="6~16자의 영문 대소문자, 숫자, 특수문자 중 2가지 이상 조합" name="userpswd" maxlength="20">
				</div>
				<div class="form-group">
					<label for="pwdChk">비밀번호 재확인</label> 
					<input type="password" class="form-control" id="pwdChk" placeholder="비밀번호 확인" name="pwdChk" maxlength="20">
				</div>
		
				<div class="form-group">
					<label for="text">이름</label> 
					<div><strong>${vo.name}</strong></div>
				</div>
		
				<div class="form-group row">
					<label for="text" class="lbl_Birth">생년월일</label> 
					<input type="text" class="form-control col-sm-4" id="year" placeholder="년(4자)" name="year" maxlength="4" onkeyup="cursorMove1()" value="${vo.year}"> 
					<select class="form-control col-sm-4" id="month" name="monthlist" onchange="cursorMove2(this.value)">
					</select> 
					<input type="text" class="form-control col-sm-4" id="day" placeholder="일" name="day" maxlength="2" value="${vo.day}">
				</div>
				
				<div class="form-group gender">
					<label for="gender">성별</label> 
					<br>
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-light">
							<input type="radio" class="form-check-input" id="gender" name="optradio" <c:if test="${vo.gender=='M'}">checked</c:if>> 남자
						</label>
						<label class="btn btn-light">
							<input type="radio" class="form-check-input" id="gender" name="optradio" <c:if test="${vo.gender=='F'}">checked</c:if>> 여자
						</label>
					</div>
				</div>		
				
				
				<div class="form-group input-group">
					<label for="tel" class="lbl_tel">휴대전화</label>
					<!-- 
					<select class="form-control col-sm-4" id="code" name="code" onchange="cursorMove3(this.value)">
					</select>
					 -->
					<input type="tel" class="form-control" id="tel" placeholder="'-'없이 숫자만 입력" name="tel" maxlength="11" value="${vo.tel}">
					<div class="input-group-append">
						<button class="btn btn-secondary" type="인증번호 전송">인증번호 전송</button>
					</div>
				</div>
				
				<!-- 
				
				<div class="form-group input-group">
					<input type="text" class="form-control" id="num" placeholder="인증번호" name="num">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="인증번호 전송">확인</button>
					</div>
				</div>
			
				 -->
				
				<span>
					<button type="submit" class="btn btn-secondary btn-lg btnModify">수정하기</button>
					<button type="button" class="btn btn-outline-secondary btn-lg btnCancel">취소</button>
				</span>
			</form>
		</div>
	</div>
</div>
</body>
</html>