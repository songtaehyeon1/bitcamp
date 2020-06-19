<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin/admin.css"/>

<table class="login-table" style="float: center">
	<tbody>
		<tr>
			<td>
				<div class="login-layout">
					<div class="login-form">
						<form method="post" action="/adminLoginOk">
							<div class="login-input">

								<div>
									<input type="text" id="userid" name="adminId"
										maxlength="20" placeholder="관리자 아이디"
										class="form-control input-lg">
								</div>
								<div>
									<input type="password" id="pwd" name="adminPwd"
										maxlength="20" placeholder="관리자 비밀번호"
										class="form-control input-lg">
								</div>
							</div>
							<div class="login-btn">
								<input type="submit" value="로그인" id="submit"
									class="btn btn-dark">
							</div>
						</form>
					</div>
				</div>
			</td>
		</tr>
	</tbody>
</table>



<script type="text/javascript">
	$("#submit_").click(function() {
		if ($("#userid").val() == "") {
			window.alert("아이디를 입력해주세요!!");
			$("#userid").focus();
			return false;
		}
		if ($("#pwd").val() == "") {
			window.alert("비밀번호를 입력해주세요!!");
			$("#pwd").focus();
			return false;
		}
	});
</script>
