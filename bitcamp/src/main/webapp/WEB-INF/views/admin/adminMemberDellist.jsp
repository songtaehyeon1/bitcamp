<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript">
	$(function() {
		$("#membermenu").attr("class","over");

		$('#s_date').datepicker({
			uiLibrary : 'bootstrap4.4.1',
				format : "yyyy-mm-dd",
				icons: { rightIcon: null }

		
					
		});
		$('#e_date').datepicker({
			uiLibrary : 'bootstrap4.4.1',
				format : "yyyy-mm-dd",
				icons: { rightIcon: null }
		
					
		});
		
		
	});		
</script>
<style>
	#datepickerbox div,#datepickerbox img,#datepickerbox span{
		float: left
	}
</style>

<div id="admin_top_menu_under">&nbsp;</div>
<div id="admin_left_menu">
	<h2>회원관리</h2>
	<dl>
		<dt>회원관리</dt>		
		<dd>
			<a href="<%=request.getContextPath()%>/admin/member">- 회원리스트</a>
		</dd>
		<dd>
			<a href="<%=request.getContextPath()%>/admin/memberdellist">- 회원탈퇴 / 삭제관리</a>
		</dd>

	</dl>
</div>

<div id="admin_contents">
	<h3>회원탈퇴 / 삭제관리</h3>
	<ul class="helpbox">
		<li>탈퇴신청및 삭제한 회원목록입니다.</li>
	</ul>
	<form name="f" method="get" action="/bitcamp/admin/memberdellist">
		<table class="adminform">
			<tbody>
				<tr>
					<th>신청일</th>
					<td id="datepickerbox"><input type="text" name="s_date" id="s_date" value="${pagevo.s_date }"
						class="text w100" autocomplete="off"><img
						class="ui-datepicker-trigger" src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						alt="Select date" title="Select date"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
						<span>~</span> <input type="text" name="e_date" id="e_date" value="${pagevo.e_date }" autocomplete="off"
						class="text w100 hasDatepicker"><img
						src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						alt="Select date" title="Select date"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
					</td>
				</tr>
				<tr>
					<th>직접검색</th>
					<td><select name="searchKey">
							<option value="username" <c:if test="${pagevo.searchKey =='username' }">selected=""</c:if>>회원명</option>
							<option value="userid" <c:if test="${pagevo.searchKey =='userid' }">selected=""</c:if>>회원아이디</option>
					</select> <input type="text" name="searchWord" value="${pagevo.searchWord }"></td>
				</tr>
			</tbody>
		</table>
		<div class="searchbtn">
			<button class="textsearch">검색</button>
		</div>
	</form>
	<h4 class="allgoodsnum">
		총 <span class="red">${pagevo.totalRecord }</span>명의 회원이 있습니다.
	</h4>


	<!-- 회원 리스트 -->
	<form method="get" action="/bitcamp/admin/memberReturn">
		<table class="goodslist">
			<tbody>
				<tr>
					<th class="width50"><input type="checkbox" id="allCheck"></th>
					<th class="width50">번호</th>
					<th class="width100">아이디</th>
					<th class="width150">이름</th>
					<th>탈퇴사유</th>
					<th class="width150">신청일</th>
					<th class="width150">처리일</th>
				</tr>
				<c:forEach var="vo" items="${list }">
				<tr>
					<td class="width50"><input type="checkbox" name="chk"
						value="${vo.userno }"></td>
					<td>${vo.userno}</td>
					<td>${vo.userid }</td>
					<td><a href=""
						style="color: blue;">${vo.username }</a></td>
					<td>${vo.reason }</td>
					<td>${vo.withdrawaldate }</td>
					<td></td>
				</tr>
				</c:forEach>
				<c:if test="${fn:length(list)==0 }">
					<tr>
						<th colspan="15" style="background: #fff;">등록된 데이터가 없습니다.</th>
					</tr>
				</c:if>
				
			</tbody>
		</table>
		<div style="margin-top: 5px;">
			<button type="submit" name="btn">선택삭제</button>
		</div>
	</form>
	<!-- 페이징 -->
	<div style="width: 100%; clear: left">
			<ul class="pagination justify-content-center">
				<c:if test="${pagevo.pageNum == 1}">
					<li class="page-item disabled"><a class="page-link">&lt;</a></li>
				</c:if>
				<c:if test="${pagevo.pageNum > 1}">
					<li class="page-item"><a class="page-link text-white black"
						href="/bitcamp/admin/memberdellist?pageNum=${pagevo.pageNum - 1}
						<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>
						<c:if test = "${pagevo.s_date !=null && pagevo.e_date !=null  && pagevo.s_date !='' && pagevo.e_date !=''  }">&s_date=${pagevo.s_date }&e_date=${pagevo.e_date }</c:if>
						">&lt;</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${pagevo.startPage}"
					end="${pagevo.startPage + pagevo.onePageCount - 1}">
					<c:if test="${i <= pagevo.totalPage}">
						<li class="page-item"><a class="page-link pages"
							href="/bitcamp/admin/memberdellist?pageNum=${i}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>
							<c:if test = "${pagevo.s_date !=null && pagevo.e_date !=null  && pagevo.s_date !='' && pagevo.e_date !=''  }">&s_date=${pagevo.s_date }&e_date=${pagevo.e_date }</c:if>
							"<c:if test = "${i == pagevo.pageNum}">style = "background : black; color : white;"</c:if>>${i}</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if
					test="${pagevo.pageNum == pagevo.totalPage || pagevo.totalPage == ''}">
					<li class="page-item disabled"><a class="page-link">&gt;</a></li>
				</c:if>
				<c:if
					test="${pagevo.pageNum != pagevo.totalPage && pagevo.totalPage != ''}">
					<li class="page-item"><a class="page-link text-white black"
						href="/bitcamp/admin/memberdellist?pageNum=${pagevo.pageNum + 1}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>
						<c:if test = "${pagevo.s_date !=null && pagevo.e_date !=null  && pagevo.s_date !='' && pagevo.e_date !=''  }">&s_date=${pagevo.s_date }&e_date=${pagevo.e_date }</c:if>">&gt;</a>
					</li>
				</c:if>
			</ul>
		</div>

</div>


