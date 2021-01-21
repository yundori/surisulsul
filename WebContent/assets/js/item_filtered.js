$( document ).ready( function() {
	
	//html 변수 = 각 키워드 출력을 위한 html li태그 내용이 들어갈 문자열 변수
	var html='';
		
	//기본 모두 선택 처리 (화면 구현 직후)
	if($("#types1").is(":checked")){
  		$( '.types' ).attr("checked", true);
		html='<li class="search_result types_result">#전체종류</li>';
		$('.result_list_type').append(html);
    }
	if($("#area1").is(":checked")){
  		$( '.area' ).attr("checked", true);
		html='<li class="search_result area_result">#전체지역</li>';
		$('.result_list_area').append(html);
    }
	if($("#incense1").is(":checked")){
  		$( '.incense' ).attr("checked", true);
		html ='<li class="search_result incense_result">#전체향</li>';
		$('.result_list_incense').append(html);
    }

	var typesArr=['탁주', '청주/약주', '과실주', '증류주', '기타주류'];
	var areaArr=['서울', '경기도', '강원도', '충청도', '전라도', '경상도', '제주도'];
	var incenseArr=['곡물향', '과일향', '꽃향', '꿀향', '누룩향', '알콜향'];

	//체크박스 모두 선택 눌렀을 때 처리 - 종류별
    $('.types' ).click( function() {
		$('.result_list_type').empty();
		//전체선택 체크박스 누르면 전체선택 처리
		if($(this).attr('id')=='types1'){
        	$('.types').prop( 'checked', this.checked );
			if($(this).is(":checked")){
				html='<li class="search_result types_result">#전체종류</li>';
				$('.result_list_type').append(html);
			}
			return;
		}else{
			//isChecked => 체크된 체크박스 갯수 저장 / notChecked => 체크되어있지 않는 체크박스의 갯수 저장
			var isChecked = 0;
			var notChecked = 0;
			
			//체크되어있지 않은 체크박스의 갯수를 세는 반복문	
			for(var i=1; i<6; i++){
				var str='#types'+(i+1); //id값만드는 변수
				if($(str).is(":checked")==false){
					notChecked++;
				}else{
					isChecked++; //체크되어있으면 갯수 셈
				}
			}
			
			//console.log('TYPES ====> isChecked : '+isChecked+', notChecked : '+notChecked);
						
			//notChecked가 1 이상이거나, isChecked가 5미만인 경우 전체선택 체크해제, 그 외에는 전체선택도 선택처리
			if(notChecked>=1 || isChecked!=5){
				//console.log("여기 들어왔어요 types1 체크해제해요");
				$( '#types1' ).attr("checked", false);
			}else{
				$( '#types1' ).attr("checked", true);
			}
		}		
    } );

	//체크박스 모두 선택 눌렀을 때 처리 - 지역별
    $('.area' ).click( function() {
		$('.result_list_area').empty();
		//전체선택 체크박스 누르면 전체선택 처리
		if($(this).attr('id')=='area1'){
        	$('.area').prop( 'checked', this.checked );
			if($(this).is(":checked")){
				html='<li class="search_result area_result">#전체지역</li>';
				$('.result_list_area').append(html);
			}
			return;
		}else{
			//isChecked => 체크된 체크박스 갯수 저장 / notChecked => 체크되어있지 않는 체크박스의 갯수 저장
			var isChecked = 0;
			var notChecked = 0;
			
			//체크되어있지 않은 체크박스의 갯수를 세는 반복문	
			for(var i=1; i<8; i++){
				var str='#area'+(i+1); //id값만드는 변수
				if($(str).is(":checked")==false){
					notChecked++;
				}else{
					isChecked++; //체크되어있으면 갯수 셈
				}
			}
			
			//console.log('AREA ====> isChecked : '+isChecked+', notChecked : '+notChecked);
						
			//notChecked가 1 이상이거나, isChecked가 7미만인 경우 전체선택 체크해제, 그 외에는 전체선택도 선택처리
			if(notChecked>=1 || isChecked!=7){
				//console.log("여기 들어왔어요 area1 체크해제해요");
				$( '#area1' ).attr("checked", false);
			}else{
				$( '#area1' ).attr("checked", true);
			}
		}		
    } );

	//체크박스 모두 선택 눌렀을 때 처리 - 향 종류
    $('.incense' ).click( function() {
		$('.result_list_incense').empty();
		//전체선택 체크박스 누르면 전체선택 처리
		if($(this).attr('id')=='incense1'){
        	$('.incense').prop( 'checked', this.checked );
			if($(this).is(":checked")){
				html='<li class="search_result incense_result">#전체향</li>';
				$('.result_list_incense').append(html);
			}
			return;
		}else{
			//isChecked => 체크된 체크박스 갯수 저장 / notChecked => 체크되어있지 않는 체크박스의 갯수 저장
			var isChecked = 0;
			var notChecked = 0;
			
			//체크되어있지 않은 체크박스의 갯수를 세는 반복문	
			for(var i=1; i<7; i++){
				var str='#incense'+(i+1); //id값만드는 변수
				if($(str).is(":checked")==false){
					notChecked++;
				}else{
					isChecked++; //체크되어있으면 갯수 셈
				}
			}
			
			//console.log('INCENSE ====> isChecked : '+isChecked+', notChecked : '+notChecked);
						
			//notChecked가 1 이상이거나, isChecked가 6미만인 경우 전체선택 체크해제, 그 외에는 전체선택도 선택처리
			if(notChecked>=1 || isChecked!=6){
				//console.log("여기 들어왔어요 incense1 체크해제해요");
				$( '#incense1' ).attr("checked", false);
			}else{
				$( '#incense1' ).attr("checked", true);
			}
		}		
    } );



} );