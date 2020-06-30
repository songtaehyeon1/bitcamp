<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/review.css" type = "text/css">
<script>
	$(function(){
		$("#review_write").submit(function(){
			var userid = "${userid}";
			var adminStatus = "${adminStatus}";
			if(adminStatus != "Y" && (userid == null || userid == "")){
				alert("로그인 후 글 작성이 가능합니다.");
				location.href = "/bitcamp/loginFrm";
				return false;
			}
		});
	});
</script>
<div class = "container" id = "reviewBody">
	<div id = "nLink"><a href = "/bitcamp/">홈</a>&nbsp;>&nbsp;<span>상품후기</span></div>
	<div id = "nTitle"><span>상품후기</span><span id = "sss">&nbsp;&nbsp;|&nbsp;&nbsp;대여금액 100,000원 이상 , 직접 설치한 장비와 캠핑모습을 담은 사진 3장 이상으로 캠핑후기를 작성해주시면 캐시백 10,000원을 드립니다. 내용에 맞지 않는 게시물은 관리자의 권한으로 삭제합니다.</span></div>
	<ul id = "boardCate">
		<li onclick = "location.href = '/bitcamp/boardNotice'">공지사항</li>
		<li onclick = "location.href = '/bitcamp/boardEnquiry'">고객문의</li>
		<li onclick = "location.href = '/bitcamp/boardReview'">상품후기</li>
	</ul>
	<div style = "width : 1400px; height : 20px; float : left;"></div>
	<ul id = "list">
		<li>번호</li>
		<li>상품정보</li>
		<li>제목</li>
		<li>작성자</li>
		<li>작성일</li>
		<li>조회수</li>
		<li>추천</li>
		<li>평점</li>
		<c:if test = "${list != null && list != ''}">
			<c:forEach var = "list" items = "${list}">
				<li>${list.review_no}</li>
				<li><img src = "/bitcamp/resources/product/${list.p_filename1}" alt = ""><span>${list.p_name}</span></li>
				<li onclick = "location.href = '/bitcamp/review_listForm?no=${list.review_no}';" class = "pointer wordCut">${list.review_subject}</li>
				<li>${list.userid}</li>
				<li>${list.review_writedate}</li>
				<li>${list.review_hit}</li>
				<li>${list.review_recommend}</li>
				<li>${list.review_rating}</li>
			</c:forEach>
		</c:if>
		<c:if test = "${list == null || list == '[]' || list == ''}">
			<li style = "width : 1400px; height : 200px; line-height : 200px; border-right : 1px solid black;">상품후기가 없습니다.</li>
		</c:if>
	</ul>
	<div id = "wsDiv">
		<form method = "post">
			<div id = "search">
				<select id = "searchList" name = "searchKey">
					<option value = "title">제목</option>
					<option value = "content">내용</option>
					<option value = "id">아이디</option>
				</select>
				<input type = "text" id = "searchText" name = "searchWord">
				<input type = "submit" id = "searchBtn" value = "찾기">
			</div>
		</form>
		<form method = "post" action = "/bitcamp/review_writeForm" id = "review_write">
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