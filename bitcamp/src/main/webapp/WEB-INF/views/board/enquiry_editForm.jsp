<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/enquiry_editForm.css" type = "text/css">
<script src = "/bitcamp/editor/ckeditor/ckeditor.js"></script>
<script>
	$(function(){
		$("#enquiry_subject option[value='${vo.enquiry_subject}']").attr("selected", "selected");
		
		// 상품리스트 가져오기
		$("#goodsSelect1").change(function(){
			var url = "/bitcamp/enquiry_goods";
			var data = "cate=" + $("#goodsSelect1 option:selected").val();
			$.ajax({
				url : url,
				data : data,
				success : function(result){
					var $result = $(result);
					var tag = "<option selected disabled = 'disabled'>-</option>";
					$result.each(function(idx, list){
						tag += "<option value = '" + list.p_no + "'>" + list.p_name + "</option>";
					});
					$("#goodsSelect2").html(tag);
				}, error : function(e){
					console.log(e.responseText);
				}
			});
		});

		// submit되면
		$("#write").submit(function(){
			if($("#goodsSelect1 option:selected").val() != "-" && $("#goodsSelect2 option:selected").val() == "-"){
				alert("상품을 선택해 주세요.");
				return false;
			}
			if($("#content").val() == ''){
				alert("내용을 입력해 주세요.");
				return false;
			}
			if($("#write input[name=enquiry_secret]:checked").val() == "Y"){
				if(confirm("공개글 등록을 하시겠습니까?")){
					return true;
				}else{
					return false;
				}
			}else if($("#write input[name=enquiry_secret]:checked").val() == "N"){
				if(confirm("비밀글 등록을 하시겠습니까?")){
					return true;
				}else{
					return false;
				}
			}
		});
	});

	// 목록, 취소 버튼
	function goboard(){
		if($("#goodsSelect1 option:selected").index() != 0 || $("#goodsSelect2 option:selected").index() != 0 || $("#content").val() != ''){
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
	<form method = "post" action = "/bitcamp/enquiry_editOk">
		<ul id = "writeForm">
			<li>상품</li>
			<li id = "goodsSelect">
				<select id = "goodsSelect1" name = "c_no">
					<option selected value = "0">-</option>
					<c:forEach var = "list" items = "${cateList}">
						<c:if test = "${list.c_no == vo.c_no}">
							<option value = "${list.c_no}" selected>${list.c_name}</option>
						</c:if>
						<c:if test = "${list.c_no != vo.c_no}">
							<option value = "${list.c_no}">${list.c_name}</option>
						</c:if>
					</c:forEach>
				</select>
				<select id = "goodsSelect2" name = "p_no">
					<option selected disabled = "disabled">-</option>
					<c:forEach var = "list" items = "${goods}">
						<c:if test = "${list.p_no == vo.p_no}">
							<option value = "${list.p_no}" selected>${list.p_name}</option>
						</c:if>
						<c:if test = "${list.p_no != vo.p_no}">
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
				<textarea name = "enquiry_content" id = "content">${vo.enquiry_content}</textarea>
			</li>
			<li>비밀글설정</li>
			<li>
				<input type = "radio" name = "enquiry_secret" value = "Y" <c:if test = "${vo.enquiry_secret == 'Y'}">checked</c:if>>공개글&nbsp;
				<input type = "radio" name = "enquiry_secret" value = "N" <c:if test = "${vo.enquiry_secret == 'N'}">checked</c:if> id = "secret">비밀글
			</li>
		</ul>
		<div id = "goBtn">
			<input type = "button" value = "목록" onclick = "goboard();">
			<div id = "regiDiv">
				<input type = "submit" value = "등록">
				<input type = "button" value = "취소" onclick = "goboard();">
			</div>
		</div>
		<input type = "hidden" name = "enquiry_no" value = "${vo.enquiry_no}">
		<input type = "hidden" name = "mypage" value = "${mypage}">
	</form>
</div>