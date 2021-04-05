<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    	</style>
        <title>josso</title>
         <!-- common.css 적용-->
         <link rel="stylesheet" href="resources/css/common.css" type="text/css">
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
            	var itemNumberMain = ['#itemRoom1','#itemRoom2','#itemRoom3','#itemAvante','#itemBenz'];
            	tablePrint = $('.table_location').html();
            	$.ajax({
    				url : 'userJSON',
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
    			    	            				decodeURIComponent(Itemdata[i].userName)+
    			    	            				decodeURIComponent(Itemdata[i].reservationPurpose));
    			    	            			$(itemNumberMain[e]).children(timeIdArr[j+m]).css("background-color","#00a1b9");
    			    	            			while(Itemdata[i].endTime != jQuery($(timeIdArr[j+m])).attr("class")){
    			    	            				$(itemNumberMain[e]).children(timeIdArr[j+m]).html(		
		    			    	            				decodeURIComponent(Itemdata[i].userName)+
		    			    	            				decodeURIComponent(Itemdata[i].reservationPurpose));
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
		    		    	$("#itemRoom1").children().each(function() {
		    		            var cols = $("#itemRoom1 > td:contains('" + $(this).html() + "')");
		    		            if (cols.length > 1 && ($(this).html()) != "" ) {
		    		            	cols.eq(0).attr("colspan", cols.length);
		    		            	cols.not(":eq(0)").remove();
		    		            }
		    		        });
	    	            });
	    				$(function(){
		    		    	$("#itemRoom2").children().each(function() {
		    		            var cols = $("#itemRoom2 > td:contains('" + $(this).html() + "')");
		    		            if (cols.length > 1 && ($(this).html()) != "" ) {
		    		            	cols.eq(0).attr("colspan", cols.length);
		    		            	cols.not(":eq(0)").remove();
		    		            }
		    		        });
	    	            });
	    				$(function(){
		    		    	$("#itemRoom3").children().each(function() {
		    		            var cols = $("#itemRoom3 > td:contains('" + $(this).html() + "')");
		    		            if (cols.length > 1 && ($(this).html()) != "" ) {
		    		            	cols.eq(0).attr("colspan", cols.length);
		    		            	cols.not(":eq(0)").remove();
		    		            }
		    		        });
	    	            });
	    				$(function(){
		    		    	$("#itemAvante").children().each(function() {
		    		            var cols = $("#itemAvante > td:contains('" + $(this).html() + "')");
		    		            if (cols.length > 1 && ($(this).html()) != "" ) {
		    		            	cols.eq(0).attr("colspan", cols.length);
		    		            	cols.not(":eq(0)").remove();
		    		            }
		    		        });
	    	            });
	    				$(function(){
		    		    	$("#itemBenz").children().each(function() {
		    		            var cols = $("#itemBenz > td:contains('" + $(this).html() + "')");
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
	            var itemNumberMain = ['#itemRoom1','#itemRoom2','#itemRoom3','#itemAvante','#itemBenz'];
            	$('#right-icon').click(function(){
	            	$.ajax({
	    				url : 'dateJSON',
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
	    			            $.ajax({
	    		    				url : 'userJSON',
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
				    			    	            				decodeURIComponent(Itemdata[i].userName)+
				    			    	            				decodeURIComponent(Itemdata[i].reservationPurpose));
				    			    	            			$(itemNumberMain[e]).children(timeIdArr[j+m]).css("background-color","#00a1b9");
				    			    	            			while(Itemdata[i].endTime != jQuery($(timeIdArr[j+m])).attr("class")){
				    			    	            				$(itemNumberMain[e]).children(timeIdArr[j+m]).html(		
						    			    	            				decodeURIComponent(Itemdata[i].userName)+
						    			    	            				decodeURIComponent(Itemdata[i].reservationPurpose));
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
	    				    		    	$("#itemRoom1").children().each(function() {
	    				    		            var cols = $("#itemRoom1 > td:contains('" + $(this).html() + "')");
	    				    		            if (cols.length > 1 && ($(this).html()) != "" ) {
	    				    		            	cols.eq(0).attr("colspan", cols.length);
	    				    		            	cols.not(":eq(0)").remove();
	    				    		            }
	    				    		        });
	    			    	            });
	    			    				$(function(){
	    				    		    	$("#itemRoom2").children().each(function() {
	    				    		            var cols = $("#itemRoom2 > td:contains('" + $(this).html() + "')");
	    				    		            if (cols.length > 1 && ($(this).html()) != "" ) {
	    				    		            	cols.eq(0).attr("colspan", cols.length);
	    				    		            	cols.not(":eq(0)").remove();
	    				    		            }
	    				    		        });
	    			    	            });
	    			    				$(function(){
	    				    		    	$("#itemRoom3").children().each(function() {
	    				    		            var cols = $("#itemRoom3 > td:contains('" + $(this).html() + "')");
	    				    		            if (cols.length > 1 && ($(this).html()) != "" ) {
	    				    		            	cols.eq(0).attr("colspan", cols.length);
	    				    		            	cols.not(":eq(0)").remove();
	    				    		            }
	    				    		        });
	    			    	            });
	    			    				$(function(){
	    				    		    	$("#itemAvante").children().each(function() {
	    				    		            var cols = $("#itemAvante > td:contains('" + $(this).html() + "')");
	    				    		            if (cols.length > 1 && ($(this).html()) != "" ) {
	    				    		            	cols.eq(0).attr("colspan", cols.length);
	    				    		            	cols.not(":eq(0)").remove();
	    				    		            }
	    				    		        });
	    			    	            });
	    			    				$(function(){
	    				    		    	$("#itemBenz").children().each(function() {
	    				    		            var cols = $("#itemBenz > td:contains('" + $(this).html() + "')");
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
	    				url : 'dateJSON',
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
	    		    				url : 'userJSON',
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
				    			    	            				decodeURIComponent(Itemdata[i].userName)+
				    			    	            				decodeURIComponent(Itemdata[i].reservationPurpose));
				    			    	            			$(itemNumberMain[e]).children(timeIdArr[j+m]).css("background-color","#00a1b9");
				    			    	            			while(Itemdata[i].endTime != jQuery($(timeIdArr[j+m])).attr("class")){
				    			    	            				$(itemNumberMain[e]).children(timeIdArr[j+m]).html(		
						    			    	            				decodeURIComponent(Itemdata[i].userName)+
						    			    	            				decodeURIComponent(Itemdata[i].reservationPurpose));
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
	    				    		    	$("#itemRoom1").children().each(function() {
	    				    		            var cols = $("#itemRoom1 > td:contains('" + $(this).html() + "')");
	    				    		            if (cols.length > 1 && ($(this).html()) != "" ) {
	    				    		            	cols.eq(0).attr("colspan", cols.length);
	    				    		            	cols.not(":eq(0)").remove();
	    				    		            }
	    				    		        });
	    			    	            });
	    			    				$(function(){
	    				    		    	$("#itemRoom2").children().each(function() {
	    				    		            var cols = $("#itemRoom2 > td:contains('" + $(this).html() + "')");
	    				    		            if (cols.length > 1 && ($(this).html()) != "" ) {
	    				    		            	cols.eq(0).attr("colspan", cols.length);
	    				    		            	cols.not(":eq(0)").remove();
	    				    		            }
	    				    		        });
	    			    	            });
	    			    				$(function(){
	    				    		    	$("#itemRoom3").children().each(function() {
	    				    		            var cols = $("#itemRoom3 > td:contains('" + $(this).html() + "')");
	    				    		            if (cols.length > 1 && ($(this).html()) != "" ) {
	    				    		            	cols.eq(0).attr("colspan", cols.length);
	    				    		            	cols.not(":eq(0)").remove();
	    				    		            }
	    				    		        });
	    			    	            });
	    			    				$(function(){
	    				    		    	$("#itemAvante").children().each(function() {
	    				    		            var cols = $("#itemAvante > td:contains('" + $(this).html() + "')");
	    				    		            if (cols.length > 1 && ($(this).html()) != "" ) {
	    				    		            	cols.eq(0).attr("colspan", cols.length);
	    				    		            	cols.not(":eq(0)").remove();
	    				    		            }
	    				    		        });
	    			    	            });
	    			    				$(function(){
	    				    		    	$("#itemBenz").children().each(function() {
	    				    		            var cols = $("#itemBenz > td:contains('" + $(this).html() + "')");
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
            
            $(function(){
            	$('.delete-button').click(function(){
            		alert("취소/반납 되었습니다.")
            	});
            });
        </script>
    </head>
    <body>
        <header>
            <div class="navigation">
                <ul>
                    <li>
                        <a href="#">
                        <span class="icon"><i class="fa fa-home" aria-hidden="true"></i></span>
                        <span class="icon">홈</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                        <span class="icon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
                        <span class="icon">메일</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                        <span class="icon"><i class="fas fa-list-ul fa-lg" aria-hidden="true"></i></span>
                        <span class="icon">게시판</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                        <span class="icon"><i class="fas fa-calendar-alt fa-lg" aria-hidden="true"></i></span>
                        <span class="icon">캘린더</span>
                        </a>
                    </li>
                    <li>
                        <a href="/josso/reserve">
                        <span class="icon"><i class="fas fa-clock fa-lg" aria-hidden="true"></i></span>
                        <span class="icon">예약</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                        <span class="icon"><i class="fas fa-clipboard fa-lg" aria-hidden="true"></i></span>
                        <span class="icon">결재</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                        <span class="icon"><i class="fas fa-user-friends fa-lg" aria-hidden="true"></i></span>
                        <span class="icon">조직도</span>
                        </a>
                    </li>
                
                </ul>
            </div>
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
        <!--  <nav class="border-bottom">
            
        </nav>
        -->
        
        <main>
        	<div class="d-flex">
	            <div class="mr-auto p-2">
	               	자산 예약 현황
	            </div>
	            <div class="p-2">
	                <span><i class="far fa-question-circle fa-lg" id="help_icon"></i></span>
	                <span><i class="far fa-bell fa-lg" id="bell_icon"></i></span>
	                <span><i class="fas fa-user-circle fa-lg" id="mypage_icon"></i></span>
	            </div>
	        </div>
            <div class="d-flex">
            	<span class="mr-auto p-2" id="day_day">
	            	<span><i class="fas fa-chevron-left"  id="left-icon"></i></span>
	                <span id="date_all">${dayOfWeek2}</span>
	                <span><i class="fas fa-chevron-right" id="right-icon"></i></span>
	                <span id="date_today">(오늘)</span>
                </span>
                <span class="p-2">
                    <span class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" id="button_right" data-toggle="dropdown">
                            예약 리스트
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
                <table class="table table-bordered">
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
                    <tbody class="main-table-body">
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
                        <tr class="4" id="itemAvante">
                            <th class="room-color">아반떼</th>
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
                        <tr class="5" id="itemBenz">
                            <th class="room-color">벤츠</th>
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
                <label>내 예약/대여 현황</label>
            </div>
            <div class="table_situation">
                <table class="table table-borderless">
                    <thead class="table table-bordered">
                      <tr>
                        <td scope="col" style="width: 40%">자산</td>
                        <td scope="col" style="width: 15%">이름</td>
                        <td scope="col" style="width: 30%">예약 시간(대여 시작 시간)</td>
                        <td scope="col" style="width: 15%">취소/반납</td>
                      </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="myUser" items="${myUser}">
                    		<tr>
	                    		<td><c:out value="${myUser.item[0].itemName}" /></td>
                    			<td><c:out value="${myUser.employee[0].employeeName}" /></td>
	                    		<td>
	                    			(<c:out value="${myUser.reservationStartDate}" />)<br>
	                    			<c:out value="${myUser.startTime}" /> ~ <c:out value="${myUser.endTime}" />
	                    		</td>
	                    		<td>
	                    			<button type="button" class="btn btn-danger btn-sm delete-button" onclick="location.href='/josso/delete/reserve?employeeNumber=${myUser.employeeNumber}&reservationNumber=${myUser.reservationNumber }'">
	                                    	취소/반납
	                                </button>
	                            </td>
                    		</tr>
                    	</c:forEach> 
                    </tbody>
                  </table>
            </div>
        </main>
        <footer class="border-top">

        </footer>
    </body>
</html>