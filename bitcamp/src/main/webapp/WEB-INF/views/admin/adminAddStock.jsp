<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/admin.css" />
<script>
	$(function() {
		$("#allCheck").click(function() {
			//만약 전체 선택 체크박스가 체크된상태일경우
			if ($("#allCheck").prop("checked")) {
				//해당화면에 전체 checkbox들을 체크해준다
				$("input[type=checkbox]").prop("checked", true);
				$("input:checkbox[name='chkall']").attr("checked", false);
				// 전체선택 체크박스가 해제된 경우
			} else {
				//해당화면에 모든 checkbox들의 체크를해제시킨다.
				$("input[type=checkbox]").prop("checked", false);
			}
		});
	});
</script>
<div
	style="height: 70px; background: #333; color: white; font-size: 3em">관리자
	페이지</div>
<div id="admin_top_menu_box">
	<ul>
		<a href="<%=request.getContextPath()%>/admin/home"><li>관리자홈</li></a>
		<a href="#"><li>기본설정</li></a>
		<a href="<%=request.getContextPath()%>/admin/member"><li>회원관리</li></a>
		<a href="<%=request.getContextPath()%>/admin/product"><li
			class="over">상품관리</li></a>
		<a href="<%=request.getContextPath()%>/admin/orderList"><li>주문관리</li></a>
		<a href="#"><li>매출관리</li></a>
	</ul>
</div>
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