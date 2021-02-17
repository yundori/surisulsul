$(document).ready(function() {
	$('.check_all').click(function() {
		var chk = $(".check_all").prop("checked");
		if (chk) {
			$(".ab").prop("checked", true);
		} else {
			$(".ab").prop("checked", false);
		}
	});
});

$(document).ready(function() {
	var chk = $(".check_all2").prop("checked");
	if (chk) {
		$(".cd").prop("checked", true);
	} else {
		$(".cd").prop("checked", false);
	}
});

// 체크박스 개별적으로 선택 시 모두 체크인지 확인해서 .check_all에도 자동 선택처리 되도록
$('.ab').click(function() {
	var reviewItem = $('input:checkbox[name=reviewItem]').length;
	var selectedReviewItem = $('input:checkbox[name=reviewItem]:checked').length;

	if (reviewItem != selectedReviewItem) {
		console.log('reviewItem!=selectedReviewItem');
		$(".check_all").prop("checked", false);

	} else {
		console.log('reviewItem==selectedReviewItem');
		$(".check_all").prop("checked", true);
	}
});
$('.cd').click(function() {
	var qnaItem = $('input:checkbox[name=qnaItem]').length;
	var selectedQnaItem = $('input:checkbox[name=qnaItem]:checked').length;

	if (qnaItem != selectedQnaItem) {
		console.log('qnaItem!=selectedQnaItem');
		$(".check_all2").prop("checked", false);

	} else {
		console.log('qnaItem==selectedQnaItem');
		$(".check_all2").prop("checked", true);
	}
});

//팝업열기
function openPop(revId) {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	var contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	var popup = window.open(
		contextPath + '/mypage/edit_review.do?id=' + revId, '후기수정',
		'width=700, height=960, toolbar=no, menubar=no, scrollbars=yes, resizable=no');
}