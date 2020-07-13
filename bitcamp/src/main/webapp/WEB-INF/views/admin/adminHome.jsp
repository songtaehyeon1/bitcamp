<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(function() {
		$("#homemenu").attr("class","over");
	});
</script>
<div id="admin_top_menu_under">&nbsp;</div>
<div id="admin_left_menu">
	<div style="margin: 5px 0 10px 0"></div>
</div>

<div id="admin_contents">
	<!--관리자 home 우측 컨텐츠-->
	<table border="0" width="100%">
		<tbody>						
			<tr>
				<td height="10"></td>
			</tr>
			<tr>
				<td width="49%"
					style="font-weight: bold; background: #ddd; padding-left: 20px;"><a href="/bitcamp/boardNotice">게시판 현황</a></td>
				<td width="2%"></td>
				<td width="49%"	style="font-weight: bold; background: #ddd; padding-left: 20px;">회원정보</td>
			</tr>
			<tr>
				<td valign="top">
					<table border="0" width="100%" class="tb01">
						<tbody>
							<tr style="font-weight: bold;">
								<td width="20%" style="padding-left: 20px;">총게시판수</td>
								<td width="30%" style="text-align: right; padding-right: 5px;">3
									개</td>
								<td width="20%" style="padding-left: 20px;">총게시물</td>
								<td width="30%" style="text-align: right; padding-right: 5px;">${totalboardcnt }
									개</td>
							</tr>
							<tr style="font-weight: bold;">
								<td style="padding-left: 20px;">오늘게시물</td>
								<td style="text-align: right; padding-right: 5px;">${todayboardcnt } 개</td>
								<td style="padding-left: 20px;">오늘댓글</td>
								<td style="text-align: right; padding-right: 5px;">${todayreplycnt }개</td>
							</tr>
						</tbody>
					</table>
				</td>
				<td></td>
				<td valign="top">
					<table border="0" width="100%"	class="tb01">
						<tbody>
							<tr style="font-weight: bold; text-align: center;">
								<td width="33%">금일 가입회원</td>
								<td width="34%">금일 탈퇴회원</td>
								<td width="33%">전체 회원수</td>
							</tr>
							<tr style="font-weight: bold; text-align: center;">
								<td>${todayMembercnt }명</td>
								<td>${todayWithdrawalcnt } 명</td>
								<td>${totalMembercnt }명</td>
							</tr>
						</tbody>
					</table>
				</td>
				
				
			</tr>

			<tr>
				<td height="10"></td>
			</tr>

			<tr>
				<td width="49%"	style="font-weight: bold; background: #ddd; padding-left: 20px;">접속관련</td>
				<td width="2%"></td>
				<td width="49%"	style="font-weight: bold; background: #ddd; padding-left: 20px;">주문 통계</td>
			</tr>
			<tr>
				<td valign="top">
					<table border="0" width="100%" class="tb01">
						<tbody>
							<tr style="font-weight: bold;">
								<td width="20%" style="padding-left: 20px;">오늘 접속자</td>
								<td width="30%" style="text-align: right; padding-right: 5px;">${todayAccessor}
									명</td>
								<td style="padding-left: 20px;">어제 접속자</td>
								<td style="text-align: right; padding-right: 5px;">${yesterdayAccessor} 명</td>
							</tr>
							<tr style="font-weight: bold;">
								<td style="padding-left: 20px;">총 접속자</td>
								<td style="text-align: right; padding-right: 5px;">${totalAccessor} 명</td>
							</tr>
						</tbody>
					</table>
				</td>
				<td></td>
				<td valign="top"><table border="0" width="100%" class="tb01">
						<tbody>
							<tr style="font-weight: bold;">
								<td width="20%" style="padding-left: 20px;">총 주문수</td>
								<td width="30%" style="text-align: right; padding-right: 5px;">${totalOrdercnt }
									건</td>
								<td width="20%" style="padding-left: 20px;">오늘 주문수</td>
								<td width="30%" style="text-align: right; padding-right: 5px;">${todayOrdercnt } 건</td>
							</tr>
							<tr style="font-weight: bold;">
								<td style="padding-left: 20px;">오늘 주문취소</td>
								<td style="text-align: right; padding-right: 5px;">${todayReturncnt } 건</td>
								<td style="padding-left: 20px;">오늘 반품수</td>
								<td style="text-align: right; padding-right: 5px;">${todayCancelcnt } 건</td>
							</tr>
						</tbody>
					</table></td>
			</tr>

			<tr>
				<td height="10"></td>
			</tr>
			
		</tbody>
	</table>
</div>


