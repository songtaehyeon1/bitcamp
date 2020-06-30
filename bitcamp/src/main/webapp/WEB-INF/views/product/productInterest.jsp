<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>


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
})

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
			<h5>주문 정보</h5>
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
							maxlength="6" readonly type="text"> <a href="#"
							class="btn btn-dark">우편번호</a><br> <input id="oaddr"
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







	<tbody id="cartTable-other">
    <tr>
        <td colspan="5" class="cart-bundle-title"><h2 class="title bundle">판매자배송 상품</h2></td>
    </tr>
    
        
            
            
                <tr class="cart-deal-item count0 cart-sc-items " data-item-status="CHECKED" data-adult="false" data-index="0" data-count="1" data-bundle-id="12178078944" data-bundle-type="PRODUCT" data-app="" data-group-type="partner">
                    <td class="product-select-event">
                        
                            
                                <input type="checkbox" title="로지텍 멀티 디바이스 블루투스 무선 키보드 상품을 결제상품으로 설정" value="12178078944" class="dealSelectChk">
                            
                        
                    </td>
                    <td>
                        
                            <a href="//www.coupang.com/vp/products/37610722?vendorItemId=70402053741" class="moveProduct">
                                <img src="//thumbnail10.coupangcdn.com/thumbnails/remote/120x120ex/image/vendor_inventory/images/2017/05/24/17/6/36b04e65-6745-4a3d-8a4b-5ec647d5a13a.jpg" width="78" height="78" class="product-img img" alt="로지텍 멀티 디바이스 블루투스 무선 키보드" data-bundle-id="12178078944">
                            </a>
                        
                    </td>
                    <td class="product-box">
                        <div class="product-name-part">
                            
                            <a href="//www.coupang.com/vp/products/37610722?vendorItemId=70402053741" class="product-name moveProduct modify-color">로지텍 멀티 디바이스 블루투스 무선 키보드, K380, 블루</a>
                            
                                
                            
                        </div>
                        
                            <div id="70402053741" class="option-item modify-float" data-quantity="1" data-vendor-id="C00256440" data-vi="70402053741" data-vip="" data-pid="37610722" data-itemid="138555806" data-bundle-id="12178078944" data-shipping-place-id="2258451" data-delivery-fee="0">
                                <div class="option-item-info" data-restock-notification-state="false">
                                    <div class="option-name">
                                        <span class="option-item-name" style="display:none;">로지텍 멀티 디바이스 블루투스 무선 키보드, K380, 블루</span>
                                        
                                            
                                            
                                        
                                    </div>
                                    
                                        
                                            
                                                <div class="delivery-date partner modify-padding" style="visibility: visible;">
                                                    <span class="arrive-date" style="display: inline-block;"><span class="arrive-date-txt"></span><span class="arrive-date-day"></span><span class="arrive-date-date">6/29</span> 도착 예정</span><span class="delivery-message"></span>
                                                </div>
                                                <p class="delivery-enterprise" style="display: none"><img src="//img1a.coupangcdn.com/image/cart/generalCart/warning_ic.png" alt="">이 상품은 <strong>로켓배송</strong>이 아닌 <strong>협력택배사</strong>가 배송하는 상품입니다.</p>
                                            
                                        
                                    
                                </div>
                                <div class="option-price-part" data-sale-price="32900">
                                    
	
		<span class="unit-cost" data-sale-price="32900"><span class="sr-only">제품가격</span>32,900원</span>
		<span class="select-select">
			<select class="quantity-select" data-url="/memberCartItem/quantity/12178078944/" data-quantity="1" data-all="false" title="로지텍 멀티 디바이스 블루투스 무선 키보드, K380, 블루 수량변경">
				
					
						<option value="1" selected="selected">1</option>
					
						<option value="2">2</option>
					
						<option value="3">3</option>
					
						<option value="4">4</option>
					
						<option value="5">5</option>
					
						<option value="6">6</option>
					
						<option value="7">7</option>
					
						<option value="8">8</option>
					
						<option value="9">9</option>
					
					<option value="10">10+</option>
				
			</select>
		</span>
		<span class="select-text">
			<input type="text" class="quantity-text" title="로지텍 멀티 디바이스 블루투스 무선 키보드, K380, 블루 수량변경" maxlength="4" value="1" data-url="/memberCartItem/quantity/12178078944/" data-all="false">
			<input type="button" class="quantity-chg none" value="수량변경">
		</span>
		<span class="unit-price-area"><span class="unit-price"><span class="sr-only">구매가격</span>32,900원</span></span>
	

                                    <a href="/memberCartItem/deleteItems?cartItemIds[]=12178078944&amp;itemStatus=CHECKED" data-url="/memberCartItem/deleteItems?cartItemIds[]=12178078944&amp;itemStatus=CHECKED" data-all="false" class="delete-option"><span class="sr-only">로지텍 멀티 디바이스 블루투스 무선 키보드, K380, 블루 상품삭제</span></a>
                                    
                                        
                                    
                                </div>
                            </div>
                            <div class="badge-list">
                                

                                
                                    
	
        <div class="badge-item option-benefit">
            
            
                 <span class="promo-cash-benefit ">
                    <i class="promo-cash-benefit__icon"></i><em class="promo-cash-benefit__text">최대 1,645원 적립</em>
                 </span>
            
        </div>
	


                                
                            </div>
                        
                        
                    </td>
                    <td class="unit-total-price" headers="th-unit-total-price">
                        
	
		
			
				<div class="unit-total-sale-price">32,900원</div>
			
		
	


                        
                            
                        
                    </td>
                    
                        <td class="delivery-fee" rowspan="1" headers="th-delivery-fee">
                            
                                
                                    
                                        
                                            
                                                -
                                            
                                        
                                    
                                
                            
                            
                        </td>
                    
                </tr>
            
        
            
            
                <tr class="cart-deal-item count1 cart-sc-items last-cart-sc-items" data-item-status="CHECKED" data-adult="false" data-index="1" data-count="1" data-bundle-id="12178076502" data-bundle-type="PRODUCT" data-app="" data-group-type="partner">
                    <td class="product-select-event">
                        
                            
                                <input type="checkbox" title="Logitech 로지텍 키즈투고 키보드 아이폰 아이패드,4종 상품을 결제상품으로 설정" value="12178076502" class="dealSelectChk">
                            
                        
                    </td>
                    <td>
                        
                            <a href="//www.coupang.com/vp/products/303466070?vendorItemId=70415745447" class="moveProduct">
                                <img src="//thumbnail8.coupangcdn.com/thumbnails/remote/120x120ex/image/vendor_inventory/b950/4aeacbfa325e4d4b15410eda32ddb611ce71867927381e45845a1164ec99.jpg" width="78" height="78" class="product-img img" alt="Logitech 로지텍 키즈투고 키보드 아이폰 아이패드,4종" data-bundle-id="12178076502">
                            </a>
                        
                    </td>
                    <td class="product-box">
                        <div class="product-name-part">
                            
                            <a href="//www.coupang.com/vp/products/303466070?vendorItemId=70415745447" class="product-name moveProduct modify-color">Logitech 로지텍 키즈투고 키보드 아이폰 아이패드 4종, 3.Stone</a>
                            
                                
                            
                        </div>
                        
                            <div id="70415745447" class="option-item modify-float" data-quantity="1" data-vendor-id="C00214641" data-vi="70415745447" data-vip="" data-pid="303466070" data-itemid="954494061" data-bundle-id="12178076502" data-shipping-place-id="1218234" data-delivery-fee="0">
                                <div class="option-item-info" data-restock-notification-state="false">
                                    <div class="option-name">
                                        <span class="option-item-name" style="display:none;">Logitech 로지텍 키즈투고 키보드 아이폰 아이패드 4종, 3.Stone</span>
                                        
                                            
                                            
                                        
                                    </div>
                                    
                                        
                                            
                                                <div class="delivery-date partner modify-padding" style="visibility: visible;">
                                                    <span class="arrive-date" style="display: inline-block;"><span class="arrive-date-txt"></span><span class="arrive-date-day"></span><span class="arrive-date-date">6/29</span> 도착 예정</span><span class="delivery-message"></span>
                                                </div>
                                                <p class="delivery-enterprise" style="display: none"><img src="//img1a.coupangcdn.com/image/cart/generalCart/warning_ic.png" alt="">이 상품은 <strong>로켓배송</strong>이 아닌 <strong>협력택배사</strong>가 배송하는 상품입니다.</p>
                                            
                                        
                                    
                                </div>
                                <div class="option-price-part" data-sale-price="48000">
                                    
	
		<span class="unit-cost" data-sale-price="48000"><span class="sr-only">제품가격</span>48,000원</span>
		<span class="select-select">
			<select class="quantity-select" data-url="/memberCartItem/quantity/12178076502/" data-quantity="1" data-all="false" title="Logitech 로지텍 키즈투고 키보드 아이폰 아이패드 4종, 3.Stone 수량변경">
				
					
						<option value="1" selected="selected">1</option>
			</select>
		</span>
		<span class="select-text">
			<input type="text" class="quantity-text" title="Logitech 로지텍 키즈투고 키보드 아이폰 아이패드 4종, 3.Stone 수량변경" maxlength="4" value="1" data-url="/memberCartItem/quantity/12178076502/" data-all="false">
			<input type="button" class="quantity-chg none" value="수량변경">
		</span>
		<span class="unit-price-area"><span class="unit-price"><span class="sr-only">구매가격</span>48,000원</span></span>
                                    <a href="/memberCartItem/deleteItems?cartItemIds[]=12178076502&amp;itemStatus=CHECKED" data-url="/memberCartItem/deleteItems?cartItemIds[]=12178076502&amp;itemStatus=CHECKED" data-all="false" class="delete-option"><span class="sr-only">Logitech 로지텍 키즈투고 키보드 아이폰 아이패드 4종, 3.Stone 상품삭제</span></a>
                                    
                                </div>
                            </div>
                            <div class="badge-list">
        <div class="badge-item option-benefit">
                 <span class="promo-cash-benefit ">
                    <i class="promo-cash-benefit__icon"></i><em class="promo-cash-benefit__text">최대 2,400원 적립</em>
                 </span>
        </div>
                            </div>
                    </td>
                    <td class="unit-total-price" headers="th-unit-total-price">
				<div class="unit-total-sale-price">48,000원</div>
                    </td>
                        <td class="delivery-fee" rowspan="1" headers="th-delivery-fee">
                                                -
                        </td>
                </tr>
		        <tr class="bundle-price-total">
		            <td colspan="5">
		                <h3 class="sr-only">업체상품 주문금액 정보</h3>
		                상품가격 <span class="total-product-price number">0</span>원<span class="coupon-area">
		                
		                <span class="symbol symbol-plus"><span class="sr-only">더하기</span></span>
		                배송비 <span class="delivery-charge number">0</span>원
		                <span class="symbol symbol-equal"><span class="sr-only">결과는</span></span>
		                주문금액 <span class="total-order-price number">0</span>원
		            </span></td>
		        </tr>
		    
		    </tbody>





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
