<%@page import="kr.co.bitcamp.product.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/order/orderForm.css" />
<script src="<%=request.getContextPath()%>/js/order/order.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$(function() {
	//총 결제 금액 세팅
	var totalOrderPrice = parseInt($("#total_order_price_view").html())//총 주문 금액
	var totalDeliveryFee = parseInt($("#total_delivery_fee_view").html())//총 배송비
	$("input[name='total_delivery_fee']").val(totalDeliveryFee);/* 배송비 */
	var totalTotal = totalOrderPrice + totalDeliveryFee//총 결제 예정 금액
	$("#total_order_sale_price_view").html(totalTotal)
	$("input[name='totalprice']").val(totalTotal)
	
	$("#addr_paymethod0").click(function() {
		$("#card-form").css("display","block");
		$("#card-agree").css("display","block");
		$("#cash-form").css("display","none");
		$("#current_pay_name").html("카드 결제");
	});
	$("#addr_paymethod1").click(function() {
		$("#card-form").css("display","none");
		$("#card-agree").css("display","none");
		$("#cash-form").css("display","block");
		$("#current_pay_name").html("무통장 입금");
	});
	
	$("#sameaddr0").change(function() {
		if($(this).prop('checked')){
			$("#rname").attr("value",$("#oname").val());
			$("#rzipcode").attr("value",$("#ozipcode").val());
			$("#raddr").attr("value",$("#oaddr").val());
			$("#raddrdetail").attr("value",$("#oaddrdetail").val());
			$("#rtel1").val($("#otel1").val()).prop("selected",true);
			$("#rtel2").attr("value",$("#otel2").val());
			$("#rtel3").attr("value",$("#otel3").val());
		}
	})
	
	$("#sameaddr1").change(function() {
		$("#rname").attr("value","");
		$("#rzipcode").attr("value","");
		$("#raddr").attr("value","");
		$("#raddrdetail").attr("value","");
		$("#rtel1").val("02").prop("selected",true);
		$("#rtel2").attr("value","");
		$("#rtel3").attr("value","");
	});
})
function openDaumZipAddress(type) {
	if(type =='o'){
		new daum.Postcode({
			oncomplete:function(data) {
				jQuery("#ozipcode").val(data.zonecode);
				jQuery("#oaddr").val(data.address);
				jQuery("#oaddrdetail").focus();
			}
		}).open();
	}else if(type=='r'){
		new daum.Postcode({
			oncomplete:function(data) {
				jQuery("#rzipcode").val(data.zonecode);
				jQuery("#raddr").val(data.address);
				jQuery("#raddrdetail").focus();
			}
		}).open();
		
	}
}
function onlyNumber(val){
	val.value = val.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
}

//카드 결제
</script>
<form method="post" action="/bitcamp/orderOk">
<input type="hidden" name="limitQuantity" value="${vo.limitQuantity }"><!-- 상품번호 -->
<input type="hidden" name="p_no" value="${product.p_no }"><!-- 상품번호 -->
<input type="hidden" name="p_name" value="${product.p_name }"><!-- 상품명 -->
<input type="hidden" name="orderStart" value="${vo.orderStart }"><!-- 대여 시작일 -->
<input type="hidden" name="orderEnd" value="${vo.orderEnd }"><!-- 대여 종료일-->
<input type="hidden" name="currentQty" value="${vo.currentQty }"><!-- 대여 종료일-->


<div id="orderForm" class="container">
	<div style="height: 130px"></div>
	<div class="titleArea">
	
		<h2>주문서작성</h2>
	</div>

	<div id="product_info">
		<table border="1">
			<colgroup>
				<col style="width: 100px">
				<col style="width: auto">
				<col style="width: 100px">
				<col style="width: 75px">
				<col style="width: 100px">
				<col style="width: 85px">
				<col style="width: 100px">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">이미지</th>
					<th scope="col">상품정보</th>
					<th scope="col">대여일</th>
					<th scope="col">판매가</th>
					<th scope="col">배송비</th>
					<th scope="col">수량</th>
					<th scope="col">합계</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<a href="/bitcamp/productView?p_no=${product.p_no }">
							<img src="/bitcamp/upload/${product.p_filename1 }" style="width:100px;height:100px" onerror="this.src='/bitcamp/resources/products/tent1.png'">
						</a>
					</td>
					<td>
						<strong><a href="/bitcamp/productView?p_no=${product.p_no }">${product.p_name }</a></strong>
					</td>
					<td>
						<div><label id="period">${vo.orderStart }~${vo.orderEnd }</label></div>
					</td>
					<td>
						<div>
							<strong>${product.price*vo.currentQty }</strong>
						</div>
					</td>
					<td rowspan="1"><label>${vo.delivery_fee*vo.currentQty}</label>원</td>
					<td>${vo.currentQty}</td>
					<td><strong><label>${vo.price*vo.currentQty+vo.delivery_fee*vo.currentQty }</label>원</strong></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="7">상품구매금액 <strong>${product.price*vo.currentQty }<span>
								(+${vo.day_price})</span></strong> + 배송비 ${vo.delivery_fee } = 합계: <strong class="txtEm gIndent10"><label>${vo.price*vo.currentQty+vo.delivery_fee*vo.currentQty }</label>원</strong>
					</td>
				</tr>
			</tfoot>
		</table>	
	</div>


<!-- 주문자 정보 입력 -->
	<div id="order_info">
		<div style="margin-top: 20px">
			<h5>주문 정보 </h5>
		</div>
		<div>
			<table border="1">
				<colgroup>
					<col style="width: 150px;">
					<col style="width: auto;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">주문하시는 분</th>
						<td><input id="oname" name="oname" size="15" type="text" value="${memberInfo.username}"></td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td>
							<input id="ozipcode" name="ozipcode" size="6"maxlength="6" value="${memberInfo.userzipcode }" type="text" readonly>
							<button type="button"class="btn btn-dark" onclick="openDaumZipAddress('o');">우편번호</button>
							<br>
							<input id="oaddr" name="oaddr" size="40"  type="text" value="${memberInfo.useraddr }" style="margin-top: 10px" readonly>
							<span>기본주소</span>
							<br> 
							<input id="oaddrdetail" name="oaddrdetail" size="40" type="text" value="${memberInfo.useraddrdetail}" style="margin-top: 10px"> 
							<span>나머지주소</span>
							<span>(선택입력가능)</span>
						</td>
					</tr>
					<tr>
						<th scope="row">연락처</th>
						<td>
							<select id="otel1" name="otel1" >
									<option value="02">02</option>
									<option value="031">031</option>
									<option value="032">032</option>
									<option value="033">033</option>
									<option value="041">041</option>
									<option value="042">042</option>
									<option value="043">043</option>
									<option value="044">044</option>
									<option value="051">051</option>
									<option value="052">052</option>
									<option value="053">053</option>
									<option value="054">054</option>
									<option value="055">055</option>
									<option value="061">061</option>
									<option value="062">062</option>
									<option value="063">063</option>
									<option value="064">064</option>
									<option value="0502">0502</option>
									<option value="0503">0503</option>
									<option value="0504">0504</option>
									<option value="0505">0505</option>
									<option value="0506">0506</option>
									<option value="0507">0507</option>
									<option value="070">070</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
									<option value="0508">0508</option>
							</select>-<input id="otel2" name="otel2" maxlength="4" size="4"	type="text" oninput="onlyNumber(this)">
									 -<input id="otel3" name="otel3" maxlength="4" size="4" type="text" oninput="onlyNumber(this)">
						</td>
					</tr>
				</tbody>
				<!-- 이메일-->
				<tbody>
					<tr>
					<label id="memberinfo_usermail" style="display:none">${memberInfo.useremail }</label>
						<th scope="row">이메일</th>
						<td>
							<input id="oemail1" name="oemail1" type="text">@
							<input id="oemail2" name="oemail2" readonly="readonly" type="text" >
							<select id="oemail3">
								<option value="" selected="selected">- 이메일 선택 -</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="nate.com">nate.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="yahoo.com">yahoo.com</option>
								<option value="empas.com">empas.com</option>
								<option value="korea.com">korea.com</option>
								<option value="dreamwiz.com">dreamwiz.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="etc">직접입력</option>
							</select>
							<ul>
								<li>- 이메일을 통해 주문처리과정을 보내드립니다.</li>
								<li>- 이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요</li>
							</ul>
						</td>
					</tr>
				</tbody>
				<!-- 비회원 결제 시 오픈-->
				<c:if test="${logStatus=='N' }">
				<tbody>
					<tr>
						<th scope="row">주문조회 비밀번호</th>
						<td>
							<input id="opassword" name="opassword" size="7"	maxlength="12" type="password"  pattern="{4.12}"> 
							(주문조회시 필요합니다. 4자에서 12자 영문 또는 숫자 대소문자 구분)
						</td>
					</tr>
					<tr>
						<th scope="row">주문조회 비밀번호<br>확인
						</th>
						<td><input id="order_password_confirm" size="7"
							maxlength="12" value="" type="password"></td>
					</tr>
				</tbody>
				</c:if>
				
				
			</table>
		</div>
	</div>
<!-- 배송지 정보 입력 -->
	<div id="recipient_info">
		<div style="margin-top: 20px">
			<h5>배송 정보</h5>
		</div>
		<div>
			<table border="1">
				<colgroup>
					<col style="width: 150px;">
					<col style="width: auto;">
				</colgroup>
	
				<tbody>
					<tr>
						<th scope="row">배송지 선택</th>
						<td><div>
								<input id="sameaddr0" name="sameaddr" type="radio"> 
								<label for="sameaddr0" style="cursor:pointer">주문자 정보와 동일</label>
								<input id="sameaddr1" name="sameaddr" type="radio"> 
								<label for="sameaddr1" style="cursor:pointer">새로운배송지</label>
								<a href="javascript:;" id="btn_shipp_addr" class="btn btn-dark"
								onclick="window.open(this.href='/bitcamp/orderShipping','주소록','width=800,height=600');return false;"
								>주소록 보기</a>
							</div></td>
					</tr>
					<tr>
						<th scope="row">받으시는 분</th>
						<td><input id="rname" name="rname" size="15" type="text"></td>
					</tr>
					<tr>
					
						<th scope="row">주소</th>
						<td><input id="rzipcode" name="rzipcode" size="6" maxlength="6" type="text" readonly> 
							<button type="button" class="btn btn-dark" onclick="openDaumZipAddress('r');">우편번호</button><br> 
							<input id="raddr" name="raddr" size="40"  type="text" style="margin-top: 10px" readonly> 
							<span>기본주소</span><br> 
							<input id="raddrdetail" name="raddrdetail" size="40" type="text"
								style="margin-top: 10px"> <span>나머지주소</span><span>(선택입력가능)</span>
						</td>
					</tr>
					<tr>
						<th scope="row">연락처</th>
						<td><select id="rtel1" name="rtel1">
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="0502">0502</option>
								<option value="0503">0503</option>
								<option value="0504">0504</option>
								<option value="0505">0505</option>
								<option value="0506">0506</option>
								<option value="0507">0507</option>
								<option value="070">070</option>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
								<option value="0508">0508</option>
						</select>
							-<input id="rtel2" name="rtel2" maxlength="4" size="4"
							type="text" oninput="onlyNumber(this)">
							-<input id="rtel3" name="rtel3"
							maxlength="4" size="4" type="text"oninput="onlyNumber(this)">
						</td>
					</tr>
					<tr>
						<th scope="row">배송메시지</th>
						<td><textarea id="rcommnet" name="rcommnet" rows="5" style="width:100%"
								cols="90" placeholder="ex)배송 전 연락 부탁드립니다."></textarea></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

<!-- 결제 예정 금액 -->

	<div>
		<div style="margin-top: 20px">
			<h5>결제 예정 금액</h5>
		</div>
		<div id="total_price">
			<table border="1">
				<colgroup>
					<col style="width: 33.33%">
					<col style="width: 33.33%">
					<col style="width: 33.33%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><strong>총 주문 금액</strong></th>
						<th scope="col"><strong>총 배송비</strong></th>
						<th scope="col"><strong>총 결제예정 금액</strong></th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>
							<div>
								<strong><span id="total_order_price_view">${vo.price*vo.currentQty+vo.day_price*vo.currentQty }</span>원</strong>
							</div>
						</td>
						<td>
							<div>
								<strong><span id="total_delivery_fee_view">${vo.delivery_fee*vo.currentQty }</span>원</strong>
								<input type="hidden" name="total_delivery_fee">
							</div>
						</td>
						<td>
							<div>
								<strong>=</strong> <strong> <span
									id="total_order_sale_price_view"></span>원
								</strong>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

	</div>


<!-- 결제 수단 -->
	<div style="margin-top: 20px">
		<h5>결제 수단</h5>
	</div>
	<div class="payArea">
		<div class="payment">
			<div class="method" style="border-bottom: 3px gray double; margin-bottom: 5px">
				<span>
					<input id="addr_paymethod0" name="addr_paymethod"
					value="card" type="radio" checked="checked"> 
					<label for="addr_paymethod0">카드 결제</label>
				</span> 
				<span> 
					<input id="addr_paymethod1" name="addr_paymethod" value="cash" type="radio"> 
					<label for="addr_paymethod1">무통장 입금</label>
				</span>
			</div>

			<div id="card-agree"
				style="display: block;">
				<div class="paymentAgree">
					<div style="margin-top: 10px">
						<input type="checkbox" id="directpay_card_agree_all">
						&nbsp;<label style="cursor:pointer" for="directpay_card_agree_all">결제대행서비스 약관에 모두
							동의합니다.</label>
						<button type="button" id="ec-order-directpay-card-agree-toggle">전체보기</button>
					</div>
					<div>
						<p>
							<input type="checkbox" id="directpay_card_agree_financial"
								class="directpay_card_agree_checkbox"> <label style="cursor:pointer"
								for="directpay_card_agree_financial">전자금융거래 기본약관</label> <a
								href="#"
								onclick="window.open('/protected/order/payment_agree_financial.html', '', 'width=460,height=382');return false;">[내용보기]</a>
						</p>
					</div>
				</div>
			</div>

			<div id="cash-form" style="display:none" >
				<!-- 무통장입금 -->
				<table border="1">
					<caption>무통장입금</caption>
					<colgroup>
						<col style="width: 139px">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">입금자명</th>
							<td><input id="depositor" name="depositor" size="15" maxlength="20"
								type="text"></td>
						</tr>
						<tr>
							<th scope="row">입금은행</th>
							<td><select id="bank" name="bank">
									<option value="-1">::: 선택해 주세요. :::</option>
									<option value="${bvo.account1bank }">${bvo.account1bank }:${bvo.account1} ${bvo.account1name }</option>
									<option value="${bvo.account2bank }">${bvo.account2bank }:${bvo.account2} ${bvo.account2name }</option>
									<option value="${bvo.account3bank }">${bvo.account3bank }:${bvo.account3} ${bvo.account3name }</option>
							</select></td>
						</tr>
					</tbody>
				</table>

			</div>

		</div>
		<!-- 카드결제 정보 -->
		<input type="hidden" name="card_corp">
		<input type="hidden" name="imp_uid">
		<input type="hidden" name="merchant_uid">
		<input type="hidden" name="apply_num">
		<input type="hidden" name="buyer_name">
		<input type="hidden" name="buyer_email">
		<input type="hidden" name="buyer_tel">
		<input type="hidden" name="formattedTime">
		<input type="hidden" name="card_name">
		<input type="hidden" name="paid_amount">
		
		<!-- 최종결제금액 -->
		<div id="end_price" style="padding: 10px 10px 10px; height: 100%">
			<h4 style="font-size: 1em">
				<strong id="current_pay_name">카드 결제</strong>
				<span>최종결제 금액</span>
			</h4>
			<p>
				<input id="total_price" name="totalprice" 
					style="text-align: right; border: none; float: none; font-size: 1.5em; background: #fafafa"
					size="10" readonly value="${vo.price*vo.currentQty+vo.delivery_fee*vo.currentQty }" type="text"><span>원</span>
			</p>
			
			<p id="chk_purchase_agreement" style="display: none;">
				<input id="chk_purchase_agreement0" name="chk_purchase_agreement"
					value="T" type="checkbox" style="display: none;"><label
					for="chk_purchase_agreement0">결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
			</p>
			<c:if test="${logStatus=='Y' }">
			<div>
				<button type="button" onclick="payment_card();" class="payment_card btn btn-dark">결제하기</button>
				<input type="submit" id="btn_payment" value="결제하기" class="payment_pay btn btn-dark" style="display:none" >
				
			</div>
			</c:if>
			<c:if test="${logStatus=='N' }">
			<div>
			<button type="button" onclick="nonMemberPay();" class="payment_card btn btn-dark">결제하기</button>
			<input type="submit" id="btn_payment" value="결제하기" class="payment_pay btn btn-dark" style="display:none">
			</div>
			</c:if>
	
			
		</div>
	</div>
</div>
</form>
