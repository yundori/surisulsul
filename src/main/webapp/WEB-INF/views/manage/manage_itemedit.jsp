<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/manage_header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${contextPath}/assets/manage/manage_itemadd.css?time=${currentTime}" />

<div class="content">
	<h2>상품수정</h2>
	<form method="post" action="${pageContext.request.contextPath}/manage_itemedit_ok.do" name="itemedit_form" id="itemedit_form">
		<table class="manage_itemedit_table">
			<tr>
				<th>상품번호</th>
				<td><input type="hidden" name="item_id" id="item_id" value="${output.id}" />${output.id}번</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="item_name" id="item_name" class="simple_textarea" value="${output.name}" /></td>
			</tr>
			<tr>
				<th>상품가격</th>
				<td><input type="number" name="item_price" id="item_price" placeholder="숫자만 입력하세요." class="simple_textarea" value="${output.price}" /></td>
			</tr>
			<tr>
				<th>상품 이미지</th>
				<td><input type="text" name="item_img" id="item_img" placeholder="확장자(.jpg)를 포함하여 입력하세요." class="simple_textarea" value="${output.img}" /></td>
			</tr>
			<tr>
				<th>종류</th>
				<td>
					<input type="radio" name="item_type" id="type1" value="탁주" <c:if test="${output.type == '탁주'}">checked</c:if> />
					<label for="type1" class="item_type_name">탁주</label>
					<input type="radio" name="item_type" id="type2" value="청주" <c:if test="${output.type == '청주'}">checked</c:if> />
					<label for="type2">청주</label>
					<input type="radio" name="item_type" id="type3" value="과실주" <c:if test="${output.type == '과실주'}">checked</c:if> />
					<label for="type3">과실주</label>
					<input type="radio" name="item_type" id="type4" value="증류주" <c:if test="${output.type == '증류주'}">checked</c:if> />
					<label for="type4">증류주</label>
					<input type="radio" name="item_type" id="type5" value="기타"  <c:if test="${output.type == '기타'}">checked</c:if> />
					<label for="type5">기타주류</label>
				</td>
			</tr>
			<tr>
				<th>지역</th>
				<td>
					<input type="radio" name="item_loc" id="loc1" value="서울" <c:if test="${output.loc == '서울'}">checked</c:if> />
					<label for="loc1">서울</label>
					<input type="radio" name="item_loc" id="loc2" value="경기" <c:if test="${output.loc == '경기'}">checked</c:if> />
					<label for="loc2">경기도</label>
					<input type="radio" name="item_loc" id="loc3" value="강원" <c:if test="${output.loc == '강원'}">checked</c:if> />
					<label for="loc3">강원도</label>
					<input type="radio" name="item_loc" id="loc4" value="충청" <c:if test="${output.loc == '충청'}">checked</c:if> />
					<label for="loc4">충청도</label>
					<input type="radio" name="item_loc" id="loc5" value="전라" <c:if test="${output.loc == '전라'}">checked</c:if> />
					<label for="loc5">전라도</label>
					<input type="radio" name="item_loc" id="loc6" value="경상" <c:if test="${output.loc == '경상'}">checked</c:if> />
					<label for="loc6">경상도</label>
					<input type="radio" name="item_loc" id="loc7" value="제주" <c:if test="${output.loc == '제주'}">checked</c:if> />
					<label for="loc7">제주도</label>
				</td>
			</tr>
			<tr>
				<th>향</th>
				<td>
					<input type="checkbox" name="item_incense" id="incense1" value="곡물" <c:if test="${output.key1 == '곡물' || output.key2 == '곡물'}">checked</c:if> />
					<label for="incense1">곡물향</label>
					<input type="checkbox" name="item_incense" id="incense2" value="과일" <c:if test="${output.key1 == '과일' || output.key2 == '과일'}">checked</c:if> />
					<label for="incense2">과일향</label>
					<input type="checkbox" name="item_incense" id="incense3" value="꽃" <c:if test="${output.key1 == '꽃' || output.key2 == '꽃'}">checked</c:if> />
					<label for="incense3">꽃향</label>
					<input type="checkbox" name="item_incense" id="incense4" value="꿀" <c:if test="${output.key1 == '꿀' || output.key2 == '꿀'}">checked</c:if> />
					<label for="incense4">꿀향</label>
					<input type="checkbox" name="item_incense" id="incense5" value="누룩" <c:if test="${output.key1 == '누룩' || output.key2 == '누룩'}">checked</c:if> />
					<label for="incense5">누룩향</label>
					<input type="checkbox" name="item_incense" id="incense6" value="알콜" <c:if test="${output.key1 == '알콜' || output.key2 == '알콜'}">checked</c:if> />
					<label for="incense6">알콜향</label>
				</td>
			</tr>
			<tr>
				<th>당도</th>
				<td>
					<select id="item_sweet" name="item_sweet">
					<option value="1" <c:if test="${output.sweet == '1'}">selected</c:if>>1</option>
					<option value="2" <c:if test="${output.sweet == '2'}">selected</c:if>>2</option>
					<option value="3" <c:if test="${output.sweet == '3'}">selected</c:if>>3</option>
					<option value="4" <c:if test="${output.sweet == '4'}">selected</c:if>>4</option>
					<option value="5" <c:if test="${output.sweet == '5'}">selected</c:if>>5</option>
					<option value="6" <c:if test="${output.sweet == '6'}">selected</c:if>>6</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>산미</th>
				<td>
					<select id="item_sour" name="item_sour">
					<option value="1" <c:if test="${output.sour == '1'}">selected</c:if>>1</option>
					<option value="2" <c:if test="${output.sour == '2'}">selected</c:if>>2</option>
					<option value="3" <c:if test="${output.sour == '3'}">selected</c:if>>3</option>
					<option value="4" <c:if test="${output.sour == '4'}">selected</c:if>>4</option>
					<option value="5" <c:if test="${output.sour == '5'}">selected</c:if>>5</option>
					<option value="6" <c:if test="${output.sour == '6'}">selected</c:if>>6</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>도수</th>
				<td><input type="number" name="item_degree" id="item_degree" placeholder="숫자만 입력하세요." class="simple_textarea" value="${output.degree}" /></td>
			</tr>
			<tr>
				<th>용량</th>
				<td><input type="number" name="item_size" id="item_size" placeholder="숫자만 입력하세요." class="simple_textarea" value="${output.size}" /></td>
			</tr>
			<tr>
				<th>원재료</th>
				<td><input type="text" name="item_igd" id="item_igd" class="simple_textarea" value="${output.igd}" /></td>
			</tr>
			<tr>
				<th>음식</th>
				<td><input type="text" name="item_food" id="item_food" class="simple_textarea" value="${output.food}" /></td>
			</tr>
			<tr>
				<th>간단설명</th>
				<td><input type="text" name="item_des1" id="item_des1" class="simple_textarea" value="${output.des1}"/></td>
			</tr>
			<tr>
				<th>상세설명</th>
				<td><textarea name="item_des2" id="item_des2" maxlength="500" class="detail_textarea">${output.des2}</textarea></td>
			</tr>
			<tr>
				<th>주능결과</th>
				<td>
					<input type="radio" name="item_jnresult" id="jnresult1" value="무궁화" <c:if test="${output.jn_result == '무궁화'}">checked</c:if> />
					<label for="jnresult1">무궁화</label>
					<input type="radio" name="item_jnresult" id="jnresult2" value="수국" <c:if test="${output.jn_result == '수국'}">checked</c:if> />
					<label for="jnresult2">수국</label>
					<input type="radio" name="item_jnresult" id="jnresult3" value="해바라기" <c:if test="${output.jn_result == '해바라기'}">checked</c:if> />
					<label for="jnresult3">해바라기</label>
					<input type="radio" name="item_jnresult" id="jnresult4" value="진달래" <c:if test="${output.jn_result == '진달래'}">checked</c:if> />
					<label for="jnresult4">진달래</label>
				</td>
			</tr>
		</table>
		
		<button type="submit" class="edit_item_btn">수정하기</button>
		
	</form>
</div>

<script src="${contextPath}/assets/manage/manage_itemadd.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>