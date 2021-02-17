$(document).ready(function() {
	$(".icons").hover(
		function() {
			//console.log("hover 들어옴");
			$(this).parent().find(".icon_description").toggleClass("text_visible");
		}
	);
})

	
	function jn(){
		swal({
			title: '주능 응시 결과가 있습니다!',
			text: "시험에 다시 응시하시겠습니까?",
			type: 'question',
			confirmButtonText: '네',
			showCancelButton: true,
			cancelButtonText: '이전 응시결과 확인하기',
		}).then(function(result) {
			if (result.dismiss === 'cancel') {
				document.location.href = "mypage/mypage.do"
			}
		});

}


function check() {
	var imgradio = document.imgradio;
	var drink = imgradio.drink.value;
	var food = imgradio.food.value;
	var people = imgradio.people.value;
	var mood = imgradio.mood.value;

	if (!drink || !food || !people || !mood) {
		alert("선택하지 않은 문항이 있습니다.")
	} else {
		imgradio.submit();
	}
}

