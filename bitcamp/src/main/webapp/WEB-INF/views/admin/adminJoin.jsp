<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin/admin.css" />
<script>
function openDaumZipAddress() {
	new daum.Postcode({
			oncomplete:function(data) {
				jQuery("#zipcode").val(data.zonecode);
				jQuery("#addr").val(data.address);
				jQuery("#addrdetail").focus();
			}
		}).open();

}
</script>
<div
	style="height: 70px; background: #333; color: white; font-size: 3em">관리자
	페이지</div>
<div id="admin_top_menu_box">
	<ul>
		<a href="<%=request.getContextPath()%>/admin/home"><li>관리자홈</li></a>
		<a href="#"><li>기본설정</li></a>
		<a href="<%=request.getContextPath()%>/admin/member"><li class="over">회원관리</li></a>
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
	<h3>회원가입</h3>
	<ul class="helpbox">
		<li>회원가입 화면입니다.</li>
	</ul>

	<form name="Frm" id="Frm" method="post" action="./member_join_ok.php">
		<table class="admin_table">
			<tbody>
				<tr>
					<th>* 아이디</th>
					<td><input type="text" id="chkID" name="chkID" value=""
						class="text" style="ime-mode: disabled;" maxlength="15">
						<button type="button" class="textsearch" style="width: 80px;"
							onclick="idCheck()">중복체크</button> 영문, 숫자 4자리 이상</td>
				</tr>
				<tr>
					<th>* 이메일</th>
					<td><input type="text" name="emailID" id="mail01" value=""
						class="text w100"> @ <input type="text" name="emailDomain"
						id="mail02" value="" class="text w100"></td>
				</tr>

				<tr>
					<th>* 비밀번호</th>
					<td><input type="password" id="pw" name="pass" value=""
						class="text" maxlength="15"> 4~15자의 영문과 숫자의 조합</td>
				</tr>
				<tr>
					<th>* 비밀번호 확인</th>
					<td><input type="password" name="rePass" id="pw02" value=""
						class="text" maxlength="15"> 비밀번호 확인을 위해 한번 더 입력해 주세요.</td>
				</tr>
				<tr>
					<th>* 연락처</th>
					<td><select id="tel1" name="tel1"
						style="border: 1px solid #ddd; height: 27px;">
							<option value="">선택</option>
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="061">061</option>
							<option value="062">062</option>
							<option value="063">063</option>
							<option value="064">064</option>
							<option value="070">070</option>
							<option value="080">080</option>
							<option value="0502">0502</option>
							<option value="0505">0505</option>
							<option value="0506">0506</option>
							<option value="0303">0303</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select> - <input type="text" name="tel2"
						class="text w50"  maxlength="4"
						onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"> - <input
						type="text" name="tel3" class="text w50"
						maxlength="4"
						onkeyup="this.value=this.value.replace(/[^0-9]/g,'')"></td>
				</tr>
				
				<tr>
					<th width="15%">* 이름</th>
					<td width="85%"><input type="text" id="name" name="name"
						value="" class="text"></td>
				</tr>
				
				<tr>
					<th>* 우편번호</th>
					<td><input type="text" id="zipcode" name="zipcode"
						class="text w50" readonly="readonly">
						<button type="button" class="textsearch"
							onclick="openDaumZipAddress()">검색</button></td>
				</tr>
				<tr>
					<th>* 주소</th>
					<td><input type="text" name="addr" id="addr"
						class="text w400" readonly> <br> <input
						type="text" name="addrDetail" id="road_address"
						class="text w400"></td>
				</tr>
				
				
			</tbody>
		</table>


		<div class="searchbtn">
			<button type="button" class="textsearch" onclick="submitChk();">회원가입</button>
		</div>
	</form>
</div>


