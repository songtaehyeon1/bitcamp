<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript">
	$(function() {
		$("#ordermenu").attr("class", "over");
	});
</script>


<div id="admin_top_menu_under">&nbsp;</div>
<div id="admin_left_menu">
	<h2>주문관리</h2>
	<dl>
		<dt>주문관리</dt>
		<dd>
			<a href="">- 주문리스트</a>
		</dd>		
		<dt>취소/교환/반품/환불</dt>
		<dd>
			<a href="">- 취소리스트</a>
		</dd>
		<dd>
			<a href="">- 교환/반품리스트</a>
		</dd>
		<dd>
			<a href="">- 환불리스트</a>
		</dd>
	</dl>
</div>

<div id="admin_contents">
	<h3>주문통합리스트</h3>
	<ul class="helpbox">
		<li>전체 주문 목록을 확인할 수 있습니다.</li>
		<li style="color: red;">취소처리 된 주문서는 삭제할 수 없습니다.</li>
	</ul>
	<h4>주문검색</h4>
	<form name="ff" method="get">
		<table class="goods_search adminform">
			<tbody>
				<tr>
					<th>진행상태</th>
					<td><label for=""><input type="checkbox"
							name="delivery_status" value="입금대기"> 입금대기</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label for=""><input type="checkbox"
							name="delivery_status" value="결제완료"> 결제완료</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label for=""><input type="checkbox"
							name="delivery_status" value="배송준비중"> 배송준비중</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label for=""><input type="checkbox"
							name="delivery_status" value="배송중"> 배송중</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label for=""><input type="checkbox"
							name="delivery_status" value="배송완료"> 배송완료</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<br></td>
				</tr>
				<tr>
					<th>결제수단</th>
					<td><label for=""><input type="radio"
							name="payment_type" value="All" checked=""> 전체</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label for=""><input type="radio" name="payment_type"
							value="card"> 신용카드</label>&nbsp;&nbsp;&nbsp;&nbsp;<label for=""><input
							type="radio" name="payment_type" value="cash"> 무통장</label></td>
				</tr>
				<tr>
					<th>기간</th>
					<td><label for=""><input type="radio" name="ndate"
							value="order_date" checked="">주문일</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label for=""><input type="radio" name="ndate"
							value="delivery_date"> 배송일</label>&nbsp;&nbsp;&nbsp;&nbsp; <label
						for=""><input type="radio" name="ndate"
							value="delivery_arrival_date"> 배송완료일</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<b>일자</b> <input type="text" name="s_date" id="s_date" value=""
						class="text w100 hasDatepicker"><img
						src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
						~ <input type="text" name="e_date" id="e_date" value=""
						class="text w100"><img
						src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
					</td>
				</tr>
				<tr>
					<th>주문금액</th>
					<td><input type="text" id="settleprice1" name="s_price"
						value="" class="money"><span>원&nbsp;&nbsp;~&nbsp;&nbsp;</span>
						<input type="text" id="settleprice2" name="e_price" value=""
						class="money"><span>원</span></td>
				</tr>
				<tr>
					<th>직접검색</th>
					<td><select name="searchKey">
							<option value="" selected="">전체</option>
							<option value="o_no">주문번호</option>
							<option value="userid">주문자ID</option>
							<option value="oname">주문자명</option>
							<option value="oemail">주문자이메일</option>
							<option value="otel">주문자연락처</option>
							<option value="rname">수령인명</option>
							<option value="rtel">수령인연락처</option>
					</select> <input type="text" name="searchWord" value=""></td>
				</tr>
			</tbody>
		</table>
		<div class="searchbtn">
			<button class="textsearch">검색</button>
		</div>
	</form>
	<h4 class="allgoodsnum">
		총 <span class="red">0</span>개의 주문건이 있습니다.		
	</h4>
	<table class="goodslist">
		<tbody>
			<tr>
				<th class="width50"><input type="checkbox" id="allCheck"></th>
				<th>주문일</th>
				<th>주문번호</th>
				<th>주문자명</th>
				<th>수명인명</th>
				<th>회원ID</th>
				<th>주문금액</th>
				<th>배송일</th>
				<th>배송완료일</th>
				<th>결제수단</th>
				<th>상태</th>
			</tr>
			<c:forEach var="vo" items="${list }">
			
			<tr>
				<td class="width50"><input type="checkbox" id="allCheck"></td>
				<td>${vo.order_date }</td>
				<td><a href="/bitcamp/admin/orderView?o_no=${vo.o_no }">${vo.o_no }</a></td>
				<td>${vo.oname }</td>
				<td>${vo.rname }</td>
				<td>${vo.userid }</td>
				<td>${vo.totalprice }</td>
				<td>${vo.delivery_date }</td>
				<td>${vo.delivery_arrival_date }</td>
				<td><c:if test="${vo.payment_type =='cash' }">무통장입금</c:if>
									<c:if test="${vo.payment_type =='card' }">카드결제</c:if></td>
				<td>${vo.delivery_status }</td>
			</tr>
			</c:forEach>
			<c:if test="${fn:length(list)==0 }">
				<tr>
					<th colspan="15" style="background: #fff;">등록된 데이터가 없습니다.</th>
				</tr>
			</c:if>
		</tbody>
	</table>

	<div class="btmbtnwrap" style="position: relative; top: 0px;">
		<button type="button" onclick="del_();">선택삭제</button>

	</div>
	<table class="adminform priceallwrap">
		<tbody>
			<tr>
				<th>주문상태설정</th>
				<td>
					<div>
						<select name="statech">
							<option value="1">입금대기</option>
							<!--
						<option value="2" >결제완료</option>
						-->
							<option value="3">배송준비중</option>
							<option value="4">배송중</option>
							<option value="5">배송완료</option>
						</select> (으)로 일괄적으로 수정합니다.
						<button type="button" onclick="state_ch();">변경하기</button>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>


