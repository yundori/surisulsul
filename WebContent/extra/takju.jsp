<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>탁주</title>
     <!-- 크로스 브라우징 호환성 시작 -->
    <link rel="stylesheet" type="text/css" href="css/reset.css" />
    <!-- 크로스 브라우징 호환성 끝 -->
    <link rel="apple-touch-icon" href="img/icon.png" />
    <!-- CSS 파일 참조 처리 -->
    <link rel="stylesheet" type="text/css" href="../assets/css/common.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/drinks.css" />
</head>

<body>
	<div id="drinks_img">
	    <img src="../assets/img/takju.jpg"/>
	    <span id="drinks_name">
		    <h1>한국의 다양한 막걸리들</h1>
		    <h3>쌀이나 각종 곡류와 누룩으로 빚어 말 그대로<br/>막 걸러내었다 하여 붙여진 이름이 막걸리다.</h3>
	    	<input type="button" value="막걸리 종류별 보기 > " id="go_takju" class="go_drink_button"/>
	    </span>
    </div>
    <div id="drinks_content">
    	<h2>탁주는 가장 대중적이면서,
    	<br/>가장 앞선 시대에 등장한 우리 술로 여겨진다.</h2>
    	<div>
    	막걸리는 체에 막 걸렀다해서 생긴 이름이다. 막이라는 뜻을 신선하다 또는 거칠다라는 뜻으로 받아들일 수 있는데, 이즈음엔 신선하다는 뜻이 더 강조되고 있다. 막걸리의 법적 명칭인 탁주는 술빛이 흐리기 때문에 붙여진 이름이다. 주세법상에 탁주는 “전분질 원료와 국을 주원료로 하여 발효시킨 술덧을 혼탁하게 제성한 것”을 말한다. 탁주와 청주(약주)를 구분하는 경계는, 탁주는 술덧을 여과하지 않고 혼탁하게 하여 거른 것이고, 청주(약주)는 여과하여 맑게 거른 것이다.
    	</div>
    	<br/>
    	<div>
    	탁주의 주요한 원료는 멥쌀과 밀누룩과 물이다. 멥쌀 고두밥을 찐 뒤에, 이를 식혀서 물과 함께 빻은 누룩을 비벼 항아리에 담는다. 항아리를 25도 전후의 따뜻한 곳에 놓아두면 술이 발효되기 시작하여 빠르게는 4-5일 만에, 더디게는 7-8일 만에 완성된다. 발효가 다 끝난 상태에서 술항아리 윗부분의 맑은 술을 떠내면 청주가 되는데, 탁주는 청주를 떠내고 난 뒤에 가라앉아 있는 술지게미에 물을 부어 하루쯤 재웠다가 체에 걸러 마시는 형태를 이른다. 하지만 청주를 떠내지 않고 처음부터 술지게미까지 휘휘 저어서, 체에 걸러 탁주를 내리는 경우도 있다 .
    	</div>
    </div>
</body>

</html>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>