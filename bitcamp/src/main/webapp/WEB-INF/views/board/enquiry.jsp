<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/enquiry.css" type = "text/css">
<script>
	$(function(){
		$("#searchBtn").click(function(){
			listSearch();
		});
		
		$("#searchText").keyup(function(event){
			if(event.keyCode == 13){
				listSearch();
			}
		});
		
		function listSearch(){
			if($("#searchText").val().trim() == "" || $("#searchText").val() == null){
				alert("검색어를 입력해 주세요.");
				$("#searchText").val("");
				return false;
			}
			location.href = "/bitcamp/boardEnquiry?searchKey=" + $("#searchList").val() + "&searchWord=" + $("#searchText").val().trim();
		}
		
		$(".pages").hover(function(){
			if($(this).text() != "${pagevo.pageNum}"){
				$(this).css("color", "white");
			}
		}, function(){
			if($(this).text() != "${pagevo.pageNum}"){
				$(this).css("color", "black");
			}
		});
		
		$("#enquiry_write").submit(function(){
			var userid = "${userid}";
			var adminStatus = "${adminStatus}";
			if(adminStatus != "Y" && (userid == null || userid == "")){
				alert("로그인 후 글 작성이 가능합니다.");
				location.href = "/bitcamp/loginFrm";
				return false;
			}
		});
	});
</script>
<div class = "container" id = "enquiryBody">
	<div id = "nLink"><a href = "/bitcamp/">홈</a>&nbsp;>&nbsp;<span>고객문의</span></div>
	<div id = "nTitle"><span>고객문의</span><span>&nbsp;&nbsp;|&nbsp;&nbsp;궁금하신 질문을 올려주세요 성심껏 답변해드리겠습니다. 게시판의 내용과 맞지 않는 글은 자동삭제됩니다.</span></div>
	<ul id = "boardCate">
		<li onclick = "location.href = '/bitcamp/boardNotice'">공지사항</li>
		<li onclick = "location.href = '/bitcamp/boardEnquiry'">고객문의</li>
		<li onclick = "location.href = '/bitcamp/boardReview'">상품후기</li>
	</ul>
	<div style = "width : 1400px; height : 20px; float : left;"></div>
	<ul id = "list">
		<li>번호</li>
		<li>제목</li>
		<li>작성자</li>
		<li>작성일</li>
		<li>조회수</li>
		<c:if test = "${list != null && list != ''}">
			<c:forEach var = "vo" items = "${list}">
				<li>${vo.enquiry_no}</li>
				<li class = "wordCut pointer" onclick = "location.href = '/bitcamp/enquiry_listForm?no=${vo.enquiry_no}&pageNum=${pagevo.pageNum}<c:if test = '${pagevo.searchKey != null && pagevo.searchWord != null}'>&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>&enquiry_secret=${vo.enquiry_secret}&userid=${vo.userid}'">${vo.enquiry_subject}<c:if test = "${vo.enquiry_secret == 'N'}">&nbsp;<img src = "/bitcamp/resources/board/lock.png"></c:if></li>
				<li>${vo.userid}</li>
				<li>${vo.enquiry_writedate}</li>
				<li>${vo.enquiry_hit}</li>
			</c:forEach>
		</c:if>
		<c:if test = "${list == null || list == '[]' || list == ''}">
			<li style = "width : 1400px; height : 200px; line-height : 200px; border-right : 1px solid black;">고객문의가 없습니다.</li>
		</c:if>
	</ul>
	<div id = "wsDiv">
		<div id = "search">
			<select id = "searchList" name = "searchList">
				<option value = "enquiry_subject">제목</option>
				<option value = "enquiry_content">내용</option>
			</select>
			<input type = "text" id = "searchText" name = "searchText">
			<input type = "submit" id = "searchBtn" value = "찾기">
		</div>
		<c:if test = "${adminStatus != 'Y'}">
			<form method = "post" action = "/bitcamp/enquiry_writeForm" id = "enquiry_write">
				<div id = "write">
					<input type = "submit" id = "writingBtn" value = "글 쓰기">
				</div>
			</form>
		</c:if>
	</div>
	<div style="width : 1400px; clear : left">
		<ul class="pagination justify-content-center">
			<c:if test = "${pagevo.pageNum == 1}">
		    	<li class="page-item disabled"><a class="page-link">&lt;</a></li>
			</c:if>
			<c:if test = "${pagevo.pageNum > 1}">
		    	<li class="page-item">
		    		<a class="page-link text-white black" href="/bitcamp/boardEnquiry?pageNum=${pagevo.pageNum - 1}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>">&lt;</a>
		    	</li>
			</c:if>
			<c:forEach var = "i" begin = "${pagevo.startPage}" end = "${pagevo.startPage + pagevo.onePageCount - 1}">
				<c:if test = "${i <= pagevo.totalPage}">
		    		<li class="page-item">
		    			<a class="page-link text-black pages <c:if test = "${i == pagevo.pageNum}"> text-white black</c:if>" href="/bitcamp/boardEnquiry?pageNum=${i}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>">${i}</a>
		    		</li>
		    	</c:if>
			</c:forEach>
			<c:if test = "${pagevo.pageNum == pagevo.totalPage || pagevo.totalPage == ''}">
		    	<li class="page-item disabled"><a class="page-link">&gt;</a></li>
			</c:if>
			<c:if test = "${pagevo.pageNum != pagevo.totalPage && pagevo.totalPage != ''}">
				<li class="page-item">
					<a class="page-link text-white black" href="/bitcamp/boardEnquiry?pageNum=${pagevo.pageNum + 1}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>">&gt;</a>
				</li>
			</c:if>
		</ul>
	</div>
</div>