<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
*{
	font-family:'Nanum Gothic';
	margin:0;
	padding:0;
}
li{list-style:none;}
a{text-decoration:none;}
.wrap{margin-top: 150px;}
.title, .join{width:40%;}
.join>h2, .tablist{text-align:center;}
.tablist b{font-size:1.5em;}
.lbl_userid, .lbl_tel, .lbl_addr{width:100%;}
#userid, #tel{border-radius:5px;}
#warning{
	font-weight:bold;
	display:none;
}
small{
	position:absolute; 
	right:0;
}
.row{margin:0 auto;}
.btn-group-toggle{width:100%;}
.btn-group-toggle label{border:1px solid #ced4da;}
form>div:nth-child(7){margin-top:15px;}
.lbl_addr{width:100%;}
#zipcode{border-radius:5px;}
#addrdetail{margin-top:5px;}
.agree_tit{
	margin-top:50px; 
	margin-bottom:10px; 
}
.agree_article{
	border:1px solid #ccc;
	border-radius:5px;
	background-color:#fafafa;
}
.agree_article .form-check{margin:10px 0;}
.agree_article .form-check:nth-child(1){font-weight:bold;}
.agree_article .form-check:nth-child(4){margin-bottom:20px;}
.agree_article .form-check-label{padding-left:15px;}
.agree_txt{display:none;}
.view_indetail{
	font-size:0.6em;
	color:#8f8f8f;
	text-decoration:underline;
	position:absolute;
   	right:15px; 
}
.agree_article ~ .btn-secondary{margin:30px 0;}
</style>

<script>
$(function(){
	//회원가입 유효성 검사
	$(document).on("submit", "#joinFrm", function(){
		//아이디 검사		
		 var reg = /^[a-zA-Z]{1}[a-zA-Z0-9]{3,19}$/; 
		if($("#userid").val()==""){
			alert("아이디를 입력해주세요.");
			return false;   
		}
		if(!reg.test($("#userid").val())){ 
			alert("아이디의 첫번째 문자는 반드시 영문자이며, 4~20자의 숫자, 영문 대소문자만 입력해주세요.");
			return false;
		}
		if( $("#idStatus").val()=="N" ){
			alert("아이디 중복확인을 진행해주세요.");
			return false;
		}

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
		if($("#usermail").val()==""){
			alert("이메일을 입력해주세요.");
			return false; 
		}
		
		//휴대전화 검사
		var reg = /^01[0|1|6|7|8|9][0-9]{7,8}$/;
		//var reg = /^(010|011|016|017|018|019)[1][0-9]{9,10}$/;
		/*
		if($("#code").val()=="이동통신사"){
			alert("이동통신사를 선택해주세요.");
			return false;  
		}else*/if($("#usertel").val()==""){
			alert("휴대전화번호를 입력해주세요.");
			return false;  
		}else if(!reg.test($("#usertel").val())){			
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
		
		//약관동의
		if($("#checkAll").prop("checked")==false){
			alert("약관동의 전체동의 체크는 필수입니다.");
			return false;
		}

		return true;
	});//////////#joinFrm 유효성검사

	
	//아이디 중복검사
	$("#idChk").click(function(){		
		var url = "/bitcamp/idChk";
		var params = "userid="+$('#userid').val();  // userid=hong
		
		console.log(params);
		
		$.ajax({
			type : "POST",
			url : url,
			data : params,
			success : function(result){
				console.log(result);
				if(result=="Y"){
					$("#idStatus").val("Y");
					alert("사용할 수 있는 아이디입니다.");
				}else if(result=='N'){
					$("#idStatus").val("N");
					alert("사용할 수 있는 아이디입니다.");
				}
			},
			error : function(e){
				console.log(e.status);
				console.log(e.responseText);
			}
			
		});

	});
	
	//아이디 중복확인 버튼 활성화
	$(document).on("keyup", "#userid", function(){		
		$("#idChk").attr("disabled",false);
	});

	//전체동의 체크박스
	$("#checkAll").change(function(){  
		$(".agree_article .form-check-label >input").prop("checked",this.checked);
	});
		
	//약관동의 상세보기 //토글로 바꾸자
	$(".view_indetail").on("click",function(){
		$(".agree_txt").css("display","block");
	});
});//jquery

/*
//휴대전화_이동통신사
function codeOption(){
	var tagOption=["이동통신사", "SKT", "KT", "LGU+", "알뜰폰"];    
	var tag="";
	for(i=0; i<tagOption.length; i++){
		tag += "<option value='"+tagOption[i]+"'+>" +tagOption[i] +"</option>";
	}
	document.getElementById("code").innerHTML = tag;
}

//휴대전화_자동 커서 이동
function cursorMove3(str) {
	if(str!="이동통신사"){
		document.getElementById("tel").focus();	
	}
}
*/

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
<div id="resultData"></div>
<div class="wrap">
	<div class="container p-3 my-3 bg-dark text-white title">
  	<h1>회원가입</h1>
 	 <p>반갑습니다! 지금 바로 THEBITCAMP 회원이 되어보세요!</p>
	</div>

	<div class="container join">
		<form method="post" id="joinFrm" name="joinFrm" action="/bitcamp/joinOk">
			<div class="form-group input-group">
				<label for="userid" class="lbl_userid">아이디</label> 
				<input type="text" class="form-control" id="userid" placeholder="첫번째 문자는 반드시 영문자이며, 4~20자의 숫자, 영문 대소문자만 허용" name="userid" maxlength="20"> 
				<div class="input-group-append">
					<button type="button" id="idChk" class="btn btn-secondary" disabled>중복확인</button> 
				</div>
				<!-- 아이디 중복검사 여부 설정 --> 
				<input type="hidden" id="idStatus" value="N"/>
			</div>
	
			<div class="form-group">
				<label for="userpwd">비밀번호</label> 
				<input type="password" class="form-control" id="userpwd" placeholder="8~20자의 최소 하나의 숫자, 영문 대소문자, 특수문자 조합" name="userpwd" maxlength="20">
			</div>
			<div class="form-group">
				<label for="pwdChk">비밀번호 재확인</label> 
				<input type="password" class="form-control" id="pwdChk" placeholder="비밀번호 확인" name="pwdChk" maxlength="20">
			</div>
	
			<div class="form-group">
				<label for="text">이름</label> 
				<input type="text" class="form-control" id="username" placeholder="이름" name="username" maxlength="20">
			</div>
			
			<div class="form-group">
				<label for="eamil" class="lbl_email">이메일</label> 
				<input type="email" class="form-control" id="usermail" placeholder="이메일 주소" name="usermail"> 
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
			
			<div class="agree_tit"><strong>약관동의</strong></div>
			<div class="agree_article">
				<div class="form-check">
			    	<label class="form-check-label" for="checkAll">
			        	<input type="checkbox" class="form-check-input" id="checkAll" name="option1" value="전체동의">전체동의
			      	</label>
			    </div>
			    <div class="form-check">
		        	<label class="form-check-label" for="check1">
		        		<input type="checkbox" class="form-check-input" id="check1" name="option2" value="개인회원 약관에 동의">개인회원 약관에 동의
		      		</label>
		      		<a href="#" class="view_indetail" target="_blank">상세보기</a>
		      		<div class="agree_txt">
		      			<textarea rows="5" cols="73" readonly></textarea>
		      		</div>
			    </div>
			    <div class="form-check">
		        	<label class="form-check-label" for="check2">
		        		<input type="checkbox" class="form-check-input" id="check2" name="option3" value="개인정보 수집 및 이용에 동의">개인정보 수집 및 이용에 동의
		      		</label>
		      		<a href="#" class="view_indetail" target="_blank">상세보기</a>
			    </div>
				<div class="form-check">
		        	<label class="form-check-label" for="check3">
		        		<input type="checkbox" class="form-check-input" id="check3" name="option4" value="개인정보 제 3자 제공 및 위탁사항 이용약관">개인정보 제 3자 제공 및 위탁사항 이용약관
		      		</label>
		      		<a href="#" class="view_indetail" target="_blank">상세보기</a>
			    </div>
			</div>
			
			<button type="submit" class="btn btn-secondary btn-block">가입하기</button>
		</form>
	</div>
</div>		
