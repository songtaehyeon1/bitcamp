<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/review_listForm.css" type = "text/css">
<script>
	$(function(){
		$('.content').on("keydown keyup", function (e){
			var content = $(this).val();
			if(content.length > 3000){
				var str = $(this).val().substring(0, 3000);
				$(this).val(str);
				alert("3000글자 제한");
				$('.count').html('3000/3000');
				return false;
			}
			$(this).height(1).height($(this).prop('scrollHeight') + 12);
			$('.count').html(content.length + '/3000');
		});
	});
</script>
<div class = "container" id = "review_listFormBody">
	<div id = "nLink"><a href = "/bitcamp/">홈</a>&nbsp;>&nbsp;<span>상품후기</span></div>
	<div id = "nTitle"><span>상품후기</span><span id = "sss">&nbsp;&nbsp;|&nbsp;&nbsp;대여금액 100,000원 이상 , 직접 설치한 장비와 캠핑모습을 담은 사진 3장 이상으로 캠핑후기를 작성해주시면 캐시백 10,000원을 드립니다. 내용에 맞지 않는 게시물은 관리자의 권한으로 삭제합니다.</span></div>
	<ul id = "boardCate">
		<li onclick = "location.href = '/bitcamp/boardNotice'">공지사항</li>
		<li onclick = "location.href = '/bitcamp/boardEnquiry'">고객문의</li>
		<li onclick = "location.href = '/bitcamp/boardReview'">상품후기</li>
	</ul>
	<div style = "width : 1400px; height : 20px; float : left;"></div>
	<div id = "goods">
		<img src = "/bitcamp/img/상품1.png">
		<span>상품명</span>
		<span>20,000원</span>
		<button onclick = "location.href = '#'">상품상세보기</button>
	</div>
	<div style = "width : 1400px; height : 20px; float : left;"></div>
	<ul id = "listForm">
		<li>제목</li>
		<li>title</li>
		<li>작성자</li>
		<li>id</li>
		<li>평점&emsp;&emsp;&emsp;작성일&emsp;&emsp;&emsp;추천&emsp;&emsp;&emsp;조회수<hr>내용</li>
		<li>첨부파일</li>
		<li><span>asdasd.jpg</span><span>awewgewg.png</span><span>wkjgbwekew.jpg</span><span>ajsdnajdaldnsa.jpg</span><span>akjdsnsaljdnsadasd.png</span></li>
	</ul>
	<div id = "boardGo">
		<button onclick = "location.href = '/bitcamp/boardReview';">목록</button>
		<div class = "boardGo_right">
			<button class = "boardList_edit" onclick = "location.href = '/bitcamp/review_editForm';">수정</button>
			<button class = "boardList_del">삭제</button>
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
	<div id = "replyForm">
		<div id = "replyForm_above">
			<span>아이디</span>
			<span class = "count">0/3000</span>
		</div>
		<div>
			<textarea class = "autoHeight content"></textarea>
		</div>
		<div>
			<button id = "replyBtn">확인</button>
		</div>
	</div>
	<hr style = "border : 1px solid #EAEAEA; width : 1400px; float : left;">
	<div id = "reply">
		<div>
			<span class = "reply_span1">아이디</span>
			<span>작성날짜</span>
		</div>
		<div class = "reply_content">
			글내용
			<div class = "reply_right">
				<button class = "reply_edit">수정</button>
				<button class = "reply_del">삭제</button>
			</div>
		</div>
		<div>
		</div>
		<hr style = "border : 1px solid #EAEAEA; width : 1400px;">
	</div>
</div>
</body>
</html>