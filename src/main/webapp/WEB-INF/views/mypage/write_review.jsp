<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- JSTL로 변수 생성 --%>
<%-- 1) 캐시를 방지하기 위해 자주 수정되는 css,js 파일에 설정하는 용도 --%>
<c:set var="currentTime" value="<%=System.currentTimeMillis()%>" />
<%-- 2) 프로젝트이름 기반의 절대경로값 --%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!doctype html>
<html>

<head>
<meta charset="UTF-8" />
<title>surisulsul</title>
<!-- 크로스 브라우징 호환성 시작 -->
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/reset.css" />
<!-- 크로스 브라우징 호환성 끝 -->
<!-- CSS 파일 참조 처리 -->
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/common.css?time=${currentTime}" />
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/popup.css?time=${currentTime}" />
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
</head>
<body>
 <div class="pop-up">
        <div class="pop-up-title">
            후기 작성하기
        </div>
        <div class="pop-up-content">
            <div class="selected-item">
                <div class="item-photo wrapper">
                    <div class="thumbnail">
                        <div class="thumbnail-centered">
                            <img class="thumbnail-photo" src="../assets/img/example.jpg" />
                        </div>
                    </div>
                </div>
                <div class="item-name">경성과하주</div>
                <div class="item-price">28,000원</div>
            </div>
            <form>
                <div class="form-group stars stars-example-fontawesome" method="post" action="${pageContext.request.contextPath}/account/write_review_ok.do">
                    <label class="label text-center">상품은 만족하셨나요?</label><br />
                    <select id="example-fontawesome" name="rating" autocomplete="off">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="label text-center">어떤 점이 좋았나요?</label><br />
                    <textarea class="write-content" placeholder="내용을 입력해 주세요."></textarea>
                    <span class="input-limit">0/1,000</span>
                </div>
                <div class="form-group">
                    <label class="label text-center file-attach-button" for="photo">사진 첨부하기</label><br />
                    <input type="file" name="photo" id="photo" class="file-attach" /><br />
                    <span class="notice">상품과 무관한 사진 첨부 시 통보 없이 삭제될 수 있습니다.</span>
                </div>
                <div>
                    <button type="submit">작성하기</button>
                </div>
            </form>
        </div>
    </div>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="${contextPath}/assets/js/jquery.barrating.min.js?time=${currentTime}" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
    $('.write-content').keyup(function(e) {
        var content = $(this).val();
        $('.input-limit').html(content.length + "/1,000"); //글자수 실시간 카운팅

        if (content.length > 1000) {
            alert("최대 1,000자까지 입력 가능합니다.");
            $(this).val(content.substring(0, 1000));
            $('.input-limit').html("1,000/1,000");
        }
    });
    $(function() {
        function ratingEnable() {
            $('#example-fontawesome').barrating({
                theme: 'fontawesome-stars',
                showSelectedRating: false
            });
        }
        ratingEnable();
    });
    </script>
  </body>