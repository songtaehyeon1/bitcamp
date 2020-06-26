<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>로그인</title>

<style>
a{text-decoration:none;}
a:hover{text-decoration:none;}
.container{
	width:500px;
	background-color:#fff;
	border:1px solid #DDD;
	padding:50px;
	margin-top:10%;
}
.container>h2{
	text-align:center;
	margin-bottom:50px;
}
.btn{
	width:400px;
	margin:20px 0;
}
.info>span{
	float:right;
	
}
.info span, .info span a{
	color: #757575;
}
</style>

<script>
$(function(){
	$("#logFrm").submit(function(){
		//이메일(아이디) 검사
		if($("#userid").val()==""){     
			alert("아이디를 입력해주세요.");
			return false;
		}	
		//비밀번호 검사
		if($("#userpwd").val()==""){
			alert("비밀번호를 입력해주세요.");
			return false;
		}
	});
	//////////////////////////////////////////////////
	
	//쿠키저장(setCookie)
	//                 쿠키이름, 쿠키에 넣을 값, 만료일(일 단위)
	function setCookie(cookieName, value, exdays){
		var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	   
	//쿠키 삭제(cookieName)
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	   
	//쿠키 불러오기(getCookie)
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
	//아이디 저장
	//저장된 쿠기값을 가져와서 ID 입력 칸에 넣어준다.
  	// var userInputId = getCookie("id_cookie");  
    $("#userid").val(getCookie("id_cookie")); 
     
    if($("#userid").val() != ""){  //이전에 이미 ID 저장하기를 해서 처음 페이지 로딩 시, ID 입력 칸에 출력된 ID가 있는 상태라면
    	$("#saveId").attr("checked", true);  //ID 저장하기를 체크 상태로 두기
    }
     
    $("#saveId").change(function(){  // 체크박스에 변화가 발생시
        if($("#saveId").is(":checked")){  // ID 저장하기 체크했을 때,
            // var userInputId = $("#userid").val();
            setCookie("id_cookie", $("#userid").val(), 7);  // 7일 동안 쿠키 보관
        }else{  // ID 저장하기 체크 해제 시,
            deleteCookie("id_cookie");
        }
    });
     
    //  ID 저장하기가 이미 체크되어 입력칸에 아이디가 출력되어 있는 상태에서 새로 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#userid").keyup(function(){  // ID 입력 칸에 ID를 입력할 때,
        if($("#saveId").is(":checked")){  // ID 저장하기를 체크한 상태라면,
            var userInputId = $("#userid").val();
            setCookie("id_cookie", userInputId, 7); // 7일 동안 쿠키 보관
        }
    }); 
});	
</script>

<div class="container">
	<h2>LOGIN</h2>
	<form id="logFrm" method="post" action="/bitcamp/loginOk">
		<div class="form-group">
			<input type="text" class="form-control" id="userid" name="userid" placeholder="아이디를 입력해주세요" autofocus/>
		</div>
		<div class="form-group">
      		<input type="password" class="form-control" id="userpwd" name="userpwd" placeholder="비밀번호를 입력해주세요"/>
      	</div>
      	<button type="submit" class="btn btn-secondary">로그인</button>
  	</form>
  	
  	<div class="info">
  		<input type="checkbox" id="saveId" name="saveId" value="saveId"/>&nbsp;아이디 저장
  		<span>
  			<a href="/bitcamp/contFindFrm">아이디/비밀번호 찾기</a> 
  			&#124;
  			<a href="/bitcamp/joinFrm">회원가입</a>
  		</span>
  	</div>
</div>


