<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/item_filtered.css?time=${currentTime}" />
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/best_items.css?time=${currentTime}" />

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
			<div class="keyword_area">
				<h4>찾는 조건</h4>
				<ul class="result_list">
					<li class="search_result">#전체종류</li>
					<li class="search_result">#서울</li>
					<li class="search_result">#경기도</li>
					<li class="search_result">#충청도</li>
					<li class="search_result">#제주도</li>
					<li class="search_result">#과일향</li>
					<li class="search_result">#알콜향</li>
					<li class="search_result">#꽃향</li>
					<li class="search_result">#꿀향</li>
					<li class="search_result">#누룩향</li>
				</ul>
			</div>
			<input type="text" name="title_search" id="title_search" placeholder="직접 입력해 주세요."/>
			<div class=clear></div>
			<button type="submit" class="search_btn">검색</button>
		</div>
		
		<div class="item_contents">
			<span class="title">내가 찾는 술</span>
			<ul class="item_list">
				<li class="item_info">
					<a href="#">
						<img class="item_img" src="../assets/img/best_items/best1.PNG" /> <br/>
						<span class="item_title">상품명abcdefghijklmnop</span>
						<span class="item_price">00,000 원</span> <br/>
                    	<div class="clean"></div>
						<span class="item_rating">★★★★☆</span> <br/>
						<ul class="item_tag_list">
							<li class="item_tag item_type_tag">#종류123456afsaff</li>
							<li class="item_tag item_area_tag">#지역ssdfaadffsdf</li>
							<li class="item_tag item_keyword_tag">#키워드thsghssfdfsf</li>
						</ul>
					</a>
				</li>
				<li class="item_info">
					<a href="#">
						<img class="item_img" src="../assets/img/best_items/best2.PNG"/> <br/>
                    	<span class="item_title">상품명</span>
						<span class="item_price">00,000 원</span> <br/>
						<div class="clean"></div>
						<span class="item_rating">★★★★☆</span> <br/>
						<ul class="item_tag_list">
							<li class="item_tag item_type_tag">#종류</li>
							<li class="item_tag item_area_tag">#지역</li>
							<li class="item_tag item_keyword_tag">#키워드</li>
						</ul>
					</a>
				</li>
				<li class="item_info">
					<a href="#">
						<img class="item_img" src="../assets/img/best_items/best3.PNG" /> <br/>
						<span class="item_title">상품명</span>
						<span class="item_price">000,000 원</span> <br/>
						<div class="clean"></div>
						<span class="item_rating">★★★★☆</span> <br/>
						<ul class="item_tag_list">
							<li class="item_tag item_type_tag">#종류</li>
							<li class="item_tag item_area_tag">#지역</li>
							<li class="item_tag item_keyword_tag">#키워드</li>
						</ul>
					</a>
				</li>
				<li class="item_info">
					<a href="#">
						<img class="item_img" src="../assets/img/best_items/best4.PNG" /> <br/>
						<span class="item_title">상품명</span>
						<span class="item_price">00,000 원</span> <br/>
						<div class="clean"></div>
						<span class="item_rating">★★★★☆</span> <br/>
						<ul class="item_tag_list">
							<li class="item_tag item_type_tag">#종류</li>
							<li class="item_tag item_area_tag">#지역</li>
							<li class="item_tag item_keyword_tag">#키워드</li>
						</ul>
					</a>
				</li>
				<li class="item_info">
					<a href="#">
						<img class="item_img" src="../assets/img/best_items/best1.PNG" /> <br/>
						<span class="item_title">상품명</span>
						<span class="item_price">00,000 원</span> <br/>
                    	<div class="clean"></div>
						<span class="item_rating">★★★★☆</span> <br/>
						<ul class="item_tag_list">
							<li class="item_tag item_type_tag">#종류</li>
							<li class="item_tag item_area_tag">#지역</li>
							<li class="item_tag item_keyword_tag">#키워드</li>
						</ul>
					</a>
				</li>
				<li class="item_info">
					<a href="#">
						<img class="item_img" src="../assets/img/best_items/best2.PNG"/> <br/>
                    	<span class="item_title">상품명</span>
						<span class="item_price">00,000 원</span> <br/>
						<div class="clean"></div>
						<span class="item_rating">★★★★☆</span> <br/>
						<ul class="item_tag_list">
							<li class="item_tag item_type_tag">#종류</li>
							<li class="item_tag item_area_tag">#지역</li>
							<li class="item_tag item_keyword_tag">#키워드</li>
						</ul>
					</a>
				</li>
				<li class="item_info">
					<a href="#">
						<img class="item_img" src="../assets/img/best_items/best3.PNG" /> <br/>
						<span class="item_title">상품명</span>
						<span class="item_price">000,000 원</span> <br/>
						<div class="clean"></div>
						<span class="item_rating">★★★★☆</span> <br/>
						<ul class="item_tag_list">
							<li class="item_tag item_type_tag">#종류</li>
							<li class="item_tag item_area_tag">#지역</li>
							<li class="item_tag item_keyword_tag">#키워드</li>
						</ul>
					</a>
				</li>
				<li class="item_info">
					<a href="#">
						<img class="item_img" src="../assets/img/best_items/best4.PNG" /> <br/>
						<span class="item_title">상품명</span>
						<span class="item_price">00,000 원</span> <br/>
						<div class="clean"></div>
						<span class="item_rating">★★★★☆</span> <br/>
						<ul class="item_tag_list">
							<li class="item_tag item_type_tag">#종류</li>
							<li class="item_tag item_area_tag">#지역</li>
							<li class="item_tag item_keyword_tag">#키워드</li>
						</ul>
					</a>
				</li>
				<li class="item_info">
					<a href="#">
						<img class="item_img" src="../assets/img/best_items/best1.PNG" /> <br/>
						<span class="item_title">상품명</span>
						<span class="item_price">00,000 원</span> <br/>
                    	<div class="clean"></div>
						<span class="item_rating">★★★★☆</span> <br/>
						<ul class="item_tag_list">
							<li class="item_tag item_type_tag">#종류</li>
							<li class="item_tag item_area_tag">#지역</li>
							<li class="item_tag item_keyword_tag">#키워드</li>
						</ul>
					</a>
				</li>
				<li class="item_info">
					<a href="#">
						<img class="item_img" src="../assets/img/best_items/best2.PNG"/> <br/>
                    	<span class="item_title">상품명</span>
						<span class="item_price">00,000 원</span> <br/>
						<div class="clean"></div>
						<span class="item_rating">★★★★☆</span> <br/>
						<ul class="item_tag_list">
							<li class="item_tag item_type_tag">#종류</li>
							<li class="item_tag item_area_tag">#지역</li>
							<li class="item_tag item_keyword_tag">#키워드</li>
						</ul>
					</a>
				</li>
				<li class="item_info">
					<a href="#">
						<img class="item_img" src="../assets/img/best_items/best3.PNG" /> <br/>
						<span class="item_title">상품명</span>
						<span class="item_price">000,000 원</span> <br/>
						<div class="clean"></div>
						<span class="item_rating">★★★★☆</span> <br/>
						<ul class="item_tag_list">
							<li class="item_tag item_type_tag">#종류</li>
							<li class="item_tag item_area_tag">#지역</li>
							<li class="item_tag item_keyword_tag">#키워드</li>
						</ul>
					</a>
				</li>
				<li class="item_info">
					<a href="#">
						<img class="item_img" src="../assets/img/best_items/best4.PNG" /> <br/>
						<span class="item_title">상품명</span>
						<span class="item_price">00,000 원</span> <br/>
						<div class="clean"></div>
						<span class="item_rating">★★★★☆</span> <br/>
						<ul class="item_tag_list">
							<li class="item_tag item_type_tag">#종류</li>
							<li class="item_tag item_area_tag">#지역</li>
							<li class="item_tag item_keyword_tag">#키워드</li>
						</ul>
					</a>
				</li>
				<li class="item_info">
					<a href="#">
						<img class="item_img" src="../assets/img/best_items/best1.PNG" /> <br/>
						<span class="item_title">상품명</span>
						<span class="item_price">00,000 원</span> <br/>
                    	<div class="clean"></div>
						<span class="item_rating">★★★★☆</span> <br/>
						<ul class="item_tag_list">
							<li class="item_tag item_type_tag">#종류</li>
							<li class="item_tag item_area_tag">#지역</li>
							<li class="item_tag item_keyword_tag">#키워드</li>
						</ul>
					</a>
				</li>
				<li class="item_info">
					<a href="#">
						<img class="item_img" src="../assets/img/best_items/best2.PNG"/> <br/>
                    	<span class="item_title">상품명</span>
						<span class="item_price">00,000 원</span> <br/>
						<div class="clean"></div>
						<span class="item_rating">★★★★☆</span> <br/>
						<ul class="item_tag_list">
							<li class="item_tag item_type_tag">#종류</li>
							<li class="item_tag item_area_tag">#지역</li>
							<li class="item_tag item_keyword_tag">#키워드</li>
						</ul>
					</a>
				</li>
				<li class="item_info">
					<a href="#">
						<img class="item_img" src="../assets/img/best_items/best3.PNG" /> <br/>
						<span class="item_title">상품명</span>
						<span class="item_price">000,000 원</span> <br/>
						<div class="clean"></div>
						<span class="item_rating">★★★★☆</span> <br/>
						<ul class="item_tag_list">
							<li class="item_tag item_type_tag">#종류</li>
							<li class="item_tag item_area_tag">#지역</li>
							<li class="item_tag item_keyword_tag">#키워드</li>
						</ul>
					</a>
				</li>
				<li class="item_info">
					<a href="#">
						<img class="item_img" src="../assets/img/best_items/best4.PNG" /> <br/>
						<span class="item_title">상품명</span>
						<span class="item_price">00,000 원</span> <br/>
						<div class="clean"></div>
						<span class="item_rating">★★★★☆</span> <br/>
						<ul class="item_tag_list">
							<li class="item_tag item_type_tag">#종류</li>
							<li class="item_tag item_area_tag">#지역</li>
							<li class="item_tag item_keyword_tag">#키워드</li>
						</ul>
					</a>
				</li>
			</ul>
			<div class="clean"></div>
		</div>
	</div>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>