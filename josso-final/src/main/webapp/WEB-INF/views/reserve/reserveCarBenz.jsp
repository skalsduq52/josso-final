<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
    <style>
    	#detail-day {
			border: none;
			width: 110px;
			margin-top: 5px;
			margin-left: 170px;
			margin-right: 170px;
		}
		#detail-user {
			border: none;
			width: 180px;
			margin-left: 150px;
			margin-right: 120px;
			margin-top: 5px;
		}

		.detail-purpose3 {
			margin-left: 30px;
			margin-right: 30px;
			margin-top: 30px;
		}

		#detail-purpose2 {
			padding-left: 160px;
		}

		#cancle-dialog2 {
			margin-left: 380px;
			margin-top: 20px;
		}
    	</style>
        <title>josso</title>
         <!-- josso css -->
         <link rel="stylesheet" href="../../resources/css/common.css" type="text/css">
         <link rel="stylesheet" href="../../resources/css/reserve/item.css" type="text/css">
         <!-- Icon -->
         <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
         crossorigin="anonymous">
         <!-- 부트스트랩 css 사용 -->
         <!-- Latest compiled and minified CSS -->
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
         <!-- jQuery library -->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
         <!-- Popper JS -->
         <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
         <!-- Latest compiled JavaScript -->
         <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
         <!-- jquery ui-->
         <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
         <script src="//code.jquery.com/jquery.min.js"></script>
         <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
         <script>
            $(function(){
                $('.hover_icon').click(function(){
                    $('.hover_tag').slideToggle("slow")
                });
            });
		
            /*페이지를 옮겼을때 이벤트가 날아가버려서 서류페이지 자체에다가 이벤트를 걸어놓는곳 */
            $(document).on('click','.table_dialog > tr > td',function(){
            	if($(this).children('.user-name').text() != ""){
	            	var str1 = $(this).children('.user-name').text();
					var str2 = $(this).children('.user-purpose').text();
		            $('#detail-user').val(str1);
		            $('#detail-purpose').val(str2);
		            	
		            $('#detail-dialog').dialog({
		                title : "예약 상세 내용",
		                width : 500,
		            	height: 300,
		                modal : true
		            }).prev(".ui-dialog-titlebar").css("background","#B0E0E6");
		            $('#cancle-dialog2').click(function(){
		            	$('#detail-dialog').dialog("close");
		            });
            	}else if($(this).children('.user-name').text() == ""){
            		$('#form_dialog').dialog({
                        title : "예약 창",
                        width : 600,
                		height: 300,
                        modal : true
                    }).prev(".ui-dialog-titlebar").css("background","#B0E0E6");
            		var Stime = $(this).parents('tr').attr('class');
            		$(".start-time-select").val(Stime).prop("selected", true);
            		$(".end-time-select").val(Stime).prop("selected", true);
                    $('#cancle-dialog').click(function(){
                    	$('#form_dialog').dialog("close");
                    });
            	}
            });
       
            var tablePrint;
            $(function(){
            	var weekId = ['${dayOfWeek2[0]}','${dayOfWeek2[1]}','${dayOfWeek2[2]}','${dayOfWeek2[3]}'
            					,'${dayOfWeek2[4]}','${dayOfWeek2[5]}','${dayOfWeek2[6]}'];
            	var timeIdArr = ['#T0700','#T0730','#T0800','#T0830','#T0900','#T0930','#T1000'
            					,'#T1030','#T1100','#T1130','#T1200','#T1230','#T1300','#T1330',
            					'#T1400','#T1430','#T1500','#T1530','#T1600','#T1630','#T1700','#T1730','#T1800','#T1830'];
            	var weekClassArr = ['.${dayOfWeek2[0]}','.${dayOfWeek2[1]}','.${dayOfWeek2[2]}','.${dayOfWeek2[3]}',
            						'.${dayOfWeek2[4]}','.${dayOfWeek2[5]}','.${dayOfWeek2[6]}'];
            	tablePrint = $('.table-content-color').html();
            	$.ajax({
    				url : 'itemJSON5',
    				dataType : 'json',
    				type : 'get',
    				success : function(Itemdata){
    					for(var k = 0; k < 7; k++){
	    					for(var i = 0; i < Itemdata.length; i++){
	    	            		if(weekId[k] == Itemdata[i].reservationStartDate ){
	    	            			for(var j = 0; j<timeIdArr.length; j++){
	    	            				if(Itemdata[i].startTime == jQuery($(timeIdArr[j])).attr("class")){
	    	            					var m = 0;
	    	            					$(timeIdArr[j+m]).children(weekClassArr[k]).html(
	    	            						'<span class="user-name">'+decodeURIComponent(Itemdata[i].userName)+' '
    			    	            			+Itemdata[i].startTime+' ~ '
    	    			    	            	+Itemdata[i].endTime+'</span>'+' ('
    	    			    	            	+'<span class="user-purpose">'+decodeURIComponent(Itemdata[i].reservationPurpose)+'</span>'+')');
	    	            					$(timeIdArr[j+m]).children(weekClassArr[k]).css("background-color","silver");
	    	            					while(Itemdata[i].endTime != jQuery($(timeIdArr[j+m])).attr("class")){
	    	            						$(timeIdArr[j+m]).children(weekClassArr[k]).html(
	    	            							'<span class="user-name">'+decodeURIComponent(Itemdata[i].userName)+' '
	    			    	            			+Itemdata[i].startTime+' ~ '
	    	    			    	            	+Itemdata[i].endTime+'</span>'+' ('
	    	    			    	            	+'<span class="user-purpose">'+decodeURIComponent(Itemdata[i].reservationPurpose)+'</span>'+')');
	    	            						$(timeIdArr[j+m]).children(weekClassArr[k]).css("background-color","silver");
	    	            						m++;
	    	            					}
	    	            				}
	    	            			}
	    	            		}
	    	            	}
    					}
    					$(function(){
		    		    	$(".table-content-color").children().children().children('.user-name').each(function() {
		    		            var rows = $(".table-content-color > tr > td:contains('" + $(this).html() + "')");
		    		            console.log(rows);
		    		            if ((rows.length > 1) && ($(this).html() != "") && ($(this).html().length > 2)) {
		    		            	rows.eq(0).attr("rowspan", rows.length);
		    		            	rows.not(":eq(0)").remove();
		    		            }
		    		        });
	    	            });
    				},
					error : function(request, satus, errorData){
						alert("error code : " + request.status + "\n"
								+ "message : " + request.responseText
								+"\n" + "error : " + errorData);
					}
    			});
            });

       
            $(function(){
            	var weekIdArr = ['#sunday','#monday','#tuesday','#wednesday','#thursday','#friday','#saturday'];
            	var count = 0;
            	var countWeek = 0;
            	var timeIdArr = ['#T0700','#T0730','#T0800','#T0830','#T0900','#T0930','#T1000','#T1030','#T1100','#T1130','#T1200','#T1230','#T1300','#T1330',
					'#T1400','#T1430','#T1500','#T1530','#T1600','#T1630','#T1700','#T1730','#T1800','#T1830'];
				var weekClassArr = ['.${dayOfWeek2[0]}','.${dayOfWeek2[1]}','.${dayOfWeek2[2]}','.${dayOfWeek2[3]}','.${dayOfWeek2[4]}','.${dayOfWeek2[5]}','.${dayOfWeek2[6]}'];
	            $('#right-icon').click(function(){
	            	var i = 0;
	            	$.ajax({
	    				url : '/josso/dateWeekJSON',
	    				dataType : 'json',
	    				type : 'get',
	    				success : function(data){
	    					if(data[count+i+7] != null){
	    		            	for(i = 0; i<7; i++){
	    			            	if(i == 0){
	    			            		$(weekIdArr[i]).html(data[count+i+7]);
	    			            		$('#left_day').html(data[count+i+7]);
	    			            	}else if(i == 6){
	    			            		$(weekIdArr[i]).html(data[count+i+7]);
	    			            		$('#right_day').html(data[count+i+7]);
	    			            	}else{
	    			            		$(weekIdArr[i]).html(data[count+i+7]);
	    			            	}
	    		            	}
	    		            	$(".table-content-color *").css("background-color","white");
	    		            	$(".table-content-color").children("tr").children("td").empty();
	    		            	$('.table-content-color').html(tablePrint);
	    		            	$.ajax({
	    		    				url : 'itemJSON5',
	    		    				dataType : 'json',
	    		    				type : 'get',
	    		    				success : function(Itemdata){
	    		    					for(var k = 0; k < 7; k++){
	    			    					for(var i = 0; i < Itemdata.length; i++){
	    			    	            		if(data[count+k] == Itemdata[i].reservationStartDate ){
	    			    	            			for(var j = 0; j<timeIdArr.length; j++){
	    			    	            				if(Itemdata[i].startTime == jQuery($(timeIdArr[j])).attr("class")){
	    			    	            					var m = 0;
	    			    	            					$(timeIdArr[j+m]).children(weekClassArr[k]).html(
	    			    	            						'<span class="user-name">'+decodeURIComponent(Itemdata[i].userName)+' '
	    			    			    	            		+Itemdata[i].startTime+' ~ '
	    			    	    			    	            +Itemdata[i].endTime+'</span>'+' ('
	    			    	    			    	            +'<span class="user-purpose">'+decodeURIComponent(Itemdata[i].reservationPurpose)+'</span>'+')');
	    			    	            					$(timeIdArr[j+m]).children(weekClassArr[k]).css("background-color","silver");
	    			    	            					while(Itemdata[i].endTime != jQuery($(timeIdArr[j+m])).attr("class") || Itemdata[i].startTime != jQuery($(timeIdArr[j])).attr("class")){
	    			    	            						$(timeIdArr[j+m]).children(weekClassArr[k]).html(
	    			    	            							'<span class="user-name">'+decodeURIComponent(Itemdata[i].userName)+' '
	    			        			    	            		+Itemdata[i].startTime+' ~ '
	    			        	    			    	            +Itemdata[i].endTime+'</span>'+' ('
	    			        	    			    	            +'<span class="user-purpose">'+decodeURIComponent(Itemdata[i].reservationPurpose)+'</span>'+')');
	    			    	            						$(timeIdArr[j+m]).children(weekClassArr[k]).css("background-color","silver");
	    			    	            						m++;
	    			    	            					}
	    			    	            				}
	    			    	            			}
	    			    	            		}
	    			    	            	}
	    		    					}
	    		    					$(function(){
	    				    		    	$(".table-content-color").children().children().children('.user-name').each(function() {
	    				    		            var rows = $(".table-content-color > tr > td:contains('" + $(this).html() + "')");
	    				    		            console.log(rows);
	    				    		            if ((rows.length > 1) && ($(this).html() != "") && ($(this).html().length > 2)) {
	    				    		            	rows.eq(0).attr("rowspan", rows.length);
	    				    		            	rows.not(":eq(0)").remove();
	    				    		            }
	    				    		        });
	    			    	            });
	    		    				},
	    							error : function(request, satus, errorData){
	    								alert("error code : " + request.status + "\n"
	    										+ "message : " + request.responseText
	    										+"\n" + "error : " + errorData);
	    							}
	    		    			});
	    		             }else if(data[count+i+7] == null){
	    		             	alert("이동할 수 없습니다.");
	    		             	count -= 7;
	    		             }
	    		             count += 7;
	    				},
						error : function(request, satus, errorData){
							alert("error code : " + request.status + "\n"
									+ "message : " + request.responseText
									+"\n" + "error : " + errorData);
						}
	    			});
    			});
	            $('#left-icon').click(function(){
	            	var i = 0;
	            	$.ajax({
	    				url : '/josso/dateWeekJSON',
	    				dataType : 'json',
	    				type : 'get',
	    				success : function(data){
	    					count -= 7;
	    					if(data[count+i] != null){
	    		            	for(i = 0; i<7; i++){
	    			            	if(i == 0){
	    			            		$(weekIdArr[i]).html(data[count+i]);
	    			            		$('#left_day').html(data[count+i]);
	    			            	}else if(i == 6){
	    			            		$(weekIdArr[i]).html(data[count+i]);
	    			            		$('#right_day').html(data[count+i]);
	    			            	}else{
	    			            		$(weekIdArr[i]).html(data[count+i]);
	    			            	}
	    		            	}
	    		            	$(".table-content-color *").css("background-color","white");
	    		            	$(".table-content-color").children("tr").children("td").empty();
	    		            	$('.table-content-color').html(tablePrint);
	    		            	$.ajax({
	    		    				url : 'itemJSON5',
	    		    				dataType : 'json',
	    		    				type : 'get',
	    		    				success : function(Itemdata){
	    		    					for(var k = 0; k < 7; k++){
	    			    					for(var i = 0; i < Itemdata.length; i++){
	    			    	            		if(data[count+k] == Itemdata[i].reservationStartDate ){
	    			    	            			for(var j = 0; j<timeIdArr.length; j++){
	    			    	            				if(Itemdata[i].startTime == jQuery($(timeIdArr[j])).attr("class")){
	    			    	            					var m = 0;
	    			    	            					$(timeIdArr[j+m]).children(weekClassArr[k]).html(
	    			    	            						'<span class="user-name">'+decodeURIComponent(Itemdata[i].userName)+' '
	    			    			    	            		+Itemdata[i].startTime+' ~ '
	    			    	    			    	            +Itemdata[i].endTime+'</span>'+' ('
	    			    	    			    	            +'<span class="user-purpose">'+decodeURIComponent(Itemdata[i].reservationPurpose)+'</span>'+')');
	    			    	            					$(timeIdArr[j+m]).children(weekClassArr[k]).css("background-color","silver");
	    			    	            					while(Itemdata[i].endTime != jQuery($(timeIdArr[j+m])).attr("class")){
	    			    	            						$(timeIdArr[j+m]).children(weekClassArr[k]).html(
	    			    	            							'<span class="user-name">'+decodeURIComponent(Itemdata[i].userName)+' '
	    			        			    	            		+Itemdata[i].startTime+' ~ '
	    			        	    			    	            +Itemdata[i].endTime+'</span>'+' ('
	    			        	    			    	            +'<span class="user-purpose">'+decodeURIComponent(Itemdata[i].reservationPurpose)+'</span>'+')');
	    			    	            						$(timeIdArr[j+m]).children(weekClassArr[k]).css("background-color","silver");
	    			    	            						m++;
	    			    	            					}
	    			    	            				}
	    			    	            			}
	    			    	            		}
	    			    	            	}
	    		    					}
	    		    					$(function(){
	    				    		    	$(".table-content-color").children().children().children('.user-name').each(function() {
	    				    		            var rows = $(".table-content-color > tr > td:contains('" + $(this).html() + "')");
	    				    		            console.log(rows);
	    				    		            if ((rows.length > 1) && ($(this).html() != "") && ($(this).html().length > 2)) {
	    				    		            	rows.eq(0).attr("rowspan", rows.length);
	    				    		            	rows.not(":eq(0)").remove();
	    				    		            }
	    				    		        });
	    			    	            });
	    		    				},
	    							error : function(request, satus, errorData){
	    								alert("error code : " + request.status + "\n"
	    										+ "message : " + request.responseText
	    										+"\n" + "error : " + errorData);
	    							}
	    		    			});
	    		             }else if(data[count+i] == null){
	    		             	alert("이동할 수 없습니다.");
	    		             	count += 7;
	    		             }
	    				},
						error : function(request, satus, errorData){
							alert("error code : " + request.status + "\n"
									+ "message : " + request.responseText
									+"\n" + "error : " + errorData);
						}
	    			});
    			});
            });
            
            $(function(){
	            $('#datepickerFirst').datepicker({
	            	 dateFormat: 'yy-mm-dd',
	            	 minDate: new Date('${dayOfWeek2First}'),
	            	 maxDate: new Date('${dayOfWeek2Last}'),
	                 prevText: '이전 달',
	                 nextText: '다음 달',
	                 monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	                 monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	                 dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	                 dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	                 showMonthAfterYear: true,
	                 constrainInput: false,
	                 yearSuffix: '년'
	                 
	            });
            });
        </script>
    </head>
    <body>
       <header>
            <%@ include file="../include/header.jsp"%>
        </header>
        <aside class="border-right">
            <%@ include file="../reserve/part/aside.jsp"%>
        </aside>
     	<nav class="border-bottom">
     		<div class="d-flex">
	            <div class="mr-auto p-2">
	               	벤츠_그룹&josso
	            </div>
	        </div>
	        <%@ include file="../include/logout.jsp"%>
     	</nav>
        <main>
            <div class="d-flex justify-content-center">
            	<span>
	            	<span><i class="fas fa-chevron-left"  id="left-icon"></i></span>
	                <span class="date_all">
	                	<span id="left_day">${dayOfWeek2[0] }</span> 
	                	~ 
	                	<span id="right_day">${dayOfWeek2[6] }</span>
	                </span>
	                <span><i class="fas fa-chevron-right"  id="right-icon"></i></span>
                </span>
            </div>
            <div class="table_location">
                <!-- java에서 for문으로 바꾸기 -->
                <table class="table table-bordered">
                    <thead>
                        <tr class="table table-borderless table-info" style="text-align: center;">
                            <th scope="col" width="5.5%"></th>
                            <th scope="col" width="13.5%"><label id="sunday">${dayOfWeek2[0] }</label>(일)</th>
                            <th scope="col" width="13.5%"><label id="monday">${dayOfWeek2[1] }</label>(월)</th>
                            <th scope="col" width="13.5%"><label id="tuesday">${dayOfWeek2[2] }</label>(화)</th>
                            <th scope="col" width="13.5%"><label id="wednesday">${dayOfWeek2[3] }</label>(수)</th>
                            <th scope="col" width="13.5%"><label id="thursday">${dayOfWeek2[4] }</label>(목)</th>
                            <th scope="col" width="13.5%"><label id="friday">${dayOfWeek2[5] }</label>(금)</th>
                            <th scope="col" width="13.5%"><label id="saturday">${dayOfWeek2[6] }</label>(토)</th>
                        </tr>
                    </thead>
                    <tbody class="table-content-color table_dialog">
                        <tr class="700" id="T0700">
                            <th class="hour-color">07</th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                        <tr class="730" id="T0730">
                            <th></th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                        <tr class="800" id="T0800">
                            <th class="hour-color">08</th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                        <tr class="830" id="T0830">
                            <th></th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                         <tr class="900" id="T0900">
                            <th class="hour-color">09</th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                        <tr class="930" id="T0930">
                            <th></th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                        <tr class="1000" id="T1000">
                            <th class="hour-color">10</th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                        <tr class="1030" id="T1030">
                            <th></th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                        <tr class="1100" id="T1100">
                            <th class="hour-color">11</th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                        <tr class="1130" id="T1130">
                            <th></th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                         <tr class="1200" id="T1200">
                            <th class="hour-color">12</th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                         <tr class="1230" id="T1230">
                            <th></th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                         <tr class="1300" id="T1300">
                            <th class="hour-color">13</th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                         <tr class="1330" id="T1330">
                            <th></th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                        <tr class="1400" id="T1400">
                            <th class="hour-color">14</th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                        <tr class="1430" id="T1430">
                            <th></th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                         <tr class="1500" id="T1500">
                            <th class="hour-color">15</th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                         <tr class="1530" id="T1530">
                            <th></th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                        <tr class="1600" id="T1600">
                            <th class="hour-color">16</th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                         <tr class="1630" id="T1630">
                            <th></th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                        <tr class="1700" id="T1700">
                            <th class="hour-color">17</th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr> 
                        <tr class="1730"id="T1730">
                            <th></th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                        <tr class="1800" id="T1800">
                            <th class="hour-color">18</th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                        <tr class="1830" id="T1830">
                            <th></th>
                            <td class="${dayOfWeek2[0] }"></td>
                            <td class="${dayOfWeek2[1] }"></td>
                            <td class="${dayOfWeek2[2] }"></td>
                            <td class="${dayOfWeek2[3] }"></td>
                            <td class="${dayOfWeek2[4] }"></td>
                            <td class="${dayOfWeek2[5] }"></td>
                            <td class="${dayOfWeek2[6] }"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </main>
        <div id="form_dialog" style="display:none">
            <form action="reservation5" method="GET">
                <div>
                	<div class="date-form-dialog">
	                    <span class="date-write-dialog">예약일</span>
	                    <span>
	                    	<input id="datepickerFirst" type="text" name="reservationStartDate" readonly>
	                    </span>
                    </div>
                    <div class="time-form-dialog">
                    	<span class="time-write-dialog">예약시간</span>
                    	<span>
	                    	<select class="start-time-select" name="startTime">
	                    		<option value="700">07:00</option>
	                    		<option value="730">07:30</option>
	                    		<option value="800">08:00</option>
	                    		<option value="830">08:30</option>
	                    		<option value="900">09:00</option>
	                    		<option value="930">09:30</option>
	                    		<option value="1000">10:00</option>
	                    		<option value="1030">10:30</option>
	                    		<option value="1100">11:00</option>
	                    		<option value="1130">11:30</option>
	                    		<option value="1200">12:00</option>
	                    		<option value="1230">12:30</option>
	                    		<option value="1300">13:00</option>
	                    		<option value="1330">13:30</option>
	                    		<option value="1400">14:00</option>
	                    		<option value="1430">14:30</option>
	                    		<option value="1500">15:00</option>
	                    		<option value="1530">15:30</option>
	                    		<option value="1600">16:00</option>
	                    		<option value="1630">16:30</option>
	                    		<option value="1700">17:00</option>
	                    		<option value="1730">17:30</option>
	                    		<option value="1800">18:00</option>
	                    		<option value="1830">18:30</option>
	                    	</select>
	                    </span>
	                    <span>~</span>
	                    <span>
	                    	<select class="end-time-select" name="endTime">
	                    		<option value="700">07:00</option>
	                    		<option value="730">07:30</option>
	                    		<option value="800">08:00</option>
	                    		<option value="830">08:30</option>
	                    		<option value="900">09:00</option>
	                    		<option value="930">09:30</option>
	                    		<option value="1000">10:00</option>
	                    		<option value="1030">10:30</option>
	                    		<option value="1100">11:00</option>
	                    		<option value="1130">11:30</option>
	                    		<option value="1200">12:00</option>
	                    		<option value="1230">12:30</option>
	                    		<option value="1300">13:00</option>
	                    		<option value="1330">13:30</option>
	                    		<option value="1400">14:00</option>
	                    		<option value="1430">14:30</option>
	                    		<option value="1500">15:00</option>
	                    		<option value="1530">15:30</option>
	                    		<option value="1600">16:00</option>
	                    		<option value="1630">16:30</option>
	                    		<option value="1700">17:00</option>
	                    		<option value="1730">17:30</option>
	                    		<option value="1800">18:00</option>
	                    		<option value="1830">18:30</option>
	                    	</select>
	                    </span>
                    </div>
                    <div class="name-form-dialog">
                    	<span class="name-write-dialog">예약자</span>
                    	<span><input type="text" value="${employeeName }" readonly></span>
                	</div>
                	<div class="purpose-form-dialog">
                    	<span class="purpose-write-dialog">이용목적</span>
                    	<span><input type="text" name="reservationPurpose"></span>
                	</div>
                	<div class="item-form-dialog">
                		<input type="text" name="itemNumber" value="5" readonly style="display:none">
                	</div>
                	<div class="button-form-dialog">
                		<input type="submit" value="제출" id="submit-dialog">
                		<input type="button" value="취소" id="cancle-dialog">
                	</div>
                </div>   
            </form>
        </div>
        
        <div id="detail-dialog" style="display:none">
        	<div>
				<div>
					<span><input id="detail-user" type="text" readonly></span>
				</div>
				<div class="detail-purpose3">
					<span id="detail-purpose2">이용목적</span>
					<span><textarea id="detail-purpose" style="width:400px;" readonly ></textarea></span>
				</div>
				<div>
					<input type="button" value="종료" id="cancle-dialog2">
				</div>
			</div>   
        </div>
    </body>
</html>