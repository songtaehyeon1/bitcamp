<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	function giveInfo(name,tel,zipcode,addr,addrdetail){
		opener.$("#rname").attr("value",name);
		opener.$("#rzipcode").attr("value",zipcode);
		opener.$("#raddr").attr("value",addr);
		opener.$("#raddrdetail").attr("value",addrdetail);
		self.close();
	}

</script>
<div style="width: 100%; height: 200px;"></div>
<div class="container">
	<h2 style="font-weight: bold;">배송 주소록 관리</h2>
	<hr>
	<table border="1" style="text-align:center">
		<colgroup>
			<col style="width: 150px">
			<col style="width: 150px">
			<col style="width: 150px">
			<col style="width: 100px">
			<col style="width: 400px">
			<col style="width: 400px">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">주소록 선택</th>
				<th scope="col">수령인</th>
				<th scope="col">전화번호</th>
				<th scope="col">우편번호</th>
				<th scope="col">주소</th>
				<th scope="col">상세 주소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td><button class="selectJuso" style="width:100%" onclick="giveInfo('${vo.rname}','${vo.rtel}','${vo.rzipcode}','${vo.raddr}','${vo.raddrdetail}');">선택</button></td>
					<td>${vo.rname}</td>
					<td>${vo.rtel}</td>
					<td>${vo.rzipcode}</td>
					<td>${vo.raddr}</td>
					<td>${vo.raddrdetail}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</div>