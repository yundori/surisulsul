$(document).ready(function() {
	$('.check_all').click(function() {
		$('.ab').prop('checked', this.checked);
		$('.check_all').prop('checked', this.checked);
	});
});

$(document).ready(function() {
	$('.check_all2').click(function() {
		$('.cd').prop('checked', this.checked);
		$('.check_all2').prop('checked', this.checked);
	});
});

// 체크박스 개별적으로 선택 시 모두 체크인지 확인해서 .check_all에도 자동 선택처리 되도록
$('.ab').click(function() {
	if ($("#item1").is(":checked") && $("#item2").is(":checked")) {
		$('.check_all').attr("checked", true);
	} else {
		$('.check_all').attr("checked", false);
	}
});
$('.cd').click(function() {
	if ($("#item1").is(":checked") && $("#item2").is(":checked")) {
		$('.check_all').attr("checked", true);
	} else {
		$('.check_all').attr("checked", false);
	}
});

//팝업열기
function openPop() {
	var popup = window.open(
	'../mypage/write_review.jsp','후기수정',
	'width=700, height=960, toolbar=no, menubar=no, scrollbars=yes, resizable=no');
	}