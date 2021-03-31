$(function() {
	$('.hover_team1').click(function() {
		var submenu = $('.modal_mb1');
		if (submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
	});
	$('.hover_team2').click(function() {
		var submenu = $('.modal_mb2');
		if (submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
	});
	$('.hover_team3').click(function() {
		var submenu = $('.modal_mb3');
		if (submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
	});
	$('.hover_team4').click(function() {
		var submenu = $('.modal_mb4');
		if (submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
	});
	$('.btn_wrap').click(function() {
		var modalDiv = $('#exampleModal');
		modalDiv.modal({
			backdrop : false,
			show : true
		});
		$('.modal-dialog').draggable({
			handle : ".modal-header"
		});
	});
});
//$(function() {
//	$('.start_date').datepicker({
//		format : "yyyy-mm-dd"
//	});
//	$('.end_date').datepicker({
//		format : "yyyy-mm-dd"
//	});
//});