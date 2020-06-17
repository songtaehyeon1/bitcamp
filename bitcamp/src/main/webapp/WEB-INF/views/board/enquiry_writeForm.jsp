<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/enquiry_writeForm.css" type = "text/css">
<script src = "/bitcamp/editor/ckeditor/ckeditor.js"></script>
<script>
	$(function(){
		CKEDITOR.replace("content", {uiColor : "#ffffff", height : "400px"});
		CKEDITOR.config.resize_enabled = false;
		//CKEDITOR.config.height = 400;
		/*CKEDITOR.editorConfig = function(config) {
			config.resize_dir = 'none';
		};*/
		
		// CKEDITOR.instances.content.getData();
		
		// 뒤로가기 하면 체크된 것들 원래대로
		$("#goodsSelect1 option:nth-of-type(1)").prop("selected", true);
		$("#goodsSelect2 option:nth-of-type(1)").prop("selected", true);
		$("#titleSelect1 option:nth-of-type(1)").prop("selected", true);
		$("#secret").prop("checked", true);
	});
	
	function goboard(){
		if($("#goodsSelect1 option:selected").index() != 0 || $("#goodsSelect2 option:selected").index() != 0 || CKEDITOR.instances.content.getData() != ''){
			if(confirm("작성한 내용이 사라집니다.")){
				location.href = '/bitcamp/boardEnquiry';
			}
		}else{
			location.href = '/bitcamp/boardEnquiry';
		}
	}
</script>
<div class = "container" id = "enquiry_writeFormBody">
	<div id = "nLink"><a href = "/bitcamp/">홈</a>&nbsp;>&nbsp;<span>고객문의</span></div>
	<div id = "nTitle"><span>고객문의</span><span>&nbsp;&nbsp;|&nbsp;&nbsp;궁금하신 질문을 올려주세요 성심껏 답변해드리겠습니다. 게시판의 내용과 맞지 않는 글은 자동삭제됩니다.</span></div>
	<ul id = "boardCate">
		<li onclick = "location.href = '/bitcamp/boardNotice'">공지사항</li>
		<li onclick = "location.href = '/bitcamp/boardEnquiry'">고객문의</li>
		<li onclick = "location.href = '/bitcamp/boardReview'">상품후기</li>
	</ul>
	<div style = "width : 1400px; height : 20px; float : left;"></div>
	<form method = "post" action = "/bitcamp/enquiry_writeOk">
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
			<li>
				<textarea name = "content" id = "content"></textarea>
			</li>
			<li>비밀글설정</li>
			<li>
				<input type = "radio" name = "writePublic" value = "public">공개글&nbsp;
				<input type = "radio" id = "secret" name = "writePublic" value = "nPublic" checked>비밀글
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