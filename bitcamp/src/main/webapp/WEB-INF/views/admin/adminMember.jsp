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
		<a href="<%=request.getContextPath()%>/admin/member"><li class="over">회원관리</li></a>
		<a href="<%=request.getContextPath()%>/admin/product"><li>상품관리</li></a>
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
	<h3>회원 리스트</h3>

	<ul class="helpbox">
		<li>사이트에 가입한 회원목록입니다.</li>
	</ul>
	<!--관리자 member 우측 컨텐츠-->
	<form name="f" method="get" action="">
		<table class="adminform">
			<tbody>
				<tr>
					<th>가입일</th>
					<td><input type="text" name="s_date" id="s_date"><img
						src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						alt="Select date" title="Select date"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
						~ <input type="text" name="e_date" id="e_date"><img
						src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						title="Select date"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
					</td>
				</tr>
				<tr>
					<th>직접검색</th>
					<td><select name="level" id="level">
							<option value="" selected="">회원구분</option>
							<option value="2">일반회원</option>
							<option value="4">기업회원</option>
					</select> <select name="column" id="column">
							<option value="mb_name">회원명</option>
							<option value="mb_nick">닉네임</option>
							<option value="mb_id">회원아이디</option>
							<option value="mb_tel">전화번호</option>
							<option value="mb_hp">휴대폰번호</option>
							<option value="mb_email">이메일</option>
					</select> <input type="text" id="txtValue" name="txtValue"></td>
				</tr>
			</tbody>
		</table>
		<div class="searchbtn">
			<button class="textsearch">검색</button>
		</div>
	</form>




	<form name="ff" method="post">
		<h4 class="allgoodsnum">
			총 <span style="color: #d1215f; font-weight: bold;">16</span>명의 회원이
			있습니다.
		</h4>

		<!-- 회원 리스트 -->
		<table class="goodslist">
			<tbody>
				<tr>
					<th class="width50"><input type="checkbox" id="allCheck"></th>
					<th class="width50">번호</th>
					<th class="width100">마일리지</th>
					<th class="width100">아이디</th>
					<th class="width150">이름</th>
					<th class="width150">일반전화</th>
					<th class="width150">핸드폰</th>
					<th class="width150">메일주소</th>
					<th class="width150">최근접속일</th>
					<th class="width150">가입일</th>
				</tr>
				<tr>
					<td class="width50"><input type="checkbox" name="chk[]"
						value="hello815"></td>
					<td>2</td>
					<td><span style="color: blue">2000</span></td>
					<td>hello815</td>
					<td><a href="./member_view.php?mb_id=hello815"
						style="color: blue;">윤준호</a></td>
					<td>02-2644-7382</td>
					<td>010-9145-8966</td>
					<td>hello105@naver.com</td>
					<td>2018-10-12 14:32:34</td>
					<td>2016-12-08</td>
				</tr>
				<tr>
					<td class="width50"><input type="checkbox" name="chk[]"
						value="hello105"></td>
					<td>1</td>
					<td>3000</td>
					<td>hello105</td>
					<td><a href="./member_view.php?mb_id=hello105"
						style="color: blue;">윤준호</a></td>
					<td>02-2644-7382</td>
					<td>010-9145-8966</td>
					<td>hello105@naver.com</td>
					<td>2018-10-12 14:31:40</td>
					<td>2016-11-21</td>
				</tr>
			</tbody>
		</table>

		<div class="btmbtnwrap" style="position: relative; top: 10px;">
			<button type="button" onclick="del_();">탈퇴처리</button>
		</div>
	</form>
</div>


