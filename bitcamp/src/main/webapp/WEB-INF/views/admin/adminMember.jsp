<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script>
	$(function() {
		$("#membermenu").attr("class","over");		

		$("#form").submit(function(){
			var chk = $("input:checkbox[name=chk]:checked").length
			
			if(chk==0){
				alert("회원을 선택해셔야 합니다.");
				return false;
			}else{
				return true;
			}
		});
		

		$('#s_date').datepicker({
			uiLibrary : 'bootstrap4.4.1',
				format : "yyyy-mm-dd",
				icons: { rightIcon: null }

		
					
		});
		$('#e_date').datepicker({
			uiLibrary : 'bootstrap4.4.1',
				format : "yyyy-mm-dd",
				icons: { rightIcon: null }
		
					
		});
		$("#reset").click(function() {
			$("input[type=text]").val('');
			$("#searchKey").val('username');
		});
	});
</script>
<style>
	#datepickerbox div,#datepickerbox img,#datepickerbox span{
		float: left
	}
</style>
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
	<h3>회원 리스트</h3>

	<ul class="helpbox">
		<li>사이트에 가입한 회원목록입니다.</li>
	</ul>
	<!--관리자 member 우측 컨텐츠-->
	<form method="get" action="/bitcamp/admin/member">
		<table class="adminform">
			<tbody>
				<tr>
					<th>가입일</th>
					<td id="datepickerbox" ><input type="text" name="s_date" id="s_date" value="${pagevo.s_date }" autocomplete="off"><img
						src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						alt="Select date" title="Select date"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
						<span>~</span> <input type="text" name="e_date" id="e_date" value="${pagevo.e_date }" autocomplete="off"><img
						src="<%=request.getContextPath()%>/resources/admin/calendar.gif"
						title="Select date"
						style="margin-left: 2px; vertical-align: middle; cursor: Pointer;">
					</td>
				</tr>
				<tr>
					<th>직접검색</th>
					<td><select name="searchKey" id="searchKey">
							<option value="username" <c:if test="${pagevo.searchKey =='username' || pagevo.searchKey ==null || pagevo.searchKey=='' }">selected=""</c:if>>회원명</option>
							<option value="userid" <c:if test="${pagevo.searchKey =='userid' }">selected=""</c:if>>회원아이디</option>
							<option value="usertel" <c:if test="${pagevo.searchKey =='usertel' }">selected=""</c:if>>전화번호</option>
							<option value="useremail" <c:if test="${pagevo.searchKey =='useremail' }">selected=""</c:if>>이메일</option>
							<option value="useraddr" <c:if test="${pagevo.searchKey =='useraddr' }">selected=""</c:if>>주소</option>
					</select> <input type="text" id="searchWord" name="searchWord" value="${pagevo.searchWord }"></td>
				</tr>
			</tbody>
		</table>
		<div class="searchbtn">
			<button class="textsearch">검색</button>
			<button class="textsearch" type="button" id="reset">초기화</button>
		</div>
	</form>




	<form method="get" id="form" action="/bitcamp/admin/memberDel">
		<h4 class="allgoodsnum">
			총 <span style="color: #d1215f; font-weight: bold;">${fn:length(list) }</span>명의 회원이
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
					<th class="width150">연락처</th>
					<th class="width150">주소</th>
					<th class="width150">메일주소</th>
					<th class="width150">최근접속일</th>
					<th class="width150">가입일</th>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td class="width50"><input type="checkbox" name="chk"
							value="${vo.userno }"></td>
						<td>${vo.userno }</td>
						<td><span style="color: blue">${vo.usermile }</span></td>
						<td>${vo.userid }</td>
						<td><a href="/bitcamp/admin/memberEdit?userno=${vo.userno}" style="color: blue;">${vo.username }</a></td>
						<td>${vo.usertel }</td>
						<td>${vo.useraddr }</td>
						<td>${vo.useremail }</td>
						<td>${vo.userlogdate }</td>
						<td>${vo.regdate }</td>
					</tr>
				</c:forEach>
				<c:if test="${fn:length(list)==0 }">
					<tr>
						<th colspan="15" style="background: #fff;">등록된 데이터가 없습니다.</th>
					</tr>
				</c:if>				
			</tbody>
		</table>

		<div class="btmbtnwrap" style="position: relative; top: 10px;">
			<input type="submit" class="btn btn-dark" value="탈퇴처리"/>
		</div>
		<div style="width: 100%; clear: left">
			<ul class="pagination justify-content-center">
				<c:if test="${pagevo.pageNum == 1}">
					<li class="page-item disabled"><a class="page-link">&lt;</a></li>
				</c:if>
				<c:if test="${pagevo.pageNum > 1}">
					<li class="page-item"><a class="page-link text-white black"
						href="/bitcamp/admin/member?pageNum=${pagevo.pageNum - 1}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>
						<c:if test = "${pagevo.s_date !=null && pagevo.e_date !=null  && pagevo.s_date !='' && pagevo.e_date !=''  }">&s_date=${pagevo.s_date }&e_date=${pagevo.e_date }</c:if>
						">&lt;</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="${pagevo.startPage}"
					end="${pagevo.startPage + pagevo.onePageCount - 1}">
					<c:if test="${i <= pagevo.totalPage}">
						<li class="page-item"><a class="page-link pages"
							href="/bitcamp/admin/member?pageNum=${i}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if>
							<c:if test = "${pagevo.s_date !=null && pagevo.e_date !=null  && pagevo.s_date !='' && pagevo.e_date !=''  }">&s_date=${pagevo.s_date }&e_date=${pagevo.e_date }</c:if>
							"<c:if test = "${i == pagevo.pageNum}">style = "background : black; color : white;"</c:if>>${i}</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if
					test="${pagevo.pageNum == pagevo.totalPage || pagevo.totalPage == ''}">
					<li class="page-item disabled"><a class="page-link">&gt;</a></li>
				</c:if>
				<c:if
					test="${pagevo.pageNum != pagevo.totalPage && pagevo.totalPage != ''}">
					<li class="page-item"><a class="page-link text-white black"
						href="/bitcamp/admin/member?pageNum=${pagevo.pageNum + 1}<c:if test = "${pagevo.searchKey != null && pagevo.searchWord != null}">&searchKey=${pagevo.searchKey}&searchWord=${pagevo.searchWord}</c:if><c:if test = "${pagevo.s_date !=null && pagevo.e_date !=null  && pagevo.s_date !='' && pagevo.e_date !=''  }">&s_date=${pagevo.s_date }&e_date=${pagevo.e_date }</c:if>">&gt;</a>
					</li>
				</c:if>
			</ul>
		</div>
	</form>
</div>


