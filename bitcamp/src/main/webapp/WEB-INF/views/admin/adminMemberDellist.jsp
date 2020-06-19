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
		<a href="<%=request.getContextPath()%>/admin/member"><li
			class="over">회원관리</li></a>
		<a href="#"><li>상품관리</li></a>
		<a href="<%=request.getContextPath()%>/admin/orderList"><li>주문관리</li></a>
		<a href="#"><li>매출관리</li></a>
	</ul>
</div>
<div id="admin_top_menu_under">&nbsp;</div>
<div id="admin_left_menu">
	<h2>회원관리</h2>
	<dl>
		<dt>회원관리</dt>
		<dd>
			<a href="<%=request.getContextPath()%>/admin/memberJoin">- 회원가입</a>
		</dd>
		<dd>
			<a href="<%=request.getContextPath()%>/admin/member">- 회원리스트</a>
		</dd>
		<dd>
			<a href="<%=request.getContextPath()%>/admin/memberdellist">- 회원탈퇴 / 삭제관리</a>
		</dd>

	</dl>
</div>

<div id="admin_contents">
	<h3>회원탈퇴 / 삭제관리</h3>
	<ul class="helpbox">
		<li>탈퇴신청및 삭제한 회원목록입니다.</li>
	</ul>
	<form name="f" method="get" action="#">
		<table class="adminform">
			<tbody>
				<tr>
					<th>신청일</th>
					<td><input type="text" name="s_date" id="s_date" value=""
						class="text w100"><img
						class="ui-datepicker-trigger" src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						alt="Select date" title="Select date"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
						~ <input type="text" name="e_date" id="e_date" value=""
						class="text w100 hasDatepicker"><img
						src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						alt="Select date" title="Select date"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
					</td>
				</tr>
				<tr>
					<th>직접검색</th>
					<td><select name="column">
							<option value="ms.name">회원명</option>
							<option value="ms.meid">회원아이디</option>
					</select> <input type="text" name="txtValue" value=""></td>
				</tr>
			</tbody>
		</table>
		<div class="searchbtn">
			<button class="textsearch">검색</button>
		</div>
	</form>
	<h4 class="allgoodsnum">
		총 <span class="red">18</span>명의 회원이 있습니다.
		<div>
			<button type="button" class="textsearch" onclick="submit_();">탈퇴처리</button>
		</div>
	</h4>


	<!-- 회원 리스트 -->
	<form name="ff" method="get">
		<input type="hidden" id="nType" name="nType" value="">
		<table class="goodslist">
			<tbody>
				<tr>
					<th class="width50"><input type="checkbox" id="allCheck"></th>
					<th class="width50">번호</th>
					<th class="width100">아이디</th>
					<th class="width150">이름</th>
					<th>탈퇴사유</th>
					<th class="width150">신청일</th>
					<th class="width150">처리일</th>
				</tr>
				<tr>
					<td class="width50"><input type="checkbox" name="chk[]"
						value="13"> <input type="hidden" name="meid[]"
						value="ceo1234"></td>
					<td>5</td>
					<td>ceo1234</td>
					<td><a href="./member_view.php?meid=ceo1234"
						style="color: blue;"></a></td>
					<td>배송 서비스 불만</td>
					<td>2020-06-17 16:34:29</td>
					<td></td>
				</tr>
				<tr>
					<td class="width50"><input type="checkbox" name="chk[]"
						value="14"> <input type="hidden" name="meid[]"
						value="ceo1234"></td>
					<td>4</td>
					<td>ceo1234</td>
					<td><a href="#"
						style="color: blue;"></a></td>
					<td>배송 서비스 불만</td>
					<td>2020-06-17 16:29:14</td>
					<td></td>
				</tr>
				<tr>
					<td class="width50"><input type="checkbox" name="chk[]"
						value="15"> <input type="hidden" name="meid[]"
						value=""></td>
					<td>3</td>
					<td>ceo1234</td>
					<td><a href="#"
						style="color: blue;"></a></td>
					<td></td>
					<td>2020-06-17 16:26:46</td>
					<td></td>
				</tr>
				<tr>
					<td class="width50"><input type="checkbox" name="chk[]"
						value="16"></td>
					<td>2</td>
					<td>ceo1234</td>
					<td><a href="#"
						style="color: blue;"></a></td>
					<td>배송 서비스 불만</td>
					<td>2020-06-17 16:14:40</td>
					<td></td>
				</tr>
				<tr>
					<td class="width50"><input type="checkbox" name="chk[]"
						value="17"> <input type="hidden" name="meid[]"
						value="ceo1234"></td>
					<td>1</td>
					<td>ceo1234</td>
					<td><a href="#"
						style="color: blue;">김태연</a></td>
					<td>기타</td>
					<td>2020-06-17 15:52:11</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<div style="margin-top: 5px;">
			<button type="button" name="btn" onclick="chkDelete();">선택삭제</button>
		</div>
	</form>
	<!-- 페이징 -->
	<div class="pagewrap">
		<center>
			<span class="nownum numactive">1</span>
		</center>
	</div>

</div>


