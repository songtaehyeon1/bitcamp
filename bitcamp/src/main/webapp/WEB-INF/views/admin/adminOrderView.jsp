<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(function() {
		$("#ordermenu").attr("class","over");
		var today = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate());
		$('#delivery_date').datepicker({
			uiLibrary : 'bootstrap4.4.1',
			format : "yyyy-mm-dd",
			icons: { rightIcon: null }
					
		});
		$('#delivery_arrival_date').datepicker({
			uiLibrary : 'bootstrap4.4.1',
			format : "yyyy-mm-dd",
			icons: { rightIcon: null }
					
		});
	});
	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				jQuery("#rzipcode").val(data.zonecode);
				jQuery("#raddr").val(data.address);
				jQuery("#raddrdetail").val('');
				jQuery("#raddrdetail").focus();
			}
		}).open();
	}

	
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
	<h3>주문상세내역</h3>
	<ul class="helpbox">
		<li>이 주문에 대한 상세한 내역을 조회하고 수정하실 수 있습니다.</li>
	</ul>
	<h4>주문번호 :</h4>
	<form method="get" action="/bitcamp/admin/orderEdit">
		<input type="hidden" name= "o_no" value="${vo.o_no }"/>
		<table class="admin_table">
			<tbody>				
				<tr>
					<th style="width: 5%;">번호</th>
					<th style="width: 35%;">상품정보</th>
					<th style="width: 5%;">수량</th>
					<th style="width: 8%;">판매가</th>
					<th style="width: 8%;">1박당가격</th>
					<th style="width: 8%;">총 금액</th>
				</tr>
				<c:forEach var="pvo" items="${list }" >
				<tr>
					<td>${pvo.p_no }</td>
					<td>${pvo.p_name }</td>
					<td>${pvo.p_count }</td>
					<td>${pvo.price }</td>
					<td>${pvo.day_price }</td>
					<td>${pvo.price*pvo.p_count }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>

		<h4 style="margin-top: 30px;">결제금액 정보</h4>
		<table class="admin_table">
			<tbody>
				<tr>
					<th width="10%">무통장 주문금액</th>
					<td width="40%"><b><c:if test="${vo.payment_type =='cash' }">${vo.totalprice }원</c:if></b></td>
					<th width="10%">카드 주문금액</th>
					<td width="40%"><b><c:if test="${vo.payment_type =='card' }">${vo.totalprice }원</c:if></b></td>
				</tr>
				<tr>
					<th>무통장 결제금액</th>
					<td><input type="text" name="payment_price" value="0" class="text w120">원</td>
					<th>카드 결제금액</th>
					<td><b><c:if test="${vo.payment_type =='card' }">${vo.totalprice }원</c:if></b></td>
				</tr>
			</tbody>
		</table>

		<!-- 주문자정보 / 수령자정보 -->
		<table width="100%">
			<tbody>
				<tr>
					<td width="49%" valign="top">
						<h4>주문자 정보</h4>
						<table class="admin_table">
							<tbody>							
								<tr>
									<th>이름(ID)</th>
									<td><b>${vo.oname }(${vo.userid})</b></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>${vo.oemail }</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>${vo.otel }</td>
								</tr>
								<tr>
									<th>주문일</th>
									<td>${vo.order_date }</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td width="2%"></td>
					<td width="49%">
						<h4>수령자 정보</h4>
						<table class="admin_table">
							<tbody>
								<tr>
									<th>수령자</th>
									<td><input type="text" name="rname" value="${vo.rname }"
										class="text w120"></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><input type="text" name="rtel" value="${vo.rtel }"
										class="text w120">
									</td>
								</tr>
								<tr>
									<th>주소</th>
									<td><input type="text" name="rzipcode" id="post" value="${vo.rzipcode }"
										class="text w70" readonly="">
										<button type="button" style="width: 70px;" onclick="openDaumZipAddress()">검색</button></td>
								</tr>
								<tr>
									<th></th>
									<td>
										<ul>
											<li>기본 <input type="text" name="raddr" id="raddr"
												value="${vo.raddr }" class="text w400" readonly=""></li>
											<li>상세 <input type="text" name="raddrdetail"
												id="raddrdetail" value="${vo.raddrdetail }" class="text w400"></li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>

		<!-- 결제정보 / 배송정보 -->
		<table width="100%">
			<tbody>
				<tr>
					<td width="49%">
						<h4>결제 정보</h4>
						<table class="admin_table">
							<tbody>
								<tr>
									<th>결제종류</th>
									<td><c:if test="${vo.payment_type =='cash' }">무통장입금</c:if>
									<c:if test="${vo.payment_type =='card' }">카드결제</c:if>
									</td>
								</tr>
								<tr>
									<th>결제시간</th>
									<td>
										<c:if test="${vo.payment_type =='cash' }">${vo.cash_time }</c:if>
										<c:if test="${vo.payment_type =='card' }">${vo.card_time }</c:if>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
					<td width="2%"></td>
					<td width="49%" valign="top">
						<h4>배송 정보</h4>
						<table class="admin_table">
							<tbody>
								<tr>
									<th>송장번호</th>
									<td><select name="delivery_corp"
										style="border: 1px #e6e6e6 solid; height: 30px;">
											<option value="16">CJ대한통운</option>											
									</select><input	type="text" name="delivery_code" value="${vo.delivery_code }" class="text w200">
									</td>
								</tr>
								<tr>
									<th>배송일/출고일</th>
									<td><input type="text" name="delivery_date" id="delivery_date" class="text" value="${vo.delivery_date }"/></td>
								</tr>
								<tr>
									<th>배송완료일</th>
									<td><input type="text" name="delivery_arrival_date" id="delivery_arrival_date" class="text" value="${vo.delivery_arrival_date }"/></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>

		<!-- 요청사항 -->
		<h4>요청사항 / 상담메모</h4>
		<table class="admin_table" style="width: 50%">
			<tbody>
				<tr>
					<th>고객요청사항</th>
					<td style="padding: 3px 3px 0px;"><textarea name="rcommnet"
							style="width: 99%; height: 100px; border: 1px #e6e6e6 solid;">${vo.rcommnet }</textarea></td>
				</tr>
			</tbody>
		</table>
		<div class="searchbtn">
			<input type="submit" class="btn btn-dark" value="수정"/>
			<a href="/bitcamp/admin/orderList" class="btn btn-dark">목록으로</a>
		</div>
	</form>
</div>