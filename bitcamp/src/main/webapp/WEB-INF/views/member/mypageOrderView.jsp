<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel = "stylesheet" href = "/bitcamp/css/member/mypageOrderView.css" type = "text/css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		var reg;
		$("#mypageOrder").submit(function(){
			var rname = $("#rname").val();
			if(rname.trim() == ""){
				alert("수령자를 적어 주세요.");
				return false;
			}
			reg = /^[가-힣]{2,5}$/;
			if(!reg.test(rname)){
				alert("수령자를 다시 입력해 주세요.");
				return false;
			}
			var rtel = $("#rtel").val();
			reg = /(01[0|1|6|7|8|9])[-](\d{4})[-](\d{4}$)/;
			if(!reg.test(rtel)){
				alert("연락처를 다시 입력해 주세요.(-까지 작성해 주세요.)");
				return false;
			}
		});
	});

	//우편번호 서비스
	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete:function(data) {
				jQuery("#userzipcode").val(data.zonecode);
				jQuery("#useraddr").val(data.address);
				jQuery("#useraddrdetail").focus();
			}
		}).open();
	}
</script>
<div style = "width : 100%; height : 200px;"></div>
<div class = "container">
	<h2>주문조회</h2>
	<hr>
	<form method="get" action="/bitcamp/mypageOrderEdit" id = "mypageOrder">
		<h4 style="margin-top: 30px;">결제금액 정보</h4>
		<table class="admin_table">
			<tbody>
				<tr>
					<th width="10%" style = "color : white;">무통장 주문금액</th>
					<td width="40%"><b><c:if test="${vo.payment_type =='cash' }">${vo.totalprice }원</c:if></b></td>
					<th width="10%" style = "color : white;">카드 주문금액</th>
					<td width="40%"><b><c:if test="${vo.payment_type =='card' }">${vo.totalprice }원</c:if></b></td>
				</tr>
			</tbody>
		</table>

		<!-- 주문자정보 / 수령자정보 -->
		<table style = "width : 100%">
			<tbody>
				<tr>
					<td width="49%" valign="top">
						<h4>주문자 정보</h4>
						<table class="admin_table">
							<tbody>							
								<tr>
									<th style = "color : white; border-bottom : 1px solid white;">이름(ID)</th>
									<td><b>${vo.oname }(${vo.userid})</b></td>
								</tr>
								<tr>
									<th style = "color : white; border-bottom : 1px solid white;">이메일</th>
									<td>${vo.oemail }</td>
								</tr>
								<tr>
									<th style = "color : white; border-bottom : 1px solid white;">연락처</th>
									<td>${vo.otel }</td>
								</tr>
								<tr>
									<th style = "color : white;">주문일</th>
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
									<th style = "color : white; border-bottom : 1px solid white;">수령자</th>
									<td><input type="text" name="rname" value="${vo.rname}"
										class="text w120" id = "rname"></td>
								</tr>
								<tr>
									<th style = "color : white; border-bottom : 1px solid white;">연락처</th>
									<td><input type="text" name="rtel" value="${vo.rtel}"
										class="text w120" id = "rtel">
									</td>
								</tr>
								<tr>
									<th style = "color : white;">주소</th>
									<td><input type="text" name="rzipcode" id="userzipcode" value="${vo.rzipcode }"
										class="text w70" readonly>
										<button type="button" style="width: 70px; border : none;" onclick="openDaumZipAddress()">검색</button></td>
								</tr>
								<tr>
									<th></th>
									<td>
										<ul>
											<li>기본 <input type="text" name="raddr" id="useraddr"
												value="${vo.raddr }" class="text w400" readonly></li>
											<li>상세 <input type="text" name="raddrdetail"
												id="useraddrdetail" value="${vo.raddrdetail }" class="text w400"></li>
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
		<table style = "width : 100%">
			<tbody>
				<tr>
					<td width="49%">
						<h4>결제 정보</h4>
						<table class="admin_table">
							<tbody>
								<tr>
									<th style = "color : white; border-bottom : 1px solid white;">결제종류</th>
									<td><c:if test="${vo.payment_type =='cash' }">무통장입금</c:if>
									<c:if test="${vo.payment_type =='card' }">카드결제</c:if>
									</td>
								</tr>
								<tr>
									<th style = "color : white;">결제시간</th>
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
									<th style = "color : white;">송장번호</th>
									<td><select name="delivery_corp"
										style="border: 1px #e6e6e6 solid; height: 30px; margin-right : 10px;" disabled="disabled">
											<option value="16">CJ대한통운</option>
									</select><input	type="text" name="delivery_code" value="${vo.delivery_code }" class="text w200" disabled="disabled">
									</td>
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
					<th style = "color : white;">고객요청사항</th>
					<td style="padding: 3px 3px 0px;"><textarea name="rcommnet"
							style="width: 99%; height: 100px; border: 1px #e6e6e6 solid;">${vo.rcommnet }</textarea></td>
				</tr>
			</tbody>
		</table>
		<div class="searchbtn">
			<input type="submit" class="btn btn-dark" value="수정"/>
			<input type = "reset" class="btn btn-dark" onclick = "history.back();" value = "취소">
		</div>
		<input type = "hidden" name = "r_no" value = "${vo.r_no}">
		<input type = "hidden" name = "o_no" value = "${vo.o_no}">
	</form>
</div>