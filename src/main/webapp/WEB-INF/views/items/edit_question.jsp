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
</head>
<body>
<div class="pop-up">
        <div class="pop-up-title">
            문의 작성하기
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
            <form id="editForm" action="${pageContext.request.contextPath}/question">
            <input type="hidden" name="id" value="${output.id}" />
                <div class="form-group">
                    <label class="label text-center">문의 분류 선택</label><br />
                    <select id="category" class="category" name="type">
                        <option value="0" <c:if test="${output.type==0}">selected</c:if>>--------</option>
                        <option value="1" <c:if test="${output.type==1}">selected</c:if>>상품 문의</option>
                        <option value="2" <c:if test="${output.type==2}">selected</c:if>>배송 문의</option>
                        <option value="3" <c:if test="${output.type==3}">selected</c:if>>대량 구매</option>
                        <option value="4" <c:if test="${output.type==4}">selected</c:if>>기타 문의</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="label text-center">문의 내용 작성하기</label><br />
                    <textarea class="write-content" placeholder="내용을 입력해 주세요." name="content" value="${output.content}"></textarea>
                    <span class="input-limit">0/1,000</span>
                </div>
                <div><button type="submit">작성하기</button>
                </div>
            </form>
        </div>
    </div>
    
    <!--Google CDN 서버로부터 jQuery 참조 -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- jQuery Ajax Form plugin CDN -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
    <!-- jQuery Ajax Setup -->
    <script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
    $(function() {
        // #addForm에 대한 submit이벤트를 가로채서 Ajax요청을 전송한다.
        $("#editForm").ajaxForm({
            // 전송 메서드 지정
            method: "PUT",
            // 서버에서 200 응답을 전달한 경우 실행됨
            success: function(json) {
                console.log(json);
                
            	// 수정이 완료되면 창닫기
                if (json.rt == "OK") {
                	alert("문의 수정이 완료되었습니다.");
                    window.close();
                }
            }
        });
    });
    $('.write-content').keyup(function(e) {
        var content = $(this).val();
        $('.input-limit').html(content.length + "/1,000"); //글자수 실시간 카운팅

        if (content.length > 1000) {
            alert("최대 1,000자까지 입력 가능합니다.");
            $(this).val(content.substring(0, 1000));
            $('.input-limit').html("1,000/1,000");
        }
    });
    </script>
    </body>