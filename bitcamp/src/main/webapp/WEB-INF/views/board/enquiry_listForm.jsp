<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/enquiry_listForm.css" type = "text/css">
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
		
		$(".reply_edit").click(function(){
			$(this).parent().parent().parent().parent().append("<div id = 'replyForm'>" +
															"<div id = 'replyForm_above'>" +
																"<span>아이디</span>" +
																"<span class = 'count'>0/3000</span>" +
															"</div>" +
															"<div>" +
																"<textarea class = 'autoHeight content'></textarea>" +
															"</div>" +
															"<div>" +
																"<button id = 'replyBtn'>확인</button>" +
															"</div>" +
														"</div>" +
														"<hr style = 'border : 1px solid #EAEAEA; width : 1400px; float : left;'>");
			$(this).parent().parent().parent().remove();
		});
	});
</script>
<div class = "container" id = "enquiry_listFormBody">
	<div id = "nLink"><a href = "/bitcamp/">홈</a>&nbsp;>&nbsp;<span>고객문의</span></div>
	<div id = "nTitle"><span>고객문의</span><span>&nbsp;&nbsp;|&nbsp;&nbsp;궁금하신 질문을 올려주세요 성심껏 답변해드리겠습니다. 게시판의 내용과 맞지 않는 글은 자동삭제됩니다.</span></div>
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
		<!-- <button onclick = "location.href = '#'">상품상세보기</button> -->
	</div>
	<div style = "width : 1400px; height : 20px; float : left;"></div>
	<ul id = "listForm">
		<li>제목</li>
		<li>title</li>
		<li>작성자</li>
		<li>id</li>
		<li>asdasd</li>
	</ul>
	<div id = "boardGo">
		<button onclick = "location.href = '/bitcamp/boardEnquiry';">목록</button>
		<div class = "boardGo_right">
			<button class = "boardList_edit" onclick = "location.href = '/bitcamp/enquiry_editForm';">수정</button>
			<button class = "boardList_del">삭제</button>
		</div>
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
	<div>
		<div id = "reply">
			<div>
				<span class = "reply_span1">아이디1</span>
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
		<div id = "reply">
			<div>
				<span class = "reply_span1">아이디2</span>
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
</div>