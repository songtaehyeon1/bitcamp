<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/member/infoEdit.css"/>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<c:if test="${result>0}">
	<script>
		alert("회원정보 수정이 완료되었습니다.");   
		location.href="/bitcamp/";
	</script>
</c:if>

<c:if test="${result<=0}">
	<script>
		alert("회원정보 수정에 실패하였습니다. 다시 시도해주세요.");   
		location.href="/bitcamp/infoEditFrm";
	</script>
</c:if>

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
	$(document).on("submit","#infoFrm",function(){
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
		
		//이메일 검사	
		if($("#useremail").val()==""){
			alert("이메일을 입력해주세요.");
			return false; 
		}
		if($("#emailChkResult").val()=="no"){
			alert("이메일 인증요청을 진행해 주세요");
			return false; 
		}
	
		//휴대전화 검사
		var reg = /^01[0|1|6|7|8|9][0-9]{7,8}$/;
		//var reg = /^(010|011|016|017|018|019)[1][0-9]{9,10}$/;
		/*if($("#code").val()=="이동통신사"){
			alert("이동통신사를 선택해주세요.");
			return false;  
		}else*/ if($("#usertel").val()==""){
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
		if($("#userzipcode").val()=="" &&  $("#useraddr").val()=="월" && $("#useraddrdetail").val()==""){
			alert("주소를 입력해주세요.");
			return false; 
		}
		if($("#userzipcode").val()==""){
			alert("우편번호 검색을 진행해주세요.");
			return false;   
		}

		return true;
	});  //infoFrm 유효성 검사
	
	//ajax로 이메일 보내기(네이버 이용)
	//이메일 인증
	function userEmail(url, params, msg1, msg2){
		$.ajax({
			type : "POST",
			url : url,
			data : params,
			success : function(result){
				console.log("result=" +result);
				
				if(result=='N'){     //이메일 사용 불가(중복 이메일)
					alert(msg2);
					$("#caution").css("display","block");					
				}else if(result=="Y"){     //이메일 인증코드 전송 성공
					alert(msg1);
					//이메일 인증코드 입력창 비활성화 → 활성화
					$("#email_code").attr('disabled', false); 
				}else if(result=='yes'){     //이메일 인증확인 성공
					$("#emailChkResult").val("yes");
					alert(msg1);
					//이메일 인증코드 입력창, 인증확인 버튼 활성화 → 비활성화
					$("#email_code").attr('disabled', true);
					$(".emailCodeChk").attr('disabled', true); 
				}else if(result=='no'){     //이메일 인증확인 실패
					alert(msg2);
				}
			},
			error : function(){
				console.log("이메일 인증 에러...");
			}
		});
	}

	//이메일 인증요청 클릭 시 (이메일 인증코드 받기)
	$(".emailCheck").click(function(){
		$("#emailChkResult").val("no");
		//이메일(아이디) 정규식 검사
		//reg = /^\w{8,20}[@][a-zA-Z]{2,10}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
		if($("#useremail").val()==""){     //이메일 미입력 시
			alert("이메일 주소를 입력해주세요.");
		}/*else if(!reg.test($("#useremail").val())){     //이메일 정규식 불일치 시
			alert("이메일 주소를 잘못 입력하였습니다.");
		}*/else{   
			//이메일 인증코드 받기
			var url ="<%=request.getContextPath()%>/mailChk";
		
			//폼의 데이터를 직렬화 시키기
			var params = "useremail="+$("#useremail").val();
			var msg1 = "해당 이메일 주소로 인증코드를 전송하였습니다.";
			var msg2 = "이미 가입된 이메일 주소입니다.";
			userEmail(url, params, msg1, msg2);
		}
	});
	
	//이메일 인증요청 버튼 비활성화 → 활성화
	$(document).on("keyup paste","#useremail",function(){
		$(".emailCheck").attr("disabled", false);
		if($("#useremailchk").val()==$("#useremail").val()){  //이메일 수정을 안했을 경우
			$("#emailChkResult").val("yes");
		}else{  //이메일 수정을 했을 경우
			$("#emailChkResult").val("no");
		}
	});
	
	//이메일 인증요청 실패 (사용할 수 없는 이메일)
	$("#useremail").on('keyup', function() {
		$("#caution").css("display","none");
	});	
	
	//이메일 인증코드 입력값 인증확인 
	$("#email_code").on("keyup paste",function(){
		//인증확인 버튼 비활성화 → 활성화
		$(".emailCodeChk").attr('disabled', false);
	});

	//이메일 인증하기
	$(document).on('click','.emailCodeChk',function(){			
		var url = "<%=request.getContextPath()%>/mailcodeChk";
			
		//폼의 데이터를 직렬화 시키기
		var params = "email_code="+$("#email_code").val(); 
		console.log("params="+params)
		var msg1 = "이메일 인증이 완료되었습니다.";
		var msg2 = "이메일 인증에 실패하였습니다.";
		userEmail(url, params, msg1, msg2);
	});  
	//////////ajax로 이메일 보내기(네이버 이용) 끝
	
});

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

<div class="wrap">
	<div class="container p-3 my-3 bg-dark text-white title">
  	<h1>회원정보 수정</h1>
  	<p>회원님의 정보를 수정·확인하실 수 있습니다.</p>
	</div>

	<div class="container">
		<div class="content">
			<form method="post" id="infoFrm" name="infoFrm" action="/bitcamp/infoEditOk">
				<div class="form-group">
					<label for="userid" class="lbl_userid">아이디</label> 
					<div><strong>${vo.userid}</strong></div>
				</div>
	
				<div class="form-group">
					<label for="userpwd">신규 비밀번호</label> 
					<input type="password" class="form-control" id="userpwd" placeholder="6~16자의 영문 대소문자, 숫자, 특수문자 중 2가지 이상 조합" name="userpwd" maxlength="20" autofocus>
				</div>
				<div class="form-group">
					<label for="pwdChk">신규 비밀번호 재확인</label> 
					<input type="password" class="form-control" id="pwdChk" placeholder="비밀번호 확인" name="pwdChk" maxlength="20">
				</div>
		
				<div class="form-group">
					<label for="text">이름</label> 
					<div><strong>${vo.username}</strong></div>
				</div>
				
				<div class="form-group input-group">
					<label for="useremail" class="lbl_email">이메일</label> 
					<small><code id="caution">사용 할 수 없는 이메일 주소입니다.</code></small>
					<input type="email" class="form-control" id="useremail" placeholder="이메일 주소" name="useremail" value="${vo.useremail}"/> 
					<input type="hidden" id="useremailchk" value="${vo.useremail}"/>
					<div class="input-group-append">
						<button class="btn btn-outline-secondary emailCheck" type="button" disabled>인증요청</button>
					</div>
				</div>
		
				<div class="form-group input-group">
					<label for="email_code" class="lbl_email">이메일 인증코드</label>
					<small>메일함을 확인하여 이메일 인증코드를 입력해주세요.</small>
					<input type="text" class="form-control" id="email_code" placeholder="인증코드" name="email_code" disabled>
					<!-- 이메일 인증확인 여부 설정 -->
					<input type="hidden" id="emailChkResult" name="emailChkResult" value="yes"/>
					<div class="input-group-append">
						<button class="btn btn-secondary emailCodeChk" type="button" disabled>인증확인</button>
					</div>
				</div>
				
				<div class="form-group input-group">
				<label for="tel" class="lbl_tel">휴대전화</label>
					<!--
					<select class="form-control col-sm-4" id="code" name="code" onchange="cursorMove3(this.value)">
					</select>
					 -->
					<input type="tel" class="form-control" id="usertel" placeholder="'-'없이 숫자만 입력" name="usertel" maxlength="13" value="${vo.usertel}">
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
					<input type="text" class="form-control" id="userzipcode" placeholder="우편번호" name="userzipcode" readonly value="${vo.userzipcode}">
					<div>
						<button class="btn btn-secondary searchAddr" type="button" onclick="openDaumZipAddress();">우편번호 검색</button>
					</div>
				</div>
				
				<div class="form-group">
					<input type="text" class="form-control" id="useraddr" placeholder="주소" name="useraddr" readonly value="${vo.useraddr}">
					<input type="text" class="form-control" id="useraddrdetail" placeholder="상세주소" name="useraddrdetail" value="${vo.useraddrdetail}">
				</div>
				
				<span>
					<button type="submit" class="btn btn-secondary btn-lg btnModify">수정하기</button>
					<button type="button" class="btn btn-outline-secondary btn-lg btnCancel"  onclick="location.href='/bitcamp'">취소</button>
				</span>
			</form>
		</div>
	</div>
</div>