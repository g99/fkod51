<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<div class="container">
			<div class="slider_wrapper">
				<ul id="image_slider">
					<li><img src="${img}/movie-slide1.jpg" style="width:100%; height:100%;"></li>
					<li><img src="${img}/movie-slide2.jpg" style="width:100%; height:100%;"></li>
					<li><img src="${img}/movie-slide3.jpg" style="width:100%; height:100%;"></li>
					<li><img src="${img}/movie-slide4.jpg" style="width:100%; height:100%;"></li>
					<li><img src="${img}/movie-slide5.jpg" style="width:100%; height:100%;"></li>
				</ul>					
				<span class="nvgt" id="prev"></span>
				<span class="nvgt" id="next"></span>		
			</div>
			<ul id="pager">
			</ul>
</div>

<%-- 	
<div class="container" style="background: rgba(180, 181, 168, 0.19);">
	<div class="row">
		<div class="box">
			<div class="col-lg-12 text-center">
				<div id="carousel-example-generic" class="carousel slide">
					<!-- Indicators -->
					<ol class="carousel-indicators hidden-xs">
						<li data-target="#carousel-example-generic" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						<li data-target="#carousel-example-generic" data-slide-to="3"></li>
						<li data-target="#carousel-example-generic" data-slide-to="4"></li>
						<li data-target="#carousel-example-generic" data-slide-to="5"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" style="height: 610px; margin-top: 230px; margin-bottom: 50px;">
						<div class="item active">
							<img class="img-responsive img-full" style="height: 100%; width: 100%;"
								src="${img}/movie-slide1.jpg" alt="">
						</div>
						<div class="item">
							<img class="img-responsive img-full" style="height: 100%; width: 100%;"
								src="${img}/movie-slide1-1.jpg" alt="">
						</div>
						<div class="item">
							<img class="img-responsive img-full" style="height: 100%; width: 100%;"
								src="${img}/movie-slide3.jpg" alt="">
						</div>
						<div class="item">
							<img class="img-responsive img-full" style="height: 100%; width: 100%;"
								src="${img}/movie-slide4.jpg" alt="">
						</div>
						<div class="item">
							<img class="img-responsive img-full" style="height: 100%; width: 100%;"
								src="${img}/movie-slide5.jpg" alt="">
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic"
						data-slide="prev"> <span class="icon-prev"></span>
					</a> <a class="right carousel-control" href="#carousel-example-generic"
						data-slide="next"> <span class="icon-next"></span>
					</a>
				</div>
			</div>
		</div>
	</div>
</div> --%>