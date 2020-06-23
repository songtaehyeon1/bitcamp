<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/enquiry_editForm.css" type = "text/css">
<script src = "/bitcamp/editor/ckeditor/ckeditor.js"></script>
<script>
	$(function(){
		$("#enquiry_subject option[value='${vo.enquiry_subject}']").attr("selected", "selected");
	});
	
	function goboard(){
		if(confirm("작성한 내용이 적용되지 않습니다.")){
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
	<form method = "post" action = "/bitcamp/enquiry_editOk">
		<ul id = "writeForm">
			<li>상품</li>
			<li id = "goodsSelect">
				<select id = "goodsSelect1">
					<option selected>-</option>
					<c:forEach var = "list" items = "${cateList}">
						<c:if test = "${list.c_no == vo.c_no}">
							<option value = "${list.c_no}" selected>${list.c_name}</option>
						</c:if>
						<c:if test = "${list.c_no != vo.c_no}">
							<option value = "${list.c_no}">${list.c_name}</option>
						</c:if>
					</c:forEach>
				</select>
				<select id = "goodsSelect2">
					<c:forEach var = "list" items = "${cateList}">
						<c:if test = "${goods.p_no eq vo.p_no}">
							<option value = "${list.p_no}" selected>${list.p_name}</option>
						</c:if>
						<c:if test = "${goods.p_no ne vo.p_no}">
							<option value = "${list.p_no}">${list.p_name}</option>
						</c:if>
					</c:forEach>
				</select>
			</li>
			<li>제목</li>
			<li id = "titleSelect">
				<select id = "enquiry_subject" name = "enquiry_subject">
					<option value = "궁금합니다">궁금합니다</option>
					<option value = "반납관련 문의">반납관련 문의</option>
					<option value = "배송관련 문의">배송관련 문의</option>
					<option value = "장비관련 문의">장비관련 문의</option>
					<option value = "예약취소 관련 문의">예약취소 관련 문의</option>
					<option value = "단체대여 관련 문의">단체대여 관련 문의</option>
					<option value = "기타 문의">기타 문의</option>
				</select>
			</li>
			<li>
				<textarea name = "content" id = "content">${vo.enquiry_content}</textarea>
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