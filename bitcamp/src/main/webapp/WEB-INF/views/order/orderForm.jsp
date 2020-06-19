<%@page import="kr.co.bitcamp.product.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
table {
	width: 100%
}

#orderForm {
	font-family: Nanum Gothic, "나눔고딕"
}

.titleArea {
	color: #353535;
	padding: 0;
	min-height: 30px;
	margin: 10px 0 20px;
	border-bottom: 1px solid #e8e8e8;
}

#titleArea>h2 {
	margin: 0;
	display: inline-block;
	padding: 20px 0;
	color: #555;
	font-size: 30px;
	font-weight: 700;
}

#benefit_info {
	margin: 20px 0;
	line-height: 1.5;
	margin-left: auto;
	margin-right: auto;
	border: 5px solid #e8e8e8;
	color: #404040;
	padding: 0;
}

#benefit_info ul {
	color: #404040;
	line-height: 1.5em;
	margin: 0;
	padding: 0;
	border: 0;
	list-style-type: none;
}

#benefit_info li {
	font-size: 1rem;
	font-weight: 400;
	color: #404040;
	line-height: 1.5em;
	box-sizing: border-box;
	list-style-type: none;
}

#benefit_title {
	line-height: 1.5;
	color: #404040;
	font-size: 12px;
	margin: 40px 0 10px 10px;
	display: table-cell;
	padding: 0;
	width: 70px;
	text-align: center;
	vertical-align: middle;
}

#benefit_info a {
	text-decoration: none;
	color: #A29C9C;
	font-size: 13px
}

#benefit_info a:hover {
	text-decoration: none;
}

#benifit_descript {
	color: #404040;
	margin: 0;
	display: table-cell;
	padding: 0 10px;
	width: auto;
	line-height: 1.5em;
	border-left: 1px solid #e8e8e8;
	vertical-align: middle;
}

#product_info thead th {
	text-align: center;
	padding: 10px 0 10px;
	font-size: 13px;
	font: 0.75em;
	background-color: #3d3d4f;
	color: white;
}

#product_info tbody td {
	text-align: center;
}

#product_info tbody {
	text-align: center;
	height: 100px;
	background-color: #fafafa;
}

#product_info tfoot {
	text-align: right;
	background-color: #fafafa;
}

#product_info a {
	text-decoration: none;
	color: black;
	font-size: 17px;
}

#product_info a:hover {
	text-decoration: none;
}

#order_info th, #recipient_info th {
	text-align: center;
	padding: 10px 0 10px;
	font-size: 13px;
	font: 0.75em;
	background-color: #3d3d4f;
	color: white;
}

#order_info ul, #recipient_info ul {
	color: #404040;
	line-height: 1.5em;
	margin: 0;
	padding: 0;
	border: 0;
	list-style-type: none;
}

#order_info li, #recipient_info li {
	font-size: 1rem;
	font-weight: 400;
	color: #404040;
	line-height: 1.5em;
	box-sizing: border-box;
	list-style-type: none;
}

#order_info td, #recipient_info td {
	padding: 10px;
	background-color: #fafafa;
}

#total_price th, .payment th {
	text-align: center;
	padding: 10px 0 10px;
	font-size: 13px;
	font: 0.75em;
	background-color: #3d3d4f;
	color: white;
}

#total_price td {
	text-align: center;
	font-size: 23px;
	padding: 8px 0px 8px;
}

#total_price td:last-child {
	color: #d74f4b;
	padding: 30px 0 30px;
}

#total_price_detail th {
	text-align: center;
	padding: 10px 0 10px;
	font-size: 20px;
	background-color: #3d3d4f;
	color: white;
}

#total_price_detail td {
	padding: 30px;
	font-size: 30px;
}

#total_price_detail td:last-child {
	font-size: 17px;
}

.payArea {
	margin: 0;
	overflow: hidden;
	position: relative;
	padding: 10px 241px 10px 10px;
	border: 1px solid #777;
	color: #353535;
	line-height: 1.5;
	background: #fbfafa;
}

#end_price {
	color: #353535;
	line-height: 1.5;
	padding:;
	float: right;
	width: 240px;
	margin: 0 -241px 0 0;
	text-align: right;
	background: #fbfafa;
}

.payment {
	color: #353535;
	line-height: 1.5;
	margin: 0;
	padding: 0;
	float: left;
	width: 100%;
	background: white;
	background: #fbfafa;
}

</style>
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
<c:forEach var="vo" items="${productList }">
	${vo.p_no },${vo.orderStart },${vo.orderEnd }
</c:forEach>
<form method="post" action="/bitcamp/orderOk">
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
				<col style="width: 27px">
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
					<th scope="col"><input type="checkbox"></th>
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
				<tr>
					<td><input type="checkbox"></td>
					<td><a href="#"><img
							src="//starcamp.co.kr/web/product/tiny/201903/086a059f7f360633d5944227ac744221.jpg"></a></td>
					<td><strong><a href="#">코베아 문리버2 4인 캠핑세트(10%할인)</a></strong>
						<div>[옵션: 4박5일/2021/7/9 (+50,000)]</div>
					<td>
						<div>
							<strong>208,850원</strong>
						</div>
					</td>
					<td>1</td>
					<td><span><img
							src="//img.echosting.cafe24.com/design/common/icon_cash.gif">
							4,700원</span></td>
					<td rowspan="1">[비례]</td>
					<td><strong>208,850원</strong></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td></td>
					<td colspan="7">상품구매금액 <strong>208,850<span>
								(+50,000)</span></strong> + 배송비 50,000 = 합계: <strong class="txtEm gIndent10">258,850원</strong>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>


	<div
		style="width: 100%; text-align: right; height: 100px; border-bottom: 1px gray solid">
		<button type="button">선택 삭제</button>
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
								<input id="sameaddr0" name="sameaddr" type="radio"> <label
									for="sameaddr0">주문자 정보와 동일</label> <input id="sameaddr1"
									name="sameaddr" type="radio"> <label for="sameaddr1">새로운배송지</label>
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
								cols="90"></textarea></td>
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
									id="total_sale_price_view">2,000</span>원</strong>
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
									<input id="input_mile" name="mileage" size="10" type="text">
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


			<div id="card-form"
				style="display: block;">
				<div>
					<table border="1">
						<colgroup>
							<col style="width: 15%">
							<col style="width: auto">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">카드선택</th>
								<td><select id="card_corp" name="card_corp">
										<option value="" selected="selected">선택해주세요.</option>
										<option value="신한카드">신한카드(구 LG카드 포함)</option>
										<option value="비씨카드">비씨카드</option>
										<option value="국민카드">KB국민카드</option>
										<option value="하나카드(구 외환)">하나카드(구 외환)</option>
										<option value="삼성카드">삼성카드</option>
										<option value="현대카드">현대카드</option>
										<option value="롯데카드">롯데카드</option>
										<option value="우리카드">우리카드</option>
										<option value="하나카드(구 하나SK)">하나카드(구 하나SK)</option>
										<option value="NH농협카드">NH농협카드</option>
										<option value="씨티카드">씨티카드</option>
										<option value="수협카드">수협카드</option>
										<option value="광주은행카드">광주은행카드</option>
										<option value="전북은행카드">전북은행카드</option>
										<option value="제주은행카드">제주은행카드</option>
								</select></td>
							</tr>
							<tr>
								<th scope="row">할부기간</th>
								<td><select id="directpay_card_installment_select"
									disabled="disabled"><option value="0">일시불</option></select></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div id="card-agree"
				style="display: block;">
				<div class="paymentAgree">
					<div style="margin-top: 10px">
						<input type="checkbox" id="directpay_card_agree_all">
						&nbsp;<label for="directpay_card_agree_all">결제대행서비스 약관에 모두
							동의합니다.</label>
						<button type="button" id="ec-order-directpay-card-agree-toggle">전체보기</button>
					</div>
					<div>
						<p>
							<input type="checkbox" id="directpay_card_agree_financial"
								class="directpay_card_agree_checkbox"> <label
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
				<input id="total_price" name="total_price"
					style="text-align: right; border: none; float: none; font-size: 1.5em; background: #fafafa"
					size="10" readonly value="25000" type="text"><span>원</span>
			</p>
			
			<p id="chk_purchase_agreement" style="display: none;">
				<input id="chk_purchase_agreement0" name="chk_purchase_agreement"
					value="T" type="checkbox" style="display: none;"><label
					for="chk_purchase_agreement0">결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
			</p>
			<div>
				<input type="submit" id="btn_payment" class="btn btn-dark" value="결제하기">
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
