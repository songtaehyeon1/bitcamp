<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/notice_editForm.css" type = "text/css">
<script>
// 목록, 취소 버튼
function goboard(){
	if(confirm("작성한 내용이 적용되지 않습니다.")){
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
	<form method = "post" action = "/bitcamp/notice_editOk">
		<ul id = "writeForm">
			<li>제목</li>
			<li><input type = "text" id = "subject" name = "subject"></li>
			<li>
				<textarea id = "content" name = "content"></textarea>
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