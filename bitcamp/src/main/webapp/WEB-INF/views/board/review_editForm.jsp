<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/review_editForm.css" type = "text/css">
<script src = "/bitcamp/editor/ckeditor/ckeditor.js"></script>
<script>
	$(function(){
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
					var tag = "<option selected value = "-" disabled = 'disabled'>-</option>";
					$result.each(function(idx, list){
						tag += "<option value = '" + list.p_no + "'>" + list.p_name + "</option>";
					});
					$("#goodsSelect2").html(tag);
				}, error : function(e){
					console.log(e.responseText);
				}
			});
		});
		
		// 글 수정 시
		$("#edit").submit(function(){
			if($("#goodsSelect1 option:selected").val() != "0" && $("#goodsSelect2 option:selected").val() == "-"){
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
			$("#editForm").append("<input type = 'hidden' name = 'review_rating' value = '" + $(".on").length / 2 + "'>");
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
	
	// 파일 삭제
	function fileDel(str){
		var fileid = $(str).parent().children("span").attr("id");
		var filename = $(str).parent().children(".hidden_file").val();
		if(confirm("파일을 삭제하시겠습니까?")){
			$.ajax({
				url : "/bitcamp/fileDel",
				data : "review_no=${vo.review_no}&filename=" + filename + "&fileid=" + fileid,
				success : function(result){
					alert("파일이 삭제되었습니다.");
					location.reload();
				}, error : function(e){
					console.log(e.responseText);
				}
			});
		}
	}
</script>
<div class = "container" id = "review_editForm">
	<div id = "nLink"><a href = "/bitcamp/">홈</a>&nbsp;>&nbsp;<span>상품후기</span></div>
	<div id = "nTitle"><span>상품후기</span></div>
	<ul id = "boardCate">
		<li onclick = "location.href = '/bitcamp/boardNotice'">공지사항</li>
		<li onclick = "location.href = '/bitcamp/boardEnquiry'">고객문의</li>
		<li onclick = "location.href = '/bitcamp/boardReview'">상품후기</li>
	</ul>
	<div style = "width : 1400px; height : 20px; float : left;"></div>
	<form method = "post" action = "/bitcamp/review_edit" id = "edit" enctype = "multipart/form-data">
		<ul id = "editForm">
			<li>상품</li>
			<li id = "goodsSelect">
				<select id = "goodsSelect1" name = "c_no">
					<option selected value = "0">-</option>
					<c:forEach var = "cate" items = "${cateList}">
						<c:if test = "${cate.c_no == vo.c_no}">
							<option value = "${cate.c_no}" selected>${cate.c_name}</option>
						</c:if>
						<c:if test = "${cate.c_no != vo.c_no}">
							<option value = "${cate.c_no}">${cate.c_name}</option>
						</c:if>
					</c:forEach>
				</select>
				<select id = "goodsSelect2" name = "p_no">
					<option selected disabled = "disabled">-</option>
					<c:forEach var = "goods" items = "${goods}">
						<c:if test = "${goods.p_no == vo.p_no}">
							<option value = "${goods.p_no}" selected>${goods.p_name}</option>
						</c:if>
						<c:if test = "${goods.p_no != vo.p_no}">
							<option value = "${goods.p_no}">${goods.p_name}</option>
						</c:if>
					</c:forEach>
				</select>
			</li>
			<li>제목</li>
			<li id = "titleSelect">
				<input type = "text" name = "review_subject" id = "subject" value = "${vo.review_subject}"/>
			</li>
			<li>평점</li>
			<li id = "star">
				<div class="star-box">
						<span class="star star_left <c:if test = "${vo.review_rating <= 5}">on</c:if>"></span>
						<span class="star star_right <c:if test = "${vo.review_rating <= 5}">on</c:if>"></span>
						
						<span class="star star_left <c:if test = "${vo.review_rating >= 2}">on</c:if>"></span>
						<span class="star star_right <c:if test = "${vo.review_rating >= 2}">on</c:if>"></span>
						
						<span class="star star_left <c:if test = "${vo.review_rating >= 3}">on</c:if>"></span>
						<span class="star star_right <c:if test = "${vo.review_rating >= 3}">on</c:if>"></span>
						
						<span class="star star_left <c:if test = "${vo.review_rating >= 4}">on</c:if>"></span>
						<span class="star star_right <c:if test = "${vo.review_rating >= 4}">on</c:if>"></span>
						
						<span class="star star_left <c:if test = "${vo.review_rating == 5}">on</c:if>"></span>
						<span class="star star_right <c:if test = "${vo.review_rating == 5}">on</c:if>"></span>
				</div>
			</li>
			<li>
				<textarea id = "content" name = "review_content">${vo.review_content}</textarea>
			</li>
			<li>첨부파일1</li>
			<li>
				<c:if test = "${vo.review_file1 == null}">
					<input type = "file" name = "filename" id = "filename1" accept = "image/gif,image/jpeg,image/png,image/jpg">
				</c:if>
				<c:if test = "${vo.review_file1 != null}">
					<input type = "hidden" class = "hidden_file" name = "review_file1" value = "${vo.review_file1}">
					<span id = "review_file1">
						<c:if test = "${vo.review_file1.length() >= 11}">${vo.review_file1.substring(0, 5)}...${vo.review_file1.substring(vo.review_file1.indexOf(".") - 1)}</c:if>
						<c:if test = "${vo.review_file1.length() < 11}">${vo.review_file1}</c:if>
					</span>
					<button type = "button" class = "file_del_btn" onclick = "fileDel(this);">삭제</button>
				</c:if>
			</li>
			<li>첨부파일2</li>
			<li>
				<c:if test = "${vo.review_file2 == null}">
					<input type = "file" name = "filename" id = "filename2" accept = "image/gif,image/jpeg,image/png,image/jpg">
				</c:if>
				<c:if test = "${vo.review_file2 != null}">
					<input type = "hidden" class = "hidden_file" name = "review_file2" value = "${vo.review_file2}">
					<span id = "review_file2">
						<c:if test = "${vo.review_file2.length() >= 11}">${vo.review_file2.substring(0, 5)}...${vo.review_file2.substring(vo.review_file2.indexOf(".") - 1)}</c:if>
						<c:if test = "${vo.review_file2.length() < 11}">${vo.review_file2}</c:if>
					</span>
					<button type = "button" class = "file_del_btn" onclick = "fileDel(this);">삭제</button>
				</c:if>
			</li>
			<li>첨부파일3</li>
			<li>
				<c:if test = "${vo.review_file3 == null}">
					<input type = "file" name = "filename" id = "filename1" accept = "image/gif,image/jpeg,image/png,image/jpg">
				</c:if>
				<c:if test = "${vo.review_file3 != null}">
					<input type = "hidden" class = "hidden_file" name = "review_file3" value = "${vo.review_file3}">
					<span id = "review_file3">
						<c:if test = "${vo.review_file3.length() >= 11}">${vo.review_file3.substring(0, 5)}...${vo.review_file3.substring(vo.review_file3.indexOf(".") - 1)}</c:if>
						<c:if test = "${vo.review_file3.length() < 11}">${vo.review_file3}</c:if>
					</span>
					<button type = "button" class = "file_del_btn" onclick = "fileDel(this);">삭제</button>
				</c:if>
			</li>
			<li>첨부파일4</li>
			<li>
				<c:if test = "${vo.review_file4 == null}">
					<input type = "file" name = "filename" id = "filename1" accept = "image/gif,image/jpeg,image/png,image/jpg">
				</c:if>
				<c:if test = "${vo.review_file4 != null}">
					<input type = "hidden" class = "hidden_file" name = "review_file4" value = "${vo.review_file4}">
					<span id = "review_file4">
						<c:if test = "${vo.review_file4.length() >= 11}">${vo.review_file4.substring(0, 5)}...${vo.review_file4.substring(vo.review_file4.indexOf(".") - 1)}</c:if>
						<c:if test = "${vo.review_file4.length() < 11}">${vo.review_file4}</c:if>
					</span>
					<button type = "button" class = "file_del_btn" onclick = "fileDel(this);">삭제</button>
				</c:if>
			</li>
			<li>첨부파일5</li>
			<li>
				<c:if test = "${vo.review_file5 == null}">
					<input type = "file" name = "filename" id = "filename1" accept = "image/gif,image/jpeg,image/png,image/jpg">
				</c:if>
				<c:if test = "${vo.review_file5 != null}">
					<input type = "hidden" class = "hidden_file" name = "review_file5" value = "${vo.review_file5}">
					<span id = "review_file5">
						<c:if test = "${vo.review_file5.length() >= 11}">${vo.review_file5.substring(0, 5)}...${vo.review_file5.substring(vo.review_file5.indexOf(".") - 1)}</c:if>
						<c:if test = "${vo.review_file5.length() < 11}">${vo.review_file5}</c:if>
					</span>
					<button type = "button" class = "file_del_btn" onclick = "fileDel(this);">삭제</button>
				</c:if>
			</li>
		</ul>
		<div id = "goBtn">
			<input type = "button" value = "목록" onclick = "goboard();">
			<div id = "regiDiv">
				<input type = "submit" value = "등록">
				<input type = "button" value = "취소" onclick = "goboard();">
			</div>
		</div>
		<input type = "hidden" name = "review_no" value = "${vo.review_no}">
		<input type = "hidden" name = "mypage" value = "${mypage}">
	</form>
</div>