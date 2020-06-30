<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		})
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
		<a href="<%=request.getContextPath()%>/admin/product"><li>상품관리</li></a>
		<a href="<%=request.getContextPath()%>/admin/orderList"><li
			class="over">주문관리</li></a>
		<a href="<%=request.getContextPath()%>/boardNotice"><li>매출관리</li></a>
	</ul>
</div>
<div id="admin_top_menu_under">&nbsp;</div>
<div id="admin_left_menu">
	<h2>주문관리</h2>
	<dl>
		<dt>주문관리</dt>
		<dd>
			<a href="">- 주문통합리스트</a>
		</dd>
		<dd>
			<a href="">- 입금대기리스트</a>
		</dd>
		<dd>
			<a href="">- 결제완료리스트</a>
		</dd>
		<dd>
			<a href="">- 배송준비중리스트</a>
		</dd>
		<dd>
			<a href="">- 배송중리스트</a>
		</dd>
		<dd>
			<a href="">- 배송완료리스트</a>
		</dd>
		<dd>
			<a href="">- 송장등록</a>
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
	<form name="ff" method="get">
		<table class="admin_table">
			<tbody>				
				<tr>
					<th style="width: 5%;">번호</th>
					<th style="width: 35%;">상품정보</th>
					<th style="width: 5%;">수량</th>
					<th style="width: 8%;">판매가</th>
					<th style="width: 8%;">할인금액</th>
				</tr>
				<tr>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
					<td>1</td>
				</tr>
			</tbody>
		</table>

		<h4 style="margin-top: 30px;">결제금액 정보</h4>
		<table class="admin_table">
			<tbody>
				<tr>
					<th width="10%">무통장 주문금액</th>
					<td width="40%"><b>0</b>원</td>
					<th width="10%">카드 주문금액</th>
					<td width="40%"><b>0</b>원</td>
				</tr>
				<tr>
					<th>무통장 결제금액</th>
					<td><input type="hidden" name="h_od_receipt_bank" value="">
						<input type="text" name="od_receipt_bank" value="0"
						class="text w120" onkeyup="inputNumberFormat(this);">원</td>
					<th>카드 결제금액</th>
					<td><b></b>원</td>
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
									<td><b> ()</b></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>/</td>
								</tr>
								<tr>
									<th>주문일</th>
									<td></td>
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
									<td><input type="text" name="od_b_name" value=""
										class="text w120"></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><input type="text" name="od_b_tel" value=""
										class="text w120">
									</td>
								</tr>
								<tr>
									<th>주소</th>
									<td><input type="text" name="od_b_zip1" id="post" value=""
										class="text w70" readonly="">
										<button type="button" style="width: 70px;"
											onclick="postSearch()">검색</button></td>
								</tr>
								<tr>
									<th></th>
									<td>
										<ul>
											<li>기본 <input type="text" name="od_b_addr1" id="address"
												value="" class="text w400" readonly=""></li>
											<li>상세 <input type="text" name="od_b_addr2"
												id="anaddress" value="" class="text w400"></li>
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
									<td></td>
								</tr>
								<tr>
									<th>결제시간</th>
									<td></td>
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
									<td><select name="deliverycode"
										style="border: 1px #e6e6e6 solid; height: 30px;">
											<option value="16">로젠택배</option>
									</select> <input type="hidden" name="h_od_invoice" value=""> <input
										type="text" name="od_invoice" value="" class="text w200">
									</td>
								</tr>
								<tr>
									<th>배송일/출고일</th>
									<td></td>
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
					<td style="padding: 3px 3px 0px;"><textarea name="od_memo"
							style="width: 99%; height: 100px; border: 1px #e6e6e6 solid;"></textarea></td>
				</tr>
			</tbody>
		</table>
		<div class="searchbtn">
			<button class="textsearch" onclick="submit_('edit');">수정</button>
			<button type="button" class="textsearch"
				onclick="location.href='order_list.php'">목록으로</button>
		</div>
	</form>
</div>