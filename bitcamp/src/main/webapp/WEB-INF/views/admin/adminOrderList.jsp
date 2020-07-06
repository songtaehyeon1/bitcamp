<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript">
	$(function() {
		$("#ordermenu").attr("class", "over");
		$("#reset").click(function() {
			$("input").val('');
			$("#searchKey").val('');		
			$("#order_date").click();
			$("#payment_all").click();
			$("input[name='delivery_status']").attr("checked",false);

		});

		$('#s_date').datepicker({
			uiLibrary : 'bootstrap4.4.1',
			format : "yyyy-mm-dd",
			icons : {
				rightIcon : null
			}

		});
		$('#e_date').datepicker({
			uiLibrary : 'bootstrap4.4.1',
			format : "yyyy-mm-dd",
			icons : {
				rightIcon : null
			}

		});

	});
</script>
<style>
#datepickerbox div, #datepickerbox img, #datepickerbox span,
	#datepickerbox label, #datepickerbox input {
	float: left
}
</style>

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
	<form method="get" action="/bitcamp/admin/orderList">
		<table class="goods_search adminform">
			<tbody>
				<tr>
					<th>진행상태</th>
					<td><label for="">
					<input type="checkbox" name="delivery_status" value="입금대기"
							<c:set var="contains" value="false" />
							<c:forEach var="item" items="${pagevo.delivery_status}">
								<c:if test="${item == '입금대기'}"><c:set var="contains" value="true" /></c:if>
							</c:forEach>
							<c:if test="${contains == 'true'}">checked="checked"</c:if>
							>
							입금대기</label>&nbsp;&nbsp;&nbsp;&nbsp; <label for=""><input
							type="checkbox" name="delivery_status" value="결제완료" <c:set var="contains" value="false" />
							<c:forEach var="item" items="${pagevo.delivery_status}">
								<c:if test="${item == '결제완료'}"><c:set var="contains" value="true" /></c:if>
							</c:forEach>
							<c:if test="${contains == 'true'}">checked="checked"</c:if>> 결제완료</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label for=""><input type="checkbox"
							name="delivery_status" value="배송준비중" <c:set var="contains" value="false" />
							<c:forEach var="item" items="${pagevo.delivery_status}">
								<c:if test="${item == '배송준비중'}"><c:set var="contains" value="true" /></c:if>
							</c:forEach>
							<c:if test="${contains == 'true'}">checked="checked"</c:if>> 배송준비중</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label for=""><input type="checkbox"
							name="delivery_status" value="배송중" <c:set var="contains" value="false" />
							<c:forEach var="item" items="${pagevo.delivery_status}">
								<c:if test="${item == '배송중'}"><c:set var="contains" value="true" /></c:if>
							</c:forEach>
							<c:if test="${contains == 'true'}">checked="checked"</c:if>> 배송중</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label for=""><input type="checkbox"
							name="delivery_status" value="배송완료" <c:set var="contains" value="false" />
							<c:forEach var="item" items="${pagevo.delivery_status}">
								<c:if test="${item == '배송완료'}"><c:set var="contains" value="true" /></c:if>
							</c:forEach>
							<c:if test="${contains == 'true'}">checked="checked"</c:if>> 배송완료</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<br></td>
				</tr>
				<tr>
					<th>결제수단</th>
					<td><label for=""><input type="radio"
							name="payment_type" value="All" id="payment_all"
							<c:if test="${pagevo.payment_type =='All'||pagevo.payment_type ==''||pagevo.payment_type ==null }">checked="checked"</c:if>>
							전체</label>&nbsp;&nbsp;&nbsp;&nbsp; <label for=""><input
							type="radio" name="payment_type" value="card"
							<c:if test="${pagevo.payment_type =='card' }">checked="checked"</c:if>>
							신용카드</label>&nbsp;&nbsp;&nbsp;&nbsp;<label for=""><input
							type="radio" name="payment_type" value="cash"
							<c:if test="${pagevo.payment_type =='cash' }">checked="checked"</c:if>>
							무통장</label></td>
				</tr>
				<tr>
					<th>기간</th>
					<td id="datepickerbox"><label for=""><input
							type="radio" name="ndate" value="order_date" id="order_date"
							<c:if test="${pagevo.ndate =='order_date' || pagevo.ndate =='' ||pagevo.ndate ==null }">checked="checked"</c:if>>주문일</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label for=""><input type="radio" name="ndate"
							value="delivery_date"
							<c:if test="${pagevo.ndate =='delivery_date' }">checked="checked"</c:if>>
							배송일</label>&nbsp;&nbsp;&nbsp;&nbsp; <label for=""><input
							type="radio" name="ndate" value="delivery_arrival_date"
							<c:if test="${pagevo.ndate =='delivery_arrival_date' }">checked="checked"</c:if>>
							배송완료일</label>&nbsp;&nbsp;&nbsp;&nbsp; <span>일자</span> <input type="text"
						name="s_date" id="s_date" value="${pagevo.s_date }" autocomplete="off"
						class="text w100 hasDatepicker"><img
						src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
						<span>~</span> <input type="text" name="e_date" id="e_date" autocomplete="off"
						value="${pagevo.e_date }" class="text w100"><img
						src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
					</td>
				</tr>
				<tr>
					<th>주문금액</th>
					<td><input type="text" id="settleprice1" name="s_price"
						value="${pagevo.s_price }" class="money"><span>원&nbsp;&nbsp;~&nbsp;&nbsp;</span>
						<input type="text" id="settleprice2" name="e_price"
						value="${pagevo.e_price }" class="money"><span>원</span></td>
				</tr>
				<tr>
					<th>직접검색</th>
					<td><select name="searchKey" id="searchKey">
							<option value=""
								<c:if test="${pagevo.searchKey == null || pagevo.searchKey !='' }">selected=""</c:if>>전체</option>
							<option value="o_no"
								<c:if test="${pagevo.searchKey =='o_no' }">selected=""</c:if>>주문번호</option>
							<option value="userid"
								<c:if test="${pagevo.searchKey =='userid' }">selected=""</c:if>>주문자ID</option>
							<option value="oname"
								<c:if test="${pagevo.searchKey =='oname' }">selected=""</c:if>>주문자명</option>
							<option value="oemail"
								<c:if test="${pagevo.searchKey =='oemail' }">selected=""</c:if>>주문자이메일</option>
							<option value="otel"
								<c:if test="${pagevo.searchKey =='otel' }">selected=""</c:if>>주문자연락처</option>
							<option value="rname"
								<c:if test="${pagevo.searchKey =='rname' }">selected=""</c:if>>수령인명</option>
							<option value="rtel"
								<c:if test="${pagevo.searchKey =='rtel' }">selected=""</c:if>>수령인연락처</option>
					</select> <input type="text" name="searchWord" value="${pagevo.searchWord }"></td>
				</tr>
			</tbody>
		</table>
		<div class="searchbtn">
			<button class="textsearch">검색</button>
			<button class="textsearch" type="button" id="reset">초기화</button>
		</div>
	</form>
	<h4 class="allgoodsnum">
		총 <span class="red">${pagevo.totalRecord }</span>개의 주문건이 있습니다.
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
					<td class="width50"><input type="checkbox" name="chk"></td>
					<td>${vo.order_date }</td>
					<td><a href="/bitcamp/admin/orderView?o_no=${vo.o_no }">${vo.o_no }</a></td>
					<td>${vo.oname }</td>
					<td>${vo.rname }</td>
					<td>${vo.userid }</td>
					<td>${vo.totalprice }</td>
					<td>${vo.delivery_date }</td>
					<td>${vo.delivery_arrival_date }</td>
					<td><c:if test="${vo.payment_type =='cash' }">무통장입금</c:if> <c:if
							test="${vo.payment_type =='card' }">카드결제</c:if></td>
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
	<div style="width: 100%; clear: left">
		<ul class="pagination justify-content-center">
			<c:if test="${pagevo.pageNum == 1}">
				<li class="page-item disabled"><a class="page-link">&lt;</a></li>
			</c:if>
			<c:if test="${pagevo.pageNum > 1}">
				<li class="page-item"><a class="page-link text-white black"
					href="/bitcamp/admin/orderList?pageNum=${pagevo.pageNum - 1}					
					<c:if test = "${pagevo.payment_type !=null }">&payment_type=${pagevo.payment_type }</c:if>
					<c:if test = "${pagevo.ndate !=null }">&ndaye = ${pagevo.ndate }</c:if>
					<c:if test = "${pagevo.s_date !=null && pagevo.e_date !=null  && pagevo.s_date !='' && pagevo.e_date !='' }">&s_date=${pagevo.s_date }&e_date=${pagevo.e_date }</c:if>
					<c:if test = "${pagevo.s_price !=null&& pagevo.s_price !='' }">&s_price=${pagevo.s_price }</c:if>
					<c:if test = "${pagevo.e_price !=null&& pagevo.e_price !='' }">&e_price=${pagevo.e_price }</c:if>
					<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>
					<c:if test="${pagevo.delivery_status !=null }">
						<c:forEach var="ds" items="${pagevo.delivery_status }">
						&delivery_status=${ds }
						</c:forEach>
					</c:if>
	
					">&lt;</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${pagevo.startPage}"
				end="${pagevo.startPage + pagevo.onePageCount - 1}">
				<c:if test="${i <= pagevo.totalPage}">
					<li class="page-item"><a class="page-link pages"
						href="/bitcamp/admin/orderList?pageNum=${i}
						<c:if test = "${pagevo.payment_type !=null }">&payment_type=${pagevo.payment_type }</c:if>
						<c:if test = "${pagevo.ndate !=null }">&ndaye = ${pagevo.ndate }</c:if>
						<c:if test = "${pagevo.s_date !=null && pagevo.e_date !=null && pagevo.s_date !='' && pagevo.e_date !='' }">&s_date=${pagevo.s_date }&e_date=${pagevo.e_date }</c:if>
						<c:if test = "${pagevo.s_price !=null&& pagevo.s_price !='' }">&s_price=${pagevo.s_price }</c:if>
						<c:if test = "${pagevo.e_price !=null&& pagevo.e_price !='' }">&e_price=${pagevo.e_price }</c:if>
						<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>
						<c:if test="${pagevo.delivery_status !=null }">
							<c:forEach var="ds" items="${pagevo.delivery_status }">
							&delivery_status=${ds }
							</c:forEach>
						</c:if>						
						"
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
					href="/bitcamp/admin/orderList?pageNum=${pagevo.pageNum + 1}
					<c:if test = "${pagevo.payment_type !=null }">&payment_type=${pagevo.payment_type }</c:if>
					<c:if test = "${pagevo.ndate !=null }">&ndaye = ${pagevo.ndate }</c:if>
					<c:if test = "${pagevo.s_date !=null && pagevo.e_date !=null  && pagevo.s_date !='' && pagevo.e_date !=''  }">&s_date=${pagevo.s_date }&e_date=${pagevo.e_date }</c:if>
					<c:if test = "${pagevo.s_price !=null && pagevo.s_price !='' }">&s_price=${pagevo.s_price }</c:if>
					<c:if test = "${pagevo.e_price !=null&& pagevo.e_price !='' }">&e_price=${pagevo.e_price }</c:if>
					<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>
					<c:if test="${pagevo.delivery_status !=null }">
						<c:forEach var="ds" items="${pagevo.delivery_status }">
						&delivery_status=${ds }
						</c:forEach>
					</c:if>					
					">&gt;</a>
				</li>
			</c:if>
		</ul>
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


