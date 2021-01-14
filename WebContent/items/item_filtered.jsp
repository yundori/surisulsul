<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!doctype html>
<html>

<head>
	<meta charset="UTF-8" />
	<title>수리술술_내가찾는술</title>

	<!-- CSS 파일 참조 처리 -->
	<link rel="stylesheet" type="text/css" href="../assets/css/item_filtered.css" />
</head>

<body>
	<div class="item_filtered">
		<form>
			<fieldset>
				<legend>종류별</legend>
				<div>
					<input name="type" id="type1" type="checkbox" />
					<label for="type1">전체 선택</label>
					<input name="type" id="type2" type="checkbox" />
					<label for="type2">탁주</label>
					<input name="type" id="type3" type="checkbox" />
					<label for="type3">청주/약주</label>
					<input name="type" id="type4" type="checkbox" />
					<label for="type4">과실주</label>
					<input name="type" id="type5" type="checkbox" />
					<label for="type5">증류주</label>
					<input name="type" id="type6" type="checkbox" />
					<label for="type6">기타 주류</label>
				</div>
			</fieldset>
			
			<fieldset>
				<legend>지역별</legend>
				<div>
					<input name="area" id="area1" type="checkbox" />
					<label for="area1">전체 선택</label>
					<input name="area" id="area2" type="checkbox" />
					<label for="area2">서울</label>
					<input name="area" id="area3" type="checkbox" />
					<label for="area3">경기도</label>
					<input name="area" id="area4" type="checkbox" />
					<label for="area4">강원도</label>
					<input name="area" id="area5" type="checkbox" />
					<label for="area5">충청도</label>
					<input name="area" id="area6" type="checkbox" />
					<label for="area6">전라도</label>
					<input name="area" id="area7" type="checkbox" />
					<label for="area7">경상도</label>
					<input name="area" id="area8" type="checkbox" />
					<label for="area8">제주도</label>
				</div>
			</fieldset>
			
			<fieldset>
				<legend>향</legend>
				<div>
					<input name="incense" id="incense1" type="checkbox" />
					<label for="area1">전체 선택</label>
					<input name="incense" id="incense2" type="checkbox" />
					<label for="incense2">곡물향</label>
					<input name="incense" id="incense3" type="checkbox" />
					<label for="incense3">과일향</label>
					<input name="incense" id="incense4" type="checkbox" />
					<label for="incense4">꽃향</label>
					<input name="incense" id="incense5" type="checkbox" />
					<label for="incense5">꿀향</label>
					<input name="incense" id="incense6" type="checkbox" />
					<label for="incense6">누룩향</label>
					<input name="incense" id="incense7" type="checkbox" />
					<label for="incense7">알코향</label>
				</div>
			</fieldset>
		</form>
	</div>

</body>

</html>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>