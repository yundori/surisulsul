<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_itemlist.css?time=${currentTime}" />
<div class="content">
	<h2>인기상품관리</h2>
	<h3 class="item_total">총 등록상품 수 : 12개</h3>
	
	<table class="manage_itemlist_table">
		<tr>
			<th rowspan="2" width="50">순위</th>
			<th rowspan="2" width="50">상품ID</th>
			<th width="200">상품명</th>
			<th rowspan="2" width="90">상품가격</th>
			<th colspan="6">타입별(분류)</th>
			<th rowspan="2" width="70">용량(ml)</th>
			<th width="200">원재료</th>
			<th width="350">상품설명</th>
			<th rowspan="2" width="80">주능결과</th>
		</tr>
		<tr>
			<th>이미지</th>
			<th width="80">종류</th>
			<th width="80">지역</th>
			<th width="80">향</th>
			<th width="40">당도</th>
			<th width="40">산미</th>
			<th width="40">도수</th>
			<th width="150">음식</th>
			<th>상세설명</th>
		</tr>
		<tr>
			<td rowspan="2">1</td>
			<td rowspan="2">1</td>
			<td>나루생막걸리11도 (3병)</td>
			<td rowspan="2">33,000원</td>
			<td rowspan="2">탁주</td>
			<td rowspan="2">서울</td>
			<td rowspan="2">과일, 알콜</td>
			<td rowspan="2">3</td>
			<td rowspan="2">1</td>
			<td rowspan="2">11</td>
			<td rowspan="2">500ml</td>
			<td>정제수, 쌀(국내산), 국 등</td>
			<td>깊고 묵직한 맛의 나루 생 막걸리</td>
			<td rowspan="2">진달래</td>
		</tr>
		<tr>
			<td><img src="${contextPath}/assets/img/items/item1.jpg" /></td>
			<td>튀김, 생크림케이크, 고기만두</td>
			<td>나루 11.5도는 묵직한 질감을 가진 술입니다. 처음에는 약간의 씁쓸함이 느껴지지만, 그 뒤로 달콤한 맛이 나면서 다소 높은 도수를 지닌 나루 생 막걸리 11.5도를 부담없이 즐길 수 있도록 도와줍니다. 탄산은 없고, 참외나 메론과 같은 박과류 풍미를 느낄 수 있는 술인데요. 평소 높은 도수의 술을 거부감 없이 잘 즐기시는 분들께 추천해드립니다! 도수가 너무 높아 부담이신 분들은 얼음을 넣어 도수를 낮춰서 마시는 방법도 있습니다. 한 모금 삼키고 난 후에 올라오는 참외나 바닐라 향을 천천히 느껴보세요!</td>
		</tr>
	</table>
</div>