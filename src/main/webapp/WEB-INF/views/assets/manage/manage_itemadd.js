/** 정규표현식 검사 */
$(function() {
	$("#itemadd_form").submit(function(e) {
		
		/** 상품명 입력 여부 검사 **/
		var check_name = $("#item_name").val();
        if (!check_name) {
        	alert("상품명을 입력하세요.");
            $("#item_name").focus();
            return false;
        }
            
		/** 상품가격 입력 여부 검사 **/
		var check_price = $("#item_price").val();
        if (!check_price) {
        	alert("상품가격을 입력하세요.");
            $("#item_price").focus();
            return false;
        }
        
		/** 상품 이미지파일명 입력 여부 검사 **/
		var check_img = $("#item_img").val();
        if (!check_img) {
        	alert("상품이미지 파일명을 입력하세요.");
            $("#item_img").focus();
            return false;
        }
		
		/** 종류별 선택 유무 검사 **/
        var check_type = $("input[name='item_type']:checked").val();
        if (!check_type) {
            alert("종류를 선택해주세요.");
            return false;
        }
        
        /** 지역별 선택 유무 검사 **/
        var check_loc = $("input[name='item_loc']:checked").val();
        if (!check_loc) {
            alert("지역을 선택해주세요.");
            return false;
        }
        
        /** 항별 선택 유무 검사(2개 선택) **/
        var check_incense = $("input[name='item_incense']:checked");
      	//배열의 길이가 0이라면 선택된 항목이 없다는 의미이므로 중단
        if (check_incense.length == 0) {
            alert("향을 선택해주세요.");
            return false;
        }
      	//향은 2개만 선택할 수 있도로 지정
        if (check_incense.length != 2) {
            alert("향을 2개 선택하세요.");
            return false;
        }
      	
        /** 당도 입력 여부 검사 **/
        var check_sweet = $("#item_sweet").val();
        if (check_sweet == 0) {
        	alert("당도를 입력하세요.");
            $("#item_sweet").focus();
            return false;
        }
        
        /** 산미 입력 여부 검사 **/
        var check_sour = $("#item_sour").val();
        if (check_sour == 0) {
        	alert("산미를 입력하세요.");
            $("#item_sour").focus();
            return false;
        }
        
        /** 도수 입력 여부 검사 **/
        var check_degree = $("#item_degree").val();
        if (!check_degree) {
        	alert("도수를 입력하세요.");
            $("#item_degree").focus();
            return false;
        }
        
        /** 상품용량 입력 여부 검사 **/
        var check_size = $("#item_size").val();
        if (!check_size) {
        	alert("상품용량(크기)을 입력하세요.");
            $("#item_size").focus();
            return false;
        }
        
        /** 원재료 입력 여부 검사 **/
        var check_igd = $("#item_igd").val();
        if (!check_igd) {
        	alert("원재료를 입력하세요.");
            $("#item_igd").focus();
            return false;
        }
        
        /** 음식 입력 여부 검사 **/
        var check_food = $("#item_food").val();
        if (!check_food) {
        	alert("음식을 입력하세요.");
            $("#item_food").focus();
            return false;
        }
        
        /** 간단설명 입력 여부 검사 **/
        var check_des1 = $("#item_des1").val();
        if (!check_des1) {
        	alert("간단설명을 입력하세요.");
            $("#item_des1").focus();
            return false;
        }
        
        /** 상세설명 입력 여부 검사 **/
        var check_des2 = $("#item_des2").val();
        if (!check_des2) {
        	alert("상세설명을 입력하세요.");
            $("#item_des2").focus();
            return false;
        }
      	
        /** 주능결과 선택 유무 검사 **/
        var check_jnresult = $("input[name='item_jnresult']:checked").val();
        if (!check_jnresult) {
            alert("주능결과를 선택해주세요.");
            return false;
        }
	});
});