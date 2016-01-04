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
					/* alert(this.movie+", "+this.theater+", "+this.date); */
					$.ajax(project + '/ticket/Ticket.do',{
						type : 'get',
						data : {
							movie : $("input:radio[name=movie]:checked").val(),
							theater : $("input:radio[name=theater]:checked").val(),
							date : $("input:radio[name=date]:checked").val(),
							page : "movieSelect"
						},
						async : true,
						dataType : 'json',
						success : function(data) {
							var $tl = null;
							var $dl = null;
							var $timel = null;
							$.each(data, function(index,val) {
								if (index===0) {
								$tl = val;
								} else if (index===1) {
								$dl = val;
								} else if (index===2) {
								$timel = val;
								}
							});
							/* alert("$dl"+$dl); */
							if (Ticket.theater===null || Ticket.$theaterlist!==$tl) {
								/* alert("기존"+Ticket.movie+"현재선택"+$("input:radio[name=movie]:checked").val()); */
								var theater_list = 
									'<div class="ticket_list-category"><dl>';
									$.each(data, function(index,val) {
										if (index===0) {
											Ticket.$theaterlist = val;
										$.each(val, function() {
											theater_list += '<dt><input type="radio" name="theater" value="'+this+'"/>'+this+'</dt>';
										});
										}
									});
									theater_list += '</dl></div>';
									$(theater_list).appendTo($('#theater_list').empty());
							}
							if (Ticket.date===null || Ticket.$datelist!==$dl) {
								var date_list = 
									'<div class="ticket_list-category"><dl>';
									$.each(data, function(index,val) {
										if (index===1) {
											Ticket.$datelist = val;
										$.each(val, function() {
											date_list += '<dt><input type="radio" name="date" value="'+this+'"/>'+this+'</dt>';
										});
										}
									});
									date_list += '</dl></div>';
									$(date_list).appendTo($('#date_list').empty());
							}
							if (Ticket.movie!=null&&Ticket.theater!=null&&Ticket.date!=null) {
								var times_list = 
									'<div class="ticket_list-category"><dl>';
									$.each(data, function(index,val) {
										if (index===2) {
										$.each(val, function() {
											times_list += '<dt><input type="radio" name="time" value="'+this+'"/>'+this+'</dt>';
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
				$.ajax(project + '/ticket/Ticket.do',{
					type : 'get',
					data : {
						movie : $("input:radio[name=movie]:checked").val(),
						theater : $("input:radio[name=theater]:checked").val(),
						date : $("input:radio[name=date]:checked").val(),
						page : "theaterSelect"
					},
					async : true,
					dataType : 'json',
					success : function(data) {
						var $mrl = null;
						var $mal = null;
						var $dl = null;
						var $timel = null;
						$.each(data, function(index,val) {
							if (index===0) {
								$mrl = val;
							} else if (index===1) {
								$mal = val;
							} else if (index===2) {
								$dl = val;
							} else if (index===3) {
								$timel = val;
							}
						});
						if (Ticket.movie===null) {
							var movie_rate_list = 
								'<div class="ticket_list-category"><dl>';
								$.each(data, function(index,val) {
									if (index===0) {
										Ticket.$movieratelist = val;
									$.each(val, function() {
									movie_rate_list += '<dt><input type="radio" name="movie" value="'+this+'"/>'+this+'</dt>';
									});
									}
								});
								movie_rate_list += '</dl></div>';
								$(movie_rate_list).appendTo($('#tab1').empty());
							var movie_asc_list = 
								'<div class="ticket_list-category"><dl>';
								$.each(data, function(index,val) {
									if (index===1) {
										Ticket.$movieasclist = val;
									$.each(val, function() {
										movie_asc_list += '<dt><input type="radio" name="movie" value="'+this+'"/>'+this+'</dt>';
									});
									}
								});
								movie_asc_list += '</dl></div>';
								$(movie_asc_list).appendTo($('#tab2').empty());
						}
						if (Ticket.date===null) {
						var date_list = 
							'<div class="ticket_list-category"><dl>';
							$.each(data, function(index,val) {
								if (index===2) {
									Ticket.$datelist = val;
								$.each(val, function() {
									date_list += '<dt><input type="radio" name="date" value="'+this+'"/>'+this+'</dt>';
								});
								}
							});
							date_list += '</dl></div>';
							$(date_list).appendTo($('#date_list').empty());
						}
						if (Ticket.movie!=null&&Ticket.theater!=null&&Ticket.date!=null) {
							var times_list = 
								'<div class="ticket_list-category"><dl>';
								$.each(data, function(index,val) {
									if (index===3) {
									$.each(val, function() {
										times_list += '<dt><input type="radio" name="time" value="'+this+'"/>'+this+'</dt>';
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
				$.ajax(project + '/ticket/Ticket.do',{
					type : 'get',
					data : {
						movie : $("input:radio[name=movie]:checked").val(),
						theater : $("input:radio[name=theater]:checked").val(),
						date : $("input:radio[name=date]:checked").val(),
						page : "dateSelect"
					},
					async : true,
					dataType : 'json',
					success : function(data) {
						var $mrl = null;
						var $mal = null;
						var $tl = null;
						var $timel = null;
						$.each(data, function(index,val) {
							if (index===0) {
								$mrl = val;
							} else if (index===1) {
								$mal = val;
							} else if (index===2) {
								$tl = val;
							} else if (index===3) {
								$timel = val;
							}
						});
						if (Ticket.movie===null) {
							var movie_rate_list = 
								'<div class="ticket_list-category"><dl>';
								$.each(data, function(index,val) {
									if (index===0) {
										Ticket.$movieratelist = val;
									$.each(val, function() {
									movie_rate_list += '<dt><input type="radio" name="movie" value="'+this+'"/>'+this+'</dt>';
									});
									}
								});
								movie_rate_list += '</dl></div>';
								$(movie_rate_list).appendTo($('#tab1').empty());
							var movie_asc_list = 
								'<div class="ticket_list-category"><dl>';
								$.each(data, function(index,val) {
									if (index===1) {
										Ticket.$movieasclist = val;
									$.each(val, function() {
										movie_asc_list += '<dt><input type="radio" name="movie" value="'+this+'"/>'+this+'</dt>';
									});
									}
								});
								movie_asc_list += '</dl></div>';
								$(movie_asc_list).appendTo($('#tab2').empty());
						}
						if (Ticket.theater===null) {
						var theater_list = 
							'<div class="ticket_list-category"><dl>';
							$.each(data, function(index,val) {
								if (index===2) {
									Ticket.$theaterlist = val;
								$.each(val, function() {
									theater_list += '<dt><input type="radio" name="theater" value="'+this+'"/>'+this+'</dt>';
								});
								}
							});
							theater_list += '</dl></div>';
							$(theater_list).appendTo($('#theater_list').empty());
						}
						if (Ticket.movie!=null&&Ticket.theater!=null&&Ticket.date!=null) {
							var times_list = 
								'<div class="ticket_list-category"><dl>';
								$.each(data, function(index,val) {
									if (index===3) {
									$.each(val, function() {
										times_list += '<dt><input type="radio" name="time" value="'+this+'"/>'+this+'</dt>';
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
				$.getJSON(project + '/ticket/Ticket.do?page=initList', function(data) {
					var movie_rate_list = 
						'<div class="ticket_list-category"><dl>';
						$.each(data, function(index,val) {
							if (index===0) {
							$.each(val, function() {
							movie_rate_list += '<dt><input type="radio" name="movie" value="'+this+'"/>'+this+'</dt>';
							});
							}
						});
						movie_rate_list += '</dl></div>';
						$(movie_rate_list).appendTo($('#tab1').empty());
					var movie_asc_list = 
						'<div class="ticket_list-category"><dl>';
						$.each(data, function(index,val) {
							if (index===1) {
							$.each(val, function() {
								movie_asc_list += '<dt><input type="radio" name="movie" value="'+this+'"/>'+this+'</dt>';
							});
							}
						});
						movie_asc_list += '</dl></div>';
						$(movie_asc_list).appendTo($('#tab2').empty());
					var theater_list = 
						'<div class="ticket_list-category"><dl>';
						$.each(data, function(index,val) {
							if (index===2) {
							$.each(val, function() {
								theater_list += '<dt><input type="radio" name="theater" value="'+this+'"/>'+this+'</dt>';
							});
							}
						});
						theater_list += '</dl></div>';
						$(theater_list).appendTo($('#theater_list').empty());
						
					var date_list = 
						'<div class="ticket_list-category"><dl>';
						$.each(data, function(index,val) {
							if (index===3) {
							$.each(val, function() {
								date_list += '<dt><input type="radio" name="date" value="'+this+'"/>'+this+'</dt>';
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
