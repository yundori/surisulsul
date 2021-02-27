/** 정규표현식 검사 */
$(function() {
	$("#csadd_form").submit(function(e) {
		
		/** 제목 입력 여부 검사 **/
		var cs_title = $("#cs_title").val();
        if (!cs_title) {
        	alert("제목을 입력하세요.");
            $("#cs_title").focus();
            return false;
        }
            
		/** 분류 입력 검사 **/
		var cs_section = $("#cs_section").val();
        if (cs_section == "0") {
        	alert("분류를 선택하세요.");
            $("#cs_section").focus();
            return false;
        }
        
		/** 글 내용 입력 검사 **/
		var cs_content = $("#cs_content").val();
        if (!cs_content) {
        	alert("내용을 입력하세요.");
            $("#cs_content").focus();
            return false;
        }
		
	});
});