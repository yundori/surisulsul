<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<div class="item_info">
	<div>
		<h3 class="title">
			수리술술의 술 이야기 <span>내가 찾은 술은 어떤 술일까?</span>
		</h3>
		
		<div class="taste">
			<h4>맛과 향</h4>
			
			<div class="taste_chart">
				<canvas id="item_chart"></canvas>
			</div>
			
		</div>

		<div class="item_keyword_lists">
			<ul class="keyword_lists_ul">
				<li class="keyword_lists_li type_li">#종류</li>
				<li class="keyword_lists_li area_li">#지역</li>
				<li class="keyword_lists_li incense1_li">#향1</li>
				<li class="keyword_lists_li incense2_li">#향2</li>
			</ul>
		</div>

		<div class="jn_result">
			<h4>주로 찾는 사람들</h4>
			<img src="${contextPath}/surisulsul/assets/img/mypage/flower01.png" />
			<ul>
				<li>이런 타입의 사람들이 많이 찾습니다!</li>
				<li>주능 테스트 타입 요약 항목1</li>
				<li>주능 테스트 타입 요약 항목2</li>
				<li>주능 테스트 타입 요약 항목3</li>
			</ul>
		</div>
		<div class="clear"></div>

		<div class="item_info_suri">
			<h4>고도리 복숭아와인은...?</h4>
			<p>고도리 복숭아와인은 GAP 인증을 받은 황도와 백도를 반씩 사용해 만든 스위트 와인입니다. 병에 붙여져 있는
				라벨의 복숭아 그림만으로도 무슨 맛일지 예상가는데요. 색깔은 연주황색과 약간의 금색을 띄고 있습니다. 향을 맡아보면 복숭아
				통조림을 딱 열었을 때 느껴지는 복숭아의 농익은 달콤한 향기가 입맛을 돋우는데요. 맛을 보면 입안 가득 복숭아의 향과 맛을
				느낄 수 있습니다. 등등</p>
		</div>
		
		<div class="item_info_suri">
			<h4>고도리 복숭아와인과 어울리는 음식</h4>
			<p>어쩌고, 저쩌고, 음식명</p>
		</div>

		<div class="suri_rules">
			<h4>판매 정책 안내 (모든 상품 공통, 교환/반품)</h4>
			<p>
				<b>수리술술에서 판매하는 주류 제품의 경우</b><br /> 발송과 동시에 재발송하기 어려운 상품으로 단순 변심,
				오주문, 주소불명, 수취인 부재 등 고객 사유로 인한 교환 및 반품이 불가합니다.<br /> 구매하시기 전 확인 후
				구매하시기 바랍니다.<br /> <br /> ※ 아래의 법률에 따라 구매 후 출고처리 전 주문 취소가 가능합니다.<br />
				<br /> <b>신용카드 가맹점 법률 제8조 (계약의 철회 및 항변)</b><br /> 가맹점은 할부거래에 관한
				법률, 방문판매 등에 관한 법률, 전자상거래 등에서의 소비자 보호에 관한 법률 등에 따라<br /> 계약에 관한 회원의
				철회가 인정되는 거래에 대해서는 관계 법령에서 정한 반에 따라 회원이 철회를 요청하는 경우 이를 수용하여야 한다.
			</p>
		</div>
		
	</div>
</div>
<script>
	/** 차트 구현 **/
	var ctx = document.getElementById('item_chart').getContext('2d');
	var itemChart = new Chart(ctx, {
		type : 'horizontalBar', //가로막대그래프
		data : {
			labels : [ "당도", "산미", "도수" ], // 각각의 bar에 표시할 x축 라벨
			datasets : [ {
				data : [ 1, 3, 4 ], // 각 bar에 대한 y축 좌표 데이터
				backgroundColor : [// 각 bar의 배경 색상
							'rgba(142, 68, 173, 0.6)',
							'rgba(74, 68, 173, 0.6)',
							'rgba(177, 101, 159, 0.7)' 
							],
				borderColor : [// 각 bar의 테두리 색상
							'rgba(142, 68, 173, 1)',
							'rgba(74, 68, 173, 1)',
							'rgba(177, 101, 159, 1)'
							],
				borderWidth : 2	// 각 bar의 테두리 굵기
			} ]
		},
		options : {
			tooltips: {
				enabled: false
			},
			hover: {
				animationDuration: 0
			},
			animation: {
				duration: 1,
				onComplete: function () {
					var chartInstance = this.chart,
						ctx = chartInstance.ctx;
					ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
					ctx.fillStyle = 'black';
					ctx.textSize = '20';
					ctx.textAlign = 'center';
					ctx.textBaseline = 'middle';
	
					this.data.datasets.forEach(function (dataset, i) {
						var meta = chartInstance.controller.getDatasetMeta(i);
						meta.data.forEach(function (bar, index) {
							var data = dataset.data[index];							
							ctx.fillText(data, bar._model.x + 10, bar._model.y);
						});
					});
				}
			},
			responsive : false,
			legend: {
				display: false
			},
			scales : {
				xAxes : [{
					ticks :{
						display: false,
						//autoSkip : false,
						beginAtZero: true,
						//stepSize: 10,
						min : 0,
						max : 6
					},
					gridLines: {
		                display:false
		            }
				}],
					yAxes : [{
						ticks :{
							autoSkip : false,
							fontColor : 'rgba(0, 0, 0, 1)',
							fontSize : 16
						},
						gridLines: {
			                display:false
			            }
					}]
				}
			}
		});
</script>