<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


    <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/cscenter.css?time=${currentTime}" />
    <div class="collapse">
        <div class='collapse-item'>
            <div class="collapse-title clearfix">
                <span class="article-number">4</span>
                <a href="#content1">배송 전 상품 변경 및 취소 안내</a>
                <span class="reg-date">2020-01-06</span>
            </div>
            <div id="content1" class="content">제목4에 해당하는 내용입니다.</div>
        </div>
        <div class='collapse-item'>
            <div class="collapse-title clearfix">
                <span class="article-number">3</span>
                <a href="#content2">'인기 많은 술' 5% 할인 판매 안내</a>
                <span class="reg-date">2020-01-06</span>
            </div>
            <div id="content2" class="content">제목3에 해당하는 내용입니다.</div>
        </div>
        <div class='collapse-item'>
            <div class="collapse-title clearfix">
                <span class="article-number">2</span>
                <a href="#content3">반품 시 필독</a>
                <span class="reg-date">2020-01-06</span>
            </div>
            <div id="content3" class="content">제목2에 해당하는 내용입니다.</div>
        </div>
        <div class='collapse-item'>
            <div class="collapse-title clearfix">
                <span class="article-number">1</span>
                <a href="#content4">우체국 택배 일부 지역 배송 지연</a>
                <span class="reg-date">2020-01-06</span>
            </div>
            <div id="content4" class="content">제목1에 해당하는 내용입니다.</div>
        </div>
    </div>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
    $(function() {
        $(".collapse-title a").click(function(e) {
            e.preventDefault();

            var target = $(this).attr('href');
            $(target).slideToggle(100);
            $(".content").not($(target)).slideUp(100);
        });
    });
    </script>

