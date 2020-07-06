<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/member/boardManage.css" type = "text/css">
<div style = "width : 100%; height : 200px;"></div>
<div class = "container">
	<h2>게시물 관리</h2>
	<hr>
	<div id = "mypage_boardManage_main">
		<ul>
			<li>번호</li>
			<li>분류</li>
			<li>제목</li>
			<li>작성자</li>
			<li>작성일</li>
			<li>조회</li>
			<c:forEach var = "list" items = "${eList}">
				<li>${list.enquiry_no}</li>
				<li>고객문의</li>
				<li class = "wordCut pointer" onclick = "location.href = '/bitcamp/enquiry_listForm?no=${list.enquiry_no}&pageNum=1&enquiry_secret=${list.enquiry_secret}&userid=${list.userid}'">${list.enquiry_subject}<c:if test = "${list.enquiry_secret == 'N'}">&nbsp;<img src = "/bitcamp/resources/board/lock.png"></c:if></li>
				<li>${list.userid}</li>
				<li>${list.enquiry_writedate}</li>
				<li>${list.enquiry_hit}</li>
			</c:forEach>
			<c:forEach var = "list" items = "${rList}">
				<li>${list.review_no}</li>
				<li>상품후기</li>
				<li onclick = "location.href = '/bitcamp/review_listForm?no=${list.review_no}&pageNum=1';" class = "pointer wordCut">${list.review_subject}</li>
				<li>${list.userid}</li>
				<li>${list.review_writedate}</li>
				<li>${list.review_hit}</li>
			</c:forEach>
			<c:if test = "${eList == '[]' && rList == '[]'}">
				<div id = "nothing_boardManage">등록된 게시물이 없습니다.</div>
			</c:if>
		</ul>
	</div>
	<button class = "mypageWishList_main_btn" onclick = "location.href = '/bitcamp/mypage';">목록으로</button>
</div>