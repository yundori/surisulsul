//탭 이동
$(document).ready(function() {
	$(".tab-button-item-link").click(function(e) {
		e.preventDefault();
		$(".tab-button-item-link").not(this).removeClass("selected");
		$(this).addClass("selected");
		var target = $(this).attr('href');
		$(target).removeClass('hide');
		$(".tab-panel>div").not($(target)).addClass('hide');
	});
});

//팝업열기
function openPw() {
	var popup = window.open(
		'../mypage/chk_pw.jsp', '비밀번호 확인',
		'width=500, height=250, toolbar=no, menubar=no, scrollbars=yes, resizable=no');
}

//탈퇴하기
$(function(){
	$(".psn_deactivate").click(function(){
		//확인, 취소버튼에 따른 후속 처리 구현
		swal({
			title : '탈퇴하기',
			text : "정말 수리술술을 탈퇴하시겠습니까?",
			type : 'question',
			confirmButtonText : '아니오',
			showCancelButton : true,
			cancelButtonText : '네',
		}).then(function(result){
			if(result.value){
				swal('취소', '탈퇴가 취소되었습니다.', 'success');
			}else if(result.dismiss === 'cancel'){
			swal({
			title : '탈퇴',
			text : "탈퇴처리가 완료되었습니다.",
			type : 'success',
			confirmButtonText : '확인',
			}).then(function(){
				window.location='../index/index.jsp';
			});
			}
		});
	});
});