<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/item_filtered.css?time=${currentTime}" />

	<div class="item_filtered">
		<form>
			<div class="keyword_checkbox">
				<div class="check_boxes">
					<h2 class="checkbox_title">종류별</h2>
					<div class="checkbox_input">
						<input name="types" id="types1" type="checkbox" />
						<label for="types1">전체 선택</label>
					</div>
					
					<div class="checkbox_input">
						<input name="types" id="types2" type="checkbox" />
						<label for="types2">탁주</label>
					</div>
					
					<div class="checkbox_input">
						<input name="types" id="types3" type="checkbox" />
						<label for="types3">청주/약주</label>
					</div>
					
					<div class="checkbox_input">
						<input name="types" id="types4" type="checkbox" />
						<label for="types4">과실주</label>
					</div>
					
					<div class="checkbox_input">
						<input name="types" id="types5" type="checkbox" />
						<label for="types5">증류주</label>
					</div>
					
					<div class="checkbox_input">
						<input name="types" id="types6" type="checkbox" />
						<label for="types6">기타 주류</label>
					</div>
				</div>
				<!--  
			</div>
			
			<div class="keyword_checkbox"> -->
				<div class="check_boxes">
					<h2 class="checkbox_title">지역별</h2>
					<div class="checkbox_input">
						<input name="area" id="area1" type="checkbox" />
						<label for="area1">전체 선택</label>
					</div>
					
					<div class="checkbox_input">
						<input name="area" id="area2" type="checkbox" />
						<label for="area2">서울</label>
					</div>
					
					<div class="checkbox_input">
						<input name="area" id="area3" type="checkbox" />
						<label for="area3">경기도</label>
					</div>
					
					<div class="checkbox_input">
						<input name="area" id="area4" type="checkbox" />
						<label for="area4">강원도</label>
					</div>
					
					<div class="checkbox_input">
						<input name="area" id="area5" type="checkbox" />
						<label for="area5">충청도</label>
					</div>
					
					<div class="checkbox_input">
						<input name="area" id="area6" type="checkbox" />
						<label for="area6">전라도</label>
					</div>
					
					<div class="checkbox_input">
						<input name="area" id="area7" type="checkbox" />
						<label for="area7">경상도</label>
					</div>
					
					<div class="checkbox_input">
						<input name="area" id="area8" type="checkbox" />
						<label for="area8">제주도</label>
					</div>
				</div>
				<!--  
			</div>
			
			<div class="keyword_checkbox"> -->
				<div class="check_boxes">
					<h2 class="checkbox_title">향</h2>
					<div class="checkbox_input">
						<input name="incense" id="incense1" type="checkbox" />
						<label for="incense1">전체 선택</label>
					</div>
					
					<div class="checkbox_input">
						<input name="incense" id="incense2" type="checkbox" />
						<label for="incense2">곡물향</label>
					</div>
					
					<div class="checkbox_input">
						<input name="incense" id="incense3" type="checkbox" />
						<label for="incense3">과일향</label>
					</div>
					
					<div class="checkbox_input">
						<input name="incense" id="incense4" type="checkbox" />
						<label for="incense4">꽃향</label>
					</div>
					
					<div class="checkbox_input">
						<input name="incense" id="incense5" type="checkbox" />
						<label for="incense5">꿀향</label>
					</div>
					
					<div class="checkbox_input">
						<input name="incense" id="incense6" type="checkbox" />
						<label for="incense6">누룩향</label>
					</div>
					
					<div class="checkbox_input">
						<input name="incense" id="incense7" type="checkbox" />
						<label for="incense7">알코향</label>
					</div>
				</div>
				<div class="sliders check_boxes">
					<h2 class="checkbox_title">맛과 깊이</h2>
					<div class="slider">
						<div class="slider_title">당도</div>
					</div>
					<div class="slider">
						<div class="slider_title">산미</div>
					</div>
					<div class="slider">
						<div class="slider_title">도수</div>
					</div>
				</div>
			</div>
		</form>
		
		<div class="search">
			<h3>찾는 조건</h3>
			<div class="keyword_area">
				<ul>
					<li></li>
				</ul>
			</div>
			<div class="title_search_area">
				<input type="text" name="title_search" id="title_search"  maxlength="20" placeholder="직접 입력해 주세요."/>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>