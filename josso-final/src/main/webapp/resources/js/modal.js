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
	
	$('[class^="hover_tag"] li>ul>li').click(function(){
		$('[class^="hover_tag"] li>ul>li').css("background","white");
		$(this).css("background","rgb(236,236,236)");
		$('#document_name').text($(this).text());
    });
	
	$('#modal_submit').click(function(){
        if($('#drop1 tr').length != 2 || $('#drop2 tr').length != 2){
            alert('결재정보를 확인해주세요!');
        }else{
        	var middle = $('#drop1').children().children().next().children().next().html();
            var middlename = $('#drop1').children().children().next().children().next().next().text();
            var last = $('#drop2').children().children().next().children().next().html();
            var lastname = $('#drop2').children().children().next().children().next().next().text();
            
            var newForm = document.createElement('form');
            newForm.setAttribute('charset', 'UTF-8');
            newForm.name = 'newForm';
            newForm.method = 'post';
            newForm.action = '/josso/elecApproval/signing';
            newForm.name = 'newForm';
            
            var input1 = document.createElement('input');
            var input2 = document.createElement('input');
            var input3 = document.createElement('input');
            var input4 = document.createElement('input');
            
            input1.setAttribute("type","hidden");
            input1.setAttribute("name","middle");
            input1.setAttribute("value",middle);
            input2.setAttribute("type","hidden");
            input2.setAttribute("name","middlename");
            input2.setAttribute("value",middlename);
            input3.setAttribute("type","hidden");
            input3.setAttribute("name","last");
            input3.setAttribute("value",last);
            input4.setAttribute("type","hidden");
            input4.setAttribute("name","lastname");
            input4.setAttribute("value",lastname);
            
            newForm.appendChild(input1);
            newForm.appendChild(input2);
            newForm.appendChild(input3);
            newForm.appendChild(input4);
            
            document.body.appendChild(newForm);
            newForm.submit();
        	
        }
      });
	
	$('#searchName').keyup(function() {
		var name = $('#searchName').val();
		$.ajax({
			url : "/josso/elecApproval/serachName",
			data : {"employeeName" : name},
			method : "post",
			dataType : "json",
			success : function(rdata) {
				$(rdata).each(function() {
					alert(this.dCode);
				});
			}
		});	
	});			
	
	
	
	
});