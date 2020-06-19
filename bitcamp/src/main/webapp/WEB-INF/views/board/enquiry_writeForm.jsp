<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/enquiry_writeForm.css" type = "text/css">
<script>
	$(function(){
		// 상품리스트 가져오기
		$("#goodsSelect1").change(function(){
			var url = "/bitcamp/requiry_goods";
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
		
		// 뒤로가기 하면 체크된 것들 원래대로
		$("#goodsSelect1 option:nth-of-type(1)").prop("selected", true);
		$("#goodsSelect2 option:nth-of-type(1)").prop("selected", true);
		$("#enquiry_subject option:nth-of-type(1)").prop("selected", true);
		$("#secret").prop("checked", true);

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
	<form id = "write" method = "post" action = "/bitcamp/enquiry_writeOk">
		<ul id = "writeForm">
			<li>상품</li>
			<li id = "goodsSelect">
				<select id = "goodsSelect1">
					<option selected>-</option>
					<c:forEach var = "list" items = "${cateList}">
						<option value = "${list.c_no}">${list.c_name}</option>
					</c:forEach>
				</select>
				<select id = "goodsSelect2" name = "p_no">
					<option selected disabled = "disabled">-</option>
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
				<textarea id = "content" name = "enquiry_content"></textarea>
			</li>
			<li>비밀글설정</li>
			<li>
				<input type = "radio" name = "enquiry_secret" value = "Y">공개글&nbsp;
				<input type = "radio" id = "secret" name = "enquiry_secret" value = "N" checked>비밀글
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