$( document ).ready( function() {

		//체크박스 모두 선택 처리
        $( '.check_all' ).click( function() {
			 var chk = $(".check_all").prop("checked");
			 if(chk) {
			  $(".ab").prop("checked", true);
			 } else {
			  $(".ab").prop("checked", false);
			 }
			 
			 var basketItem = $('input:checkbox[name=basketItem]').length;
	    	var selectedBasketItem = $('input:checkbox[name=basketItem]:checked').length;
	    	
	    	if(basketItem != selectedBasketItem) {
	    		console.log('basketItem!=selectedBasketItem');
		     	$('#go_order').bind('click', false);
        		$('#go_order_comment').removeClass("hidden");
		     	
		    }else{
		    	console.log('basketItem==selectedBasketItem');
		    	$('#go_order').unbind('click', false);
        		$('#go_order_comment').addClass("hidden");
		    }
        } );
        
        // 체크박스 개별적으로 선택 시 모두 체크인지 확인해서 .check_all에도 자동 선택처리 되도록
        $( '.ab' ).click( function() {
  			
  			var basketItem = $('input:checkbox[name=basketItem]').length;
	    	var selectedBasketItem = $('input:checkbox[name=basketItem]:checked').length;
	    	
	    	if(basketItem != selectedBasketItem) {
	    		console.log('basketItem!=selectedBasketItem');
		     	$('#go_order').bind('click', false);
        		$('#go_order_comment').removeClass("hidden");
  				$(".check_all").prop("checked", false);
		     	
		    }else{
		    	console.log('basketItem==selectedBasketItem');
		    	$('#go_order').unbind('click', false);
        		$('#go_order_comment').addClass("hidden");
			  	$(".check_all").prop("checked", true);
		    }	    
        } );
        
		
		// 주문자/수령인 정보 동일 출력 처리        
        $( '#same' ).click( function() {
        	
        	if($("#same").is(":checked") == true) {
        		//체크박스 체크되어있을 경우
	        	var name = $('#user_name').html();
	        	var phone = $('#tel').html();
	        	var postcode = $('#hiddenPostcode').val();
	        	var address1 = $('#hiddenAddress1').val();
	        	var address2 = $('#hiddenAddress2').val();
	        	
	        	// 주소도 가져와서 출력할 수 있으면 좋을 것 같습니다
	        	$('#receiver_name').val(name);
	        	$("#receiver_name").attr("readonly",true);
	        	$('#receiver_tel').val(phone);
	        	$("#receiver_tel").attr("readonly",true);
	        	
	        	$('#postcode').val(postcode);
	        	$('#address').val(address1);
	        	$('#detailAddress').val(address2);
	        	$("#detailAddress").attr("readonly",true);
	        	
        	}else{
        		//체크박스 해제했을 경우
        		$('#receiver_name').val('');
	        	$("#receiver_name").attr("readonly",false);
	        	$('#receiver_tel').val('');
	        	$("#receiver_tel").attr("readonly",false);
	        	
	        	$('#postcode').val('');
	        	$('#address').val('');
	        	$('#detailAddress').val('');
	        	$("#detailAddress").attr("readonly",false);
        	}
        	
        } );
        
        
        // 결제방법에 따른 HTML 출력결과 분리
        $( '.payment_info' ).click( function() {
        	var payment = $(this).val();
        	
        	if(payment=="pay_money"){
        		$('#pay_details_money').removeClass("hidden");
        		$('#pay_details_card').addClass("hidden");
        	}else{
        		$('#pay_details_money').addClass("hidden");
        		$('#pay_details_card').removeClass("hidden");
        	}
        } );
        
        //submit 버튼 선택 시 JS단에서 먼저 유효성 검사
        /** 플러그인의 기본 설정 옵션 추가 */
	    jQuery.validator.setDefaults({
	        onkeyup: false, // 키보드입력시 검사 안함
	        onclick: false, // <input>태그 클릭시 검사 안함
	        onfocusout: false, // 포커스가 빠져나올 때 검사 안함
	        showErrors: function(errorMap, errorList) { // 에러 발생시 호출되는 함수 재정의
	            // 에러가 있을 때만..
	            if (this.numberOfInvalids()) {
	                // 0번째 에러 메시지에 대한 javascript 기본 alert 함수 사용
	                //alert(errorList[0].message);
	                // 0번째 에러 발생 항목에 포커스 지정
	                //$(errorList[0].element).focus();
	
	                swal({
	                    title: "에러",
	                    text: errorList[0].message,
	                    type: "error"
	                }).then(function(result) {
	                    // 창이 닫히는 애니메이션의 시간이 있으므로,
	                    // 0.1초의 딜레이 적용 후 포커스 이동
	                    setTimeout(function() {
	                        $(errorList[0].element).val('');
	                        $(errorList[0].element).focus();
	                    }, 100);
	                });
	            }
	        }
	    });
	
	    /** 유효성 검사 추가 함수 */
	    $.validator.addMethod("kor", function(value, element) {
	        return this.optional(element) || /^[ㄱ-ㅎ가-힣]*$/i.test(value);
	    });
	
	    $.validator.addMethod("phone", function(value, element) {
	        return this.optional(element) ||
	            /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/i.test(value) ||
	            /^\d{2,3}\d{3,4}\d{4}$/i.test(value);
	    });
	
	    /** order_form태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */
	    $("#order_form").validate({
	        /** 입력검사 규칙 */
	        rules: {
	            // [수령자 - 이름] 필수
	            receiver_name: { required: true, kor: true },
	            // [수령자 - 연락처] 필수
	            receiver_tel: { required: true, phone: true },
	            // [수령자 - 주소] 필수
	            postcode: { required: true },   
	            // [개인정보 수집/제공 동의] 필수, 최소 무조건 3개 다 동의
               	terms: { required: true, minlength: 3 }     
	        },
	        /** 규칙이 맞지 않을 경우의 메시지 */
	        messages: {
	            receiver_name: {
	                required: "수령인 이름을 입력하세요.",
	                kor: "이름은 한글만 입력 가능합니다."
	            },
	            receiver_tel: {
	                required: "수령인 연락처를 입력하세요.",
	                phone: "연락처 형식이 잘못되었습니다."
	            },
	            postcode: {
	                required: "우편번호와 주소를 입력하세요."
	            },
	            terms: {
                    required: "개인정보 수집/제공 약관에 동의해주세요.",
                    minlength: "개인정보 수집/제공 약관에 모두 동의해주세요."
                }
	        }
	    }); // end validate()
	    
	    
} );
