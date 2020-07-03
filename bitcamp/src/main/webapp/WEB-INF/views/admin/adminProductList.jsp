<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script>
	$(function() {
		$("#productmenu").attr("class","over");
		$("#reset").click(function() {
			$("input").val('');
			$("#searchKey").val('p_name');
			$("#c_no").val(0);
			$("#all").click();
		});
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
	<h3>상품리스트</h3>
	<ul class="helpbox">
		<li>·&nbsp;&nbsp;등록하신 상품들을 수정/관리 하실 수 있습니다.</li>
		<li>·&nbsp;&nbsp;[상품영역]을 클릭하시면 영역별로 상품들을 보실 수 있습니다.</li>
		<li>·&nbsp;&nbsp;서브메인 영역에 상품을 올릴시려면 상품관리에서 제일 마지막 카테고리분류(소분류)를
			클릭하시면 됩니다.</li>
		<li>·&nbsp;&nbsp;[상품진열]버튼을 클릭하시면 상품을 숨길수 있으며 [진열안함]버튼을 클릭하시면 상품을
			전시하실수 있습니다.</li>
		<li>·&nbsp;&nbsp;[상품영역]중 서브메인과 중간영역은 카테고리 지정시에만 가능합니다.</li>
	</ul>

	<form method="get" action="/bitcamp/admin/product">
		<table class="goods_search adminform">
			<tbody>
				<tr>
					<th>상품분류</th>
					<td><select id="c_no" name="c_no"
						style="border: 1px #CCC solid; height: 25px">
							<option value="0" selected="">전체분류</option>
							<c:forEach var="cvo" items="${clist }">
								<option value="${cvo.c_no }" <c:if test="${pagevo.c_no == cvo.c_no }">selected="selected"</c:if>>${cvo.c_name }</option>
							</c:forEach>
					</select></td>

				</tr>
				<tr>
					<th>등록일</th>
					<td><input type="text" name="s_date" id="s_date" value="${pagevo.s_date }"
						class="text w100"><img class="ui-datepicker-trigger"
						src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						alt="" title="Select date"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
						~ <input type="text" name="e_date" id="e_date" value="${pagevo.e_date }"
						class="text w100"><img class="ui-datepicker-trigger"
						src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						alt="" title="Select date"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
					</td>
				</tr>
				<tr>
					<th>재고여부</th>
					<td><label for="p_deltype"><input type="radio" id="all"
							name="p_deltype" value="All"
							<c:if test="${pagevo.p_deltype =='All'  || pagevo.p_deltype ==null || pagevo.p_deltype ==''}">checked="checked"</c:if>>전체상품</label>
						<label for="p_deltype"><input type="radio"
							name="p_deltype" value="Y"
							<c:if test="${pagevo.p_deltype =='Y' &&pagevo.p_deltype != null &&pagevo.p_deltype != ''}">checked="checked"</c:if>>판매</label>
						<label for="p_deltype"><input type="radio"
							name="p_deltype" value="N"
							<c:if test="${pagevo.p_deltype =='N' &&pagevo.p_deltype != null &&pagevo.p_deltype != ''}">checked="checked"</c:if>>품절</label></td>
				</tr>
				<tr>
					<th>직접검색</th>
					<td><select name="searchKey" id="searchKey" >
							<option value="p_name" selected="">상품명</option>
							<option value="p_no">상품코드</option>
					</select> <input type="text" name="searchWord" style="width: 200px;">
					</td>
				</tr>
			</tbody>
		</table>
		<div class="searchbtn">
			<button class="textsearch">검색</button>
			<button class="textsearch" type="button" id="reset">초기화</button>
		</div>
	</form>
	<h4 class="allgoodsnum">
		총 <span class="red">${fn:length(list) }</span>개의 상품이 검색되었습니다.

	</h4>

	<!-- 상품 리스트 -->
	<table class="goodslist">
		<tbody>
			<tr>
				<th width="7%">상품코드</th>
				<th width="25%">상품명</th>
				<th width="15%">카테고리</th>
				<th width="5%">개수</th>
				<th width="15%">가격</th>
				<th width="6%">판매여부</th>
				<th width="6%">배송료</th>
				<th width="10%">등록일</th>
				<th width="8%">수정</th>
				<th width="8%">재고</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.p_no }</td>
					<td class="goodsname">
						<div class="imgwrap">
							<img
								src="<%=request.getContextPath() %>/upload/${vo.p_filename1 }"
								alt="">
						</div>
						<div>
							<p class="gdname">
								<a href="<%=request.getContextPath()%>/admin/stocklist?p_no=${vo.p_no}">${vo.p_name }</a>
							</p>
							<p class="gdcate"></p>
						</div>
					</td>
					<td>${vo.c_name }</td>
					<td>1 개</td>
					<td><span
						style="display: inline-block; width: 80px; text-align: right;">${vo.price }원
					</span></td>
					<td><c:if test="${vo.p_deltype =='Y'}">
							<span style="color: blue">판매중</span>
						</c:if> <c:if test="${vo.p_deltype =='N'}">
							<span style="color: red">품절</span>
						</c:if></td>
					<td>${vo.delivery_fee }원</td>
					<td>${vo.p_date }</td>
					<td><a class="btn btn-dark" type="button"
						style="width: 70px; color: white"
						href="<%=request.getContextPath()%>/updateProduct?p_no=${vo.p_no}">수정</a></td>
					<td><a class="btn btn-dark" type="button"
						style="width: 70px; color: white"
						href="<%=request.getContextPath()%>/admin/stocklist?p_no=${vo.p_no}">재고</a></td>
				</tr>
			</c:forEach>
			<c:if test="${fn:length(list)==0 }">
				<tr>
					<th colspan="15" style="background: #fff;">등록된 데이터가 없습니다.</th>
				</tr>
			</c:if>

		</tbody>
	</table>
	<div style="width: 100%; clear: left">
		<ul class="pagination justify-content-center">
			<c:if test="${pagevo.pageNum == 1}">
				<li class="page-item disabled"><a class="page-link">&lt;</a></li>
			</c:if>
			<c:if test="${pagevo.pageNum > 1}">
				<li class="page-item"><a class="page-link text-white black"
					href="/bitcamp/admin/product?pageNum=${pagevo.pageNum - 1}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>">&lt;</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${pagevo.startPage}"
				end="${pagevo.startPage + pagevo.onePageCount - 1}">
				<c:if test="${i <= pagevo.totalPage}">
					<li class="page-item"><a class="page-link pages"
						href="/bitcamp/admin/product?pageNum=${i}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>"
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
					href="/bitcamp/admin/product?pageNum=${pagevo.pageNum + 1}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>">&gt;</a>
				</li>
			</c:if>
		</ul>
	</div>



</div>


