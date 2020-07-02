<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				jQuery("#userzipcode").val(data.zonecode);
				jQuery("#useraddr").val(data.address);
				jQuery("#useraddrdetail").focus();
			}
		}).open();

	}
</script>

<div id="admin_top_menu_under">&nbsp;</div>
<div id="admin_left_menu">
	<h2>회원관리</h2>
	<dl>
		<dt>회원관리</dt>
		<dd>
			<a href="<%=request.getContextPath()%>/admin/member">- 회원리스트</a>
		</dd>
		<dd>
			<a href="<%=request.getContextPath()%>/admin/memberdellist">-
				회원탈퇴 / 삭제관리</a>
		</dd>
	</dl>
</div>

<div id="admin_contents">
	<h3>회원정보 수정</h3>
	<ul class="helpbox">
		<li>회원정보 수정화면입니다.</li>
	</ul>

	<form name="Frm" id="Frm" method="post" action="/bitcamp/admin/memberEditOk">
		<table class="admin_table">
			<tbody>
				<tr>
					<th>* 회원코드</th>
					<td><input type="text" id="userno" name="userno"
						value="${vo.userno }" class="text" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>* 아이디</th>
					<td><input type="text" id="userid" name="userid"
						value="${vo.userid }" class="text" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>* 이메일</th>
					<td><input type="text" name="useremail" id="useremail"
						value="${vo.useremail }" class="text"></td>
				</tr>
				<tr>
					<th>* 연락처</th>
					<td><input type="text" id="usertel" class="text" value="${vo.usertel }"
						placeholder="'-'없이 숫자만 입력" name="usertel" maxlength="13"></td>
				</tr>
				<tr>
					<th width="15%">* 이름</th>
					<td width="85%"><input type="text" id="username" name="username"
						value="${vo.username }" class="text"></td>
				</tr>

				<tr>
					<th>* 우편번호</th>
					<td><input type="text" id="userzipcode" name="userzipcode"
						class="text w50" readonly="readonly" value="${vo.userzipcode }">
						<button type="button" class="textsearch"
							onclick="openDaumZipAddress()">검색</button></td>
				</tr>
				<tr>
					<th>* 주소</th>
					<td><input type="text" name="useraddr" id="useraddr" class="text w400" value="${vo.useraddr }"
						readonly> <br> <input type="text" name="useraddrdetail" value="${vo.useraddrdetail }"
						id="useraddrdetail" class="text w400"></td>
				</tr>


			</tbody>
		</table>

		<div class="searchbtn">
			<button type="submit" class="textsearch">수정</button>
		</div>
	</form>
</div>


