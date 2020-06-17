<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
table{
	width:100%
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

#total_price th{
	text-align: center;
	padding: 10px 0 10px;
	font-size: 13px;
	font: 0.75em;
	background-color: #3d3d4f;
	color: white;
}

#total_price td{
	text-align: center;
	font-size: 23px;
	padding: 8px 0px 8px;

}

#total_price td:last-child {
	color:#d74f4b;
	padding : 30px 0 30px;
}
#total_price_detail th{
	text-align: center;
	padding: 10px 0 10px;
	font-size: 20px;
	background-color: #3d3d4f;
	color: white;
}
#total_price_detail td{
	padding : 30px;
	font-size: 30px;
}
#total_price_detail td:last-child {
	font-size: 17px;
}

</style>

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
						<td><input id="ozipcode1" name="ozipcode1" size="6"
							maxlength="6" readonly type="text"> <a href="#"
							class="btn btn-dark">우편번호</a><br> <input id="oaddr1"
							name="oaddr1" size="40" readonly type="text"
							style="margin-top: 10px"> <span>기본주소</span><br> <input
							id="oaddr2" name="oaddr2" size="40" type="text"
							style="margin-top: 10px"> <span>나머지주소</span><span>(선택입력가능)</span></td>
					</tr>
					<tr>
						<th scope="row">연락처</th>
						<td><select id="ophone1_1" name="ophone1_[]">
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
						</select>-<input id="ophone1_2" name="ophone1_[]" maxlength="4" size="4"
							type="text">-<input id="ophone1_3" name="ophone1_[]"
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
						<td><input id="order_password" name="order_password" size="7"
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
						<td><input id="rzipcode1" name="rzipcode1" size="6"
							maxlength="6" readonly type="text"> <a href="#"
							class="btn btn-dark">우편번호</a><br> <input id="raddr1"
							name="raddr1" size="40" readonly type="text"
							style="margin-top: 10px"> <span>기본주소</span><br> <input
							id="raddr2" name="raddr2" size="40" type="text"
							style="margin-top: 10px"> <span>나머지주소</span><span>(선택입력가능)</span></td>
					</tr>
					<tr class="">
						<th scope="row">연락처</th>
						<td><select id="rphone1_1" name="rphone1_[]">
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
						</select>-<input id="rphone1_2" name="rphone1_[]" maxlength="4" size="4"
							type="text">-<input id="rphone1_3" name="rphone1_[]"
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



	<div >
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
							id="total_addsale_text">할인</strong><strong	id="plus_mark" > + </strong><strong
							id="total_addpay_text">부가결제</strong><strong> 금액</strong>
						</th>
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
								<strong>-</strong> 
								<strong><span id="total_sale_price_view">2,000</span>원</strong>								
							</div>
						</td>
						<td>
							<div>
								<strong>=</strong>
								<strong>
								<span id="total_order_sale_price_view">52,000</span>원</strong>								
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
									<input id="input_mile" name="input_mile"										
										size="10" type="text"> 원 (총 사용가능 적립금 : <strong>2,000</strong>원)
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


</div>
