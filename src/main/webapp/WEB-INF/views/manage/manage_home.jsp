<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_home.css" />
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.css" />

<div class="content_home">
	<h1>관리자 메인</h1>
	<hr />
	<div class="all_main">
		<div class="chart">
			<canvas id="price_chart"></canvas>
		</div>
		<table class="manage_main">
			<tr>
				<th colspan="2">오늘의 수리술술</th>
			</tr>
			<tr>
			
				<td><a href="${pageContext.request.contextPath}/manage_members.do">새로 가입한 회원 수</a></td>
				<td width=100><a href="${pageContext.request.contextPath}/manage_members.do">${todayIn }</a></td>
			
			</tr>
			<tr>
				<td><a href="${pageContext.request.contextPath}/manage_members.do">오늘 탈퇴한 회원 수</a></td>
				<td><a href="${pageContext.request.contextPath}/manage_members.do">${todayOut}</a></td>
			</tr>
			<tr>
				<td><a href="${pageContext.request.contextPath}/manage_question.do">새로 등록된 문의사항</a></td>
				<td><a href="${pageContext.request.contextPath}/manage_question.do">${qnaCount }</a></td>
			</tr>
			<tr>
				<td><a href="${pageContext.request.contextPath}/manage_orders.do">오늘 들어온 주문 수</a></td>
				<td><a href="${pageContext.request.contextPath}/manage_orders.do">${orderCount }</a></td>
			</tr>
		</table>
	</div>
</div>
<script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script>
/** 차트 구현 **/
var ctx = document.getElementById('price_chart').getContext('2d');
var itemChart = new Chart(ctx, {
	type : 'bar', //가로막대그래프
	data : {
		labels : ['1일','2일','3일', '4일', '5일', '6일', '7일'],
		datasets : [ {
			label : '최근 일주일 매출 현황',
			data : [ 10, 20, 30, 40, 50, 60, 70 ] // 최근 일주일 매출 데이터
		}],

	},
	options : {
		scales : {
			xAxes : [{
				ticks :{
					display: true,
					autoSkip : false,
					beginAtZero: true,
					stepSize: 10,
				},
				gridLines: {
	                display:true,
	                drawOnChartArea : false
	            }
			}],
				yAxes : [{
					ticks :{
						beginAtZero : true,
						autoSkip : false,
						fontColor : 'rgba(0, 0, 0, 1)',
						fontSize : 16
					},
					gridLines: {
		                display:true,
		                drawOnChartArea :false
		            }
				}]
			}
	}
	});

</script>
</body>

</html>