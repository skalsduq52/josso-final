<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
    	<style>
			.d-flex{
				font-weight: bolder;
    			font-size: 20px;
    			margin: 15px 19px;
			}
			.table{
				line-height:0;
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
			.date_all{
				font-size: 27px;
				padding: 0px 30px;
			}
			.table-bordered{
				table-layout: fixed;
			}
			.table-content-color{
				font-size: 0.7em;
				color: white;
				font-weight: bold;
			}
			.table-content-color td{
				text-overflow:ellipsis; 
				overflow:hidden;
				white-space:nowrap;
			}
			.hour-color{
				color: black;
				font-size: 1.5em;
			}
			
    	</style>
        <title>josso</title>
         <!-- navigaion.css 적용-->
         <link rel="stylesheet" href="../../resources/css/common.css" type="text/css">
         <!-- Icon -->
         <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
         crossorigin="anonymous">
         <!-- 부트스트랩 css 사용 -->
         <!-- Latest compiled and minified CSS -->
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
         <!-- jQuery library -->
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
         <!-- jquery ui-->
         <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
         <script src="//code.jquery.com/jquery.min.js"></script>
         <script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
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
		
            $(function(){
                $('#table_dialog').click(function(){
                    $('#form_dialog').dialog({
                        title : "예약 창",
                        width : 600,
                		height: 300,
                        modal : true
                   
                    });
                    $('#cancle-dialog').click(function(){
                    	$('#form_dialog').dialog("close");
                    });
                })
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
	    		            	$.ajax({
	    		    				url : 'itemJSON4',
	    		    				dataType : 'json',
	    		    				type : 'get',
	    		    				success : function(Itemdata){
	    		    					for(var k = 0; k < 7; k++){
	    			    					for(var i = 0; i < Itemdata.length; i++){
	    			    	            		if(data[count+k] == Itemdata[i].reservationStartDate ){
	    			    	            			for(var j = 0; j<timeIdArr.length; j++){
	    			    	            				if(Itemdata[i].startTime == jQuery($(timeIdArr[j])).attr("class")){
	    			    	            					var m = 0;
	    			    	            					$(timeIdArr[j+m]).children(weekClassArr[k]).html(decodeURIComponent(Itemdata[i].userName)+decodeURIComponent(Itemdata[i].reservationPurpose));
	    			    	            					$(timeIdArr[j+m]).children(weekClassArr[k]).css("background-color","silver");
	    			    	            					while(Itemdata[i].endTime != jQuery($(timeIdArr[j+m])).attr("class") || Itemdata[i].startTime != jQuery($(timeIdArr[j])).attr("class")){
	    			    	            						$(timeIdArr[j+m]).children(weekClassArr[k]).css("background-color","silver");
	    			    	            						m++;
	    			    	            					}
	    			    	            				}
	    			    	            			}
	    			    	            		}
	    			    	            	}
	    		    					}
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
	    		            	$.ajax({
	    		    				url : 'itemJSON4',
	    		    				dataType : 'json',
	    		    				type : 'get',
	    		    				success : function(Itemdata){
	    		    					for(var k = 0; k < 7; k++){
	    			    					for(var i = 0; i < Itemdata.length; i++){
	    			    	            		if(data[count+k] == Itemdata[i].reservationStartDate ){
	    			    	            			for(var j = 0; j<timeIdArr.length; j++){
	    			    	            				if(Itemdata[i].startTime == jQuery($(timeIdArr[j])).attr("class")){
	    			    	            					var m = 0;
	    			    	            					$(timeIdArr[j+m]).children(weekClassArr[k]).html(decodeURIComponent(Itemdata[i].userName)+decodeURIComponent(Itemdata[i].reservationPurpose));
	    			    	            					$(timeIdArr[j+m]).children(weekClassArr[k]).css("background-color","silver");
	    			    	            					while(Itemdata[i].endTime != jQuery($(timeIdArr[j+m])).attr("class")){
	    			    	            						$(timeIdArr[j+m]).children(weekClassArr[k]).css("background-color","silver");
	    			    	            						m++;
	    			    	            					}
	    			    	            				}
	    			    	            			}
	    			    	            		}
	    			    	            	}
	    		    					}
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
            	var weekId = ['${dayOfWeek2[0]}','${dayOfWeek2[1]}','${dayOfWeek2[2]}','${dayOfWeek2[3]}','${dayOfWeek2[4]}','${dayOfWeek2[5]}','${dayOfWeek2[6]}'];
            	var timeIdArr = ['#T0700','#T0730','#T0800','#T0830','#T0900','#T0930','#T1000','#T1030','#T1100','#T1130','#T1200','#T1230','#T1300','#T1330',
            					'#T1400','#T1430','#T1500','#T1530','#T1600','#T1630','#T1700','#T1730','#T1800','#T1830'];
            	var weekClassArr = ['.${dayOfWeek2[0]}','.${dayOfWeek2[1]}','.${dayOfWeek2[2]}','.${dayOfWeek2[3]}','.${dayOfWeek2[4]}','.${dayOfWeek2[5]}','.${dayOfWeek2[6]}'];
            	$.ajax({
    				url : 'itemJSON4',
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
	    	            						decodeURIComponent(Itemdata[i].userName)+
	    	            						decodeURIComponent(Itemdata[i].reservationPurpose));
	    	            					$(timeIdArr[j+m]).children(weekClassArr[k]).css("background-color","silver");
	    	            					while(Itemdata[i].endTime != jQuery($(timeIdArr[j+m])).attr("class")){
	    	            						$(timeIdArr[j+m]).children(weekClassArr[k]).css("background-color","silver");
	    	            						m++;
	    	            					}
	    	            				}
	    	            			}
	    	            		}
	    	            	}
    					}
    				},
					error : function(request, satus, errorData){
						alert("error code : " + request.status + "\n"
								+ "message : " + request.responseText
								+"\n" + "error : " + errorData);
					}
    			});
            });
            
            $(function(){
            	$('#submit-dialog').click(function(){
            		var success = ('#submit-success').val();
            		console.log(success);
            		if(success == 1){
            			alert("예약 완료했습니다.");
            		}else if(success == -1){
            			alert("값을 입력하지 않으셨습니다.");
            		}else if(success == -2){
            			alert("같은 시간을 선택하셨습니다.");
            		}else if(success == 0){
            			alert("이미 예약된 시간입니다.")
            		}
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
                                    	<a href="/josso/reserve/car?itemNumber=4">
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
     	<nav class="border-bottom">
     		<div class="d-flex">
	            <div class="mr-auto p-2">
	               	아반떼_그룹&josso
	            </div>
	            <div class="p-2">
	                <span><i class="far fa-question-circle fa-lg" id="help_icon"></i></span>
	                <span><i class="far fa-bell fa-lg" id="bell_icon"></i></span>
	                <span><i class="fas fa-user-circle fa-lg" id="mypage_icon"></i></span>
	            </div>
	        </div>
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
                <table class="table table-bordered" id="table_dialog">
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
                    <tbody class="table-content-color">
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

        <footer class="border-top">

        </footer>
        
        <div id="form_dialog" style="display:none">
            <form action="reservation4" method="GET">
                <div>
                	<div>
	                    <span>예약일</span>
	                    <span>
	                    	<input id="datepickerFirst" type="text" name="reservationStartDate" readonly>
	                    </span>
                    </div>
                    <div>
                    	<span>예약시간</span>
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
                    <div>
                    	<span>예약자</span>
                    	<span><input type="text" name="userNumber"></span>
                	</div>
                	<div>
                    	<span>이용목적</span>
                    	<span><input type="text" name="reservationPurpose"></span>
                	</div>
                	<div>
                		<input type="text" name="itemNumber" value="4" readonly style="display:none">
                	</div>
                	<div>
                		<input type="submit" value="제출" id="submit-dialog">
                		<input type="button" value="취소" id="cancle-dialog">
                	</div>
                	
                </div>   
            </form>
        </div>
    </body>
</html>