<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <style>
			.d-flex{
				font-weight: bolder;
    			font-size: 20px;
    			margin: 15px 19px;
			}
			.table_situation{
				font-size: 13px;	
			}
			.write_situation{
				margin: 10px 25px;
				padding-top: 10px;
   	 			padding-bottom: 10px;
   	 			font-weight: bold;
			}
			#day_day{
				margin-left: 350px;
			}
			#button_right{
				background: #00a1b9;
			}
			#help_icon{
				margin-right: 10px;
				
			}
			#bell_icon{
				margin-right: 10px;
			}
			#left_icon{
				font-size: 17px;
			}
			#right_icon{
				font-size: 17px;
			}
			#date_all{
				font-size: 27px;
				padding: 0px 30px;
			}
			#date_today{
				font-size: 14px;
				font-weight: normal;
				padding: 0px 30px;
			}
			.table-bordered{
				table-layout: fixed;
			}
			.main-table-body{
				font-size: 0.7em;
				color: white;
				font-weight: bold;
			}
			.main-table-body td{
				text-overflow:ellipsis; 
				overflow:hidden;
				white-space:nowrap;
			}
			.room-color{
				color: black;
				font-size: 1.5em;
			}
			#detail-day{
			border:none;width:110px;margin-top: 5px;margin-left: 170px;margin-right: 170px;
			}
			#detail-user{
			border:none;width:200px;margin-left: 150px;margin-right: 120px;margin-top: 5px;
			}
			.detail-purpose3{
			margin-left: 30px;margin-right: 30px;margin-top: 10px;
			}
			#detail-purpose2{
			padding-left: 160px;
			}
			#cancle-dialog{
			margin-left: 380px;margin-top: 20px;
			}
    	</style>
        <title>josso</title>
         <!-- navigaion.css 적용-->
         <link rel="stylesheet" href="../resources/css/common.css" type="text/css">
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
            
            var tablePrint;
            $(function(){
            	var timeIdArr = ['#T0700','#T0730','#T0800','#T0830','#T0900','#T0930','#T1000','#T1030','#T1100','#T1130','#T1200','#T1230','#T1300','#T1330',
            					'#T1400','#T1430','#T1500','#T1530','#T1600','#T1630','#T1700','#T1730','#T1800','#T1830'];
            	var dayOfWeek2 = '${dayOfWeek2 }';
            	var itemNumberMain = ['#itemRoom1','#itemRoom2','#itemRoom3'];
            	tablePrint = $('.table_location').html();
            	$.ajax({
    				url : '/josso/userRoomJSON',
    				dataType : 'json',
    				type : 'get',
    				success : function(Itemdata){
	    				for(var i = 0; i < Itemdata.length; i++){
	    	            	if(dayOfWeek2 == Itemdata[i].reservationStartDate){
	    	            		for(var j = 0; j<timeIdArr.length; j++){
	    	            			if(Itemdata[i].startTime == jQuery($(timeIdArr[j])).attr("class")){
	    	            				for(var e = 0; e<itemNumberMain.length; e++){
			    	            			if(Itemdata[i].itemNumber == jQuery($(itemNumberMain[e])).attr("class")){
    			    	            			var m = 0;
    			    	            			$(itemNumberMain[e]).children(timeIdArr[j+m]).html(
    			    	            				'<span class="user-name">'+decodeURIComponent(Itemdata[i].userName)+' '
    			    	            				+Itemdata[i].startTime+' ~ '
    	    			    	            		+Itemdata[i].endTime+'</span>'+' ('
    	    			    	            		+'<span class="user-purpose">'+decodeURIComponent(Itemdata[i].reservationPurpose)+'</span>'+')');
    			    	            			$(itemNumberMain[e]).children(timeIdArr[j+m]).css("background-color","#00a1b9");
    			    	            			while(Itemdata[i].endTime != jQuery($(timeIdArr[j+m])).attr("class")){
    			    	            				$(itemNumberMain[e]).children(timeIdArr[j+m]).html(	
    			    	            						'<span class="user-name">'+decodeURIComponent(Itemdata[i].userName)+' '
    	    			    	            				+Itemdata[i].startTime+' ~ '
    	    	    			    	            		+Itemdata[i].endTime+'</span>'+' ('
    	    	    			    	            		+'<span class="user-purpose">'+decodeURIComponent(Itemdata[i].reservationPurpose)+'</span>'+')');
    			    	            				$(itemNumberMain[e]).children(timeIdArr[j+m]).css("background-color","#00a1b9");
    			    	            				m++;
    			    	            			}
			    	            			}
		    	            			}
	    	            			}
	    	            		}
	    	            	}
	    	            }
	    				$(function(){
		    		    	$("#itemRoom1").children().children('.user-name').each(function() {
		    		            var cols = $("#itemRoom1 > td:contains('" + $(this).html() + "')");
		    		            if (cols.length > 1 && ($(this).html()) != "" ) {
		    		            	cols.eq(0).attr("colspan", cols.length);
		    		            	cols.not(":eq(0)").remove();
		    		            }
		    		        });
	    	            });
	    				$(function(){
		    		    	$("#itemRoom2").children().children('.user-name').each(function() {
		    		            var cols = $("#itemRoom2 > td:contains('" + $(this).html() + "')");
		    		            if (cols.length > 1 && ($(this).html()) != "" ) {
		    		            	cols.eq(0).attr("colspan", cols.length);
		    		            	cols.not(":eq(0)").remove();
		    		            }
		    		        });
	    	            });
	    				$(function(){
	    					$("#itemRoom3").children().children('.user-name').each(function() {
		    		            var cols = $("#itemRoom3 > td:contains('" + $(this).html() + "')");
		    		            if (cols.length > 1 && ($(this).html()) != "" ) {
		    		            	cols.eq(0).attr("colspan", cols.length);
		    		            	cols.not(":eq(0)").remove();
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
            	var count = 0;
            	var timeIdArr = ['#T0700','#T0730','#T0800','#T0830','#T0900','#T0930','#T1000','#T1030','#T1100','#T1130','#T1200','#T1230','#T1300','#T1330',
					'#T1400','#T1430','#T1500','#T1530','#T1600','#T1630','#T1700','#T1730','#T1800','#T1830'];
	            var itemNumberMain = ['#itemRoom1','#itemRoom2','#itemRoom3'];
            	$('#right-icon').click(function(){
	            	$.ajax({
	    				url : '/josso/dateJSON',
	    				dataType : 'json',
	    				type : 'get',
	    				success : function(data){
	    					if(data[count+1] != null){
	    			            $('#date_all').html(data[count+1]);
	    			            $('#date_today').html("");
	    			            $(".main-table-body *").css("background-color","white");
	    		            	$(".main-table-body").children("tr").children("td").empty();
	    		            	$('.table-print').remove();
	    		            	$('.table_location').html(tablePrint);
	    		            	console.log(tablePrint);
	    			            $.ajax({
	    		    				url : '/josso/userRoomJSON',
	    		    				dataType : 'json',
	    		    				type : 'get',
	    		    				success : function(Itemdata){
	    			    				for(var i = 0; i < Itemdata.length; i++){
	    			    	            	if(data[count] == Itemdata[i].reservationStartDate){
		    			    	            	for(var j = 0; j<timeIdArr.length; j++){
		    			    	            		if(Itemdata[i].startTime == jQuery($(timeIdArr[j])).attr("class")){
		    			    	            			for(var e = 0; e<itemNumberMain.length; e++){
			    			    	            			if(Itemdata[i].itemNumber == jQuery($(itemNumberMain[e])).attr("class")){
				    			    	            			var m = 0;
				    			    	            			$(itemNumberMain[e]).children(timeIdArr[j+m]).html(		
				    			    	            					'<span class="user-name">'+decodeURIComponent(Itemdata[i].userName)+' '
				        			    	            				+Itemdata[i].startTime+' ~ '
				        	    			    	            		+Itemdata[i].endTime+'</span>'+' ('
				        	    			    	            		+'<span class="user-purpose">'+decodeURIComponent(Itemdata[i].reservationPurpose)+'</span>'+')');
				    			    	            			$(itemNumberMain[e]).children(timeIdArr[j+m]).css("background-color","#00a1b9");
				    			    	            			while(Itemdata[i].endTime != jQuery($(timeIdArr[j+m])).attr("class")){
				    			    	            				$(itemNumberMain[e]).children(timeIdArr[j+m]).html(		
				    			    	            						'<span class="user-name">'+decodeURIComponent(Itemdata[i].userName)+' '
				    	    			    	            				+Itemdata[i].startTime+' ~ '
				    	    	    			    	            		+Itemdata[i].endTime+'</span>'+' ('
				    	    	    			    	            		+'<span class="user-purpose">'+decodeURIComponent(Itemdata[i].reservationPurpose)+'</span>'+')');
				    			    	            				$(itemNumberMain[e]).children(timeIdArr[j+m]).css("background-color","#00a1b9");
				    			    	            				m++;
				    			    	            			}
			    			    	            			}
		    			    	            			}
		    			    	            		}
		    			    	            	}
	    			    	            	}
	    			    	            }
	    			    				$(function(){
	    				    		    	$("#itemRoom1").children().children('.user-name').each(function() {
	    				    		            var cols = $("#itemRoom1 > td:contains('" + $(this).html() + "')");
	    				    		            if (cols.length > 1 && ($(this).html()) != "" ) {
	    				    		            	cols.eq(0).attr("colspan", cols.length);
	    				    		            	cols.not(":eq(0)").remove();
	    				    		            }
	    				    		        });
	    			    	            });
	    			    				$(function(){
	    				    		    	$("#itemRoom2").children().children('.user-name').each(function() {
	    				    		            var cols = $("#itemRoom2 > td:contains('" + $(this).html() + "')");
	    				    		            if (cols.length > 1 && ($(this).html()) != "" ) {
	    				    		            	cols.eq(0).attr("colspan", cols.length);
	    				    		            	cols.not(":eq(0)").remove();
	    				    		            }
	    				    		        });
	    			    	            });
	    			    				$(function(){
	    				    		    	$("#itemRoom3").children().children('.user-name').each(function() {
	    				    		            var cols = $("#itemRoom3 > td:contains('" + $(this).html() + "')");
	    				    		            if (cols.length > 1 && ($(this).html()) != "" ) {
	    				    		            	cols.eq(0).attr("colspan", cols.length);
	    				    		            	cols.not(":eq(0)").remove();
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
	    		            }else if(data[count+1] == null){
		    		            alert("날짜가 없습니다.");
		    		            count -= 1;
		    		        }
		    		        count += 1;
	    				},
						error : function(request, satus, errorData){
							alert("error code : " + request.status + "\n"
									+ "message : " + request.responseText
									+"\n" + "error : " + errorData);
						}
	    			});
    			});
	            $('#left-icon').click(function(){
	            	$.ajax({
	    				url : '/josso/dateJSON',
	    				dataType : 'json',
	    				type : 'get',
	    				success : function(data){
	    					count -= 1;
	    					if(data[count] != null){
	    						$('#date_all').html(data[count]);
	    						if(count == 0){
	    							$('#date_today').html("(오늘)");
	    						}
	    						$(".main-table-body *").css("background-color","white");
	    		            	$(".main-table-body").children("tr").children("td").empty();
	    		            	$('.table-print').remove();
	    		            	$('.table_location').html(tablePrint);
	    		            	$.ajax({
	    		    				url : '/josso/userRoomJSON',
	    		    				dataType : 'json',
	    		    				type : 'get',
	    		    				success : function(Itemdata){
	    			    				for(var i = 0; i < Itemdata.length; i++){
	    			    	            	if(data[count] == Itemdata[i].reservationStartDate){
	    			    	            		for(var j = 0; j<timeIdArr.length; j++){
	    			    	            			if(Itemdata[i].startTime == jQuery($(timeIdArr[j])).attr("class")){
	    			    	            				for(var e = 0; e<itemNumberMain.length; e++){
			    			    	            			if(Itemdata[i].itemNumber == jQuery($(itemNumberMain[e])).attr("class")){
				    			    	            			var m = 0;
				    			    	            			$(itemNumberMain[e]).children(timeIdArr[j+m]).html(		
				    			    	            					'<span class="user-name">'+decodeURIComponent(Itemdata[i].userName)+' '
				        			    	            				+Itemdata[i].startTime+' ~ '
				        	    			    	            		+Itemdata[i].endTime+'</span>'+' ('
				        	    			    	            		+'<span class="user-purpose">'+decodeURIComponent(Itemdata[i].reservationPurpose)+'</span>'+')');
				    			    	            			$(itemNumberMain[e]).children(timeIdArr[j+m]).css("background-color","#00a1b9");
				    			    	            			while(Itemdata[i].endTime != jQuery($(timeIdArr[j+m])).attr("class")){
				    			    	            				$(itemNumberMain[e]).children(timeIdArr[j+m]).html(		
				    			    	            						'<span class="user-name">'+decodeURIComponent(Itemdata[i].userName)+' '
				    	    			    	            				+Itemdata[i].startTime+' ~ '
				    	    	    			    	            		+Itemdata[i].endTime+'</span>'+' ('
				    	    	    			    	            		+'<span class="user-purpose">'+decodeURIComponent(Itemdata[i].reservationPurpose)+'</span>'+')');
				    			    	            				$(itemNumberMain[e]).children(timeIdArr[j+m]).css("background-color","#00a1b9");
				    			    	            				m++;
				    			    	            			}
			    			    	            			}
		    			    	            			}
	    			    	            			}
	    			    	            		}
	    			    	            	}
	    			    	            }
	    			    				$(function(){
	    				    		    	$("#itemRoom1").children().children('.user-name').each(function() {
	    				    		            var cols = $("#itemRoom1 > td:contains('" + $(this).html() + "')");
	    				    		            if (cols.length > 1 && ($(this).html()) != "" ) {
	    				    		            	cols.eq(0).attr("colspan", cols.length);
	    				    		            	cols.not(":eq(0)").remove();
	    				    		            }
	    				    		        });
	    			    	            });
	    			    				$(function(){
	    				    		    	$("#itemRoom2").children().children('.user-name').each(function() {
	    				    		            var cols = $("#itemRoom2 > td:contains('" + $(this).html() + "')");
	    				    		            if (cols.length > 1 && ($(this).html()) != "" ) {
	    				    		            	cols.eq(0).attr("colspan", cols.length);
	    				    		            	cols.not(":eq(0)").remove();
	    				    		            }
	    				    		        });
	    			    	            });
	    			    				$(function(){
	    				    		    	$("#itemRoom3").children().children('.user-name').each(function() {
	    				    		            var cols = $("#itemRoom3 > td:contains('" + $(this).html() + "')");
	    				    		            if (cols.length > 1 && ($(this).html()) != "" ) {
	    				    		            	cols.eq(0).attr("colspan", cols.length);
	    				    		            	cols.not(":eq(0)").remove();
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
	    		            }else if(data[count] == null){
	    		            	alert("날짜가 없습니다.");
	    		            	count += 1;
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
            
            /*페이지를 옮겼을때 이벤트가 날아가버려서 서류페이지 자체에다가 이벤트를 걸어놓는곳 */
            $(document).on('click','.table-dialog > tr > td',function(){
            	var str = $('#date_all').text();
            	var str1 = $(this).children('.user-name').text();
				var str2 = $(this).children('.user-purpose').text();
            	$('#detail-day').val(str);
            	$('#detail-user').val(str1);
            	$('#detail-purpose').val(str2);
            	
            	$('#detail-dialog').dialog({
                    title : "예약 상세 내용",
                    width : 500,
            		height: 300,
                    modal : true
                }).prev(".ui-dialog-titlebar").css("background","#B0E0E6");
                $('#cancle-dialog').click(function(){
                	$('#detail-dialog').dialog("close");
                });
            });
        </script>
    </head>
    <body>
        <header>
            <%@ include file="../include/header.jsp"%>
        </header>
        <aside class="border-right">
            <div>
                <section>
                    <div class="title">
                        <span class="icon"><i class="fas fa-clock fa-lg" aria-hidden="true"></i>예약</span>
                    </div>
                </section>
                <section>
                    <div class="title_button">
                        <span>전자자산</span>
                    </div>
                </section>
                <section>
                    <div class="side_title">
                        <ul>
                            <li>
                                <span class="hover_icon"><i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                                    	<a href="/josso/reserve/room">
                                    		회의실(사옥)
                                    	</a>
                                </span>
                            </li>
                           <li class="hover_tag">
                                <a href="/josso/reserve/room/first?itemNumber=1">
                                    1회의실
                                </a>
                            </li>
                            <li class="hover_tag">
                                <a href="/josso/reserve/room/second?itemNumber=2">
                                    2회의실
                                </a>
                            </li>
                            <li class="hover_tag">
                                <a href="/josso/reserve/room/third?itemNumber=3">
                                    3회의실
                                </a>
                            </li>
                        </ul>
                        <ul>
                            <li>
                                <span class="hover_icon"><i class="fas fa-sort-down fa-rotate-270" style="color:gray"></i>
                                    	<a href="/josso/reserve/car">
                                    		공용차량
                                    	</a>
                                </span>
                            </li>
                            <li class="hover_tag">
                                <a href="/josso/reserve/car/avante?itemNumber=4">
                                    	아반떼
                                </a>
                            </li>
                            <li class="hover_tag">
                                <a href="/josso/reserve/car/benz?itemNumber=5">
                                    	벤츠
                                </a>
                            </li>
                        </ul>
                    </div>
                </section>
            </div>
        </aside>
        <!-- <nav class="border-bottom">
           
        </nav> -->
        
        <main>
        	<div class="d-flex">
	            <div class="mr-auto p-2">
	               	회의실(사옥)
	            </div>
	            <div class="p-2">
	                <span><i class="far fa-question-circle fa-lg" id="help_icon"></i></span>
	                <span><i class="far fa-bell fa-lg" id="bell_icon"></i></span>
	                <span><i class="fas fa-user-circle fa-lg" id="mypage_icon"></i></span>
	            </div>
	        </div>
            <div class="d-flex">
            	<span class="mr-auto p-2" id="day_day">
	            	<span><i class="fas fa-chevron-left" id="left-icon"></i></span>
	                <span id="date_all">${dayOfWeek2}</span>
	                <span><i class="fas fa-chevron-right" id="right-icon"></i></span>
	                <span id="date_today">(오늘)</span>
                </span>
               <span class="p-2">
                    <span class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" id="button_right" data-toggle="dropdown">
                            회의실 사옥
                        </button>
                        <span class="dropdown-menu">
                        	<a class="dropdown-item" href="/josso/reserve">예약 리스트</a>
                            <a class="dropdown-item" href="/josso/reserve/room">회의실 사옥</a>
                            <a class="dropdown-item" href="/josso/reserve/car">차량대여</a>
                        </span>
                    </span>
                </span>
            </div>
            <div class="table_location">
                <!-- java에서 for문으로 바꾸기 -->
                <table class="table table-bordered table-print">
                    <thead>
                        <tr class="table-info" style="text-align: center" >
                            <th scope="col"  width="10%"></th>
                            <th colspan="2" scope="col" width="7.5%">07</th>
                            <th colspan="2" scope="col" width="7.5%">08</th>
                            <th colspan="2" scope="col" width="7.5%">09</th>
                            <th colspan="2" scope="col" width="7.5%">10</th>
                            <th colspan="2" scope="col" width="7.5%">11</th>
                            <th colspan="2" scope="col" width="7.5%">12</th>
                            <th colspan="2" scope="col" width="7.5%">13</th>
                            <th colspan="2" scope="col" width="7.5%">14</th>
                            <th colspan="2" scope="col" width="7.5%">15</th>
                            <th colspan="2" scope="col" width="7.5%">16</th>
                            <th colspan="2" scope="col" width="7.5%">17</th>
                            <th colspan="2" scope="col" width="7.5%">18</th>
                        </tr>
                    </thead>
                    <tbody class="main-table-body table-dialog">
                        <tr class="1" id="itemRoom1">
                            <th class="room-color">1회의실</th>
                            <td class="700" id="T0700"></td>
                            <td class="730" id="T0730"></td>
                            <td class="800" id="T0800"></td>
                            <td class="830" id="T0830"></td>
                            <td class="900" id="T0900"></td>
                            <td class="930" id="T0930"></td>
                            <td class="1000" id="T1000"></td>
                            <td class="1030" id="T1030"></td>
                            <td class="1100" id="T1100"></td>
                            <td class="1130" id="T1130"></td>
                            <td class="1200" id="T1200"></td>
                            <td class="1230" id="T1230"></td>
                            <td class="1300" id="T1300"></td>
                            <td class="1330" id="T1330"></td>
                            <td class="1400" id="T1400"></td>
                            <td class="1430" id="T1430"></td>
                            <td class="1500" id="T1500"></td>
                            <td class="1530" id="T1530"></td>
                            <td class="1600" id="T1600"></td>
                            <td class="1630" id="T1630"></td>
                            <td class="1700" id="T1700"></td>
                            <td class="1730" id="T1730"></td>
                            <td class="1800" id="T1800"></td>
                            <td class="1830" id="T1830"></td>
                        </tr>
                        <tr class="2" id="itemRoom2">
                            <th class="room-color">2회의실</th>
                            <td class="700" id="T0700"></td>
                            <td class="730" id="T0730"></td>
                            <td class="800" id="T0800"></td>
                            <td class="830" id="T0830"></td>
                            <td class="900" id="T0900"></td>
                            <td class="930" id="T0930"></td>
                            <td class="1000" id="T1000"></td>
                            <td class="1030" id="T1030"></td>
                            <td class="1100" id="T1100"></td>
                            <td class="1130" id="T1130"></td>
                            <td class="1200" id="T1200"></td>
                            <td class="1230" id="T1230"></td>
                            <td class="1300" id="T1300"></td>
                            <td class="1330" id="T1330"></td>
                            <td class="1400" id="T1400"></td>
                            <td class="1430" id="T1430"></td>
                            <td class="1500" id="T1500"></td>
                            <td class="1530" id="T1530"></td>
                            <td class="1600" id="T1600"></td>
                            <td class="1630" id="T1630"></td>
                            <td class="1700" id="T1700"></td>
                            <td class="1730" id="T1730"></td>
                            <td class="1800" id="T1800"></td>
                            <td class="1830" id="T1830"></td>
                        </tr>
                        <tr class="3" id="itemRoom3">
                            <th class="room-color">3회의실</th>
                            <td class="700" id="T0700"></td>
                            <td class="730" id="T0730"></td>
                            <td class="800" id="T0800"></td>
                            <td class="830" id="T0830"></td>
                            <td class="900" id="T0900"></td>
                            <td class="930" id="T0930"></td>
                            <td class="1000" id="T1000"></td>
                            <td class="1030" id="T1030"></td>
                            <td class="1100" id="T1100"></td>
                            <td class="1130" id="T1130"></td>
                            <td class="1200" id="T1200"></td>
                            <td class="1230" id="T1230"></td>
                            <td class="1300" id="T1300"></td>
                            <td class="1330" id="T1330"></td>
                            <td class="1400" id="T1400"></td>
                            <td class="1430" id="T1430"></td>
                            <td class="1500" id="T1500"></td>
                            <td class="1530" id="T1530"></td>
                            <td class="1600" id="T1600"></td>
                            <td class="1630" id="T1630"></td>
                            <td class="1700" id="T1700"></td>
                            <td class="1730" id="T1730"></td>
                            <td class="1800" id="T1800"></td>
                            <td class="1830" id="T1830"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="write_situation">
                <span >
                	자산별 상세 정보
                </span>
            </div>
            <div>
                <table class="table table-borderless">
                    <thead class="table table-bordered">
                      <tr>
                        <td scope="col">항목</td>
                        <td scope="col">예약</td>
                      </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style="font-size:15px">1회의실_1층_20명</td>
                            <td>
                                <button type="button" class="btn btn-danger btn-sm" onclick="location.href='/josso/reserve/room/first?itemNumber=1'">
                                    	예약
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size:15px">2회의실_1층_8명</td>
                            <td>
                                <button type="button" class="btn btn-danger btn-sm" onclick="location.href='/josso/reserve/room/second?itemNumber=2'">
                                    	예약
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td style="font-size:15px">3회의실_2층_4명</td>
                            <td>
                                <button type="button" class="btn btn-danger btn-sm" onclick="location.href='/josso/reserve/room/third?itemNumber=3'">
                                    	예약
                                </button>
                            </td>
                        </tr>
                    </tbody>
                  </table>
            </div>
        </main>
        <div id="detail-dialog" style="display:none">
        	<div>
            	<div>
					<span>
						<input id="detail-day" type="text" readonly>
					</span>
				</div>
				<div>
					<span><input id="detail-user" type="text" readonly></span>
				</div>
				<div class="detail-purpose3">
					<span id="detail-purpose2">이용목적</span>
					<span><textarea id="detail-purpose" style="width:400px;" readonly ></textarea></span>
				</div>
				<div>
					<input type="button" value="종료" id="cancle-dialog">
				</div>
			</div>   
        </div>
</body>
</html>