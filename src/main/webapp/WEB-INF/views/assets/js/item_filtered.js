$(document).ready(function() {

	//html 변수 = 각 키워드 출력을 위한 html li태그 내용이 들어갈 문자열 변수
	var html = '';

	var typesArr = ['탁주', '청주/약주', '과실주', '증류주', '기타주류'];
	var areaArr = ['서울', '경기도', '강원도', '충청도', '전라도', '경상도', '제주도'];
	var incenseArr = ['곡물향', '과일향', '꽃향', '꿀향', '누룩향', '알콜향'];

	//체크박스 모두 선택 눌렀을 때 처리 - 종류별
	$('.types').click(function() {
		//전체선택 체크박스 누르면 전체선택 처리
		if ($(this).attr('id') == 'types1') {
			$('.types').prop('checked', this.checked);
		} else {
			getChecked('types', 6);
		}
		printKeyword('.result_list_type','types_result', 5, 'types');
		
	});
	
	//체크박스 모두 선택 눌렀을 때 처리 - 지역별
	$('.area').click(function() {
		//전체선택 체크박스 누르면 전체선택 처리
		if ($(this).attr('id') == 'area1') {
			$('.area').prop('checked', this.checked);
		} else {
			getChecked('area', 8);
		}
		printKeyword('.result_list_area','area_result', 7, 'area');
	});

	//체크박스 모두 선택 눌렀을 때 처리 - 향 종류
	$('.incense').click(function() {
		//전체선택 체크박스 누르면 전체선택 처리
		if ($(this).attr('id') == 'incense1') {
			$('.incense').prop('checked', this.checked);
		} else {
			getChecked('incense', 7);
		}
		printKeyword('.result_list_incense','incense_result', 6, 'incense');
	});

	//체크박스 전체선택+해제 관련 처리 메서드
	function getChecked(className, max) {

		var allCheckboxId = '#'+className + '1';	//전체선택 체크박스의 ID 값을 가지는 변수

		//isChecked => 체크된 체크박스 갯수 저장 / notChecked => 체크되어있지 않는 체크박스의 갯수 저장
		var isChecked = 0;
		var notChecked = 0;

		//체크되어있지 않은 체크박스의 갯수를 세는 반복문 / 파라미터로 받아온 max 까지 반복	
		for (var i = 1; i < max; i++) {
			var normalCheckboxId = '#'  + className + (i + 1); //전체선택제외, 일반체크박스의 id값만드는 변수
			if ($(normalCheckboxId).is(":checked") == false) {
				notChecked++;
			} else {
				isChecked++; //체크되어있으면 isChecked에 갯수 추가됨
			}
		}

		//console.log(className + ' ====> isChecked : ' + isChecked + ', notChecked : '+notChecked);

		//notChecked가 1 이상이거나, isChecked가 5미만인 경우 전체선택 체크해제, 그 외에는 전체선택도 선택처리
		if (isChecked<max-1 || notChecked>=1) {
			//console.log('여기 들어왔어요 allCheckboxId : '+allCheckboxId+'해제해요');
			$(allCheckboxId).attr("checked", false);
		} else {
			$(allCheckboxId).attr("checked", true);
		}
	}

	/**
	*  체크박스가 눌릴때마다 호출, 선택된 체크박스를 찾아낸다.
	*  html 변수에 <li> 코드를 입력해서 append로 찍어내는 printKeyword 함수
	*
	*  params : resultListClass = li 태그가 들어갈 ul의 클래스명
	*           resultLiClass = li태그에 적용될 클래스명 (background-color CSS 적용을 위해 쓰임)
	*           max = type, area, incense에 따라 다른 체크박스의 수 (for문에 쓰임) ※전체는 제외
	*           selectedId = 지금 눌린 체크박스의 클래스를 받아옴 
	*/
	function printKeyword(resultUlClass, resultLiClass, max, selectedClass){
		
		//파라미터로 받아온 ul클래스 안의 HTML 태그 내용을 비운다 (초기화), html 변수도 초기화한다.
		$(resultUlClass).empty();
		html = '';
		
		//tagetArr = selectedClass에 따라서 사용할 배열을 가져온다.
		var targetArr = [];
		
		if(selectedClass=='types'){
			targetArr = typesArr;
		}else if(selectedClass=='area'){
			targetArr = areaArr;
		}else if(selectedClass=='incense'){
			targetArr = incenseArr;
		}
		
		for(var i=0; i<max; i++){
			var getId = '#'+selectedClass+(i+2);
			
			if($(getId).is(":checked") == true){
				html+= '<li class="search_result '+resultLiClass+'">#'+targetArr[i]+'</li>';
			}
		}
		$(resultUlClass).append(html);
	}
	
	//기본 모두 선택 처리 (화면 구현 직후)
	if ($("#types1").is(":checked")) {
		$('.types').attr("checked", true);
		printKeyword('.result_list_type','types_result', 5, 'types');
	}
	if ($("#area1").is(":checked")) {
		$('.area').attr("checked", true);
		printKeyword('.result_list_area','area_result', 7, 'area');
	}
	if ($("#incense1").is(":checked")) {
		$('.incense').attr("checked", true);
		printKeyword('.result_list_incense','incense_result', 6, 'incense');
	}
	
	
	printKeyword('.result_list_type','types_result', 5, 'types');
	printKeyword('.result_list_area','area_result', 7, 'area');
	printKeyword('.result_list_incense','incense_result', 6, 'incense');

});