<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/review_listForm.css" type = "text/css">
<script>
	$(function(){
		// 글자 제한
		$('.content, #r_reply_content').on("keydown keyup", function (e){
			var content = $(this).val();
			if(content.length > 300){
				var str = $(this).val().substring(0, 300);
				$(this).val(str);
				alert("300글자 제한");
				$('.count, #count').html('300/300');
				return false;
			}
			$(this).height(1).height($(this).prop('scrollHeight') + 12);
			$('.count, #count').html(content.length + '/300');
		});
		
		replyAll();
		
		var rating = "${vo.review_rating}";
		for(var i=0; i<rating * 2; i++){
	    	$(".star").eq(i).addClass("on");
		}
	});
	
	// 댓글 가져오기
	function replyAll(){
		var url = "/bitcamp/review_reply";
		var data = "review_no=" + ${vo.review_no};
		$.ajax({
			url : url,
			data : data,
			type : "post",
			success : function(result){
				var $result = $(result);
				var tag = "";
				$result.each(function(i, list){
					tag += "<div class = 'reply'>";
					tag += "	<div>";
					tag += "		<span class = 'reply_span1'>" + list.userid + "</span>";
					tag += "		<span>작성날짜 : " + list.r_reply_writedate + "</span>";
					tag += "	</div>";
					tag += "	<div>";
					tag += "		<div class = 'reply_content'>";
					tag += list.r_reply_content;
					tag += "		</div>";
					if(list.userid == '${userid}'){
						tag += "	<div class = 'reply_right'>";
						tag += "		<button class = 'reply_edit' onclick = 'reply_edit(this);'>수정</button>";
						tag += "		<button class = 'reply_del' onclick = 'reply_del(this);'>삭제</button>";
						tag += "		<input type = 'hidden' name = 'r_reply_no' value = '" + list.r_reply_no + "'>";
						tag += "	</div>";
					}
					tag += "	</div>";
					tag += "<hr style = 'border : 1px solid #EAEAEA; width : 1400px;'>";
					tag += "</div>";
				});
				$("#replyAll").html(tag);
			}, error : function(e){
				console.log(e.responseText);
			}
		});
	}
	
	// 댓글 작성
	function replyWrite(){
		var content_val = $("#r_reply_content").val();
		if(content_val == null || content_val.trim() == ""){
			alert("댓글을 작성해 주세요.");
			return false;
		}
		var data = "userno=1&review_no=" + ${vo.review_no} + "&r_reply_content=" + content_val;
		$.ajax({
			url : "/bitcamp/review_replyWrite",
			data : data,
			success : function(result){
				$("#count").text("0/300");
				alert("댓글이 작성되었습니다.");
				replyAll();
			}, error : function(e){
				console.log(e.responseText);
			}
		});
		$("#r_reply_content").val("");
	}
	
	// 댓글 삭제
	function reply_del(btn){
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url : "/bitcamp/review_replyDel",
				data : "r_reply_no=" + $(btn).parent().children("input[name=r_reply_no]").val(),
				success : function(){
					replyAll();
				}, error : function(e){
					console.log(e.responseText);
				}
			});
		}
	}
	
	// 댓글 수정폼
	function reply_edit(btn){
		$.ajax({
			url : "/bitcamp/review_replyEdit",
			data : "r_reply_no=" + $(btn).parent().children("input[name=r_reply_no]").val(),
			success : function(result){
				$(btn).parent().parent().parent().html(
						"<div class = 'replyForm'>" +
							"<div class = 'replyForm_above'>" +
								"<span>" + result.userid + "</span>" +
								"<span class = 'count'>0/300</span>" +
							"</div>" +
							"<div class = 'contentDiv'>" +
								"<textarea class = 'content'>" + result.r_reply_content + "</textarea>" +
							"</div>" +
							"<div>" +
								"<button class = 'replyBtn' onclick = 'reply_editOk(this);'>확인</button>" +
								"<input type = 'hidden' name = 'r_reply_no' value = '" + result.r_reply_no + "'>" +
							"</div>" +
						"</div>" +
						"<hr style = 'border : 1px solid #EAEAEA; width : 1400px; float : left;'>");
			}, error : function(e){
				console.log(e.responseText);
			}
		});
	}
	
	// 댓글 수정
	function reply_editOk(btn){
		var content_val = $(btn).parent().parent().children(".contentDiv").children("textarea").val();
		if(content_val == null || content_val.trim() == ""){
			alert("댓글 수정란을 작성해 주세요.");
			return false;
		}
		$.ajax({
			url : "/bitcamp/review_replyEditOk",
			data : "r_reply_no=" + $(btn).parent().children("input").val() + "&r_reply_content=" + content_val,
			success : function(result){
				replyAll();
			}, error : function(e){
				console.log(e.responseText);
			}
		});
	}
	
	// 추천 수 올리기
	function recommend_up(){
		$.ajax({
			url : "/bitcamp/review_recommend",
			data : "review_no=${vo.review_no}",
			success : function(result){
				if("${vo.review_recommend}" != result){
					alert("추천 되었습니다.");
				}else{
					alert("이미 추천을 하셨습니다.");
				}
				$("#recommendNum").html(result);
			}, error : function(e){
				console.log(e.responseText);
			}
		});
	}
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
		<c:if test = "${vo.p_filename1 != null && vo.p_name != null && vo.price != 0}">
			<img src = "/bitcamp/resources/product/${vo.p_filename1}" alt="">
			<span>${vo.p_name}</span>
			<span>${vo.price}원</span>
			<button onclick = "location.href = '/bitcamp/productView?p_no=${vo.p_no}'">상품상세보기</button>
		</c:if>
		<c:if test = "${vo.p_filename1 == null || vo.p_name == null || vo.price == 0}">
			<span style = "height : 110px; line-height : 110px;">상품을 선택하지 않았습니다.</span>
		</c:if>
	</div>
	<div style = "width : 1400px; height : 20px; float : left;"></div>
	<ul id = "listForm">
		<li>제목</li>
		<li>${vo.review_subject}</li>
		<li>작성자</li>
		<li>${vo.userid}</li>
		<li id = "list_kind">
			<span style = "float : left;">평점 :</span> <div class="star-box" style = "float : left; margin-right : 20px;">
					<span class="star star_left"></span>
					<span class="star star_right"></span>
					
					<span class="star star_left"></span>
					<span class="star star_right"></span>
					
					<span class="star star_left"></span>
					<span class="star star_right"></span>
					
					<span class="star star_left"></span>
					<span class="star star_right"></span>
					
					<span class="star star_left"></span>
					<span class="star star_right"></span>
				</div>
			<span>작성일 : ${vo.review_writedate}</span>
			<span>추천 : <span id = "recommendNum">${vo.review_recommend}</span> <button id = "recommendBtn" onclick = "recommend_up()">추천하기</button></span>
			<span>조회수 : ${vo.review_hit}</span><hr>
			<div id = "list_imgs">
				<c:if test = "${vo.review_file1 != null}">
					<div>
						<img src = "/bitcamp/resources/review/${vo.review_file1}">
					</div>
				</c:if>
				<c:if test = "${vo.review_file2 != null}">
					<div>
						<img src = "/bitcamp/resources/review/${vo.review_file2}">
					</div>
				</c:if>
				<c:if test = "${vo.review_file3 != null}">
					<div>
						<img src = "/bitcamp/resources/review/${vo.review_file3}">
					</div>
				</c:if>
				<c:if test = "${vo.review_file4 != null}">
					<div>
						<img src = "/bitcamp/resources/review/${vo.review_file4}">
					</div>
				</c:if>
				<c:if test = "${vo.review_file5 != null}">
					<div>
						<img src = "/bitcamp/resources/review/${vo.review_file5}">
					</div>
				</c:if>
			</div>
			<div id = "list_content">${vo.review_content}</div>
		</li>
		<li>첨부파일</li>
		<li>
			<c:if test = "${vo.review_file1 != null}">
				<a href = "bitcamp/resources/review/${vo.review_file1}" download>
					<span>
						<c:if test = "${vo.review_file1.length() >= 11}">${vo.review_file1.substring(0, 5)}...${vo.review_file1.substring(vo.review_file1.indexOf(".") - 1)}</c:if>
						<c:if test = "${vo.review_file1.length() < 11}">${vo.review_file1}</c:if>
					</span>
				</a>
			</c:if>
			<c:if test = "${vo.review_file2 != null}">
			<a href = "bitcamp/resources/review/${vo.review_file2}" download>
				<span>
					<c:if test = "${vo.review_file2.length() >= 11}">${vo.review_file2.substring(0, 5)}...${vo.review_file2.substring(vo.review_file2.indexOf(".") - 1)}</c:if>
					<c:if test = "${vo.review_file2.length() < 11}">${vo.review_file2}</c:if>
				</span>
			</a>
			</c:if>
			<c:if test = "${vo.review_file3 != null}">
			<a href = "bitcamp/resources/review/${vo.review_file3}" download>
				<span>
					<c:if test = "${vo.review_file3.length() >= 11}">${vo.review_file3.substring(0, 5)}...${vo.review_file3.substring(vo.review_file3.indexOf(".") - 1)}</c:if>
					<c:if test = "${vo.review_file3.length() < 11}">${vo.review_file3}</c:if>
				</span>
			</a>
			</c:if>
			<c:if test = "${vo.review_file4 != null}">
			<a href = "bitcamp/resources/review/${vo.review_file4}" download>
				<span>
					<c:if test = "${vo.review_file4.length() >= 11}">${vo.review_file4.substring(0, 5)}...${vo.review_file4.substring(vo.review_file4.indexOf(".") - 1)}</c:if>
					<c:if test = "${vo.review_file4.length() < 11}">${vo.review_file4}</c:if>
				</span>
			</a>
			</c:if>
			<c:if test = "${vo.review_file5 != null}">
			<a href = "bitcamp/resources/review/${vo.review_file5}" download>
				<span>
					<c:if test = "${vo.review_file5.length() >= 11}">${vo.review_file5.substring(0, 5)}...${vo.review_file5.substring(vo.review_file5.indexOf(".") - 1)}</c:if>
					<c:if test = "${vo.review_file5.length() < 11}">${vo.review_file5}</c:if>
				</span>
			</a>
			</c:if>
		</li>
	</ul>
	<div id = "boardGo">
		<button onclick = "location.href = '/bitcamp/boardReview?pageNum=${pagevo.pageNum}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>';">목록</button>
		<c:if test = "${vo.userid == userid || adminStatus == 'Y'}">
			<div class = "boardGo_right">
				<button class = "boardList_edit" onclick = "location.href = '/bitcamp/review_editForm?no=${vo.review_no}';">수정</button>
				<button class = "boardList_del" onclick = "if(confirm('진짜로 삭제하시겠습니까?')){location.href = '/bitcamp/review_delForm?no=${vo.review_no}';};">삭제</button>
			</div>
		</c:if>
	</div>
	<div id = "listMove">
		<ul>
			<c:if test = "${pnvo.lagSubject != '다음글'}">
				<li class = "pointer" onclick = "location.href = '/bitcamp/review_listForm?no=${pnvo.lagNo}&pageNum=${pagevo.pageNum}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>'">▲&emsp;다음글</li>
			</c:if>
			<c:if test = "${pnvo.lagSubject == '다음글'}">
				<li>▲&emsp;다음글</li>
			</c:if>
			<c:if test = "${pnvo.lagSubject != '다음글'}">
				<li class = "pointer" onclick = "location.href = '/bitcamp/review_listForm?no=${pnvo.lagNo}&pageNum=${pagevo.pageNum}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>'">${pnvo.lagSubject}</li>
			</c:if>
			<c:if test = "${pnvo.lagSubject == '다음글'}">
				<li>다음글이 없습니다.</li>
			</c:if>
			<c:if test = "${pnvo.leadSubject != '이전글'}">
				<li class = "pointer" onclick = "location.href = '/bitcamp/review_listForm?no=${pnvo.leadNo}&pageNum=${pagevo.pageNum}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>'">▼&emsp;이전글</li>
			</c:if>
			<c:if test = "${pnvo.leadSubject == '이전글'}">
				<li>▼&emsp;이전글</li>
			</c:if>
			<c:if test = "${pnvo.leadSubject != '이전글'}">
				<li class = "pointer" onclick = "location.href = '/bitcamp/review_listForm?no=${pnvo.leadNo}&pageNum=${pagevo.pageNum}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>'">${pnvo.leadSubject}</li>
			</c:if>
			<c:if test = "${pnvo.leadSubject == '이전글'}">
				<li>이전글이 없습니다.</li>
			</c:if>
		</ul>
	</div>
	<c:if test = "${userid != null && userid != ''}">
		<div id = "replyForm">
			<div id = "replyForm_above">
				<span>${userid}</span>
				<span id = "count">0/300</span>
			</div>
			<div>
				<textarea class = "content" id = "r_reply_content" name = "r_reply_content"></textarea>
			</div>
			<div>
				<button id = "replyBtn" onclick = "replyWrite();">확인</button>
			</div>
			<input type = "hidden" name = "review_no" value = "${vo.review_no}">
		</div>
	</c:if>
	<c:if test = "${userid == null || userid == ''}">
		<div id = "replyForm" style = "height : 100px; line-height : 85px;">
			<div style = "text-align : center;">
				로그인 후 댓글 작성이 가능합니다.
			</div>
		</div>
	</c:if>
	<hr style = "border : 1px solid #EAEAEA; width : 1400px; float : left;">
	<div id = "replyAll">
	</div>
</div>