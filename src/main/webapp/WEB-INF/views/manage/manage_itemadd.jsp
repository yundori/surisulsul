<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_itemadd.css?time=${currentTime}" />

<div class="content">
	<h2>상품등록</h2>
	<form method="post" action="${pageContext.request.contextPath}/manage_itemadd_ok.do" name="itemadd_form" id="itemadd_form">
		<table class="manage_itemadd_table">
			<tr>
				<th>상품명</th>
				<td><input type="text" name="item_name" id="item_name" class="simple_textarea"/></td>
			</tr>
			<tr>
				<th>상품가격</th>
				<td><input type="text" name="item_price" id="item_price" placeholder="숫자만 입력하세요." class="simple_textarea"/></td>
			</tr>
			<tr>
				<th>종류</th>
				<td>
					<input type="radio" name="item_type" id="type1" value="탁주" />
					<label for="type1" class="item_type_name">탁주</label>
					<input type="radio" name="item_type" id="type2" value="청주" />
					<label for="type2">청주</label>
					<input type="radio" name="item_type" id="type3" value="과실주" />
					<label for="type3">과실주</label>
					<input type="radio" name="item_type" id="type4" value="증류주" />
					<label for="type4">증류주</label>
					<input type="radio" name="item_type" id="type5" value="기타" />
					<label for="type5">기타주류</label>
				</td>
			</tr>
			<tr>
				<th>지역</th>
				<td>
					<input type="radio" name="item_loc" id="loc1" value="서울" />
					<label for="loc1">서울</label>
					<input type="radio" name="item_loc" id="loc2" value="경기" />
					<label for="loc2">경기도</label>
					<input type="radio" name="item_loc" id="loc3" value="강원" />
					<label for="loc3">강원도</label>
					<input type="radio" name="item_loc" id="loc4" value="충청" />
					<label for="loc4">충청도</label>
					<input type="radio" name="item_loc" id="loc5" value="전라" />
					<label for="loc5">전라도</label>
					<input type="radio" name="item_loc" id="loc6" value="경상" />
					<label for="loc6">경상도</label>
					<input type="radio" name="item_loc" id="loc7" value="제주" />
					<label for="loc7">제주도</label>
				</td>
			</tr>
			<tr>
				<th>향</th>
				<td>
					<input type="checkbox" name="item_incense" id="incense1" value="곡물" />
					<label for="incense1">곡물향</label>
					<input type="checkbox" name="item_incense" id="incense2" value="과일" />
					<label for="incense2">과일향</label>
					<input type="checkbox" name="item_incense" id="incense3" value="꽃" />
					<label for="incense3">꽃향</label>
					<input type="checkbox" name="item_incense" id="incense4" value="꿀" />
					<label for="incense4">꿀향</label>
					<input type="checkbox" name="item_incense" id="incense5" value="누룩" />
					<label for="incense5">누룩향</label>
					<input type="checkbox" name="item_incense" id="incense6" value="알콜" />
					<label for="incense6">알콜향</label>
				</td>
			</tr>
			<tr>
				<th>당도</th>
				<td>
					<select id="item_sweet" name="item_sweet">
					<option value="1" >1</option>
					<option value="2" >2</option>
					<option value="3" >3</option>
					<option value="4" >4</option>
					<option value="5" >5</option>
					<option value="6" >6</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>산미</th>
				<td>
					<select id="item_sour" name="item_sour">
					<option value="1" >1</option>
					<option value="2" >2</option>
					<option value="3" >3</option>
					<option value="4" >4</option>
					<option value="5" >5</option>
					<option value="6" >6</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>도수</th>
				<td><input type="text" name="item_degree" id="item_degree" placeholder="숫자만 입력하세요." class="simple_textarea" /></td>
			</tr>
			<tr>
				<th>용량</th>
				<td><input type="text" name="item_size" id="item_size" placeholder="숫자만 입력하세요." class="simple_textarea" /></td>
			</tr>
			<tr>
				<th>원재료</th>
				<td><input type="text" name="item_igd" id="item_igd" class="simple_textarea" /></td>
			</tr>
			<tr>
				<th>음식</th>
				<td><input type="text" name="item_food" id="item_food" class="simple_textarea" /></td>
			</tr>
			<tr>
				<th>간단설명</th>
				<td><input type="text" name="item_des1" id="item_des1" class="simple_textarea"/></td>
			</tr>
			<tr>
				<th>상세설명</th>
				<td><textarea name="item_des2" id="item_des2" maxlength="500" class="detail_textarea"></textarea></td>
			</tr>
			<tr>
				<th>주능결과</th>
				<td>
					<input type="radio" name="item_jnresult" id="jnresult1" value="무궁화" />
					<label for="jnresult1">무궁화</label>
					<input type="radio" name="item_jnresult" id="jnresult2" value="수국" />
					<label for="jnresult2">수국</label>
					<input type="radio" name="item_jnresult" id="jnresult3" value="해바라기" />
					<label for="jnresult3">해바라기</label>
					<input type="radio" name="item_jnresult" id="jnresult4" value="진달래" />
					<label for="jnresult4">진달래</label>
				</td>
			</tr>
		</table>
		
		<button class="add_item_btn">등록하기</button>
		
	</form>
</div>