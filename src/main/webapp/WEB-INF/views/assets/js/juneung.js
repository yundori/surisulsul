$(document).ready(function() { 
	$(".icons").hover(
        function() {
            //console.log("hover 들어옴");
            $(this).parent().find(".icon_description").toggleClass("text_visible");
        }
    );

    
})

//주능 결과값 있을 시 confirm 
$(document).ready(function(){
	    
    //주능 결과값 없을 시 false, 있을 시 true->재응시 여부 묻기
    if('${jn_result}' != true) {
    console.log("성공>>");
     		swal({
			title: '주능 응시 결과가 있습니다!',
			text: "시험에 다시 응시하시겠습니까?",
			type: 'question',
			confirmButtonText: '네',
			showCancelButton: true,
			cancelButtonText: '취소',
		}).then(function(result) {
			if (result.dismiss === 'cancel') {
					history.back();
			}
		});
    }
    
    
});
