var Movie = {
			 	home : function() {
					$(".mainView").load(context + "/movie/Movie");
				},
				ranking : function() {
					var arr = [];
					var fWindow ='<div><input type="text" class="form-control" name="search" placeholder="Search" style="width:250px; background: white; float:left; margin-left: 50px;"><img src="'+context+'/resources/images/searchimg.png" id="search" style="height:37px; padding-left:5px;float:left;"><button id="test" style="font-size: 13px; width: 130px; border-radius: 10px;float:left; " class="btn btn-primary btn-block">Daum 영화 검색</button></div>';
					var test = '<button id="test" style="font-size: 13px; float: right; width: 130px; border-radius: 10px; " class="btn btn-primary btn-block">Daum 영화 검색</button>';
					$.getJSON(context + '/movie/movie_Chart', function(data) {
						var rank = '<div class="container-fluid"><div class="row no-gutter">';
						$.each(data, function(index, value) {
							rank += '<div style="float: left; width: 19%"><div class="chart_rank" id="chart_rank'+index+'">'
									+'<div class="chart_ranking chart_font_17 chart_bold">'+'NO.'+(index+1)+'</div>'
									+'<a href="#movieGalleryModal" data-toggle="modal" class="gallery-box" id='+this.filmNumber+' data-src=""><img src="'+context+'/resources/images/'+this.filmNumber+'.jpg" '
									+'alt="" width="90%" height="40%"><div class="gallery-box-caption"><div class="gallery-box-content"><div><i class="icon-lg ion-ios-search"></i></div></div></div></a></div></div>';
							arr.push(this.filmNumber);
						});
						rank += '</div></div>';
						
					$('#movielay').empty().append(rank);
					$('#sWindow').empty().append(fWindow);
					$.each(data, function(i, val) {
						$('#'+arr[i]).click(function() {
							Movie.movieName(arr[i]);
					});
					});
					$('#search').click(function name() {
						Movie.find($("input:text[name=search]").val());
					})
					$('#test').click(function() {
						Movie.api($("input:text[name=search]").val());
					})
					});
				},
				find : function(keyword) {
					$.ajax(context + "/movie/film_name/"+keyword,{
						data : {
							"filmName" : keyword
						},
						dataType : "json",
						success : function(data) {
							var fWindow ='<div><input type="text" class="form-control" name="search" placeholder="Search" style="width:250px; background: white; float:left; margin-left: 50px;"><img src="'+context+'/resources/images/searchimg.png" id="search" style="height:37px; padding-left:5px;float:left;"><img src="'+context+'/resources/images/cancelimg.png" id="ranking" style="height:37px; padding-left:5px;float:left;">'
										+'<button id="test" style="font-size: 13px; float: left; width: 130px; border-radius: 10px; " class="btn btn-primary btn-block">Daum 영화 검색</button></div>';
							var arr = [];
							var result = '<div class="container-fluid"><div class="row no-gutter">';
							$.each(data, function(index, value) {
								result += '<div style="float: left; width: 17%"><div class="chart_rank" id="chart_rank'+index+'">'
										+'<a href="#movieGalleryModal" data-toggle="modal" class="gallery-box" id='+this.filmNumber+' data-src=""><img src="'+context+'/resources/images/'+this.filmNumber+'.jpg" '
										+'alt="" width="90%" height="40%"><div class="gallery-box-caption"><div class="gallery-box-content"><div><i class="icon-lg ion-ios-search"></i></div></div></div></a></div></div>';
								arr.push(this.filmNumber);
							});
							result += '</div></div>';
							$('#movielay').empty().append(result);
							$('#sWindow').empty().append(fWindow);
							$.each(data, function(i, val) {
								$('#'+arr[i]).click(function() {
									Movie.movieName(arr[i]);
							});
							});
							$('#search').click(function name() {
								Movie.find($("input:text[name=search]").val());
							});
							$('#ranking').click(function() {
								Movie.ranking();
							})
						},
						error : function() {
							alert("검색어를 입력하세요");
						}
					})
				},
				api : function(keyword) {
					var fWindow ='<div><input type="text" class="form-control" name="search" placeholder="Search" style="width:250px; background: white; float:left; margin-left: 50px;"><img src="'+context+'/resources/images/searchimg.png" id="search" style="height:37px; padding-left:5px;float: left;"><img src="'+context+'/resources/images/cancelimg.png" id="ranking" style="height:37px; float: left; padding-left:5px;"><button id="test" style="font-size: 13px; float: left; width: 130px; border-radius: 10px; " class="btn btn-primary btn-block">Daum 영화 검색</button></div>';
					var test = '<button id="test" style="font-size: 13px; float: left; width: 130px; border-radius: 10px; " class="btn btn-primary btn-block">Daum 영화 검색</button>';
					var query = keyword;
					var url = "https://apis.daum.net/contents/movie";
					url += "?output=json";
					url += "&apikey=09ad15f4ddb7ae0dc28f53dc88367e00"
					url += "&q=" + query;
					url += "&result=10";
					url += "&callback=?";
					
					$.getJSON(url,function(data) {
						result = '<div class="container-fluid"><div class="row no-gutter">';
						for (var i in data.channel.item)
						{
							result += '<div style="float:left; width: 19%"><div class="chart_rank">'
								+'<div class="chart_font_17 chart_bold" style="width:100%">'+data.channel.item[i].title[0].content+'</div>'
								+'<a href="'+data.channel.item[i].title[0].link+'" data-toggle="modal" class="gallery-box" data-src=""><img src="'+data.channel.item[i].thumbnail[0].content+'" '
								+'alt="" width="90%" height="40%"><div class="gallery-box-caption"><div class="gallery-box-content"><div><i class="icon-lg ion-ios-search"></i></div></div></div></a></div></div>';
								+'</div></div>'
							
						} 
						result += '</div></div>';
					}).error(function(XMLHttpRequest, textStatus, errorThrown)
					{          
						result = textStatus;
					}).complete(function(){
						$('#movielay').empty().append(result);    
						$('#sWindow').empty().append(fWindow);
						$('#ranking').click(function() {
							Movie.ranking();
						})
					});
					
				},
				movieName : function(filmNumber) {
		 			$.getJSON(context + '/movie/movie_name/'+filmNumber, 
							function(data) {
		 						var story = data.story;
		 						var sdiv = story.replace(/\[/g,'<h3>');
		 						var ediv = sdiv.replace(/\]/g,'</h3>');
								var movieInfom = 
									'<div id="movie_info" class="movie_info"><div id="movie_poster"><img id="movie_float" src="'+context+'/resources/images/'+data.filmNumber+'.jpg;" alt="" width="250" height="350" /></div>'
									+'<h2>'+data.filmName+'</h2>'
									+'<table id="movie_tab"><tr><th style="font-size: 18px">예매율</th><td> '+data.tRate+'%</td></tr><tr><th>감독</th>'
									+'<td>'+data.director+'</td><tr><th>배우</th><td>'+data.actor+'</td></tr>'
									+'<tr><th>장르</th><td>'+data.genre+'</td></tr><tr><th>기본</th><td>'+data.rate+', '+data.runtime+', '+data.country+'분 '+'</td></tr><tr><th>개봉</th>'
									+'<td>'+data.releaseDate+' <a href="#">&nbsp;&nbsp;&nbsp;<input type="button" value="바로 예매" style="font-size: 12px; width: 100px; border-radius: 10px; float:right; margin-right: 150px;" class="btn btn-primary btn-block" id="booking"></a></td></tr></table>'
									+'</div>'
									+'<div id="movie_story" class="movie_story_lay movie_margin_b20"><h2>영화 스토리</h2><div class="movie_story movie_margin_a10 movie_margin_b20">'+ediv+'</div></div><hr/>'
									+'<div id="movie_cut" class="movie_cut_lay movie_margin_b20"><h2>스틸컷&nbsp;&nbsp;&nbsp;<input type="button" value="스틸컷 더보기" id="cutmore" style="font-size: 15px; float: right; width: 130px; border-radius: 10px; margin-right: 570px;" class="btn btn-primary btn-block"></h2>'
									+'<div class="movie_cut movie_margin_l30  movie_float"><a href="#"><img src="'+context+'/resources/images/'+data.filmNumber+'1.jpg;" alt="" width="250" height="161" /></a></div>'
									+'<div class="movie_cut movie_margin_l20 movie_float"><a href="#"><img src="'+context+'/resources/images/'+data.filmNumber+'2.jpg;" alt="" width="250" height="161" /></a></div>'
									+'<div class="movie_cut movie_margin_l20 movie_float"><a href="#"><img src="'+context+'/resources/images/'+data.filmNumber+'3.jpg;" alt="" width="250" height="161" /></a></div>'
									+'</div>'
									+'<div id="movie_tra" class="movie_tra_lay movie_margin_b20 "><h2>트레일러</h2>';
								$.each(data.trailer.split("/"),function(index, value){
									movieInfom +='<div class="movie_tra margin_l20 movie_float"><iframe width="270" height="200" src="https://www.youtube.com/embed/'+value+'" frameborder="0" allowfullscreen></iframe></div>';
								});
									movieInfom +='<div class="movie_tra_name movie_float movie_margin_r20"><strong>(1차 예고편)</strong></div><div class="movie_tra_name movie_float movie_margin_r20"><strong>(2차 예고편)</strong></div>'
										+'<div class="movie_tra_name movie_float"><strong>(3차 예고편)</strong></div></div>'
										+'</div>'
										+'<p><br/><button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">Close <i class="ion-android-close"></i></button></p>';
								
								$('#movieModal-body').empty();	
								$('#movieModal-body').html(movieInfom);
								$('#movie_info').css('width', '95%').css('height', '500px').css('margin','20px');
								$('#movie_poster').css('float', 'left').css('border', '1px solid black').css('width', '250px').css('height', '350px').css('margin', 'auto').css('margin-right','30px');
								$('#movie_float').css('float', 'left');
								$('#movie_tab').css('width', '400px').css('height', '300px').css('border-collapse', 'collapse');
								$('#booking').click(function(data) {
									alert(this);
								})
								$('#cutmore').click(function() {
									
									Movie.movieBasic(data.filmNumber);
								});
							});
				},
				movieBasic : function(data) {
					$.getJSON(context + '/movie/movie_Basic/'+data, function(data) {
						if ((data.cut.split("/").length)>6 && (data.cut.split("/").length)<9) {
							var movieBasic ='<div class="cut_allcut_lay1"><h1>'+data.filmName+'&nbsp;&nbsp;&nbsp;<input type="button" value="영화정보" id="movie_home" style="font-size: 17px; float: right; width: 130px; border-radius: 10px; margin-right: 480px;" class="btn btn-primary btn-block"></h1>';
						    $.each(data.cut.split("/"), function(index,value){
						    		movieBasic += '<div class="cut_allcut cut_margin_l20 cut_margin_b20 cut_float">'
					    				+'<a href="'+context+'/resources/images/'+value+'.jpg;">'
					    				+'<img src="'+context+'/resources/images/'+value+'.jpg;" alt="" width="250px" height="161px" />'
					    				+'</a></div>';
						    });
						}
						    if ((data.cut.split("/").length)>9 && (data.cut.split("/").length)<12) {
						    	var movieBasic ='<div class="cut_allcut_lay2"><h1>'+data.filmName+'&nbsp;&nbsp;&nbsp;<input type="button" value="영화정보" id="movie_home" style="font-size: 17px; float: right; width: 130px; border-radius: 10px; margin-right: 480px;" class="btn btn-primary btn-block"></h1>';
							    $.each(data.cut.split("/"), function(index,value){
							    		movieBasic += '<div class="cut_allcut cut_margin_l20 cut_margin_b20 cut_float">'
						    				+'<a href="'+context+'/resources/images/'+value+'.jpg;">'
						    				+'<img src="'+context+'/resources/images/'+value+'.jpg;" alt="" width="250px" height="161px" />'
						    				+'</a></div>';
							    });
							}
						    if ((data.cut.split("/").length)%3 == 0) {
						    	var movieBasic ='<div class="cut_allcut_lay3"><h1>'+data.filmName+'&nbsp;&nbsp;&nbsp;<input type="button" value="영화정보" id="movie_home" style="font-size: 17px; float: right; width: 130px; border-radius: 10px; margin-right: 480px;" class="btn btn-primary btn-block"></h1>';
							    $.each(data.cut.split("/"), function(index,value){
							    		movieBasic += '<div class="cut_allcut cut_margin_l20 cut_margin_b20 cut_float">'
						    				+'<a href="'+context+'/resources/images/'+value+'.jpg;">'
						    				+'<img src="'+context+'/resources/images/'+value+'.jpg;" alt="" width="250px" height="161px" />'
						    				+'</a></div>';
							    });
							}
						    movieBasic +='</div><p><br/><button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">Close <i class="ion-android-close"></i></button></p>';
						
						$('#movieModal-body').html(movieBasic);
						$('#movie_home').click(function() {
							$('#movieModal-body').empty();
							Movie.movieName(data.filmNumber);
						});
					});
			
				}
	 };
