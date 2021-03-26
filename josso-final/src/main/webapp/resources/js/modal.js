$(function() {
	$('.document_kind').click(function() {
		var submenu = $('.hover_tag>li');
		if (submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
	});
	$('.document_kind_2').click(function() {
		var submenu = $('.hover_tag2>li');
		if (submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
	});
	$('.document_kind_3').click(function() {
		var submenu = $('.hover_tag3>li');
		if (submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
	});
	$('.document_kind_4').click(function() {
		var submenu = $('.hover_tag4>li');
		if (submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
	});
	$('.document_kind_5').click(function() {
		var submenu = $('.hover_tag5>li');
		if (submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
	});
	$('.document_kind_6').click(function() {
		var submenu = $('.hover_tag6>li');
		if (submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
	});

	$('.dataRow').on({
		'dragstart' : function(e) {
			e.originalEvent.dataTransfer.setData('text', $(this).html());
		},
	});

	$('#droppObj')
			.on(
					{
						'dragenter' : function(e) {
						},
						'dragleave' : function(e) {
						},
						'dragover' : function(e) {
							e.preventDefault();
						},

						'drop' : function(e) {
							if ($('#drop1 >tbody>tr').length == 1) {
								console.log($('#drop1 >tbody>tr').length)
								var data = e.originalEvent.dataTransfer
										.getData('text');
								var trObj = document.createElement('tr');
								var board = document.getElementById('droppObj');
								trObj.innerHTML = data;
								console
										.log(board.lastElementChild.lastElementChild);
								board.lastElementChild.lastElementChild
										.append(trObj);
								e.preventDefault();
							} else {
								var data = e.originalEvent.dataTransfer
										.getData('text');
								var parent1 = document
										.getElementById('droppObj');
								var parent2 = parent1.lastElementChild.lastElementChild;
								data1 = parent1.lastElementChild.lastElementChild.lastElementChild;
								data1.remove();
								var trObj = document.createElement('tr');
								trObj.innerHTML = data;
								parent2.append(trObj);
								e.preventDefault();
							}
						}
					});

	$('#droppObj1')
			.on(
					{
						'dragenter' : function(e) {
						},
						'dragleave' : function(e) {
						},
						'dragover' : function(e) {
							e.preventDefault();
						},
						'drop' : function(e) {
							if ($('#drop2 >tbody>tr').length == 1) {
								var data = e.originalEvent.dataTransfer
										.getData('text');
								var trObj = document.createElement('tr');
								var board = document
										.getElementById('droppObj1');
								trObj.innerHTML = data;
								console
										.log(board.lastElementChild.lastElementChild);
								board.lastElementChild.lastElementChild
										.append(trObj);
								e.preventDefault();
							} else {
								var data = e.originalEvent.dataTransfer
										.getData('text');
								var parent1 = document
										.getElementById('droppObj1');
								var parent2 = parent1.lastElementChild.lastElementChild;
								data1 = parent1.lastElementChild.lastElementChild.lastElementChild;
								data1.remove();
								var trObj = document.createElement('tr');
								trObj.innerHTML = data;
								parent2.append(trObj);
								e.preventDefault();
							}
						}
					});
	$(function() {
		$('.hover_icon').click(function() {
			$('.hover_tag').slideToggle("slow")
		});
	});
});