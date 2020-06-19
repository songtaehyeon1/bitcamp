<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원정보 수정</title>

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
		
		//이름 검사	
		if($("#username").val()==""){
			alert("이름을 입력해주세요.");
			return false; 
		}
		var reg = /^[가-힣]{2,7}$/;
		if(!reg.test($("#username").val())){
			alert("한글 이름 2~7자를 입력해주세요.");
			return false;
		}
		
		//이메일 검사	
		if($("#useremail").val()==""){
			alert("이메일을 입력해주세요.");
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
		
		//주소 검사	
		if($("#zipcode").val()=="" &&  $("#addr").val()=="월" && $("#addrdetail").val()==""){
			alert("주소를 입력해주세요.");
			return false; 
		}
		if($("#zipcode").val()==""){
			alert("우편번호 검색을 진행해주세요.");
			return false;   
		}
		
		return true;
	});  //infoFrm 유효성 검사
});

//우편번호 서비스
function openDaumZipAddress() {
	new daum.Postcode({
		oncomplete:function(data) {
			jQuery("#zipcode").val(data.zonecode);
			jQuery("#addr").val(data.address);
			jQuery("#addrdetail").focus();
		}
	}).open();
}
</script>

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
					<div><strong>${vo.username}</strong></div>
				</div>
		
				<div class="form-group">
					<label for="eamil" class="lbl_email">이메일</label> 
					<input type="email" class="form-control" id="useremail" placeholder="이메일 주소" name="useremail"> 
				</div>
				
				
				<div class="form-group input-group">
				<label for="tel" class="lbl_tel">휴대전화</label>
					<!--
					<select class="form-control col-sm-4" id="code" name="code" onchange="cursorMove3(this.value)">
					</select>
					 -->
					<input type="tel" class="form-control" id="usertel" placeholder="'-'없이 숫자만 입력" name="usertel" maxlength="13">
					<!-- 
					<div class="input-group-append">
						<button class="btn btn-secondary" type="button">인증번호 전송</button>
					</div>
					 -->
				</div>
				
				<!--
				<div class="form-group input-group">
					<input type="text" class="form-control" id="num" placeholder="인증번호" name="num">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button">확인</button>
					</div>
				</div> 
				 -->
				 
				<div class="form-group input-group">
					<label for="addr" class="lbl_addr">주소</label> 
					<input type="text" class="form-control" id="zipcode" placeholder="우편번호" name="zipcode" readonly>
					<div>
						<button class="btn btn-secondary searchAddr" type="button" onclick="openDaumZipAddress();">우편번호 검색</button>
					</div>
				</div>
				
				<div class="form-group">
					<input type="text" class="form-control" id="addr" placeholder="주소" name="addr" readonly>
					<input type="text" class="form-control" id="addrdetail" placeholder="상세주소" name="addrdetail">
				</div>
				
				<span>
					<button type="submit" class="btn btn-secondary btn-lg btnModify">수정하기</button>
					<button type="button" class="btn btn-outline-secondary btn-lg btnCancel">취소</button>
				</span>
			</form>
		</div>
	</div>
</div>