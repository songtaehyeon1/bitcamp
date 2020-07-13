<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/js/jqplot/jquery.jqplot.css">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jqplot/jquery.jqplot.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jqplot/jquery.jqplot.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jqplot/plugins/jqplot.enhancedLegendRenderer.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jqplot/plugins/jqplot.barRenderer.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jqplot/plugins/jqplot.highlighter.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jqplot/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jqplot/plugins/jqplot.cursor.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jqplot/plugins/jqplot.pointLabels.js"></script>
<script>

$(function () {
	$("#salemenu").attr("class","over");
    var barData1 = [];
    var barData2 = [];
    var barData3 = [];
    var totalsales=0;
    var totalcashs=0;
    var totalcards=0;
    var totalrprices=0;
    var totalcprices=0;
    var ticks = [];
    var labels = ['총', '현금','카드'];    
    <c:forEach var="list" items="${dateList}" >
   		<c:if test="${list.order_data_arr[0] != null && list.order_data_arr[0] != ''}">
    		barData1.push("${list.order_data_arr[0].totalsale}");
    		totalsales += ${list.order_data_arr[0].totalsale}-${list.order_data_arr[0].totalcprice}-${list.order_data_arr[0].totalrprice};
    		totalrprices += ${list.order_data_arr[0].totalrprice};
    		totalcprices += ${list.order_data_arr[0].totalcprice};
   		</c:if>
   		<c:if test="${(list.order_data_arr[0] == null || list.order_data_arr[0] == '') && list.date !=null && list.date !=''}">
			barData1.push("0");
		</c:if>
		
		<c:if test="${list.order_data_arr[0] != null && list.order_data_arr[0] != ''}">
			barData2.push("${list.order_data_arr[0].totalcard}");
			totalcards += ${list.order_data_arr[0].totalcard}-${list.order_data_arr[0].cardcprice}-${list.order_data_arr[0].cardrprice};;
		</c:if>
		<c:if test="${(list.order_data_arr[0] == null || list.order_data_arr[0] == '') && list.date !=null && list.date !=''}">
			barData2.push("0");
		</c:if>
		
		<c:if test="${list.order_data_arr[0] != null && list.order_data_arr[0] != ''}">
			barData3.push("${list.order_data_arr[0].totalcash}");
			totalcashs += ${list.order_data_arr[0].totalcash}-${list.order_data_arr[0].cashcprice}-${list.order_data_arr[0].cashrprice};;
		</c:if>
		<c:if test="${(list.order_data_arr[0] == null || list.order_data_arr[0] == '') && list.date !=null && list.date !=''}">
			barData3.push("0");
		</c:if>
   		<c:if test="${list.date !=null && list.date !=''}">
			 ticks.push("${list.date}");
		</c:if>       
    </c:forEach>    
    $("#totalcards").html(numberWithCommas(totalcards)+"원");
    $("#totalcashs").html(numberWithCommas(totalcashs)+"원");
    $("#totalsales").html(numberWithCommas(totalsales)+"원");
    $("#totalcprices").html(numberWithCommas(totalcprices)+"원");
    $("#totalrprices").html(numberWithCommas(totalrprices)+"원");
    var csCntMaxValue = Math.max.apply(null, barData1);
    
    if(ticks.length > 1){
        csCntMaxValue = csCntMaxValue*1.2;    //전체 데이터 최대 값 * 1.2
    }else{
        csCntMaxValue = 10000000;    //모든 데이터 값이 0인 경우 차트 최대값을 10,000,000으로 set
    }
           
    var campChart = $.jqplot('chartArea', [barData1, barData3, barData2], {
        //차트 속성 설정
    	animate: true,
        animateReplot: true,
        cursor: {show: true,
                      zoom: false,
                      looseZoom: false,
                      showTooltip: false              
                },
        series:[
                  {
                      color : 'blue',
                      renderer: $.jqplot.LineRenderer,
                  } ,
                  {
                      color : 'red',
                      renderer: $.jqplot.LineRenderer,
                  },
                  {
                      color : 'orange',
                      renderer: $.jqplot.LineRenderer,
                  }
                ],
        axesDefaults: {
              pad: 0
        },

        /*그래프 범례*/
        legend: {
             renderer: $.jqplot.EnhancedLegendRenderer,
              show: true,
              location: 'ne',
              labels: labels,
              rendererOptions:{
                    numberRows :1    
                 }
                          
        },    
        axes: {
                xaxis: {
                            renderer: $.jqplot.CategoryAxisRenderer,
                          ticks: ticks,
                          drawMajorGridlines: false,
                          drawMinorGridlines: true,
                          drawMajorTickMarks: false,
                        },
                yaxis: {
                            max: csCntMaxValue,
                            min: 0,
                            tickOptions: {
                                formatString: "%'d"
                            },
                            rendererOptions: {
                                forceTickAt0: true
                            }
                        },
            },
            highlighter: {
                            show: true, 
                            showLabel: true, 
                            tooltipAxes: 'y',
                            sizeAdjust: 7.5 , tooltipLocation : 'ne'
                        }
    })
	
    
    $("#year").append("<option value='${today_info.search_year-5}'>${today_info.search_year-5}</option>");
    $("#year").append("<option value='${today_info.search_year-4}'>${today_info.search_year-4}</option>");
    $("#year").append("<option value='${today_info.search_year-3}'>${today_info.search_year-3}</option>")
    $("#year").append("<option value='${today_info.search_year-2}'>${today_info.search_year-2}</option>")
    $("#year").append("<option value='${today_info.search_year-1}'>${today_info.search_year-1}</option>")
    $("#year").append("<option value='${today_info.search_year}'selected>${today_info.search_year}</option>")
    $("#year").append("<option value='${today_info.search_year+1}'>${today_info.search_year+1}</option>")
    $("#year").append("<option value='${today_info.search_year+2}'>${today_info.search_year+2}</option>")
    $("#year").append("<option value='${today_info.search_year+3}'>${today_info.search_year+3}</option>")
    for (var i = 0; i <= 11; i++) {
		$("#month").append("<option value='"+i+"'>"+(i+1)+"</option>");
	}
    $("#month").val('${today_info.search_month-1}');
    
    $(".detail").click(function () {
    	$('.modal').css('display', 'block');
	});
    
    $('.modal .btn_close, .btn_cancel').click(function() {
    	$('.modal').css('display', 'none');
    });
    
});
function addmodal(totaldfee,totalpayment,totalsale,totalcash,totalcard,date,totalcprice,totalrprice,cashcprice,cashrprice,cardcprice,cardrprice,totalpaycprice,totalpayrprice,cashpaycprice,cashpayrprice,cardpaycprice,cardpayrprice){
	var resulttotalpayment = totalpayment - totalpaycprice - totalpayrprice;
	$("#modaltotalpayment").html(numberWithCommas(resulttotalpayment)+" 원");
	var resulttotalsale = totalsale-totalcprice-totalrprice;
	$("#modaltotalsale").html(numberWithCommas(resulttotalsale)+" 원");
	var resulttotalcash = totalcash-cashcprice-cashrprice;
	$("#modaltotalcash").html(numberWithCommas(resulttotalcash)+" 원");
	var resulttotalcard = totalcard-cardcprice-cardrprice;
	$("#modaltotalcard").html(numberWithCommas(resulttotalcard)+" 원");
	$("#modaldate").html(date);
	$("#modaltotalcprice").html(numberWithCommas(totalcprice)+" 원");
	$("#modaltotalrprice").html(numberWithCommas(totalrprice)+" 원");
	$("#modalcashcprice").html(numberWithCommas(cashcprice)+" 원");
	$("#modalcashrprice").html(numberWithCommas(cashrprice)+" 원");
	$("#modalcardcprice").html(numberWithCommas(cardcprice)+" 원");
	$("#modalcardrprice").html(numberWithCommas(cardrprice)+" 원");
	var notpayment = resulttotalsale-resulttotalpayment;
	$("#modalnotpayment").html('-'+numberWithCommas(notpayment)+" 원");
	$('.modal').css('display', 'block');
}
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


</script>
<style>
a:link {
	text-decoration: none;
}
</style>
<div id="admin_top_menu_under">&nbsp;</div>
<div id="admin_left_menu">
	<div style="margin: 5px 0 10px 0"></div>
</div>
<div id="admin_contents">
	<h3>매출정보 확인</h3>
	<ul class="helpbox">
		<li>매출정보 확인 화면입니다.</li>
	</ul>
	<form method="get" action="/bitcamp/admin/sales">
		<table class="goods_search adminform">
			<tbody>
				<tr>
					<th>날짜</th>
					<td><select name="year" id="year">
					</select>년 <select name="month" id="month">
					</select>월</td>
				</tr>				
			</tbody>
		</table>
		<div class="searchbtn">
			<button class="textsearch">검색</button>			
		</div>
	</form>
	<div id="chartArea"></div>
	<table border="0" width="100%" class="tb01" style="margin-top:30px">		
		<tbody>
			<tr><td colspan="5" style="text-align: center;font-size: 3em;font-weight: bold;background-color:#f6f6f6">${today_info.search_year }년 	${today_info.search_month }월</td></tr>
			<tr style="font-weight: bold; text-align: center;">
				<td width="20%" style="font-size:2em;color:#445ebc">총 매출액</td>
				<td width="20%"style="font-size:2em;color:#d33c34">총 현금매출</td>
				<td width="20%"style="font-size:2em;color:orange">총 카드 매출</td>
				<td width="20%"style="font-size:2em;">총 반품</td>
				<td width="20%"style="font-size:2em;">총 취소</td>
			</tr>
			<tr style="font-weight: bold; text-align: center;">
				<td style="font-size:2em;color:#445ebc" id="totalsales"></td>
				<td style="font-size:2em;color:#d33c34" id="totalcashs"></td>
				<td style="font-size:2em;color:orange" id="totalcards"></td>
				<td style="font-size:2em;" id="totalcprices"></td>
				<td style="font-size:2em;" id="totalrprices"></td>
			</tr>
		</tbody>
	</table>
	
	<div class="calendar">
		<table class="calendar_body" style="width: 100%">
			<thead>
				<tr bgcolor="#CECECE">
					<td class="day sun">일</td>
					<td class="day">월</td>
					<td class="day">화</td>
					<td class="day">수</td>
					<td class="day">목</td>
					<td class="day">금</td>
					<td class="day sat">토</td>
				</tr>
			</thead>
			<tbody>
			<colgroup>
				<col width="12.5%">
				<col width="12.5%">
				<col width="12.5%">
				<col width="12.5%">
				<col width="12.5%">
				<col width="12.5%">
				<col width="12.5%">
			</colgroup>
			<tr style="height: 0px">
				<c:forEach var="dateList" items="${dateList}"
					varStatus="date_status">
					<c:choose>
						
						<c:when test="${date_status.index%7==6}">
							<td class="sat_day">
								<table class="calendar-table-inner"
									style="width: 100%; border: 1px solid #ccc">
									<tbody>
										<tr>
											<td align="right" style="border-bottom: 1px solid #ccc;background-color: #f6f6f6"><b
												class="sat"><c:forEach var="orderList"
														items="${dateList.order_data_arr}">
														<c:if
															test="${orderList.totalsale !='' && orderList.totalsale != null }">
															<button style="float: left" class="detail"
																onclick="javascript:addmodal('${orderList.totaldfee}','${orderList.totalpayment }','${orderList.totalsale }','${orderList.totalcash }','${orderList.totalcard }','${today_info.search_year }-${today_info.search_month }-${dateList.date}','${orderList.totalcprice}','${orderList.totalrprice}','${orderList.cashcprice}','${orderList.cashrprice}','${orderList.cardcprice }','${orderList.cardrprice}','${orderList.totalpaycprice}','${orderList.totalpayrprice}','${orderList.cashpaycprice}','${orderList.cashpayrprice}','${orderList.cardpaycprice }','${orderList.cardpayrprice}')">상세
																보기</button>
														</c:if>
													</c:forEach>${dateList.date}</b></td>
										</tr>
										<tr>
											<td align="right" style="border-bottom: 1px dashed #ccc">
												<c:forEach var="orderList"
													items="${dateList.order_data_arr}">
													<c:if
														test="${orderList.totalsale !='' && orderList.totalsale != null }">
														<a
															href="/bitcamp/admin/orderList?payment_type=All&ndate=order_date&s_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}&e_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}"><b
															class="date_subject"><font color="#445ebc">총
																	매출 <fmt:formatNumber type="number"
																		maxFractionDigits="3" value="${orderList.totalsale  - orderList.totalcprice - orderList.totalrprice }" />원
															</font></b></a>
													</c:if>
												</c:forEach>
											</td>
										</tr>
										<tr>
											<td align="right" style="border-bottom: 1px dashed #ccc"><c:forEach
													var="orderList" items="${dateList.order_data_arr}">
													<c:if
														test="${orderList.totalcash !='' && orderList.totalcash != null }">
														<a
															href="/bitcamp/admin/orderList?payment_type=cash&ndate=order_date&s_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}&e_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}"><b
															class="date_subject"><font color="#d33c34">현금
																	매출 <fmt:formatNumber type="number"
																		maxFractionDigits="3" value="${orderList.totalcash - orderList.cashcprice - orderList.cashrprice }" />원
															</font></b></a>
													</c:if>
												</c:forEach></td>
										</tr>
										<tr>
											<td align="right"><c:forEach var="orderList"
													items="${dateList.order_data_arr}">
													<c:if
														test="${orderList.totalcard !='' && orderList.totalcard != null }">
														<a
															href="/bitcamp/admin/orderList?payment_type=card&ndate=order_date&s_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}&e_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}"><b
															class="date_subject"><font color="orange">카드
																	매출 <fmt:formatNumber type="number"
																		maxFractionDigits="3" value="${orderList.totalcard  - orderList.cardcprice - orderList.cardrprice }" />원
															</font></b></a>
													</c:if>
												</c:forEach></td>
										</tr>
									</tbody>
								</table>
							</td>
						</c:when>
						<c:when test="${date_status.index%7==0}">
			</tr>
			<tr>
				<td>
					<table class="calendar-table-inner"
						style="width: 100%; border: 1px solid #ccc">
						<tbody>
							<tr>
								<td align="right" style="border-bottom: 1px solid #ccc;background-color: #f6f6f6"><b
									class="sun"><c:forEach var="orderList"
											items="${dateList.order_data_arr}">
											<c:if
												test="${orderList.totalsale !='' && orderList.totalsale != null }">
												<button style="float: left" class="detail"
																onclick="javascript:addmodal('${orderList.totaldfee}','${orderList.totalpayment }','${orderList.totalsale }','${orderList.totalcash }','${orderList.totalcard }','${today_info.search_year }-${today_info.search_month }-${dateList.date}','${orderList.totalcprice}','${orderList.totalrprice}','${orderList.cashcprice}','${orderList.cashrprice}','${orderList.cardcprice }','${orderList.cardrprice}','${orderList.totalpaycprice}','${orderList.totalpayrprice}','${orderList.cashpaycprice}','${orderList.cashpayrprice}','${orderList.cardpaycprice }','${orderList.cardpayrprice}')">상세
																보기</button>
											</c:if>
										</c:forEach>${dateList.date}</b></td>
							</tr>
							<tr>
								<td align="right" style="border-bottom: 1px dashed #ccc"><c:forEach
										var="orderList" items="${dateList.order_data_arr}">
										<c:if
											test="${orderList.totalsale !='' && orderList.totalsale != null }">
											<a
												href="/bitcamp/admin/orderList?payment_type=All&ndate=order_date&s_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}&e_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}"><b
												class="date_subject"><font color="#445ebc">총 매출 <fmt:formatNumber
															type="number" maxFractionDigits="3"
															value="${orderList.totalsale  - orderList.totalcprice - orderList.totalrprice }" />원
												</font></b></a>
										</c:if>
									</c:forEach></td>
							</tr>
							<tr>
								<td align="right" style="border-bottom: 1px dashed #ccc"><c:forEach
										var="orderList" items="${dateList.order_data_arr}">
										<c:if
											test="${orderList.totalcash !='' && orderList.totalcash != null }">
											<a
												href="/bitcamp/admin/orderList?payment_type=cash&ndate=order_date&s_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}&e_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}"><b
												class="date_subject"><font color="#d33c34">현금 매출
														<fmt:formatNumber type="number" maxFractionDigits="3"
															value="${orderList.totalcash  - orderList.cashcprice - orderList.cashrprice }" />원
												</font></b></a>
										</c:if>
									</c:forEach></td>
							</tr>
							<tr>
								<td align="right"><c:forEach var="orderList"
										items="${dateList.order_data_arr}">
										<c:if
											test="${orderList.totalcard !='' && orderList.totalcard != null }">
											<a
												href="/bitcamp/admin/orderList?payment_type=card&ndate=order_date&s_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}&e_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}"><b
												class="date_subject"><font color="orange">카드 매출 <fmt:formatNumber
															type="number" maxFractionDigits="3"
															value="${orderList.totalcard  - orderList.cardcprice - orderList.cardrprice }" />원
												</font></b></a>
										</c:if>
									</c:forEach></td>
							</tr>
						</tbody>
					</table>
				</td>
				</c:when>
				<c:otherwise>
					<td>
						<table class="calendar-table-inner"
							style="width: 100%; border: 1px solid #ccc">
							<tbody>
								<tr>
									<td align="right" style="border-bottom: 1px solid #ccc;background-color: #f6f6f6"><b
										class="normal_day"><c:forEach var="orderList"
												items="${dateList.order_data_arr}">
												<c:if
													test="${orderList.totalsale !='' && orderList.totalsale != null }">
													<button style="float: left" class="detail"
																onclick="javascript:addmodal('${orderList.totaldfee}','${orderList.totalpayment }','${orderList.totalsale }','${orderList.totalcash }','${orderList.totalcard }','${today_info.search_year }-${today_info.search_month }-${dateList.date}','${orderList.totalcprice}','${orderList.totalrprice}','${orderList.cashcprice}','${orderList.cashrprice}','${orderList.cardcprice }','${orderList.cardrprice}','${orderList.totalpaycprice}','${orderList.totalpayrprice}','${orderList.cashpaycprice}','${orderList.cashpayrprice}','${orderList.cardpaycprice }','${orderList.cardpayrprice}')">상세
																보기</button>
												</c:if>
											</c:forEach> ${dateList.date}</b></td>
								</tr>
								<tr>
									<td align="right" style="border-bottom: 1px dashed #ccc">
										<c:forEach var="orderList" items="${dateList.order_data_arr}">
											<c:if
												test="${orderList.totalsale !='' && orderList.totalsale != null }">
												<a
													href="/bitcamp/admin/orderList?payment_type=All&ndate=order_date&s_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}&e_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}"><b
													class="date_subject"><font color="#445ebc">총 매출
															<fmt:formatNumber type="number" maxFractionDigits="3"
																value="${orderList.totalsale - orderList.totalcprice - orderList.totalrprice }" />원
													</font></b></a>
											</c:if>
										</c:forEach>
									</td>
								</tr>
								<tr>
									<td align="right" style="border-bottom: 1px dashed #ccc"><c:forEach
											var="orderList" items="${dateList.order_data_arr}">
											<c:if
												test="${orderList.totalcash !='' && orderList.totalcash != null }">
												<a
													href="/bitcamp/admin/orderList?payment_type=cash&ndate=order_date&s_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}&e_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}"><b
													class="date_subject"><font color="#d33c34">현금 매출
															<fmt:formatNumber type="number" maxFractionDigits="3"
																value="${orderList.totalcash - orderList.cashcprice - orderList.cashrprice }" />원
													</font></b></a>
											</c:if>
										</c:forEach></td>
								</tr>
								<tr>
									<td align="right"><c:forEach var="orderList"
											items="${dateList.order_data_arr}">
											<c:if
												test="${orderList.totalcard !='' && orderList.totalcard != null }">
												<a
													href="/bitcamp/admin/orderList?payment_type=card&ndate=order_date&s_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}&e_date=${today_info.search_year }-${today_info.search_month }-${dateList.date}"><b
													class="date_subject"><font color="orange">카드 매출
															<fmt:formatNumber type="number" maxFractionDigits="3"
																value="${orderList.totalcard - orderList.cardcprice - orderList.cardrprice  }" />원
													</font></b></a>
											</c:if>
										</c:forEach></td>
								</tr>
							</tbody>
						</table>
					</td>
				</c:otherwise>
				</c:choose>
				</c:forEach>
			</tr>
			</tbody>


		</table>
	</div>
	<div class="modal">
		<div class="modal_container">
			<p style="color: gray; text-align: right">
				<b id="modaldate">1987-08-15</b> 매출내역
			</p>
			<p style="text-align: center;font-size: 1.5em;font-weight: bold">매출 내역</p>
			<p style="font-size: 1.2em; margin-bottom: 0">
				+현금 매출금액<b id="modaltotalcash" style="float: right">0</b>
			</p>
			<p style="font-size: 1.2em; margin-bottom: 0">
				+카드 매출금액<b id="modaltotalcard" style="float: right">0</b>
			</p>			
			<p style="border-bottom: 1px dashed gray;">
				총 매출금액<b id="modaltotalsale" style="color: blue; float: right;">0</b>
			</p>
			<p>
				총 결제 금액:<b id="modaltotalpayment" style="color: blue; float: right">0</b>
			</p>
			<p>
				미결제 금액:<b id="modalnotpayment" style="color: red; float: right">0</b>
			</p>
			<p style="text-align: center;font-size: 1.5em;font-weight: bold">취소내역</p>
			<p style="font-size: 1.2em; margin-bottom: 0">
				-현금 취소금액<b id="modalcashcprice" style="float: right">0</b>
			</p>
			<p style="font-size: 1.2em; margin-bottom: 0;border-bottom: 1px dashed gray;">
				-카드 취소금액<b id="modalcardcprice" style="float: right">0</b>
			</p>
			<p>
				총 취소 금액:<b id="modaltotalcprice" style="color: red; float: right">0</b>
			</p>
			<p style="text-align: center;font-size: 1.5em;font-weight: bold">반품내역</p>
			<p style="font-size: 1.2em; margin-bottom: 0">
				-현금 반품금액<b id="modalcashrprice" style="float: right">0</b>
			</p>
			<p style="font-size: 1.2em; margin-bottom: 0;border-bottom: 1px dashed gray;">
				-카드 반품금액<b id="modalcardrprice" style="float: right">0</b>
			</p>
			<p>
				총 반품 금액:<b id="modaltotalrprice" style="color: red; float: right">0</b>
			</p>
			<div class="group_btn">
				<button type="button" class="btn_cancel" style="float: right">닫기</button>
			</div>
		</div>

	</div>
</div>