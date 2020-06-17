<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/review_editForm.css" type = "text/css">
<script src = "/bitcamp/editor/ckeditor/ckeditor.js"></script>
<script>
	$(function(){
		CKEDITOR.replace("content");
		CKEDITOR.config.resize_enabled = false;
		CKEDITOR.config.height = 400;
		
		// CKEDITOR.instances.content.getData();
		
		// 평점 클릭시 이벤트
		$(".star").on('click',function(){
			var idx = $(this).index();
			$(".star").removeClass("on");
			for(var i=0; i<=idx; i++){
		    	$(".star").eq(i).addClass("on");
			}
		});
		// 평점 누른 갯수(나누기 2해야됨)
		//console.log($(".on").length / 2);
	});
	
	// 목록, 취소 버튼
	function goboard(){
		if(confirm("작성한 내용이 적용되지 않습니다.")){
			location.href = '/bitcamp/boardReview';
		}
	}
</script>
<div class = "container" id = "review_writeForm">
	<div id = "nLink"><a href = "/bitcamp/">홈</a>&nbsp;>&nbsp;<span>상품후기</span></div>
	<div id = "nTitle"><span>상품후기</span><span id = "sss">&nbsp;&nbsp;|&nbsp;&nbsp;대여금액 100,000원 이상 , 직접 설치한 장비와 캠핑모습을 담은 사진 3장 이상으로 캠핑후기를 작성해주시면 캐시백 10,000원을 드립니다. 내용에 맞지 않는 게시물은 관리자의 권한으로 삭제합니다.</span></div>
	<ul id = "boardCate">
		<li onclick = "location.href = '/bitcamp/boardNotice'">공지사항</li>
		<li onclick = "location.href = '/bitcamp/boardEnquiry'">고객문의</li>
		<li onclick = "location.href = '/bitcamp/boardReview'">상품후기</li>
	</ul>
	<div style = "width : 1400px; height : 20px; float : left;"></div>
	<form method = "post" action = "/bitcamp/review_editOk">
		<ul id = "writeForm">
			<li>상품</li>
			<li id = "goodsSelect">
				<select id = "goodsSelect1">
					<option>-</option>
					<option>2</option>
					<option>3</option>
				</select>
				<select id = "goodsSelect2">
					<option>-</option>
					<option>2</option>
					<option>3</option>
				</select>
			</li>
			<li>제목</li>
			<li id = "titleSelect">
				<select id = "titleSelect1">
					<option>궁금합니다</option>
					<option>반납관련 문의</option>
					<option>배송관련 문의</option>
					<option>장비관련 문의</option>
					<option>예약취소 관련 문의</option>
					<option>단체대여 관련 문의</option>
					<option>기타 문의</option>
				</select>
			</li>
			<li>평점</li>
			<li id = "star">
				<div class="star-box">
					<span class="star star_left on"></span>
					<span class="star star_right on"></span>
					
					<span class="star star_left"></span>
					<span class="star star_right"></span>
					
					<span class="star star_left"></span>
					<span class="star star_right"></span>
					
					<span class="star star_left"></span>
					<span class="star star_right"></span>
					
					<span class="star star_left"></span>
					<span class="star star_right"></span>
				</div>
			</li>
			<li>
				<textarea name = "content" id = "content"></textarea>
			</li>
			<li>첨부파일1</li>
			<li>
				<input type = "file" name = "filename1">
			</li>
			<li>첨부파일2</li>
			<li>
				<input type = "file" name = "filename2">
			</li>
			<li>첨부파일3</li>
			<li>
				<input type = "file" name = "filename3">
			</li>
			<li>첨부파일4</li>
			<li>
				<input type = "file" name = "filename4">
			</li>
			<li>첨부파일5</li>
			<li>
				<input type = "file" name = "filename5">
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