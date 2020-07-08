<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/member/join.css"/>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원가입</title>

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
		if($("#useremail").val()==""){
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
		if($("#userzipcode").val()=="" &&  $("#useraddr").val()=="" && $("#useraddrdetail").val()==""){
			alert("주소를 입력해주세요.");
			return false; 
		}
		if($("#userzipcode").val()==""){
			alert("우편번호 검색을 진행해주세요.");
			return false;   
		}
		
		//약관동의
		if($("#check1").prop("checked")==false && $("#check2").prop("checked")==false || $("#check1").prop("checked")==false || $("#check2").prop("checked")==false){
			alert("약관동의 필수 항목 체크를 확인해주세요.");
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
					
					//아이디 중복확인 후 아이디 수정 금지
					$("#userid").on('keyup', function() {
						$("#idStatus").val("N");
						$("#idChk").attr('disabled', true);
					});	
				}else if(result=='N'){
					$("#idStatus").val("N");
					alert("사용할 수 없는 아이디입니다.");
				}
			},
			error : function(e){
				console.log(e.status);
				console.log(e.responseText);
			}
			
		});

	});
	
	//아이디 중복확인 버튼 비활성화  → 활성화
	$(document).on("keyup", "#userid", function(){	
		var reg = /^[a-zA-Z]{1}[a-zA-Z0-9]{3,19}$/;
		if(reg.test($("#userid").val())){
			$("#warning").css("display","none");
			$("#idChk").attr("disabled",false);  //버튼 활성화
		}else if(!reg.test($("#userid").val())){
			$("#warning").css("display","block");
			$("#idChk").attr("disabled",true);	
		}
	});

	//전체동의 체크박스 선택 및 해제
	$("#checkAll").change(function(){  
		$(".agree_article .form-check-label >input").prop("checked",this.checked);
	});
	
	$("#check1, #check2, #check3").click(function(){
		if($("#check1").is(":checked")==true && $("#check2").is(":checked")==true && $("#check3").is(":checked")==true){
			$("#checkAll").prop("checked", true);  //전체동의 체크박스 선택
		}else{
			$("#checkAll").prop("checked", false);  //전체동의 체크박스 해제
		}
	});
	
	//약관동의 상세보기 
	$(".view_indetail").click(function(){
		$(this).next().toggleClass("txt_div");
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
			jQuery("#userzipcode").val(data.zonecode);
			jQuery("#useraddr").val(data.address);
			jQuery("#useraddrdetail").focus();
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
				<small><code id="warning">아이디의 첫번째 문자는 반드시 영문자이며, 4~20자의 숫자, 영문 대소문자만 입력해주세요.</code></small> 
				<input type="text" class="form-control" id="userid" placeholder="첫번째 문자는 반드시 영문자이며, 4~20자의 숫자, 영문 대소문자만 허용" name="userid" maxlength="20" autofocus> 
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
				<input type="text" class="form-control" id="userzipcode" placeholder="우편번호" name="userzipcode" readonly>
				<div>
					<button class="btn btn-secondary searchAddr" type="button" onclick="openDaumZipAddress();">우편번호 검색</button>
				</div>
			</div>
			
			<div class="form-group">
				<input type="text" class="form-control" id="useraddr" placeholder="주소" name="useraddr" readonly>
				<input type="text" class="form-control" id="useraddrdetail" placeholder="상세주소" name="useraddrdetail">
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
		        		<input type="checkbox" class="form-check-input" id="check1" name="option2" value="[필수] 이용약관 동의">[필수] 이용약관 동의
		      		</label>
		      		<span class="view_indetail">상세보기</span>
		      		<div class="agree_txt">
		      		<pre>
제1조(목적)
이 약관은 OO 회사(전자상거래 사업자)가 운영하는 OO 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리?의무 및 책임사항을 규정함을 목적으로 합니다.

※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」

제2조(정의)
①“몰” 이란 OO 회사가 재화 또는 용역(이하 “재화등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.

②“이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.

③ ‘회원’이라 함은 “몰”에 개인정보를 제공하여 회원등록을 한 자로서, “몰”의 정보를 지속적으로 제공받으며, “몰”이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.

④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.

제3조 (약관등의 명시와 설명 및 개정)
① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호?모사전송번호?전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.

② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회?배송책임?환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.

③ “몰”은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.

④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다.
다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.

⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 ‘몰“에 송신하여 ”몰“의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.

⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률, 공정거래위원회가 정하는 전자상거래등에서의소비자보호지침 및 관계법령 또는 상관례에 따릅니다.
		      		</pre>
		      		</div>
			    </div>
			    <div class="form-check">
		        	<label class="form-check-label" for="check2">
		        		<input type="checkbox" class="form-check-input" id="check2" name="option3" value="[필수] 개인정보 수집 및 이용 동의">[필수] 개인정보 수집 및 이용 동의
		      		</label>
		      		<span class="view_indetail">상세보기</span>
      				<div class="agree_txt">
	      			</div>
			    </div>
				<div class="form-check">
		        	<label class="form-check-label" for="check3">
		        		<input type="checkbox" class="form-check-input" id="check3" name="option4" value="[선택] 쇼핑정보 수신 동의">[선택] 쇼핑정보 수신 동의
		      		</label>
		      		<span class="view_indetail">상세보기</span>
	      			<div class="agree_txt">
	      				<pre>
할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS나 이메일로 받아보실 수 있습니다.

단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.

선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.
	      				</pre>
	      			</div>
			    </div>
			</div>
			
			<button type="submit" class="btn btn-secondary btn-block">가입하기</button>
		</form>
	</div>
</div>		
