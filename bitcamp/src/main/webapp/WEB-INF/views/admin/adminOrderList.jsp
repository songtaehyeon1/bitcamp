<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		<a href="<%=request.getContextPath()%>/admin/orderList"><li class="over">주문관리</li></a>
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
							name="ordstate[]" value="1"> 입금대기</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label for=""><input type="checkbox" name="ordstate[]"
							value="2"> 결제완료</label>&nbsp;&nbsp;&nbsp;&nbsp; <label for=""><input
							type="checkbox" name="ordstate[]" value="3"> 배송준비중</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label for=""><input type="checkbox" name="ordstate[]"
							value="4"> 배송중</label>&nbsp;&nbsp;&nbsp;&nbsp; <label for=""><input
							type="checkbox" name="ordstate[]" value="5"> 배송완료</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label for=""><input type="checkbox" name="ordstate[]"
							value="6"> 구매확정</label><br></td>
				</tr>
				<tr>
					<th>결제수단</th>
					<td><label for=""><input type="radio"
							name="od_settle_case" value="0" checked=""> 전체</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label for=""><input type="radio" name="od_settle_case"
							value="1"> 신용카드</label>&nbsp;&nbsp;&nbsp;&nbsp;<label for=""><input type="radio" name="od_settle_case"
							value="5"> 무통장</label></td>
				</tr>
				<tr>
					<th>기간</th>
					<td><label for=""><input type="radio" name="ndate"
							value="od_time" checked=""> 주문일</label>&nbsp;&nbsp;&nbsp;&nbsp; <label
						for=""><input type="radio" name="ndate" value="inpaydate">
							결제확인일</label>&nbsp;&nbsp;&nbsp;&nbsp; <label for=""><input
							type="radio" name="ndate" value="od_completedt"> 배송일</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<label for=""><input type="radio" name="ndate"
							value="od_confirmdt"> 배송완료일</label>&nbsp;&nbsp;&nbsp;&nbsp; <b>일자</b>
						<input type="text" name="s_date" id="s_date" value=""
						class="text w100 hasDatepicker"><img
						class="ui-datepicker-trigger"
						src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
						~ <input type="text" name="e_date" id="e_date" value=""
						class="text w100 hasDatepicker"><img
						class="ui-datepicker-trigger"
						src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
					</td>
				</tr>
				<tr>
					<th>주문금액</th>
					<td><input type="text" id="settleprice1" name="settleprice1"
						value="" class="money"><span>원&nbsp;&nbsp;~&nbsp;&nbsp;</span>
						<input type="text" id="settleprice2" name="settleprice2" value=""
						class="money"><span>원</span></td>
				</tr>
				<tr>
					<th>직접검색</th>
					<td><select name="column">
							<option value="" selected="">전체</option>
							<option value="od_id">주문번호</option>
							<option value="mb_id">주문자ID</option>
							<option value="od_name">주문자명</option>
							<option value="od_email">주문자이메일</option>
							<option value="od_tel">주문자연락처</option>
							<option value="od_b_name">수령인명</option>
							<option value="od_b_tel">수령인전화번호</option>
							<option value="od_b_hp">수령인휴대폰번호</option>
					</select> <input type="text" name="txtValue" value=""></td>
				</tr>
			</tbody>
		</table>
		<div class="searchbtn">
			<button class="textsearch" onclick="submit_('order_list.php', '1');">검색</button>
		</div>
		<h4 class="allgoodsnum">
			총 <span class="red">0</span>개의 주문건이 있습니다.
			<div>
				<select name="line" id="line"
					onchange="submit_('order_list.php', '1');">
					<option value="10" selected="">10줄씩보기</option>
					<option value="20">20줄씩보기</option>
					<option value="30">30줄씩보기</option>
					<option value="50">50줄씩보기</option>
					<option value="100">100줄씩보기</option>
				</select>

			</div>
		</h4>
		<table class="goodslist">
			<tbody>
				<tr>
					<th class="width50"><input type="checkbox" id="allCheck"></th>
					<th>가입업체명</th>
					<th>주문일</th>
					<th>주문번호</th>
					<th>주문자명</th>
					<th>회원ID</th>
					<th>주문금액</th>
					<th>결제금액</th>
					<th>결제수단</th>
					<th>상태</th>
				</tr>
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
								<option value="6">구매확정</option>
							</select> (으)로 일괄적으로 수정합니다.
							<button type="button" onclick="state_ch();">변경하기</button>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>


