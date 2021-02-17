<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


    <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/cscenter.css?time=${currentTime}" />
    <div class="collapse">
    	<c:choose>
    		<%-- 조회 결과가 없는 경우 --%>
			<c:when test="${output==null||fn:length(output)==0}">
				<hr />
				<div class="review_none">
					<table>
						<tr>
							<td><h1>작성된 공지사항이 없습니다.</h1></td>
						</tr>
					</table>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="item" items="${output}" varStatus="status">
					<div class='collapse-item'>
	            		<div class="collapse-title clearfix">
	                		<span class="article-number">${status.index+1}</span>
                			<a href="#content${status.index}">${item.title}</a>
                			<span class="reg-date">${item.reg_date}</span>
            			</div>
            			<div id="content${status.index}" class="content">${item.content}</div>
       				</div>
				</c:forEach>
			</c:otherwise>
    	</c:choose>
       
        <!-- 게시글이 많다면 페이지네이션 -->
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

