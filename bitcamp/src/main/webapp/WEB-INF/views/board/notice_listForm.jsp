<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/notice_listForm.css" type = "text/css">
<script>
	function formDelete(){
		if(confirm("삭제하시겠습니까?")){
			location.href = "/bitcamp/notice_delForm?no=" + ${list.notice_no};
		}
	}
</script>
<div class = "container" id = "notice_listFormBody">
	<div id = "nLink"><a href = "/bitcamp/">홈</a>&nbsp;>&nbsp;<span>공지사항</span></div>
	<div id = "nTitle"><span>공지사항</span><span>&nbsp;&nbsp;|&nbsp;&nbsp;공지사항입니다.</span></div>
	<ul id = "boardCate">
		<li onclick = "location.href = '/bitcamp/boardNotice'">공지사항</li>
		<li onclick = "location.href = '/bitcamp/boardEnquiry'">고객문의</li>
		<li onclick = "location.href = '/bitcamp/boardReview'">상품후기</li>
	</ul>
	<div style = "width : 1400px; height : 20px; float : left;"></div>
	<ul id = "listForm">
		<li>제목</li>
		<li>${list.notice_subject}</li>
		<li>작성자</li>
		<li>관리자</li>
		<li>작성날짜 : ${list.notice_writedate}&emsp;&emsp;&emsp;조회수 : ${list.notice_hit}<hr>${list.notice_content}</li>
	</ul>
	<div id = "boardGo">
		<button onclick = "location.href = '/bitcamp/boardNotice';">목록</button>
		<div class = "boardGo_right">
			<button class = "boardList_edit" onclick = "location.href = '/bitcamp/notice_editForm?no=${list.notice_no}';">수정</button>
			<button class = "boardList_del" onclick = "formDelete();">삭제</button>
		</div>
	</div>
	<div id = "listMove">
		<ul>
			<li>▲&emsp;이전글</li>
			<li>이전글이다</li>
			<li>▼&emsp;다음글</li>
			<li>다음글이다</li>
		</ul>
	</div>
</div>