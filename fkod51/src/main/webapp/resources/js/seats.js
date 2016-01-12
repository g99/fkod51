var Seats = {
				normalNum : null,
				teenagerNum : null,
				treatmentNum : null,
				sum : null,
				price : null,
				
				initSeats : function(project,ticket_data) {
					alert("이닛시트 - 룸네임 :"+ticket_data.ticket.roomName);
					$.ajax(project+'/schedule/initSeats', {
						type : 'get',
						data : {
							movie : ticket_data.movie,
							date : ticket_data.date,
							time : ticket_data.time,
							filmNumber : ticket_data.ticket.filmNumber,
							theater : ticket_data.theater,
							roomName : ticket_data.ticket.roomName,
							startTime : ticket_data.ticket.startTime
						},
						async : true,
						dataType : 'json',
						success : function(data) {
							var row = 1;
							var seat_list = '<br>';
							if (data.seatList.a!==0) {
								seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
								$.each(data.aArr, function(index,val) {
									var col = index+1;
									if (val===false) {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'"><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									} else {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'" disabled><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									}
								});
								seat_list += '<br>';
							}
							row++;
							if (data.seatList.b!==0) {
								seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
								$.each(data.bArr, function(index,val) {
									var col = index+1;
									if (val===false) {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'"><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									} else {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'" disabled><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									}
								});
								seat_list += '<br>';
							}
							row++;
							if (data.seatList.c!==0) {
								seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
								$.each(data.cArr, function(index,val) {
									var col = index+1;
									if (val===false) {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'"><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									} else {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'" disabled><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									}
								});
								seat_list += '<br>';
							}
							row++;
							if (data.seatList.d!==0) {
								seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
								$.each(data.dArr, function(index,val) {
									var col = index+1;
									if (val===false) {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'"><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									} else {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'" disabled><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									}
								});
								seat_list += '<br>';
							}
							row++;
							if (data.seatList.e!==0) {
								seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
								$.each(data.eArr, function(index,val) {
									var col = index+1;
									if (val===false) {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'"><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									} else {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'" disabled><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									}
								});
								seat_list += '<br>';
							}
							row++;
							if (data.seatList.f!==0) {
								seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
								$.each(data.fArr, function(index,val) {
									var col = index+1;
									if (val===false) {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'"><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									} else {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'" disabled><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									}
								});
								seat_list += '<br>';
							}
							row++;
							if (data.seatList.g!==0) {
								seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
								$.each(data.gArr, function(index,val) {
									var col = index+1;
									if (val===false) {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'"><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									} else {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'" disabled><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									}
								});
								seat_list += '<br>';
							}
							row++;
							if (data.seatList.h!==0) {
								seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
								$.each(data.hArr, function(index,val) {
									var col = index+1;
									if (val===false) {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'"><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									} else {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'" disabled><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									}
								});
								seat_list += '<br>';
							}
							row++;
							if (data.seatList.i!==0) {
								seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
								$.each(data.iArr, function(index,val) {
									var col = index+1;
									if (val===false) {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'"><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									} else {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'" disabled><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									}
								});
								seat_list += '<br>';
							}
							row++;
							if (data.seatList.j!==0) {
								seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
								$.each(data.jArr, function(index,val) {
									var col = index+1;
									if (val===false) {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'"><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									} else {
										seat_list += '<input id="'+row+'_'+col+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+col+'" disabled><label class="seats_seatnum" for="'+row+'_'+col+'">'+col+'</label>';
									}
								});
								seat_list += '<br>';
							}
							row++;
							$(seat_list).appendTo($('#seats_seatsblock').empty());
							$('.seats_check').click(function() {Seats.selectSeats();});
						},
						error : function(xhr, status, msg) {
							alert('에러발생상태 : '+status+',내용:'+msg);
						}
					});
				},
				selectSeats : function() {
					var checklistNum = $('input:checkbox:checked').length;
					var checklist = $('input:checkbox:checked').map(function() {return this.value;}).get().join(',');
					var seat_num ='<h5 style="display: inline-block;margin: 0;">'+checklist+'</h5>';	
					$(seat_num).appendTo($('#seat_num').empty());
					if (checklistNum===sum) {
						$('#seats_seatsblock').children().prop('disabled',true);
						alert("좌석을 모두 선택하셨습니다.");
					}
					
				},
				seats_number : function() {
					normalNum = Number($("select[name=normal] option:selected").val());
					teenagerNum = Number($("select[name=teenager] option:selected").val());
					treatmentNum = Number($("select[name=treatment] option:selected").val());
					sum = normalNum+teenagerNum+treatmentNum;
					price = normalNum*10000 + teenagerNum*7000 + treatmentNum*4000;
					var ea ='<h5 style="display: inline-block;margin: 0;">일반'+normalNum+'명</h5><h5 style="display: inline-block;margin: 0;">청소년'+teenagerNum+'명</h5><h5 style="display: inline-block;margin: 0;">우대'+treatmentNum+'명</h5>';	
					$(ea).appendTo($('#ea').empty());
				},
				seats_cal : function() {
					var normal_cal ='<h5 style="display: inline-block;margin: 0;">10,000원 X '+normalNum+'</h5>';
					$(normal_cal).appendTo($('#normal_cal').empty());
					var teenager_cal ='<h5 style="display: inline-block;margin: 0;">7,000원 X '+teenagerNum+'</h5>';
					$(teenager_cal).appendTo($('#teenager_cal').empty());
					var treatment_cal ='<h5 style="display: inline-block;margin: 0;">4,000원 X '+treatmentNum+'</h5>';
					$(treatment_cal).appendTo($('#treatment_cal').empty());
					var total_cal ='<h5 style="display: inline-block;margin: 0;">'+price+'</h5>';
					$(total_cal).appendTo($('#total_cal').empty());
				},

				book : function(project,info,mem_id) {
					var movie = info.movie;
					var date = info.date;
					var time = info.time;
					var filmNumber = info.ticket.filmNumber;
					var theater = info.theater;
					var roomName = info.ticket.roomName;
					var startTime = info.ticket.startTime;
					var id = mem_id;
					alert(info+"  "+info.movie+""+info.ticket.filmNumber+"룸네임"+info.ticket.roomName+"날짜"+info.date+"시작시간"+info.ticket.startTime);
					alert($('input:checkbox:checked').map(function() {return this.value;}).get().join(','));
					$.ajax(project+'/ticket/book',{
						type : 'get',
						data : {
							id : id,
							movie : movie,
							date : date,
							time : time,
							filmNumber : filmNumber,
							theater : theater,
							roomName : roomName,
							startTime : startTime,
							adult : Number($("select[name=normal] option:selected").val()),
							teenager : Number($("select[name=teenager] option:selected").val()),
							old_man : Number($("select[name=treatment] option:selected").val()),
							price :	Number($("select[name=normal] option:selected").val())*10000 + Number($("select[name=teenager] option:selected").val())*7000 + Number($("select[name=treatment] option:selected").val())*4000,
							seat_number : $('input:checkbox:checked').map(function() {return this.value;}).get().join(',')
						},
						async : true,
						dataType : 'json',
						success : function(data) {
							//location.href="${context}/ticket/Ticket.do?page=Confirm";
							var confirm = '<div class="container"><div class="row"><div class="col-lg-12 text-center"><h2 class="margin-top-0 text-primary">예매가 성공적으로 완료되었습니다.</h2></div></div></div><div class="container"><div class="row"><div class="col-lg-12 text-center"><h4>예매번호 : '+data.ticketNumber+'</h4></div></div></div><div class="container"><div class="row"><div class="col-lg-12 text-center"><div><label id="continue" style="font-size: 20px">계속하기</label></div></div></div></div>';
							$(confirm).appendTo($('#three').empty());
							$('#continue').click(function() {
								tabs.make();
						    	Ticket.main();
								Ticket.initList(project);
								});
						},
						error : function(xhr, status, msg) {
							alert('에러발생상태 : '+status+',내용:'+msg);
						}
					});
				}
		};