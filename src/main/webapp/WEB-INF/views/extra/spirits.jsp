<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/drinks.css" />

	<div id="drinks_img">
		<img src="../assets/img/drinks/soju.jpg" class="drinks_img_detail"/> 
		<span id="drinks_name">
			<h1>한국의 다양한 증류주들</h1>
			<h3>전통 방식으로 증류한 증류식 소주를 소개합니다.</h3> 
			<input type="button" value="증류주 종류별 보기 > " id="go_spirits" class="go_drink_button" action="${pageContext.request.contextPath}/items/item_filtered.do" />
		</span>
	</div>
	<div id="drinks_content">
		<h2>
			한국의 증류주를 대표하는 소주는 크게 두 분류로 나뉜다. 
		</h2>
		
		<div>
			전통방식의 증류식 소주와 주정을 원료로 한 희석식소주로 나뉜다.  <br /> 
			안동소주와 문배주가 전통방식의 증류식 소주고, 진로로 대표되는 소주가 희석식 소주다. <br />  
			한국의 희석식 소주는 품질과 가격 경쟁력을 갖추고 있어 외화 획득에도 기여하고 있다. <br /> 
			그래서 외국사람들은 한국을 대표하는 술로 소주를 꼽기도 한다.  <br /> 
		</div>
		<br/>
		<div>
			다만 희석식 소주는 값싼 원료를 쓰기 때문에 대중주로서 명성은 있어도, 명품이 되기에는 한계가 있다.<br/>  
			명품 증류주는 전통 증류주에서 찾아야 한다.<br/>
		</div>
		
	</div>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>