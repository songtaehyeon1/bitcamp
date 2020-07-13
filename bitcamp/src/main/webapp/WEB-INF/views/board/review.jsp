<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/board/review.css" type = "text/css">
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
			if($("#searchText").val() == null || $("#searchText").val().trim() == ""){
				alert("검색어를 입력해 주세요.");
				$("#searchText").val("");
				return false;
			}
			location.href = "/bitcamp/boardReview?searchKey=" + $("#searchList").val() + "&searchWord=" + $("#searchText").val().trim();
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
		
		$("#review_write").submit(function(){
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
<div class = "container" id = "reviewBody">
	<div id = "nLink"><a href = "/bitcamp/">홈</a>&nbsp;>&nbsp;<span>상품후기</span></div>
	<div id = "nTitle"><span>상품후기</span></div>
	<ul id = "boardCate">
		<li onclick = "location.href = '/bitcamp/boardNotice'">공지사항</li>
		<li onclick = "location.href = '/bitcamp/boardEnquiry'">고객문의</li>
		<li onclick = "location.href = '/bitcamp/boardReview'">상품후기</li>
	</ul>
	<div style = "width : 1400px; height : 20px; float : left;"></div>
	<ul id = "list">
		<li>번호</li>
		<li>상품정보</li>
		<li>제목</li>
		<li>작성자</li>
		<li>작성일</li>
		<li>조회수</li>
		<li>추천</li>
		<li>평점</li>
		<c:if test = "${list != null && list != ''}">
			<c:forEach var = "list" items = "${list}">
				<li>${list.review_no}</li>
				<li><img src = "/bitcamp/upload/${list.p_filename1}" alt = ""><span>${list.p_name}</span></li>
				<li onclick = "location.href = '/bitcamp/review_listForm?no=${list.review_no}&pageNum=${pagevo.pageNum}<c:if test = '${pagevo.searchKey != null && pagevo.searchWord != null}'>&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>';" class = "pointer wordCut">${list.review_subject}</li>
				<li>${list.userid}</li>
				<li>${list.review_writedate}</li>
				<li>${list.review_hit}</li>
				<li>${list.review_recommend}</li>
				<li>
					<div class="star-box">
						<span class="star star_left <c:if test = "${list.review_rating <= 5}">on</c:if>"></span>
						<span class="star star_right <c:if test = "${list.review_rating <= 5}">on</c:if>"></span>
						
						<span class="star star_left <c:if test = "${list.review_rating >= 2}">on</c:if>"></span>
						<span class="star star_right <c:if test = "${list.review_rating >= 2}">on</c:if>"></span>
						
						<span class="star star_left <c:if test = "${list.review_rating >= 3}">on</c:if>"></span>
						<span class="star star_right <c:if test = "${list.review_rating >= 3}">on</c:if>"></span>
						
						<span class="star star_left <c:if test = "${list.review_rating >= 4}">on</c:if>"></span>
						<span class="star star_right <c:if test = "${list.review_rating >= 4}">on</c:if>"></span>
						
						<span class="star star_left <c:if test = "${list.review_rating == 5}">on</c:if>"></span>
						<span class="star star_right <c:if test = "${list.review_rating == 5}">on</c:if>"></span>
					</div>
				</li>
			</c:forEach>
		</c:if>
		<c:if test = "${list == null || list == '[]' || list == ''}">
			<li style = "width : 1400px; height : 200px; line-height : 200px; border-right : 1px solid black;">상품후기가 없습니다.</li>
		</c:if>
	</ul>
	<div id = "wsDiv">
		<div id = "search">
			<select id = "searchList" name = "searchKey">
				<option value = "review_subject">제목</option>
				<option value = "review_content">내용</option>
			</select>
			<input type = "text" id = "searchText" name = "searchWord">
			<input type = "submit" id = "searchBtn" value = "찾기">
		</div>
		<c:if test = "${adminStatus != 'Y'}">
			<form method = "post" action = "/bitcamp/review_writeForm" id = "review_write">
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
		    		<a class="page-link text-white black" href="/bitcamp/boardReview?pageNum=${pagevo.pageNum - 1}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>">&lt;</a>
		    	</li>
			</c:if>
			<c:forEach var = "i" begin = "${pagevo.startPage}" end = "${pagevo.startPage + pagevo.onePageCount - 1}">
				<c:if test = "${i <= pagevo.totalPage}">
		    		<li class="page-item">
		    			<a class="page-link text-green pages <c:if test = "${i == pagevo.pageNum}"> text-white black</c:if>" href="/bitcamp/boardReview?pageNum=${i}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>">${i}</a>
		    		</li>
		    	</c:if>
			</c:forEach>
			<c:if test = "${pagevo.pageNum == pagevo.totalPage || pagevo.totalPage == ''}">
		    	<li class="page-item disabled"><a class="page-link">&gt;</a></li>
			</c:if>
			<c:if test = "${pagevo.pageNum != pagevo.totalPage && pagevo.totalPage != ''}">
				<li class="page-item">
					<a class="page-link text-white black" href="/bitcamp/boardReview?pageNum=${pagevo.pageNum + 1}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>">&gt;</a>
				</li>
			</c:if>
		</ul>
	</div>
</div>