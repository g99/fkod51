var Ticket = {
				movie : null,
				theater : null,
				date : null,
				time : null,
				$movieratelist : null,
				$movieasclist : null,
				$theaterlist : null,
				$datelist : null,
				
				ticket_sub : function(project) {
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
							var $movie = null;
							$.each(data, function(index,val) {
								if (index==="theaterList") {
								$tl = val;
								} else if (index==="dateList") {
								$dl = val;
								} else if (index==="timeList") {
								$timel = val;
								} else if (index==="movie") {
								$movie = val;
								}
							});
							/* alert("$dl"+$dl); */
							/*alert("기존"+Ticket.movie+"현재선택"+$("input:radio[name=movie]:checked").val());*/
							alert(Ticket.movie+", "+$movie);
							if (Ticket.theater===null || Ticket.$theaterlist!==$tl || Ticket.movie!==$movie) {
								var theater_list = 
									'<div><dl>';
									$.each(data, function(index,val) {
										if (index==="theaterList") {
											Ticket.$theaterlist = val;
										$.each(val, function() {
											theater_list += '<dt><input id="'+this+'" type="radio" name="theater" value="'+this+'" style="display: none;"><label for="'+this+'">'+this+'</label></dt>';
										});
										}
									});
									theater_list += '</dl></div>';
									$(theater_list).appendTo($('#theater_list').empty());
							}
							if (Ticket.date===null || Ticket.$datelist!==$dl) {
								var date_list = 
									'<div><dl>';
									$.each(data, function(index,val) {
										if (index==="dateList") {
											Ticket.$datelist = val;
										$.each(val, function() {
											date_list += '<dt><input id="'+this+'" type="radio" name="date" value="'+this+'" style="display: none;"><label for="'+this+'">'+this+'</label></dt>';
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
										$.each(val, function() {
											times_list += '<dt><input id="'+this+'" type="radio" name="time" value="'+this+'" style="display: none;"><label for="'+this+'">'+this+'</label></dt>';
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
					this.movie=$("input:radio[name=movie]:checked").val();
					/* alert(this.movie+", "+this.theater+", "+this.date); */
				},
			theater_list: function(project) {
				/* alert(this.movie+", "+this.theater+", "+this.date); */
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
						if (Ticket.movie===null) {
							var movie_rate_list = 
								'<div><dl>';
								$.each(data, function(index,val) {
									if (index==="movieListRate") {
										Ticket.$movieratelist = val;
									$.each(val, function() {
									movie_rate_list += '<dt><input id="'+this+'" type="radio" name="movie" value="'+this+'" style="display: none;"><label for="'+this+'">'+this+'</label></dt>';
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
										movie_asc_list += '<dt><input id="'+this+'" type="radio" name="movie" value="'+this+'" style="display: none;"><label for="'+this+'">'+this+'</label></dt>';
									});
									}
								});
								movie_asc_list += '</dl></div>';
								$(movie_asc_list).appendTo($('#tab2').empty());
						}
						if (Ticket.date===null) {
						var date_list = 
							'<div><dl>';
							$.each(data, function(index,val) {
								if (index==="dateList") {
									Ticket.$datelist = val;
								$.each(val, function() {
									date_list += '<dt><input id="'+this+'" type="radio" name="date" value="'+this+'" style="display: none;"><label for="'+this+'">'+this+'</label></dt>';
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
									$.each(val, function() {
										times_list += '<dt><input id="'+this+'" type="radio" name="time" value="'+this+'" style="display: none;"><label for="'+this+'">'+this+'</label></dt>';
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
				this.theater=$("input:radio[name=theater]:checked").val();
				/* alert(this.movie+", "+this.theater+", "+this.date); */
			},
			date_list : function(project) {
				/* alert(this.movie+", "+this.theater+", "+this.date); */
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
						if (Ticket.movie===null) {
							var movie_rate_list = 
								'<div><dl>';
								$.each(data, function(index,val) {
									if (index==="movieListRate") {
										Ticket.$movieratelist = val;
									$.each(val, function() {
									movie_rate_list += '<dt><input id="'+this+'" type="radio" name="movie" value="'+this+'" style="display: none;"><label for="'+this+'">'+this+'</label></dt>';
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
										movie_asc_list += '<dt><input id="'+this+'" type="radio" name="movie" value="'+this+'" style="display: none;"><label for="'+this+'">'+this+'</label></dt>';
									});
									}
								});
								movie_asc_list += '</dl></div>';
								$(movie_asc_list).appendTo($('#tab2').empty());
						}
						if (Ticket.theater===null) {
						var theater_list = 
							'<div><dl>';
							$.each(data, function(index,val) {
								if (index==="theaterList") {
									Ticket.$theaterlist = val;
								$.each(val, function() {
									theater_list += '<dt><input id="'+this+'" type="radio" name="theater" value="'+this+'" style="display: none;"><label for="'+this+'">'+this+'</label></dt>';
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
									$.each(val, function() {
										times_list += '<dt><input id="'+this+'" type="radio" name="time" value="'+this+'" style="display: none;"><label for="'+this+'">'+this+'</label></dt>';
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
				this.date=$("input:radio[name=date]:checked").val();
				/* alert(this.movie+", "+this.theater+", "+this.date); */
			},
			ticket_choiceseat : function(project) {
				$.ajax(project + '/ticket/Ticket.do',{
					type : 'get',
					data : {
						movie : $("input:radio[name=movie]:checked").val(),
						theater : $("input:radio[name=theater]:checked").val(),
						date : $("input:radio[name=date]:checked").val(),
						time : $("input:radio[name=time]:checked").val(),
						page : "choiceseat"
					},
					async : true,
					dataType : 'json',
					success : function(data) {
						location.href=project + "/ticket/Ticket.do?page=Seats";
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
							$.each(val, function() {
							movie_rate_list += '<dt><input id="'+this+'" type="radio" name="movie" value="'+this+'" style="display: none;"><label for="'+this+'">'+this+'</label></dt>';
							});
							}
						});
						movie_rate_list += '</dl></div>';
						$(movie_rate_list).appendTo($('#tab1').empty());
					var movie_asc_list = 
						'<div><dl>';
						$.each(data, function(index,val) {
							if (index==="movieListAsc") {
							$.each(val, function() {
								movie_asc_list += '<dt><input id="'+this+'" type="radio" name="movie" value="'+this+'" style="display: none;"><label for="'+this+'">'+this+'</label></dt>';
							});
							}
						});
						movie_asc_list += '</dl></div>';
						$(movie_asc_list).appendTo($('#tab2').empty());
					var theater_list = 
						'<div><dl>';
						$.each(data, function(index,val) {
							if (index==="theaterList") {
							$.each(val, function() {
								theater_list += '<dt><input id="'+this+'" type="radio" name="theater" value="'+this+'" style="display: none;"><label for="'+this+'">'+this+'</label></dt>';
							});
							}
						});
						theater_list += '</dl></div>';
						$(theater_list).appendTo($('#theater_list').empty());
						
					var date_list = 
						'<div><dl>';
						$.each(data, function(index,val) {
							if (index==="dateList") {
							$.each(val, function() {
								date_list += '<dt><input id="'+this+'" type="radio" name="date" value="'+this+'" style="display: none;"><label for="'+this+'">'+this+'</label></dt>';
							});
							}
						});
						date_list += '</dl></div>';
						$(date_list).appendTo($('#date_list').empty());
					var times_list = '';
					$(times_list).appendTo($('#times_list').empty());
				});
			}
		};
