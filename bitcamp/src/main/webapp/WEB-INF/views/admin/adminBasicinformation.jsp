<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(function() {
		$("#basicinfo").attr("class", "over");
	});
	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				jQuery("#corpzipcode").val(data.zonecode);
				jQuery("#corpaddr").val(data.address);
				jQuery("#corpaddr").focus();
			}
		}).open();

	}
</script>

<div id="admin_top_menu_under">&nbsp;</div>
<div id="admin_left_menu">
	<div style="margin: 5px 0 10px 0"></div>
</div>

<div id="admin_contents">
	<h3>기본정 수정</h3>
	<ul class="helpbox">
		<li>기본정보 수정/등록 화면입니다.</li>
	</ul>
	* 표시는 필수 입력 사항입니다.
	<form name="Frm" id="Frm" method="post"	action="/bitcamp/admin/basicInfoEditOk">
		<table class="admin_table">
			<tbody>
				<tr>
					<th>* 사업자명</th>
					<td><input type="text" id="corpname" name="corpname"
						value="${vo.corpname }" class="text"/></td>
				</tr>
				<tr>
					<th>* 대표자명</th>
					<td><input type="text" id="ceoname" name="ceoname"
						value="${vo.ceoname }" class="text"/></td>
				</tr>
				<tr>
					<th>* 사업자등록번호</th>
					<td><input type="text" name="licenseno" id="licenseno"
						value="${vo.licenseno }" class="text"></td>
				</tr>
				<tr>
					<th>* 통신판매업신고번호</th>
					<td><input type="text" name="reportno" id="reportno"
						value="${vo.reportno }" class="text"></td>
				</tr>
				<tr>
					<th>* 사업자 전화번호 </th>
					<td><input type="text" name="corptel" id="corptel"
						value="${vo.corptel }" class="text"></td>
				</tr>
				<tr>
					<th>* 사업자 우편번호</th>
					<td><input type="text" id="corpzipcode" name="corpzipcode"
						class="text w50" readonly="readonly" value="${vo.corpzipcode }">
						<button type="button" class="textsearch"
							onclick="openDaumZipAddress()">검색</button></td>
				</tr>
				
				<tr>
					<th>* 사업자 주소</th>
					<td><input type="text" name="corpaddr" id="corpaddr"
						class="text w400" value="${vo.corpaddr }"> <br>
						</td>
				</tr>
				<tr>
					<th>* 책임자명 </th>
					<td><input type="text" name="managername" id="managername"
						value="${vo.managername }" class="text"></td>
				</tr>
				<tr>
					<th>* 책임자 이메일 </th>
					<td><input type="text" name="manageremail" id="manageremail"
						value="${vo.manageremail }" class="text"></td>
				</tr>
				<tr>
					<th> 카카오톡링크 </th>
					<td><input type="text" name="kakao" id="kakao"
						value="${vo.kakao }" class="text"></td>
				</tr>
				<tr>
					<th> 인스타그램링크 </th>
					<td><input type="text" name="instagram" id="instagram"
						value="${vo.instagram }" class="text"></td>
				</tr>
				<tr>
					<th> 계좌1 </th>
					<td><input type="text" name="account1" id="account1"
						value="${vo.account1 }" class="text"></td>
				</tr>
				<tr>
					<th> 계좌1 은행명 </th>
					<td><input type="text" name="account1bank" id="account1bank"
						value="${vo.account1bank }" class="text"></td>
				</tr>
				<tr>
					<th> 계좌1 예금주 </th>
					<td><input type="text" name="account1name" id="account1name"
						value="${vo.account1name }" class="text"></td>
				</tr>
				<tr>
					<th> 계좌2 </th>
					<td><input type="text" name="account2" id="account2"
						value="${vo.account2 }" class="text"></td>
				</tr>
				<tr>
					<th> 계좌2 은행명 </th>
					<td><input type="text" name="account2bank" id="account2bank"
						value="${vo.account1bank }" class="text"></td>
				</tr>
				<tr>
					<th> 계좌2 예금주 </th>
					<td><input type="text" name="account2name" id="account2name"
						value="${vo.account2name }" class="text"></td>
				</tr>
				<tr>
					<th> 계좌3 </th>
					<td><input type="text" name="account3" id="account3"
						value="${vo.account3 }" class="text"></td>
				</tr>
				<tr>
					<th> 계좌3 은행명 </th>
					<td><input type="text" name="account3bank" id="account3bank"
						value="${vo.account3bank }" class="text"></td>
				</tr>
				<tr>
					<th> 계좌3 예금주 </th>
					<td><input type="text" name="account3name" id="account3name"
						value="${vo.account3name }" class="text"></td>
				</tr>				
		
				<tr>
					<th> 연락처 </th>
					<td><input type="text" name="tel" id="tel"
						value="${vo.tel }" class="text"></td>
				</tr>
				<tr>
					<th>메모 </th>
					<td><textarea cols="30" rows="3" id="memo" name="memo">${vo.memo }</textarea></td>
				</tr>	
			</tbody>
		</table>

		<div class="searchbtn">
			<button type="submit" class="textsearch">수정</button>
		</div>
	</form>
</div>


