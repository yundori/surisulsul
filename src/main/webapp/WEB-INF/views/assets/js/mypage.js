//탭 이동
$(document).ready(function() {
		
	$(".tab-button-item-link").click(function(e) {
		//링크의 페이지 이동을 방지
		e.preventDefault();
		
		//탭 클릭시 이미지 변경
		$(".tab-button-item-link").not(this).removeClass("selected");
		$(this).addClass("selected");
		
		var activeTab = $(this).attr('data-tab');

		$.ajax({
			type: 'GET',
			url: activeTab + ".do",
			dataType: "html",
			error: function() {
				alert('통신실패');
				console.log(">>에러" + error.status);
			},
			success: function(data) {
				$('.tab-panel').html(data);	
			}
		});
	});
});


//팝업열기
function openPw() {
	var popup = window.open(
		'chk_pw.do', '비밀번호 확인',
		'width=500, height=300, toolbar=no, menubar=no, scrollbars=yes, resizable=no');
}

//탈퇴하기
$(function() {
	$(".psn_deactivate").click(function() {
		//확인, 취소버튼에 따른 후속 처리 구현
		swal({
			title: '탈퇴하기',
			text: "정말 수리술술을 탈퇴하시겠습니까?",
			type: 'question',
			confirmButtonText: '아니오',
			showCancelButton: true,
			cancelButtonText: '네',
		}).then(function(result) {
			if (result.value) {
				swal('취소', '탈퇴가 취소되었습니다.', 'success');
			} else if (result.dismiss === 'cancel') {
			var hostIndex = location.href.indexOf(location.host)+location.host.length;
			var contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1) );
				location.replace(contextPath+'/mypage/is_out.do');
			}
		});
	});
});
