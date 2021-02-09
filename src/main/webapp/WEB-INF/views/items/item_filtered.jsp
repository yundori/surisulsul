<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/item_filtered.css?time=${currentTime}" />
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/best_items.css?time=${currentTime}" />
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/bar_slider.css?time=${currentTime}">

	<div class="item_filtered">
		<form method="post" action="${pageContext.request.contextPath}/item_filtered.do" name="filtered_form" id="filtered_form">
			<div class="keyword_checkbox">
				<div class="check_boxes">
					<h2 class="checkbox_title">종류별</h2>
					<div class="checkbox_input">
						<input name="types" class="types" id="types1" type="checkbox" value="전체 종류" checked />
						<label for="types1">전체 선택</label>
					</div>
					
					<div class="checkbox_input">
						<input name="types" class="types" id="types2" type="checkbox" value="탁주" />
						<label for="types2">탁주</label>
					</div>
					
					<div class="checkbox_input">
						<input name="types" class="types" id="types3" type="checkbox" value="청주/약주" />
						<label for="types3">청주/약주</label>
					</div>
					
					<div class="checkbox_input">
						<input name="types" class="types" id="types4" type="checkbox" value="과실주" />
						<label for="types4">과실주</label>
					</div>
					
					<div class="checkbox_input">
						<input name="types" class="types" id="types5" type="checkbox" value="증류주" />
						<label for="types5">증류주</label>
					</div>
					
					<div class="checkbox_input">
						<input name="types" class="types" id="types6" type="checkbox" value="기타 주류" />
						<label for="types6">기타 주류</label>
					</div>
				</div>
			
				<div class="check_boxes">
					<h2 class="checkbox_title">지역별</h2>
					<div class="checkbox_input">
						<input name="area" class="area" id="area1" type="checkbox" value="전체 지역" checked />
						<label for="area1">전체 선택</label>
					</div>
					
					<div class="checkbox_input">
						<input name="area" class="area" id="area2" type="checkbox" value="서울" />
						<label for="area2">서울</label>
					</div>
					
					<div class="checkbox_input">
						<input name="area" class="area" id="area3" type="checkbox" value="경기도" />
						<label for="area3">경기도</label>
					</div>
					
					<div class="checkbox_input">
						<input name="area" class="area" id="area4" type="checkbox" value="강원도" />
						<label for="area4">강원도</label>
					</div>
					
					<div class="checkbox_input">
						<input name="area" class="area" id="area5" type="checkbox" value="충청도" />
						<label for="area5">충청도</label>
					</div>
					
					<div class="checkbox_input">
						<input name="area" class="area" id="area6" type="checkbox" value="전라도" />
						<label for="area6">전라도</label>
					</div>
					
					<div class="checkbox_input">
						<input name="area" class="area" id="area7" type="checkbox" value="경상도" />
						<label for="area7">경상도</label>
					</div>
					
					<div class="checkbox_input">
						<input name="area" class="area" id="area8" type="checkbox" value="제주도" />
						<label for="area8">제주도</label>
					</div>
				</div>
				
				<div class="check_boxes">
					<h2 class="checkbox_title">향</h2>
					<div class="checkbox_input">
						<input name="incense" class="incense" id="incense1" type="checkbox" value="전체 향" checked />
						<label for="incense1">전체 선택</label>
					</div>
					
					<div class="checkbox_input">
						<input name="incense" class="incense" id="incense2" type="checkbox" value="곡물향" />
						<label for="incense2">곡물향</label>
					</div>
					
					<div class="checkbox_input">
						<input name="incense" class="incense" id="incense3" type="checkbox" value="과일향" />
						<label for="incense3">과일향</label>
					</div>
					
					<div class="checkbox_input">
						<input name="incense" class="incense" id="incense4" type="checkbox" value="꽃향" />
						<label for="incense4">꽃향</label>
					</div>
					
					<div class="checkbox_input">
						<input name="incense" class="incense" id="incense5" type="checkbox" value="꿀향" />
						<label for="incense5">꿀향</label>
					</div>
					
					<div class="checkbox_input">
						<input name="incense" class="incense" id="incense6" type="checkbox" value="누룩향" />
						<label for="incense6">누룩향</label>
					</div>
					
					<div class="checkbox_input">
						<input name="incense" class="incense" id="incense7" type="checkbox" value="알콜향" />
						<label for="incense7">알콜향</label>
					</div>
				</div>
				<div class="sliders check_boxes">
					<h2 class="checkbox_title">맛과 깊이</h2>
					<%-- <div class="slider_info">전체 낮음 중간 높음</div> --%>
					<div class="slider">
						<span class="slider_title">당도</span>
						<div class="bar_slider">
							<select id="bar_slider_sugar" name="bar_slider" autocomplete="off">
                        		<option value="1">낮음</option>
                        		<option value="2">중간</option>
                        		<option value="3">높음</option>
                        		<option value="4" selected>전체</option>
                    		</select>
						</div>
					</div>
					
					<div class="slider">
						<span class="slider_title">산미</span>
						<div class="bar_slider">
							<select id="bar_slider_acidity" name="bar_slider" autocomplete="off">
                        		<option value="1">낮음</option>
                        		<option value="2">중간</option>
                        		<option value="3">높음</option>
                        		<option value="4" selected>전체</option>
                    		</select>
						</div>
					</div>
					
					<div class="slider">
						<span class="slider_title">도수</span>
						<div class="bar_slider">
							<select id="bar_slider_alcohol" name="bar_slider" autocomplete="off">
                        		<option value="1">낮음</option>
                        		<option value="2">중간</option>
                        		<option value="3">높음</option>
                        		<option value="4" selected>전체</option>
                    		</select>
						</div>
					</div>
				</div>
			</div>
		<!-- </form> -->
		
		<div class="search">
			<div class="keyword_area">
				<h4>검색 조건</h4>
				<ul class="result_list_type">
				</ul>
				<ul class="result_list_area">
				</ul>
				<ul class="result_list_incense">
				</ul>
			</div>
			<input type="text" name="title_search" id="title_search" placeholder="직접 입력해 주세요."/>
			<div class=clear></div>
			<button type="submit" class="search_btn">검색</button>
		</div>
		</form>
		
		<div class="item_contents">
			<span class="title">내가 찾는 술</span>
			<ul class="item_list">
				<c:choose>
				 	<%-- 조건에 부합하는 상품이 없는 경우 --%>
				 	<c:when test="${output == null || fn:length(output) == 0}">
				 		<div class="select_none">
							<img src="${contextPath}/assets/img/mark_alert.png" />
							<h1>검색 결과를 찾을 수 없습니다.</h1>
						</div>
					</c:when>
					
					<%-- 조건에 부합하는 상품이 없는 경우 --%>
					<c:otherwise>
						<%-- 조회 결과에 따른 반복처리 --%>
				 		<c:forEach var="item" items="${output}" varStatus="status">
							<li class="item_info">
								<a href="${pageContext.request.contextPath}/item_details.do">
									<img class="item_img" src="${contextPath}/assets/img/items/${item.img}" /> <br/>
									<span class="item_title">${item.name}</span>
									<span class="item_price"><fmt:formatNumber value="${item.price}" pattern="#,###"/>원</span> <br/>
		                    		<div class="clean"></div>
									<span class="item_rating">
										<c:set var="stars" value="${item.star}" />
										<c:choose>
										<c:when test="${stars != 0}">
											<c:forEach var="i" begin="1" end="${stars}">★</c:forEach>
											<c:if test="${stars} < 5">
												<c:forEach var="j" begin="${stars}" end="5">☆</c:forEach>
											</c:if>
										</c:when>
										<c:otherwise>☆☆☆☆☆</c:otherwise>
										</c:choose>
									</span> <br/>
									<ul class="item_tag_list">
										<li class="item_tag item_type_tag">${item.type}</li>
										<li class="item_tag item_area_tag">${item.loc}</li>
										<li class="item_tag item_keyword_tag">${item.key1}</li>
									</ul>
								</a>
							</li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</ul>
			
			<div class="clean"></div>
		</div>
		<!-- 페이지네이션 구현 부분 -->
	</div>

<script src="${contextPath}/assets/js/item_filtered.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${contextPath}/assets/js/jquery.barrating.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $(function() {
        function ratingEnable() {
            $('#bar_slider_sugar').barrating({
                theme: 'bars-pill',
                showValues: true,
                showSelectedRating: false,
                hoverState: true
            });
        }
        ratingEnable();
    });
    
    $(function() {
        function ratingEnable() {
            $('#bar_slider_acidity').barrating({
                theme: 'bars-pill',
                showValues: true,
                showSelectedRating: false,
                hoverState: true
            });
        }
        ratingEnable();
    });
    
    $(function() {
        function ratingEnable() {
            $('#bar_slider_alcohol').barrating({
                theme: 'bars-pill',
                showValues: true,
                showSelectedRating: false,
                hoverState: true
            });
        }
        ratingEnable();
    });
</script>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>