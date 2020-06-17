<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/notice.css" type = "text/css">
<div class = "container" id = "noticeBody">
	<div id = "nLink"><a href = "/bitcamp/">홈</a>&nbsp;>&nbsp;<span>공지사항</span></div>
	<div id = "nTitle"><span>공지사항</span><span>&nbsp;&nbsp;|&nbsp;&nbsp;공지사항입니다.</span></div>
	<ul id = "boardCate">
		<li onclick="location.href = '/bitcamp/boardNotice'">공지사항</li>
		<li onclick="location.href = '/bitcamp/boardEnquiry'">고객문의</li>
		<li onclick="location.href = '/bitcamp/boardReview'">상품후기</li>
	</ul>
	<div style = "width : 1400px; height : 20px; float : left;"></div>
	<ul id = "list">
		<li>번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>조회수</li>
		<li>3</li>
		<li><a href = "/bitcamp/notice_listForm">공</a></li>
		<li>홍길동홍길동홍홍</li>
		<li>123</li>
		<li>2</li>
		<li>지</li>
		<li>ㅎ2</li>
		<li>234</li>
		<li>1</li>
		<li>사</li>
		<li>ㅎ3</li>
		<li>345</li>
		<li>1</li>
		<li>항</li>
		<li>ㅎ3</li>
		<li>345</li>
	</ul>
	<div id = "wsDiv">
		<form method = "post">
			<div id = "search">
				<select id = "searchList" name = "searchList">
					<option value = "title">제목</option>
					<option value = "content">내용</option>
					<option value = "id">아이디</option>
				</select>
				<input type = "text" id = "searchText" name = "searchText">
				<input type = "submit" id = "searchBtn" value = "찾기">
			</div>
		</form>
		<form method = "post" action = "/bitcamp/notice_writeForm">
			<div id = "write">
				<input type = "submit" id = "writingBtn" value = "글 쓰기">
			</div>
		</form>
	</div>
	<div style="width : 1400px; clear : left">
		<ul class="pagination justify-content-center">
		    <li class="page-item"><a class="page-link bg-dark text-white" href="javascript:void(0);">&lt;</a></li>
		    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
		    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
		    <li class="page-item"><a class="page-link bg-dark text-white" href="javascript:void(0);">&gt;</a></li>
		</ul>
	</div>
</div>