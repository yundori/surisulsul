$( document ).ready( function() {

		//체크박스 모두 선택 처리
        $( '.check_all' ).click( function() {
          $( '.ab' ).prop( 'checked', this.checked );
		  $( '.check_all' ).prop( 'checked', this.checked );
        } );
        
        // 체크박스 개별적으로 선택 시 모두 체크인지 확인해서 .check_all에도 자동 선택처리 되도록
        $( '.ab' ).click( function() {
        	if($("#item1").is(":checked") && $("#item2").is(":checked")){
		  		$( '.check_all' ).prop( 'checked', this.checked );
        	}
        } );
        
		
		// 주문자/수령인 정보 동일 출력 처리        
        $( '#same' ).click( function() {
        	
        	if($("#same").is(":checked") == true) {
        		//체크박스 체크되어있을 경우
	        	var name = $('#user_name').html();
	        	var phone = $('#tel').html();
	        	
	        	// 주소도 가져와서 출력할 수 있으면 좋을 것 같습니다
	        	$('#receiver_name').val(name);
	        	$("#receiver_name").attr("readonly",true);
	        	$('#receiver_tel').val(phone);
	        	$("#receiver_tel").attr("readonly",true);
        	}else{
        		//체크박스 해제했을 경우
        		$('#receiver_name').val('');
	        	$("#receiver_name").attr("readonly",false);
	        	$('#receiver_tel').val('');
	        	$("#receiver_tel").attr("readonly",false);
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
} );


function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}

