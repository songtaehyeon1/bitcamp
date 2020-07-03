<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script>
	$(function() {
		$("#productmenu").attr("class","over");
		$("#form").submit(function() {
			var chk = $("input:checkbox[name=chk]:checked").length

			if (chk == 0) {
				alert("상품을 선택해셔야 합니다.");
				return false;
			} else {
				return true;
			}
		})
	});
</script>

<div id="admin_top_menu_under">&nbsp;</div>

<div id="admin_left_menu">
	<h2>상품관리</h2>
	<dl>
		<dt>상품분류</dt>
		<dd>
			<a href="<%=request.getContextPath()%>/admin/productCategory">-
				카테고리관리</a>
		</dd>
		<dt>상품관리</dt>
		<dd>
			<a href="<%=request.getContextPath()%>/admin/product">- 상품리스트</a>
		</dd>
		<dd>
			<a href="<%=request.getContextPath()%>/admin/insertProduct">-
				상품등록</a>
		</dd>
	</dl>

</div>


<div id="admin_contents">
	<h3>상품재고리스트</h3>
	<ul class="helpbox">
		<li>해당 상품의 재고를 등록하거나 삭제합니다.</li>
	</ul>
	<form method="get" action="/bitcamp/admin/stocklist?p_no=${pvo.p_no }">
		<input type="hidden" name="p_no" value="${pvo.p_no }" />
		<table class="goods_search adminform">
			<tbody>
				<tr>
					<th>예약날짜</th>
					<td><input type="text" name="s_date" id="s_date" value="${pagevo.s_date }"
						class="text w100"><img class="ui-datepicker-trigger"
						src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						alt="Select date" title="Select date"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
						~ <input type="text" name="e_date" id="e_date" value="${pagevo.e_date }"
						class="text w100"><img class="ui-datepicker-trigger"
						src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						alt="Select date" title="Select date"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
					</td>
				</tr>
				<tr>
					<th>재고수량</th>
					<td><strong style="font-size: 2em;">${pvo.productCount }</strong>
					</td>
				</tr>
				<tr>
					<th>가능 재고번호</th>
					<td><c:forEach var="pvo" items="${pvo.s_noList }">
							<strong
								style="font-size: 2em; margin-right: 20px; border-bottom: 1px solid gray">${pvo }</strong>
						</c:forEach></td>
				</tr>

			</tbody>
		</table>
		<div class="searchbtn">
			<button class="btn btn-dark">재고 확인</button>
		</div>
	</form>
	<form method="get" action="/bitcamp/admin/stocklist?p_no=${pvo.p_no }">
		<input type="hidden" name="p_no" value="${pvo.p_no }" />
		<table class="goods_search adminform">
			<tbody>
				<tr>
					<th>상품명</th>
					<td>${pvo.c_name}>${pvo.p_name }</td>
				</tr>
				<tr>
					<th>재고여부</th>
					<td><label for="s_deltype"><input type="radio"
							name="s_deltype" value="All"
							<c:if test="${pagevo.s_deltype =='All'  || pagevo.s_deltype ==null || pagevo.s_deltype ==''}">checked="checked"</c:if>>전체상품</label>
						<label for="s_deltype"><input type="radio"
							name="s_deltype" value="Y"
							<c:if test="${pagevo.s_deltype =='Y' &&pagevo.s_deltype != null &&pagevo.s_deltype != ''}">checked="checked"</c:if>>재고있음</label>
						<label for="s_deltype"><input type="radio"
							name="s_deltype" value="N"
							<c:if test="${pagevo.s_deltype =='N' &&pagevo.s_deltype != null &&pagevo.s_deltype != ''}">checked="checked"</c:if>>재고없음</label></td>
				</tr>
			</tbody>
		</table>
		<div class="searchbtn">
			<button class="btn btn-dark">검색</button>
		</div>
	</form>
	<h4 class="allgoodsnum">
		총 <span class="red">${fn:length(list) }</span>개의 상품이 검색되었습니다.

	</h4>


	<!-- 상품 리스트 -->
	<form method="get" name="form" id="form">
		<input type="hidden" name="p_no" value="${pvo.p_no }" />
		<table class="goodslist" style="table-layout: fixed">
			<tbody>
				<div style="position: relative; float: right; margin-bottom: 10px;">
					<input type="submit" class="btn btn-dark"
						onclick="javascript:form.action='/bitcamp/admin/stockDel'"
						value="선택 삭제" />
				</div>
				<div
					style="position: relative; float: right; margin-bottom: 10px; margin-right: 10px">
					<input type="submit" class="btn btn-dark"
						onclick="javascript:form.action='/bitcamp/admin/stockRestore'"
						value="재고 복구" />
				</div>
				<div
					style="position: relative; float: right; margin-bottom: 10px; margin-right: 10px">
					<a href="/bitcamp/admin/addStock?p_no=${pvo.p_no }"
						class="btn btn-dark">상품등록</a>
				</div>
				<tr>
					<th width="5%"><input type="checkbox" id="allCheck"></th>
					<th width="5%">상품번호</th>
					<th width="5%">재고번호</th>
					<th width="20%">상품명</th>
					<th width="10%">재고상태</th>
					<th width="35%">비고</th>
					<th width="20%">재고생성일자</th>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td><input type="checkbox" name="chk" class="chk"
							value="${vo.s_no }"></td>
						<td>${vo.p_no }</td>
						<td>${vo.s_no }</td>
						<td style="text-overflow: ellipsis; overflow: hidden"
							title="${vo.p_name }"><nobr>${vo.p_name }</nobr></td>
						<td><c:if test="${vo.s_deltype =='Y'}">
								<span style="color: blue">재고있음</span>
							</c:if> <c:if test="${vo.s_deltype =='N'}">
								<span style="color: red">재고없음</span>
							</c:if></td>
						<td style="text-overflow: ellipsis; overflow: hidden"
							title="${vo.note }"><nobr>${vo.note }</nobr></td>
						<td>${vo.s_regdate}</td>
					</tr>
				</c:forEach>
				<c:if test="${fn:length(list)==0 }">
					<tr>
						<th colspan="15" style="background: #fff;">등록된 데이터가 없습니다.</th>
					</tr>
				</c:if>
			</tbody>
		</table>
	</form>
	<div style="width: 100%; clear: left">
		<ul class="pagination justify-content-center">
			<c:if test="${pagevo.pageNum == 1}">
				<li class="page-item disabled"><a class="page-link">&lt;</a></li>
			</c:if>
			<c:if test="${pagevo.pageNum > 1}">
				<li class="page-item"><a class="page-link text-white black"
					href="/bitcamp/admin/stocklist?p_no=${pvo.p_no }&pageNum=${pagevo.pageNum - 1}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>">&lt;</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${pagevo.startPage}"
				end="${pagevo.startPage + pagevo.onePageCount - 1}">
				<c:if test="${i <= pagevo.totalPage}">
					<li class="page-item"><a class="page-link pages"
						href="/bitcamp/admin/stocklist?p_no=${pvo.p_no }&pageNum=${i}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>"
						<c:if test = "${i == pagevo.pageNum}">style = "background : black; color : white;"</c:if>>${i}</a>
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
					href="/bitcamp/admin/stocklist?p_no=${pvo.p_no }&pageNum=${pagevo.pageNum + 1}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>">&gt;</a>
				</li>
			</c:if>
		</ul>
	</div>



</div>


