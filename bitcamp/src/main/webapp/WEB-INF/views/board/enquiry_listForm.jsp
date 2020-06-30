<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/enquiry_listForm.css" type = "text/css">
<script>
	$(function(){
		// 글자 제한
		$('.content, #e_reply_content').on("keydown keyup", function (e){
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
	});
	
	// 댓글 가져오기
	function replyAll(){
		var url = "/bitcamp/enquiry_reply";
		var data = "enquiry_no=" + ${list.enquiry_no};
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
					if(list.userid == null && "${adminStatus == 'Y'}"){
						list.userid = "관리자";
					}
					tag += "		<span class = 'reply_span1'>" + list.userid + "</span>";
					tag += "		<span>작성날짜 : " + list.e_reply_writedate + "</span>";
					tag += "	</div>";
					tag += "	<div>";
					tag += "		<div class = 'reply_content'>";
					tag += list.e_reply_content;
					tag += "		</div>";
					if(list.userid == '${userid}' || "${adminStatus}" == 'Y'){
						tag += "	<div class = 'reply_right'>";
						tag += "		<button class = 'reply_edit' onclick = 'reply_edit(this);'>수정</button>";
						tag += "		<button class = 'reply_del' onclick = 'reply_del(this);'>삭제</button>";
						tag += "		<input type = 'hidden' name = 'e_reply_no' value = '" + list.e_reply_no + "'>";
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
		var content_val = $("#e_reply_content").val();
		if(content_val == null || content_val.trim() == ""){
			alert("댓글을 작성해 주세요.");
			return false;
		}
		var data = "userno=" + ${list.userno} + "&enquiry_no=" + ${list.enquiry_no} + "&e_reply_content=" + content_val;
		$.ajax({
			url : "/bitcamp/replyWrite",
			data : data,
			success : function(result){
				$("#count").text("0/300");
				alert("댓글이 작성되었습니다.");
				replyAll();
			}, error : function(e){
				console.log(e.responseText);
			}
		});
		$("#e_reply_content").val("");
	}
	
	// 댓글 삭제
	function reply_del(btn){
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url : "/bitcamp/replyDel",
				data : "e_reply_no=" + $(btn).parent().children("input[name=e_reply_no]").val(),
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
			url : "/bitcamp/replyEdit",
			data : "e_reply_no=" + $(btn).parent().children("input[name=e_reply_no]").val(),
			success : function(result){
				$(btn).parent().parent().parent().html(
						"<div class = 'replyForm'>" +
							"<div class = 'replyForm_above'>" +
								"<span>" + result.userid + "</span>" +
								"<span class = 'count'>0/300</span>" +
							"</div>" +
							"<div class = 'contentDiv'>" +
								"<textarea class = 'content'>" + result.e_reply_content + "</textarea>" +
							"</div>" +
							"<div>" +
								"<button class = 'replyBtn' onclick = 'reply_editOk(this);'>확인</button>" +
								"<input type = 'hidden' name = 'e_reply_no' value = '" + result.e_reply_no + "'>" +
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
			url : "/bitcamp/replyEditOk",
			data : "e_reply_no=" + $(btn).parent().children("input").val() + "&e_reply_content=" + content_val,
			success : function(result){
				replyAll();
			}, error : function(e){
				console.log(e.responseText);
			}
		});
	}
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
		<c:if test = "${str == ''}">
			<img src = "/bitcamp/resources/products/${list.p_filename1}" alt="">
			<span>${list.p_name}</span>
			<span>${list.price}원</span>
		</c:if>
		<c:if test = "${str != ''}">
			<span style = "height : 110px; line-height : 110px;">${str}</span>
		</c:if>
	</div>
	<div style = "width : 1400px; height : 20px; float : left;"></div>
	<ul id = "listForm">
		<li>제목</li>
		<li>${list.enquiry_subject}</li>
		<li>작성자</li>
		<li>${list.userid}</li>
		<li>${list.enquiry_content}</li>
	</ul>
	<div id = "boardGo">
		<button onclick = "location.href = '/bitcamp/boardEnquiry?pageNum=${pagevo.pageNum}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>';">목록</button>
		<c:if test = "${list.userid == userid || adminStatus == 'Y'}">
			<div class = "boardGo_right">
				<button class = "boardList_edit" onclick = "location.href = '/bitcamp/enquiry_editForm?no=${list.enquiry_no}';">수정</button>
				<button class = "boardList_del" onclick = "if(confirm('진짜로 삭제하시겠습니까?')){location.href = '/bitcamp/enquiry_delForm?no=${list.enquiry_no}';};">삭제</button>
			</div>
		</c:if>
	</div>
	<c:if test = "${adminStatus == 'Y' || userid != null && userid != ''}">
		<div id = "replyForm">
			<div id = "replyForm_above">
				<span>
					<c:if test = "${adminStatus != 'Y'}">${userid}</c:if>
					<c:if test = "${adminStatus == 'Y'}">관리자</c:if>
				</span>
				<span id = "count">0/300</span>
			</div>
			<div>
				<textarea class = "content" id = "e_reply_content" name = "e_reply_content"></textarea>
			</div>
			<div>
				<button id = "replyBtn" onclick = "replyWrite();">확인</button>
			</div>
			<input type = "hidden" name = "enquiry_no" value = "${list.enquiry_no}">
		</div>
	</c:if>
	<c:if test = "${adminStatus != 'Y' && (userid == null || userid == '')}">
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