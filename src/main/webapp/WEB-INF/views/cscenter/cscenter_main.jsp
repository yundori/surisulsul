<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

    <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/cscenter.css?time=${currentTime}" />

    <!-- 버튼 클릭 시 페이지가 이동하는 게 아니라 include 하고 있는 두 페이지 중 hide 되는 것과 show 되는 것이바뀜 -->
    <div class="tab">
        <ul class="tab-button">
            <li class="tab-button-item fix-center">
                <a class="tab-button-item-link selected" href="#tab-page-1">알립니다</a>
            </li>
            <li class="tab-button-item fix-center">
                <a class="tab-button-item-link" href="#tab-page-2">자주 묻는 질문</a>
            </li>
        </ul>
        <div class="tab-panel">
            <div id="tab-page-1">
                <%@ include file="../cscenter/cscenter_notice.jsp"%>
            </div>
            <div id="tab-page-2" class="hide">
                <%@ include file="../cscenter/cscenter_faq.jsp"%>
            </div>
        </div>
    </div>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
    $(function() {
        $(".tab-button-item-link").click(function(e) {
            e.preventDefault();
            $(".tab-button-item-link").not(this).removeClass("selected");
            $(this).addClass("selected");
            var target = $(this).attr('href');
            $(target).removeClass('hide');
            $(".tab-panel>div").not($(target)).addClass('hide');
        });
    });
    </script>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>