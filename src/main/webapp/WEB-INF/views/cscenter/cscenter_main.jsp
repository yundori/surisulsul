<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

 <link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/common.css" />
<link rel="stylesheet" type="text/css" href="${contextPath}/assets/css/cscenter.css" />

    <!-- 버튼 클릭 시 페이지가 이동하는 게 아니라 include 하고 있는 두 페이지 중 hide 되는 것과 show 되는 것이바뀜 -->
    <div class="tab">
        <ul class="tab-button">
            <li class="tab-button-item fix-center">
                <a data-tab="notice" class="tab-button-item-link selected" id="notice" href="#">알립니다</a>
            </li>
            <li class="tab-button-item fix-center">
                <a data-tab="faq" class="tab-button-item-link" id="faq" href="#">자주 묻는 질문</a>
            </li>
        </ul>
        <div class="tab-panel">
           <%--<div id="tab-page-1">
                <%@ include file="/WEB-INF/views/cscenter/cscenter_notice.jsp"%>
            </div>
            <div id="tab-page-2" class="hide">
                <%@ include file="/WEB-INF/views/cscenter/cscenter_faq.jsp"%>
            </div> --%> 
        </div>
    </div>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
    
    function loadTab(activeTab) {
        console.log( '>>>>>>>>>>>>>>1' );
                
		$.ajax({
			type: 'GET',
			url: activeTab + ".do",
			dataType: "html",
			error: function() {
				alert('통신실패');
				console.log(">>에러" + error.status);
			},
			success: function(data) {
				console.log(">>성공>>");
				console.log(activeTab);
				var activeTabId = '#'+activeTab;
				//탭 클릭시 이미지 변경
				$(activeTabId).addClass("selected");
				$(".tab-button-item-link").not(activeTabId).removeClass("selected");
				$('.tab-panel').html(data);
			}
		});

    }
  
    
    $(".tab-button-item-link").click(function(e) {
    	//탭 클릭시 이미지 변경
    	$(".tab-button-item-link").not(this).removeClass("selected");
    	$(this).addClass("selected");
    	
    	e.preventDefault();
    	
    	var activeTab = $(this).attr('data-tab');
		console.log(activeTab);
		
    	loadTab(activeTab);
    });
    
    $(function() {
    	console.log('>>>>>>>>>>>>>>2');
    	var tab = window.location.hash;
    	console.log(tab);
    	console.log(tab.substring(1) );
    	
    	loadTab(tab.substring(1));
    });

    $( window ).on( 'hashchange', function( e ) {
        console.log( '>>>>>>>>>>>>>>3' );
        var tab = window.location.hash;
    	console.log(tab);
    	if (!tab) {
    		tab = "notice";
    	}
    	console.log(tab.substring(1) );

    	loadTab(tab.substring(1));
    } );
    
    
        
    </script>

<%@ include file="/WEB-INF/views/_inc/footer.jsp"%>