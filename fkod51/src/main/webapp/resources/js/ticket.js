var Ticket = {
				movie : null,
				theater : null,
				date : null,
				time : null,
				$movieratelist : null,
				$movieasclist : null,
				$theaterlist : null,
				$datelist : null,
				
				main : function() {
					tabs.make();
					/*var sheet = document.createElement('style');
					sheet.innerHTML = '.tabs li{list-style:none;display:inline}.tabs a{padding:5px 10px;display:inline-block;background:#666;color:#fff;text-decoration:none}.tabs a.active{background:#fff;color:#000}';
					document.body.appendChild(sheet);*/
					var main = '<div class="container"><div class="row"><div class="col-lg-12 text-center"><h2 class="margin-top-0 text-primary">예매하기</h2></div></div></div><div class="container"><div class="row" style="background: #36333D;"><div class="col-lg-3 col-md-8 text-center" style="background:#2D2D2D; height:100%;"><div class="feature"><h3>영화</h3><hr class="primary"><ul class="nav nav-tabs"><li class="active"><a data-toggle="tab" href="#tab1" style="padding: 5px;">예매율</a></li><li><a data-toggle="tab" href="#tab2" style="padding: 5px;">가나다</a></li></ul><div class="tab-content"><div id="tab1" class="tab-pane fade in active ticket_sub"><h3>예매율순</h3></div><div id="tab2" class="tab-pane fade ticket_sub"><h3>가나다순</h3></div></div></div></div><div class="col-lg-3 col-md-8 text-center"><div class="feature"><h3>극장</h3><hr class="primary"><div id="theater_list"></div></div></div><div class="col-lg-3 col-md-8 text-center" style="background:#2D2D2D; height:100%;"><div class="feature"><h3>날짜</h3><hr class="primary"><div id="date_list"></div></div></div><div class="col-lg-3 col-md-8 text-center"><div class="feature"><h3>시간</h3><hr class="primary"><div id="times_list"></div></div></div></div></div><div class="container"><div class="row"><div class="col-lg-11 text-right"><input id="choiceseat" type="button" value="좌석선택" style="display: none;"><label for="choiceseat" class="button" style="font-size: 20px;">좌석선택</label></div></div></div>';
					$(main).appendTo($('#three').empty());
				},
				ticket_sub : function(project) {
					//alert("티켓서브실행중"+", 선택 : "+$("input:radio[name=movie]:checked").val());
					$.ajax(project + '/schedule/movieSelect',{
						type : 'get',
						data : {
							movie : $("input:radio[name=movie]:checked").val(),
							theater : $("input:radio[name=theater]:checked").val(),
							date : $("input:radio[name=date]:checked").val()
						},
						async : true,
						dataType : 'json',
						success : function(data) {
							var $tl = null;
							var $dl = null;
							var $timel = null;
							$.each(data, function(index,val) {
								if (index==="theaterList") {
								$tl = val;
								} else if (index==="dateList") {
								$dl = val;
								} else if (index==="timeList") {
								$timel = val;
								}
							});

							//alert("Ticket tl :"+Ticket.$theaterlist+"   가져온tl :"+$tl);
							if (String(Ticket.$theaterlist)!==String($tl)) {
								alert("다름");
								var theater_list = 
									'<div><dl>';
									$.each(data, function(index,val) {
										if (index==="theaterList") {
											Ticket.$theaterlist = $tl;
										$.each(val, function() {
											theater_list += '<dt><input id="'+this+'" type="radio" name="theater" value="'+this+'" style="display: none;"><label class="theater" for="'+this+'">'+this+'</label></dt>';
										});
										}
									});
									theater_list += '</dl></div>';
									$(theater_list).appendTo($('#theater_list').empty());
							}
							//alert("Ticket dl :"+Ticket.$datelist+"   가져온dl :"+$dl);
							if (String(Ticket.$datelist)!==String($dl)) {
								alert("다름");
								var date_list = 
									'<div><dl>';
									$.each(data, function(index,val) {
										if (index==="dateList") {
											Ticket.$datelist = val;
										$.each(val, function() {
											date_list += '<dt><input id="'+this+'" type="radio" name="date" value="'+this+'" style="display: none;"><label class="date" for="'+this+'">'+this+'</label></dt>';
										});
										}
									});
									date_list += '</dl></div>';
									$(date_list).appendTo($('#date_list').empty());
							}
							if (Ticket.movie!=null&&Ticket.theater!=null&&Ticket.date!=null) {
								var times_list = 
									'<div><dl>';
									$.each(data, function(index,val) {
										if (index==="timeList") {
											var $roomName = null;
											$.each(val, function() {
												if ($roomName !== this.ROOMNAME) {

													times_list += '<dt><p>'+this.ROOMNAME+'</p></dt>';
												}
												times_list += '<dt><input id="'+this.SHOWTIME+'" type="radio" name="time" value="'+this.ROOMNAME+' '+this.SHOWTIME+'" style="display: none;"><label for="'+this.SHOWTIME+'">'+this.SHOWTIME+'</label></dt>';
												$roomName=this.ROOMNAME;
											});
										}
									});
									times_list += '</dl></div>';
									$(times_list).appendTo($('#times_list').empty());
							}
						},
						error : function(xhr, status, msg) {
							alert('에러발생상테 : '+status+',내용:'+msg);
						}
					});
					Ticket.movie=$("input:radio[name=movie]:checked").val();
				},
				theater_list: function(project) {
					$.ajax(project + '/schedule/theaterSelect',{
						type : 'get',
						data : {
							movie : $("input:radio[name=movie]:checked").val(),
							theater : $("input:radio[name=theater]:checked").val(),
							date : $("input:radio[name=date]:checked").val()
						},
						async : true,
						dataType : 'json',
						success : function(data) {
							var $mrl = null;
							var $mal = null;
							var $dl = null;
							var $timel = null;
							$.each(data, function(index,val) {
								if (index==="movieListRate") {
									$mrl = val;
								} else if (index==="movieListAsc") {
									$mal = val;
								} else if (index==="dateList") {
									$dl = val;
								} else if (index==="timeList") {
									$timel = val;
								}
							});
							//alert("Ticket mrl :"+Ticket.$movieratelist+"   가져온mrl :"+$mrl+"Ticket.mal :"+Ticket.$movieasclist+"가져온mal"+$mal);
							if (String(Ticket.$movieratelist)!==String($mrl)||String(Ticket.$movieasclist)!==String($mal)) {
								alert("다름");
								var movie_rate_list = 
									'<div><dl>';
									$.each(data, function(index,val) {
										if (index==="movieListRate") {
											Ticket.$movieratelist = val;
										$.each(val, function() {
										movie_rate_list += '<dt><input id="'+this+'" type="radio" name="movie" value="'+this+'" style="display: none;"><label class="mov" for="'+this+'">'+this+'</label></dt>';
										});
										}
									});
									movie_rate_list += '</dl></div>';
									$(movie_rate_list).appendTo($('#tab1').empty());
								var movie_asc_list = 
									'<div><dl>';
									$.each(data, function(index,val) {
										if (index==="movieListAsc") {
											Ticket.$movieasclist = val;
										$.each(val, function() {
											movie_asc_list += '<dt><input id="'+this+'" type="radio" name="movie" value="'+this+'" style="display: none;"><label class="mov" for="'+this+'">'+this+'</label></dt>';
										});
										}
									});
									movie_asc_list += '</dl></div>';
									$(movie_asc_list).appendTo($('#tab2').empty());
							}
							//alert("Ticket dl :"+Ticket.$datelist+"   가져온dl :"+$dl);
							if (String(Ticket.$datelist)!==String($dl)) {
							var date_list = 
								'<div><dl>';
								$.each(data, function(index,val) {
									if (index==="dateList") {
										Ticket.$datelist = val;
									$.each(val, function() {
										date_list += '<dt><input id="'+this+'" type="radio" name="date" value="'+this+'" style="display: none;"><label class="date" for="'+this+'">'+this+'</label></dt>';
									});
									}
								});
								date_list += '</dl></div>';
								$(date_list).appendTo($('#date_list').empty());
							}
							if (Ticket.movie!=null&&Ticket.theater!=null&&Ticket.date!=null) {
								var times_list = 
									'<div><dl>';
									$.each(data, function(index,val) {
										if (index==="timeList") {
											var $roomName = null;
											$.each(val, function() {
												if ($roomName !== this.ROOMNAME) {
													times_list += '<dt><p>'+this.ROOMNAME+'</p></dt>';
												}
												times_list += '<dt><input id="'+this.SHOWTIME+'" type="radio" name="time" value="'+this.ROOMNAME+' '+this.SHOWTIME+'" style="display: none;"><label for="'+this.SHOWTIME+'">'+this.SHOWTIME+'</label></dt>';
												$roomName=this.ROOMNAME;
											});
										}
									});
									times_list += '</dl></div>';
									$(times_list).appendTo($('#times_list').empty());
							}
						},
						error : function(xhr, status, msg) {
							alert('에러발생상테 : '+status+',내용:'+msg);
						}
					});
					Ticket.theater=$("input:radio[name=theater]:checked").val();
				},
				date_list : function(project) {
					$.ajax(project + '/schedule/dateSelect',{
						type : 'get',
						data : {
							movie : $("input:radio[name=movie]:checked").val(),
							theater : $("input:radio[name=theater]:checked").val(),
							date : $("input:radio[name=date]:checked").val()
						},
						async : true,
						dataType : 'json',
						success : function(data) {
							var $mrl = null;
							var $mal = null;
							var $tl = null;
							var $timel = null;
							$.each(data, function(index,val) {
								if (index==="movieListRate") {
									$mrl = val;
								} else if (index==="movieListAsc") {
									$mal = val;
								} else if (index==="theaterList") {
									$tl = val;
								} else if (index==="timeList") {
									$timel = val;
								}
							});
							//alert("Ticket mrl :"+Ticket.$movieratelist+"   가져온mrl :"+$mrl+"Ticket.mal :"+Ticket.$movieasclist+"가져온mal"+$mal);
							if (String(Ticket.$movieratelist)!==String($mrl)||String(Ticket.$movieasclist)!==String($mal)) {
								var movie_rate_list = 
									'<div><dl>';
									$.each(data, function(index,val) {
										if (index==="movieListRate") {
											Ticket.$movieratelist = val;
										$.each(val, function() {
										movie_rate_list += '<dt><input id="'+this+'" type="radio" name="movie" value="'+this+'" style="display: none;"><label class="mov" for="'+this+'">'+this+'</label></dt>';
										});
										}
									});
									movie_rate_list += '</dl></div>';
									$(movie_rate_list).appendTo($('#tab1').empty());
								var movie_asc_list = 
									'<div><dl>';
									$.each(data, function(index,val) {
										if (index==="movieListAsc") {
											Ticket.$movieasclist = val;
										$.each(val, function() {
											movie_asc_list += '<dt><input id="'+this+'" type="radio" name="movie" value="'+this+'" style="display: none;"><label class="mov" for="'+this+'">'+this+'</label></dt>';
										});
										}
									});
									movie_asc_list += '</dl></div>';
									$(movie_asc_list).appendTo($('#tab2').empty());
							}
							//alert("Ticket tl :"+Ticket.$theaterlist+"   가져온tl :"+$tl);
							if (String(Ticket.$theaterlist)!==String($tl)) {
							var theater_list = 
								'<div><dl>';
								$.each(data, function(index,val) {
									if (index==="theaterList") {
										Ticket.$theaterlist = val;
									$.each(val, function() {
										theater_list += '<dt><input id="'+this+'" type="radio" name="theater" value="'+this+'" style="display: none;"><label class="theater" for="'+this+'">'+this+'</label></dt>';
									});
									}
								});
								theater_list += '</dl></div>';
								$(theater_list).appendTo($('#theater_list').empty());
							}
							if (Ticket.movie!=null&&Ticket.theater!=null&&Ticket.date!=null) {
								var times_list = 
									'<div><dl>';
									$.each(data, function(index,val) {
										if (index==="timeList") {
											var $roomName = null;
											$.each(val, function() {
												if ($roomName !== this.ROOMNAME) {
													times_list += '<dt><p>'+this.ROOMNAME+'</p></dt>';
												}
												times_list += '<dt><input id="'+this.SHOWTIME+'" type="radio" name="time" value="'+this.ROOMNAME+' '+this.SHOWTIME+'" style="display: none;"><label for="'+this.SHOWTIME+'">'+this.SHOWTIME+'</label></dt>';
												$roomName=this.ROOMNAME;
											});
										}
									});
									times_list += '</dl></div>';
									$(times_list).appendTo($('#times_list').empty());
							}
						},
						error : function(xhr, status, msg) {
							alert('에러발생상테 : '+status+',내용:'+msg);
						}
					});
					Ticket.date=$("input:radio[name=date]:checked").val();
				},
				ticket_choiceseat : function(project) {
					$.ajax(project + '/schedule/choiceseat',{
						type : 'get',
						data : {
							movie : $("input:radio[name=movie]:checked").val(),
							theater : $("input:radio[name=theater]:checked").val(),
							date : $("input:radio[name=date]:checked").val(),
							time : $("input:radio[name=time]:checked").val()
						},
						async : true,
						dataType : 'json',
						success : function(data) {
							var initInfo = '<div class="container"><div class="row"><div class="col-lg-15 text-center"><h2 class="margin-top-0 text-primary">인원 / 좌석 선택</h2></div></div></div><div class="container"><div class="row"><div class="col-lg-2 col-md-8 text-center"><div class="feature"><h3>인원</h3><hr class="primary"><div class="seats_number"><div><label class="seats_ratelist">일반</label><select name="normal"><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option></select></div><div><label class="seats_ratelist">청소년</label><select name="teenager"><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option></select></div><div><label class="seats_ratelist">우대</label><select name="treatment"><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option></select></div></div></div></div><div class="col-lg-6 col-md-8 text-center"><div class="feature"><div class="seats_seats"><div class="seats_screenborder"><label class="seats_screen">SCREEN</label></div><div class="seats_seatsblock" id="seats_seatsblock"></div><div><label id="reset_seats">다시선택하기</label></div></div></div></div>'
								+'<div class="col-lg-4 col-md-8 text-center"><div class="feature"><h3>결제 정보</h3><div class="seats_info"><div class="seats_movieinfo"><div class="seats_infoline" id="movie_info"><label class="seats_infotitle" style="margin-right: 10px;">영화</label><h5 style="display: inline-block;margin: 0;">'+data.movie+'</h5></div><div class="seats_infoline"><label class="seats_infotitle" style="margin-right: 10px;">상영관</label><h5 style="display: inline-block;margin-right: 5;">'+data.theater+'</h5><h5 style="display: inline-block;margin: 0;">'+data.roomName+'</h5></div><div class="seats_infoline"><label class="seats_infotitle" style="margin-right: 10px;">일시</label><h5 style="display: inline-block;margin-right: 5;">'+data.date+'</h5><h5 style="display: inline-block;margin: 0;">'+data.time+'</h5></div><div class="seats_infoline"><label class="seats_infotitle">인원</label><div id="ea"></div></div><div class="seats_infoline"><label class="seats_infotitle">좌석번호</label><div id="seat_num"></div></div></div><div class="seats_cal"><div id="seats_normal"><label class="seats_infotitle">일반</label><div id="normal_cal"></div></div><div id="seats_teenager"><label class="seats_infotitle">청소년</label><div id="teenager_cal"></div></div><div id="seats_treatment"><label class="seats_infotitle">우대</label><div id="treatment_cal"></div></div><div id="seats_sum"><label class="seats_infotitle">총금액</label><div id="total_cal"></div></div></div></div></div></div></div></div><div class="container"><div class="row"><div class="col-lg-11 text-right"><input id="book" type="button" value="좌석선택" style="display: none;"><label for="book" class="button" style="font-size: 20px;">예매하기</label></div></div></div>';
							$('#three').empty();
							$('#three').append(initInfo);
							Seats.initSeats(project,data);
							$('.seats_number').change(function() {
								Seats.seats_number();
								Seats.seats_cal();
								Seats.initSeats(project);
								$('#seat_num').empty();
								});
							$('#reset_seats').click(function() {
								Seats.initSeats(project,data);
								$('#seat_num').empty();
							});
							$('#book').click(function() {
								var ticket_data = data;
								$.getJSON(project + '/ticket/getId', function(dataId) {
									alert("룸네임 : "+ticket_data.ticket.roomName+"시작시간 : "+ticket_data.ticket.startTime);
									if (dataId.id!=null) {
										Seats.book(project,ticket_data,dataId.id);
									} else {
										alert("로그인을 해주세요.");
									}
								
								});
								});
						},
						error : function(xhr, status, msg) {
							alert('에러발생상테 : '+status+',내용:'+msg);
						}
					});
				},
				initList : function(project) {
					$.getJSON(project + '/schedule/initList', function(data) {
						var movie_rate_list = 
							'<div><dl>';
							$.each(data, function(index,val) {
								if (index==="movieListRate") {
									Ticket.$movieratelist = val;
								$.each(val, function() {
									movie_rate_list += '<dt><input id="'+this+'" type="radio" name="movie" value="'+this+'" style="display: none;"><label class="mov" for="'+this+'">'+this+'</label></dt>';
								});
								}
							});
							movie_rate_list += '</dl></div>';
							$(movie_rate_list).appendTo($('#tab1').empty());
						var movie_asc_list = 
							'<div><dl>';
							$.each(data, function(index,val) {
								if (index==="movieListAsc") {
									Ticket.$movieasclist = val;
								$.each(val, function() {
									movie_asc_list += '<dt><input id="'+this+'" type="radio" name="movie" value="'+this+'" style="display: none;"><label class="mov" for="'+this+'">'+this+'</label></dt>';
								});
								}
							});
							movie_asc_list += '</dl></div>';
							$(movie_asc_list).appendTo($('#tab2').empty());
						var theater_list = 
							'<div><dl>';
							$.each(data, function(index,val) {
								if (index==="theaterList") {
									Ticket.$theaterlist = val;
								$.each(val, function() {
									theater_list += '<dt><input id="'+this+'" type="radio" name="theater" value="'+this+'" style="display: none;"><label class="theater" for="'+this+'">'+this+'</label></dt>';
								});
								}
							});
							theater_list += '</dl></div>';
							$(theater_list).appendTo($('#theater_list').empty());
							
						var date_list = 
							'<div><dl>';
							$.each(data, function(index,val) {
								if (index==="dateList") {
									Ticket.$datelist = val;
								$.each(val, function() {
									date_list += '<dt><input id="'+this+'" type="radio" name="date" value="'+this+'" style="display: none;"><label class="date" for="'+this+'">'+this+'</label></dt>';
								});
								}
							});
						date_list += '</dl></div>';
						$(date_list).appendTo($('#date_list').empty());
						$('#times_list').empty();
						
						$('.ticket_sub').change(function() {Ticket.ticket_sub(context);});
						$('#theater_list').change(function() {Ticket.theater_list(context);});
						$('#date_list').change(function() {Ticket.date_list(context);});
						
						$('#choiceseat').click(function() {Ticket.ticket_choiceseat(context);});
					});
				}
		};
