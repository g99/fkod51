var Movie = {
			 	home : function(project) {
					$(".mainView").load(project + "/movie/Movie");
				},
				ranking : function(project) {
					var arr = [];
					$.getJSON(project + '/movie/movie_Chart', function(data) {
						var rank = '<section id="two" class="no-padding"><div class="container-fluid"><div class="row no-gutter">';
						$.each(data, function(index, value) {
							rank += '<div style="float: left;"><div class="chart_rank" id="chart_rank'+index+'">'
									+'<div class="chart_ranking chart_font_17 chart_bold">'+'NO.'+(index+1)+'</div>'
									+'<a href="#galleryModal1" data-toggle="modal" class="gallery-box" id='+this.filmNumber+' data-src=""><img src="'+project+'/resources/images/'+this.filmNumber+'.jpg" '
									+'alt="" width="280" height="300"><div class="gallery-box-caption"><div class="gallery-box-content"><div><i class="icon-lg ion-ios-search"></i></div></div></div></a><div class="chart_desc chart_bold">'+this.filmName+'</div></div></div>';
							arr.push(this.filmNumber);
						});
						rank += '</div></div></section>';
					$('#two').empty().append(rank);
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
								var movieInfom = ''
									+'<div id="movie_info" class="movie_info"><div id="movie_poster"><img id="movie_float" src="'+project+'/resources/images/'+data.filmNumber+'.jpg;" alt="" width="250" height="350" /></div>'
									+'<h2>'+data.filmName+'</h2>'
									+'<table id="movie_tab"><tr><th style="font-size: 18px">예매율</th><td> '+data.tRate+'%</td></tr><tr><th>감독</th>'
									+'<td>'+data.director+'</td><tr><th>배우</th><td>'+data.actor+'</td></tr>'
									+'<tr><th>장르</th><td>'+data.genre+'</td></tr><tr><th>기본</th><td>'+data.rate+', '+data.runtime+', '+data.country+'분 '+'</td></tr><tr><th>개봉</th>'
									+'<td>'+data.releaseDate+' <a href="../ticket/ticket.html">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="바로 예매" class="movie_font_20 movie_bold movie_bg_color_purple movie_txt_color_white "></a></td></tr></table>'
									+'</div>'
									+'<div id="movie_story" class="movie_story_lay movie_margin_b20"><h2>영화 스토리</h2><div class="movie_story movie_margin_a10 movie_margin_b20"><img src="'+project+'/resources//images/'+data.story+'.JPG;" alt="" /></div></div><hr/>'
									+'<div id="movie_cut" class="movie_cut_lay movie_margin_b20"><h2>스틸컷&nbsp;&nbsp;&nbsp;<input type="button" value="스틸컷 더보기" id="cutmore" class="movie_bold movie_bg_color_purple movie_txt_color_white "></h2>'
									+'<div class="movie_cut movie_margin_l30  movie_float"><a href="#"><img src="'+project+'/resources/images/'+data.filmNumber+'1.jpg;" alt="" width="250" height="161" /></a></div>'
									+'<div class="movie_cut movie_margin_l20 movie_float"><a href="#"><img src="'+project+'/resources/images/'+data.filmNumber+'2.jpg;" alt="" width="250" height="161" /></a></div>'
									+'<div class="movie_cut movie_margin_l20 movie_float"><a href="#"><img src="'+project+'/resources/images/'+data.filmNumber+'3.jpg;" alt="" width="250" height="161" /></a></div>'
									+'</div>'
									+'<div id="movie_tra" class="movie_tra_lay movie_margin_b20 "><h2>트레일러</h2>';
								$.each(data.trailer.split("/"),function(index, value){
									movieInfom +='<div class="movie_tra margin_l20 movie_float"><iframe width="270" height="200" src="https://www.youtube.com/embed/'+value+'" frameborder="0" allowfullscreen></iframe></div>';
								});
									movieInfom +='<div class="movie_tra_name movie_float movie_margin_r20"><strong>(1차 예고편)</strong></div><div class="movie_tra_name movie_float movie_margin_r20"><strong>(2차 예고편)</strong></div>'
										+'<div class="movie_tra_name movie_float"><strong>(3차 예고편)</strong></div></div>'
										+'</div><div id="movie_cut" class="movie_cut_lay movie_margin_b20">'
										+'<div id="movie_review" class="movie_review_lay"><h2>리뷰</h2></div>'
										+'</div><p><br/><button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">Close <i class="ion-android-close"></i></button></p>';
								$('#modal-body1').html(movieInfom);
								$('#movie_info').css('width', '95%').css('height', '500px').css('margin','20px');
								$('#movie_poster').css('float', 'left').css('border', '1px solid black').css('width', '250px').css('height', '350px').css('margin', 'auto').css('margin-right','30px');
								$('#movie_float').css('float', 'left');
								$('#movie_tab').css('width', '400px').css('height', '300px').css('border-collapse', 'collapse');
								$('#cutmore').click(function() {
									
									Movie.movieBasic(project,data.filmNumber);
								});
							});
				},
				movieBasic : function(project,data) {
					$.getJSON(project + '/movie/movie_Basic/'+data, function(data) {
						    var movieBasic ='<div class="cut_allcut_lay"><h1>'+data.filmName+'&nbsp;&nbsp;&nbsp;<input type="button" value="영화정보" id="movie_home" class="cut_bold cut_bg_color_purple cut_txt_color_white "></h1>';
						    $.each(data.cut.split("/"), function(index,value){
						    	
						    		movieBasic += '<div class="cut_allcut cut_margin_l20 cut_margin_b20 cut_float">'
					    				+'<a href="'+project+'/resources/images/'+value+'.jpg;">'
					    				+'<img src="'+project+'/resources/images/'+value+'.jpg;" alt="" width="250px" height="161px" />'
					    				+'</a></div>';
						    	
						    });
						    
						    movieBasic +='</div><div><br></br></div><br/><p><br/><button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">Close <i class="ion-android-close"></i></button></p>';
						$('#modal-body1').html(movieBasic);
						$('#movie_home').click(function() {
							$('#modal-body1').empty();
							Movie.movieName(project,data.filmNumber);
						});
					});
			
				}
	 };
