<%@page import="kr.co.bitcamp.product.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/order/orderForm.css" />
<script src="<%=request.getContextPath()%>/js/order/order_cart.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$(function() {
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
	
	$("#sameaddr0").click(function() {
		$("#rname").attr("value",$("#oname").val());
		$("#rzipcode").attr("value",$("#ozipcode").val());
		$("#raddr").attr("value",$("#oaddr").val());
		$("#raddrdetail").attr("value",$("#oaddrdetail").val());
		$("#rtel1").val($("#otel1").val()).prop("selected",true);
		$("#rtel2").attr("value",$("#otel2").val());
		$("#rtel3").attr("value",$("#otel3").val());
	})
	
	$("#sameaddr1").click(function() {
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
</script>

<form method="post" action="/bitcamp/cartOrderOk">


<div id="orderForm" class="container">
	<div style="height: 130px"></div>
	<div class="titleArea">
	
		<h2>주문서작성</h2>
	</div>
	<div id="benefit_info">
		<h3 id="benefit_title">혜택정보</h3>
		<div id="benifit_descript">
			<ul class="mileage">
				<li><a href="#">가용적립금 : <strong>2,000원</strong></a></li>
			</ul>
		</div>
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
					<th scope="col">판매가</th>
					<th scope="col">수량</th>
					<th scope="col">적립금</th>
					<th scope="col">배송비</th>
					<th scope="col">합계</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="cart" items="${cart}">
<input type="hidden" name="limitQuantity" value="${cart.limitQuantity}">
<input type="hidden" name="currentQty" value="${cart.currentQty}">
<input type="hidden" name="p_no" value="${cart.p_no}">
				<tr>
					<td><a href="/bitcamp/productView?p_no=${cart.p_no }">
						<img src="/bitcamp/upload/${cart.p_filename1 }" style="width:100px;height:100px" onerror="this.src='/bitcamp/resources/products/tent1.png'"></a>
					</td>
					<td><strong><a href="/bitcamp/productView?p_no=${cart.p_no }">${cart.p_name }</a></strong>
						<div><label id="period">${cart.orderStart }~${cart.orderEnd }</label></div>
					<td>
						<div>
							<strong class="TotalProductPrice">${cart.price*cart.currentQty }</strong>
						</div>
					</td>
					<td>${cart.currentQty}</td>
					<td>
						<span><img src="//img.echosting.cafe24.com/design/common/icon_cash.gif">
							4,700원
						</span>
					</td>
					<td rowspan="1"><label class="TotalDeliveryFee">${cart.delivery_fee*cart.currentQty }</label>원</td>
					<td><strong><label >${cart.price*cart.currentQty+cart.delivery_fee*cart.currentQty }</label>원</strong></td>
				</tr>
				</c:forEach>
			</tbody>
			<script>/* 최종결제금액 설정 */
				$(function(){
					var deliveryfee =0;
					var productprice =0;
					$.each($(".TotalDeliveryFee"),function(index){
						deliveryfee += parseInt($(this).text())
					})
					$.each($(".TotalProductPrice"),function(index){
						productprice += parseInt($(this).text())
					})
						var TDF = document.getElementById("TDF")
						var TTP = document.getElementById("TPP")
						TDF.innerHTML =deliveryfee
						TTP.innerHTML =productprice
						TT.innerHTML = (deliveryfee+productprice)
						$("#total_order_price_view").html(TT.innerHTML)
						var a = parseInt($("#total_order_price_view").html())
						var b = parseInt($("#total_sale_price_view").html())
						console.log(a+"///"+b)
						$("#total_order_sale_price_view").html(a+b)
						var c = $("#total_order_sale_price_view").html()
						$("input[name='totalprice']").val(c)
				})
			</script>
			<tfoot>
				<tr>
					<td colspan="7">상품구매금액
						<strong><label id="TPP">0</label>원(+<label>0</label>)</strong> 
						+ <strong>배송비 <label id="TDF">0</label></strong> 
						= 합계: <strong class="txtEm gIndent10"><label id="TT">0</label>원</strong>
					</td>
				</tr>
			</tfoot>
			
		</table>
	</div>


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
						<td><input id="oname" name="oname" size="15" type="text"></td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td><input id="ozipcode" name="ozipcode" size="6"
							maxlength="6" readonly type="text"> <button type="button"
							class="btn btn-dark" onclick="openDaumZipAddress('o');">우편번호</button><br> <input id="oaddr"
							name="oaddr" size="40" readonly type="text"
							style="margin-top: 10px"> <span>기본주소</span><br> <input
							id="oaddrdetail" name="oaddrdetail" size="40" type="text"
							style="margin-top: 10px"> <span>나머지주소</span><span>(선택입력가능)</span></td>
					</tr>
					<tr>
						<th scope="row">연락처</th>
						<td><select id="otel1" name="otel1">
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
						</select>-<input id="otel2" name="otel2" maxlength="4" size="4"
							type="text">-<input id="otel3" name="otel3"
							maxlength="4" size="4" type="text"></td>
					</tr>
				</tbody>
				<!-- 이메일-->
				<tbody>
					<tr>
						<th scope="row">이메일</th>
						<td><input id="oemail1" name="oemail1" type="text">@<input
							id="oemail2" name="oemail2" readonly="readonly" type="text">
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
							</ul></td>
					</tr>
				</tbody>

				<!-- 비회원 결제 시 오픈-->
				<tbody>
					<tr>
						<th scope="row">주문조회 비밀번호</th>
						<td><input id="opassword" name="opassword" size="7"
							maxlength="12" type="password"> (주문조회시 필요합니다. 4자에서 12자 영문
							또는 숫자 대소문자 구분)</td>
					</tr>
					<tr>
						<th scope="row">주문조회 비밀번호<br>확인
						</th>
						<td><input id="order_password_confirm" size="7"
							maxlength="12" value="" type="password"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>


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
								<input id="sameaddr0" name="sameaddr" type="radio"> <label style="cursor:pointer"
									for="sameaddr0">주문자 정보와 동일</label> <input id="sameaddr1"
									name="sameaddr" type="radio"> <label style="cursor:pointer" for="sameaddr1">새로운배송지</label>
								<a href="#" id="btn_shipp_addr" class="btn btn-dark">주소록 보기</a>
							</div></td>
					</tr>
					<tr>
						<th scope="row">받으시는 분</th>
						<td><input id="rname" name="rname" size="15" type="text"></td>
					</tr>
					<tr>
						<th scope="row">주소</th>
						<td><input id="rzipcode" name="rzipcode" size="6"
							maxlength="6" readonly type="text"> <button type="button"
							class="btn btn-dark" onclick="openDaumZipAddress('r');">우편번호</button><br> <input id="raddr"
							name="raddr" size="40" readonly type="text"
							style="margin-top: 10px"> <span>기본주소</span><br> <input
							id="raddrdetail" name="raddrdetail" size="40" type="text"
							style="margin-top: 10px"> <span>나머지주소</span><span>(선택입력가능)</span></td>
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
						</select>-<input id="rtel2" name="rtel2" maxlength="4" size="4"
							type="text">-<input id="rtel3" name="rtel3"
							maxlength="4" size="4" type="text"></td>
					</tr>
					<tr>
						<th scope="row">배송메시지</th>
						<td><textarea id="rcommnet" name="rcommnet" rows="5"
								cols="90" placeholder="ex)배송 전 연락 부탁드립니다."></textarea></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>



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
						<th scope="col"><strong>총 </strong><strong
							id="total_addsale_text">할인</strong><strong id="plus_mark">
								+ </strong><strong id="total_addpay_text">부가결제</strong><strong>
								금액</strong></th>
						<th scope="col"><strong>총 결제예정 금액</strong></th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>
							<div>
								<strong><span id="total_order_price_view">54,000</span>원</strong>
							</div>
						</td>
						<td>
							<div>
								<strong>-</strong> <strong><span
									id="total_sale_price_view">0</span>원</strong>
							</div>
						</td>
						<td>
							<div>
								<strong>=</strong> <strong> <span
									id="total_order_sale_price_view">52,000</span>원
								</strong>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!-- 비회원은 안보임 -->
		<div id="total_price_detail">
			<div>
				<table border="1">
					<colgroup>
						<col style="width: 160px">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><strong>총 할인금액</strong></th>
							<td><strong id="total_addsale_price_view">0</strong>원</td>
						</tr>
						<tr>
							<th scope="row"><strong>총 부가결제금액</strong></th>
							<td><strong id="total_addpay_price_view">2,000</strong>원</td>
						</tr>
						<tr>
							<th scope="row">적립금</th>
							<td>
								<p>
									<input id="input_mile" name="mileage" size="10" type="text" value="0">
									원 (총 사용가능 적립금 : <strong>2,000</strong>원)
								</p>
								<ul class="info">
									<li>적립금은 최소 0 이상일 때 결제가 가능합니다.</li>
									<li id="mileage_max_limit" class="">1회 구매시 적립금 최대 사용금액은
										2,000입니다.</li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>
	</div>

	<div style="margin-top: 20px">
		<h5>결제 수단</h5>
	</div>
	<div class="payArea">
		<div class="payment">
			<div class="method"
				style="border-bottom: 3px gray double; margin-bottom: 5px">
				<span> <input id="addr_paymethod0" name="addr_paymethod"
					value="card" type="radio" checked="checked"> <label
					for="addr_paymethod0">카드 결제</label>
				</span> <span> <input id="addr_paymethod1" name="addr_paymethod"
					value="cash" type="radio"> <label for="addr_paymethod1">무통장
						입금</label>
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
									<option value="농협">농협회원조합:111-1111-1111-11 비트캠프</option>
									<option value="기업">기업은행:333-33333-33-333 비트캠프</option>
									<option value="우리">우리은행:2222-222-222222 비트캠프</option>
							</select></td>
						</tr>
					</tbody>
				</table>

			</div>

		</div>

		<!-- 최종결제금액 -->
		<div id="end_price" style="padding: 10px 10px 10px; height: 100%">
			<h4 style="font-size: 1em">
				<strong id="current_pay_name">카드 결제</strong> <span>최종결제 금액</span>
			</h4>
			<p>
				<input id="total_price" name="totalprice"
					style="text-align: right; border: none; float: none; font-size: 1.5em; background: #fafafa"
					size="10" readonly value="0" type="text"><span>원</span>
			</p>
			
			
			<p id="chk_purchase_agreement" style="display: none;">
				<input id="chk_purchase_agreement0" name="chk_purchase_agreement"
					value="T" type="checkbox" style="display: none;"><label
					for="chk_purchase_agreement0">결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
			</p>
			<div>
				<button type="button" onclick="payment_card();" class="payment_card btn btn-dark">결제하기</button>
				<input type="submit" onclick="payment_card();" id="btn_payment" value="결제하기" class="payment_pay btn btn-dark" style="display:none">
			</div>
			<div>
				<dl>
					<dt>
						<strong>총 적립예정금액</strong>
					</dt>
					<dd id="mAllMileageSum" style="display: block;">0원</dd>
				</dl>
			</div>
		</div>
	</div>

</div>
</form>
