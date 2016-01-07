var Seats = {
				normalNum : null,
				teenagerNum : null,
				treatmentNum : null,
				sum : null,
				price : null,
				
				initSeats : function(project) {
					$.getJSON(project+'/schedule/initSeats', function(data) {
						var row = 1;
						var seat_list = '<br>';
							$.each(data, function(index,val) {
								if (index==="seatList") {
									if (val.a!==0){
										seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
										for (var int = 0; int < val.a; int++) {
											var count = int+1;
											seat_list += '<input id="'+row+'_'+count+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+count+'"><label class="seats_seatnum" for="'+row+'_'+count+'">'+count+'</label>';
										}
										seat_list += '<br>';
									}
									row++;
									if (val.b!==0){
										seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
										for (var int = 0; int < val.a; int++) {
											var count = int+1;
											seat_list += '<input id="'+row+'_'+count+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+count+'"><label class="seats_seatnum" for="'+row+'_'+count+'">'+count+'</label>';
										}
										seat_list += '<br>';
									}
									row++;
									if (val.c!==0){
										seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
										for (var int = 0; int < val.a; int++) {
											var count = int+1;
											seat_list += '<input id="'+row+'_'+count+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+count+'"><label class="seats_seatnum" for="'+row+'_'+count+'">'+count+'</label>';
										}
										seat_list += '<br>';
									}
									row++;
									if (val.d!==0){
										seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
										for (var int = 0; int < val.a; int++) {
											var count = int+1;
											seat_list += '<input id="'+row+'_'+count+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+count+'"><label class="seats_seatnum" for="'+row+'_'+count+'">'+count+'</label>';
										}
										seat_list += '<br>';
									}
									row++;
									if (val.e!==0){
										seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
										for (var int = 0; int < val.a; int++) {
											var count = int+1;
											seat_list += '<input id="'+row+'_'+count+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+count+'"><label class="seats_seatnum" for="'+row+'_'+count+'">'+count+'</label>';
										}
										seat_list += '<br>';
									}
									row++;
									if (val.f!==0){
										seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
										for (var int = 0; int < val.a; int++) {
											var count = int+1;
											seat_list += '<input id="'+row+'_'+count+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+count+'"><label class="seats_seatnum" for="'+row+'_'+count+'">'+count+'</label>';
										}
										seat_list += '<br>';
									}
									row++;
									if (val.g!==0){
										seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
										for (var int = 0; int < val.a; int++) {
											var count = int+1;
											seat_list += '<input id="'+row+'_'+count+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+count+'"><label class="seats_seatnum" for="'+row+'_'+count+'">'+count+'</label>';
										}
										seat_list += '<br>';
									}
									row++;
									if (val.h!==0){
										seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
										for (var int = 0; int < val.a; int++) {
											var count = int+1;
											seat_list += '<input id="'+row+'_'+count+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+count+'"><label class="seats_seatnum" for="'+row+'_'+count+'">'+count+'</label>';
										}
										seat_list += '<br>';
									}
									row++;
									if (val.i!==0){
										seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
										for (var int = 0; int < val.a; int++) {
											var count = int+1;
											seat_list += '<input id="'+row+'_'+count+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+count+'"><label class="seats_seatnum" for="'+row+'_'+count+'">'+count+'</label>';
										}
										seat_list += '<br>';
									}
									row++;
									if (val.j!==0){
										seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
										for (var int = 0; int < val.a; int++) {
											var count = int+1;
											seat_list += '<input id="'+row+'_'+count+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+count+'"><label class="seats_seatnum" for="'+row+'_'+count+'">'+count+'</label>';
										}
										seat_list += '<br>';
									}
									
								/*if (val!==0) {
									seat_list += '<label class="seats_rownum" for="seats_">'+row+'열</label>';
									for (var int = 0; int < val; int++) {
										var count = int+1;
										seat_list += '<input id="'+row+'_'+count+'" class="seats_check" name="chair" type="checkbox" value="'+row+'열 '+count+'"><label class="seats_seatnum" for="'+row+'_'+count+'">'+count+'</label>';
									}
									seat_list += '<br>';
									row++;
								}*/
								
								}
							});
							$(seat_list).appendTo($('#seats_seatsblock').empty());
							$('.seats_check').click(function() {Seats.selectSeats();});
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
				book : function(project,info) {
					var movie = info.movie;
					var date = info.date;
					var time = info.time;
					var filmNumber = info.ticket.filmNumber;
					var theater = info.ticket.theaterName;
					var roomName = info.ticket.rooName;
					var startTime = info.ticket.startTime;
					alert(info+"  "+info.movie+""+info.ticket.filmNumber);
					$.ajax(project+'/ticket/book',{
						type : 'get',
						data : {
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
							alert("예매!!");
							//location.href="${context}/ticket/Ticket.do?page=Confirm";
						},
						error : function(xhr, status, msg) {
							alert('에러발생상태 : '+status+',내용:'+msg);
						}
					});
				}
		};