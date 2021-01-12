<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>우리술종류 > 탁주</title>
     <!-- 크로스 브라우징 호환성 시작 -->
    <link rel="stylesheet" type="text/css" href="css/reset.css" />
    <!-- 크로스 브라우징 호환성 끝 -->
    <link rel="apple-touch-icon" href="img/icon.png" />
    <!-- CSS 파일 참조 처리 -->
    <link rel="stylesheet" type="text/css" href="../assets/css/common.css" />
    <link rel="stylesheet" type="text/css" href="../assets/css/drinks.css" />
</head>

<body>
	<div id="drinks_content">
	    <img src="../assets/img/takju.jpg"/>
	    <span id="drinks_name">
		    <h1>한국의 다양한 막걸리들</h1>
		    <h3>쌀이나 각종 곡류와 누룩으로 빚어 말 그대로</h3>
		    <h3>막 걸러내었다 하여 붙여진 이름이 막걸리다.</h3>
	    </span>
	    <input type="button" value="막걸리 종류별 보기 > "/>
    </div>
</body>

</html>
<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>