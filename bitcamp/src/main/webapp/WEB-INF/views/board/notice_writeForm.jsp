<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/notice_writeForm.css" type = "text/css">
<script>
	$(function(){
		$("#write").submit(function(){
			if($("#subject").val() == ""){
				alert("제목을 입력해 주세요.");
				return false;
			}
			if($("#content").val() == ""){
				alert("내용을 입력해 주세요.");
				return false;
			}
		});
		
		$("#subject").on("keydown", function(event){
			if(event.keyCode == 13){
				$("#content").focus();
				return false;
			}
		});
		
		$("#subject").on("keyup", function(event){
			if($(this).val().length > 30){
				alert("제목은 30글자까지 작성할 수 있습니다.");
				$("#subject").val($(this).val().substring(0, 30));
			}
		});
	});
	
	// 목록, 취소 버튼
	function goboard(){
		if($("#subject").val() != "" || $("#content").val() != ""){
			if(confirm("작성한 내용이 사라집니다.")){
				location.href = '/bitcamp/boardNotice';
			}
		}else{
			location.href = '/bitcamp/boardNotice';
		}
	}
</script>
<div class = "container" id = "notice_writeFormBody">
	<div id = "nLink"><a href = "/bitcamp/">홈</a>&nbsp;>&nbsp;<span>공지사항</span></div>
	<div id = "nTitle"><span>공지사항</span><span>&nbsp;&nbsp;|&nbsp;&nbsp;공지사항입니다.</span></div>
	<ul id = "boardCate">
		<li onclick = "location.href = '/bitcamp/boardNotice'">공지사항</li>
		<li onclick = "location.href = '/bitcamp/boardEnquiry'">고객문의</li>
		<li onclick = "location.href = '/bitcamp/boardReview'">상품후기</li>
	</ul>
	<div style = "width : 1400px; height : 20px; float : left;"></div>
	<form method = "post" action = "/bitcamp/notice_writeOk" id = "write">
		<ul id = "writeForm">
			<li>제목</li>
			<li><input type = "text" id = "subject" name = "notice_subject"></li>
			<li>
				<textarea id = "content" name = "notice_content"></textarea>
			</li>
		</ul>
		<div id = "goBtn">
			<input type = "button" value = "목록" onclick = "goboard();">
			<div id = "regiDiv">
				<input type = "submit" value = "등록">
				<input type = "button" value = "취소" onclick = "goboard();">
			</div>
		</div>
	</form>
</div>