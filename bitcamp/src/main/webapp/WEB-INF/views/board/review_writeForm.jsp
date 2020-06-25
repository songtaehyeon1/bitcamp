<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/review_writeForm.css" type = "text/css">
<script src = "/bitcamp/editor/ckeditor/ckeditor.js"></script>
<script>
	$(function(){
		// 뒤로가기 하면 체크된 것들 원래대로
		$("#goodsSelect1 option:nth-of-type(1)").prop("selected", true);
		$("#goodsSelect2 option:nth-of-type(1)").prop("selected", true);
		$("#subject").val("");
		$("#content").val("");
		$("#filename1").val("");
		$("#filename2").val("");
		$("#filename3").val("");
		$("#filename4").val("");
		$("#filename5").val("");
		
		// 평점 클릭시 이벤트
		$(".star").on('click',function(){
			var idx = $(this).index();
			$(".star").removeClass("on");
			for(var i=0; i<=idx; i++){
		    	$(".star").eq(i).addClass("on");
			}
		});
		
		// 상품리스트 가져오기
		$("#goodsSelect1").change(function(){
			var url = "/bitcamp/review_goods";
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
		
		$("#write").submit(function(){
			if($("#goodsSelect1 option:selected").val() != "" && $("#goodsSelect2 option:selected").val() == "-"){
				alert("상품을 선택해 주세요.");
				return false;
			}
			if($("#subject").val().trim() == ""){
				alert("제목을 작성해 주세요.");
				return false;
			}
			if($("#content").val().trim() == ""){
				alert("내용을 작성해 주세요.");
				return false;
			}
			$("#writeForm").append("<input type = 'hidden' name = 'review_rating' value = '" + $(".on").length / 2 + "'>");
		});
	});
	
	// 목록, 취소 버튼
	function goboard(){
		if($("#goodsSelect1 option:selected").index() != 0 || $("#goodsSelect2 option:selected").index() != 0 || $("#subject").val().trim() != "" || 
				$("#content").val().trim() != "" || $("#filename1").val().trim() != "" || $("#filename2").val().trim() != "" || 
				$("#filename3").val().trim() != "" || $("#filename4").val().trim() != "" || $("#filename5").val().trim() != "" || 
				$(".on").length / 2 != 1){
			if(confirm("작성한 내용이 사라집니다.")){
				location.href = '/bitcamp/boardReview';
			}
		}else{
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
	<form method = "post" action = "/bitcamp/review_writeOk" id = "write" enctype = "multipart/form-data">
		<ul id = "writeForm">
			<li>상품</li>
			<li id = "goodsSelect">
				<select id = "goodsSelect1" name = "c_no">
					<option selected value = "">-</option>
					<c:forEach var = "goods" items = "${cate}">
						<option value = "${goods.c_no}">${goods.c_name}</option>
					</c:forEach>
				</select>
				<select id = "goodsSelect2" name = "p_no">
					<option selected disabled = "disabled">-</option>
				</select>
			</li>
			<li>제목</li>
			<li id = "titleSelect">
				<input type = "text" name = "review_subject" id = "subject">
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
				<textarea id = "content" name = "review_content"></textarea>
			</li>
			<li>첨부파일1</li>
			<li>
				<input type = "file" name = "filename" id = "filename1">
			</li>
			<li>첨부파일2</li>
			<li>
				<input type = "file" name = "filename" id = "filename2">
			</li>
			<li>첨부파일3</li>
			<li>
				<input type = "file" name = "filename" id = "filename3">
			</li>
			<li>첨부파일4</li>
			<li>
				<input type = "file" name = "filename" id = "filename4">
			</li>
			<li>첨부파일5</li>
			<li>
				<input type = "file" name = "filename" id = "filename5">
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