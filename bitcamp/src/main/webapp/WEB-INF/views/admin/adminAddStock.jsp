<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript">
	$(function() {
		$("#productmenu").attr("class","over");
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
	<h3>상품재고등록</h3>
	<ul class="helpbox">
		<li>해당 상품의 재고를 등록합니다.</li>
	</ul>
	<form method="get"
		action="/bitcamp/admin/addStockOk">
		<input type="hidden" name="p_no" value="${pvo.p_no }" />
		<table class="goods_search adminform">
			<tbody>
				<tr>
					<th>상품명</th>
					<td>${pvo.c_name}>${pvo.p_name }</td>
				</tr>				
				<tr>
					<th>현 재고수량</th>
					<td><strong style="font-size: 2em;">${pvo.productCount }</strong>
					</td>
				</tr>
				<tr>
					<th>생성 재고번호</th>
					<td><strong style="font-size: 2em;">${sno_sq }</strong>
					</td>
				</tr>
				<tr>
					<th>비고 입력</th>
					<td><textarea name="note" cols="150" rows="3"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="searchbtn">
			<button class="textsearch">등록</button>
		</div>
	</form>
</div>