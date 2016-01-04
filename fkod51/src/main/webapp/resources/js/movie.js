var Movie = {
			 	home : function(project) {
					$(".mainView").load(project + "/movie/Movie");
				},
				ranking : function(project) {
					var arr = [];
					$.getJSON(project + '/movie/movie_Chart', function(data) {
						alert("갯제이슨 다녀옴!!");
						var rank = '<div id="test"><h2 style="color: white; padding-top: 10;">무비차트</h2></div>';
						$.each(data, function(index, value) {
							rank += '<div class="chart_rank" id="chart_rank'+index+'"><div class="chart_ranking chart_font_17 chart_bold">'+'NO.'+(index+1)+'</div>'
									+'<img id='+this.filmNumber+' src="'+project+'/resources/images/'+this.filmNumber+'.jpg" alt="" width="250" height="350"><div class="chart_desc chart_bold">'+this.filmName+'</div></div>';
							arr.push(this.filmNumber);
						});
										
					$('#movie_wrap').empty().append(rank);
					$.each(data, function(i, val) {
						$('#'+arr[i]).click(function() {
							
							Movie.movieName(project, arr[i]);
					});

					});
					});

				},
				movieName : function(project,filmNumber) {
		 			$.getJSON(project + '/movie/movie_name/'+filmNumber, 
							function(data) {
								var movieInfom = '<h1>무비페이지</h1>'
									+'<div id="movie_info"><div id="movie_poster"><img id="movie_float" src="'+project+'/resources/images/'+data.filmNumber+'.jpg;" alt="" width="250" height="350" /></div>'
									+'<h2>'+data.filmName+'</h2>'
									+'<table id="movie_tab" style= "border : 1px solid black"><tr><th style="color: grey; font-size: 18px">예매율</th><td>10.5%</td></tr><tr><th>감독</th>'
									+'<td>'+data.director+'</td><tr><th>배우</th><td>'+data.actor+'</td></tr>'
									+'<tr><th>장르</th><td>'+data.genre+'</td></tr><tr><th>기본</th><td>'+data.rate+', '+data.runtime+', '+data.country+'분 '+'</td></tr><tr><th>개봉</th>'
									+'<td>'+data.releaseDate+' <a href="../ticket/ticket.html"><input type="button" value="바로 예매" class="movie_font_20 movie_bold movie_bg_color_green movie_txt_color_white "></a></td></tr></table>'
									+'<div class="movie_margin_auto"></div><br /><div class="movie_infonavi movie_font_20"><ul><li><a href="#movie_story">영화스토리</a></li>'
									+'<li><a href="#movie_tra">트레일러</a></li><li><a href="#movie_cut">스틸컷</a></li><li><a href="#movie_review">리뷰</a></li></ul></div></div>'
									+'<div id="movie_story" class="movie_story_lay movie_margin_b20"><h2>영화 스토리</h2><div class="movie_story movie_margin_a10"><img src="'+project+'/resources//images/'+data.story+'.JPG;" alt="" /></div></div>'
									+'<div id="movie_cut" class="movie_cut_lay movie_margin_b20"><h2>스틸컷<input type="button" value="스틸컷 더보기" id="cutmore" class="movie_bold movie_bg_color_green movie_txt_color_white "></h2>'
									+'<div class="movie_cut movie_margin_l30  movie_float"><a href="#"><img src="'+project+'/resources/images/'+data.filmNumber+'1.jpg;" alt="" width="250" height="161" /></a></div>'
									+'<div class="movie_cut movie_margin_l20 movie_float"><a href="#"><img src="'+project+'/resources/images/'+data.filmNumber+'2.jpg;" alt="" width="250" height="161" /></a></div>'
									+'<div class="movie_cut movie_margin_l20 movie_float"><a href="#"><img src="'+project+'/resources/images/'+data.filmNumber+'3.jpg;" alt="" width="250" height="161" /></a></div>'
									+'<div class="movie_cut movie_margin_l20 movie_float"><a href="#"><img src="'+project+'/resources/images/'+data.filmNumber+'4.jpg;" alt="" width="250" height="161" /></a></div></div>'
									
								$('#movie_wrap').html(movieInfom).append(Movie.trailer(project,data));
								$('#movie_info').css('border', '1px solid black').css('width', '95%').css('height', '500px').css('margin','20px');
								$('#movie_poster').css('float', 'left').css('border', '1px solid black').css('width', '250px').css('height', '350px').css('margin', 'auto').css('margin-right','30px');
								$('#movie_float').css('float', 'left');
								$('#movie_tab').css('border', '1px solid black').css('width', '400px').css('height', '300px').css('border-collapse', 'collapse');
								$('#cutmore').click(function() {
									Movie.movieBasic(project,data);
								});
							});
				},
				trailer : function(project,data) {
					$.getJSON(project + '/movie/Movie.do?page=movie_Tra&filmNumber='+data.filmNumber, function(data) {
						var movieTra = '<div id="movie_tra" class="movie_tra_lay movie_margin_b20 "><h2>트레일러</h2>';
						$.each(data, function(index, value) {
							movieTra += '<div class="movie_tra margin_l20 movie_float"><iframe width="350" height="200" src="https://www.youtube.com/embed/'+value+'" frameborder="0" allowfullscreen></iframe></div>';
						});
							movieTra += '<div class="movie_tra_name movie_float movie_margin_r35"><strong>(1차 예고편)</strong></div><div class="movie_tra_name movie_float movie_margin_r30"><strong>(2차 예고편)</strong></div>'
										+'<div class="movie_tra_name movie_float"><strong>(3차 예고편)</strong></div></div><div id="movie_cut" class="movie_cut_lay movie_margin_b20">'
										+'<div id="movie_review" class="movie_review_lay"><h2>리뷰</h2></div>'
										+'<div class="movie_infonavi movie_font_20"><ul><li><a href="#movie_info">영화상세</a></li><li><a href="#movie_story">영화스토리</a></li>'
										+'<li><a href="#movie_tra">트레일러</a></li><li><a href="#movie_cut">스틸컷</a></li></ul></div></div>';
										
							return movieTra;
					});
				},
				cutMore : function(project,data) {
					
					$.getJSON(project + '/movie/Movie.do?page=movie_Cut&filmNumber='+data.filmNumber, function(data) {
						var movieCut = '<div class="cut_allcut_lay">';
						$.each(data, function(index, value) {
							movieCut += '<div class="cut_allcut cut_margin_l30 cut_margin_t20 cut_margin_b20  cut_float"><a href="../images/'+value+'.jpg;">'
								+'<img src="../images/'+value+'.jpg;" alt="" width="250" height="161" /></a></div>';
								
						});
						movieCut+='</div>' ;
						$("#movie_wrap").append(movieCut);
					});
				},
			
				movieBasic : function(project,data) {
					$.getJSON(project + '/movie/Movie.do?page=movie_Basic&filmNumber='+data.filmNumber, function(data) {
						    var movieBasic ='<div><h1>영화상세<input type="button" value="영화정보" id="movie_home" class="cut_bold cut_bg_color_orange cut_txt_color_white "></h1></div>'
							+'<div id="cut_info" class="cut_info cut_margin_b20"><div class="cut_poster cut_margin_r30"><img class="float" src="../images/'+data.filmNumber+'.jpg;" alt="" width="250" height="350" /></div>'
							+'<h2>'+data.filmName+'</h2><table style="border: solid 1px white; width: 400; height: 300px"><tr><th style="color: grey; font-size: 18px">예매율</th>'
							+'<td>10.5%</td></tr><tr><th>감독</th><td>'+data.director+'</td><tr><th>배우</th><td>'+data.actor+'</td></tr>'
							+'<tr><th>장르</th><td>'+data.genre+'</td></tr><tr><th>기본</th><td>'+data.rate+', '+data.runtime+'분 '+', '+data.country+'</td></tr>'
							+'<tr><th>개봉</th><td>'+data.releaseDate+'<a href="../ticket/ticket.html"><input type="button" value="바로 예매" class="cut_font_20 cut_bold cut_bg_color_green cut_txt_color_white "></a></td></tr></table></div>';

						$('#movie_wrap').html(movieBasic);
						Movie.cutMore(project,data);
						$('#movie_home').click(function() {
							$('#movie_wrap').empty();
							Movie.movieName(project,data);
						});
					});
			
				}
	 };
