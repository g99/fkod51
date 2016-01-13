<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FKOD - chart</title>

<link href="${admin_css}/bootstrap.min.css" rel="stylesheet">
<link href="${admin_css}/datepicker3.css" rel="stylesheet">
<link href="${admin_css}/bootstrap-table.css" rel="stylesheet">
<link href="${admin_css}/styles.css" rel="stylesheet">

<!--Icons-->
<script src="${admin_js}/lumino.glyphs.js"></script>


</head>

<body>
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>MTB</span>관리자</a>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
		<ul class="nav menu">
			<li class="active"><a href="${context}/admin/main"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> 홈</a></li>
			<li><a href="${context}/admin/member"><svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg> 회원관리</a></li>
			<li><a href="${context}/admin/movie"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg> 영화관리</a></li>
			<li><a href="${context}/admin/board"><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg> 게시판관리</a></li>
			<li><a href="${context}/admin/chart"><svg class="glyph stroked app-window"><use xlink:href="#stroked-app-window"></use></svg> 차트</a></li>
		</ul>
	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">차트관리</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">일별 판매량</div>
					<div class="panel-body">
						<div id="curve_chart"></div>
					</div>
				</div>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">예매율</div>
					<div class="panel-body">
						<div id="piechart"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">연령별</div>
					<div class="panel-body">
						<div id="donutchart"></div>
					</div>
				</div>
			</div>
		</div><!--/.row-->
	</div><!--/.main-->

	<script src="${admin_js}/jquery-1.11.1.min.js"></script>
	<script src="${admin_js}/bootstrap.min.js"></script>
	<script src="${admin_js}/bootstrap-datepicker.js"></script>
	<script src="${admin_js}/bootstrap-table.js"></script>
	<!-- 라인차트 -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<!-- 파이차트 -->
	<script type="text/javascript" src="https://www.google.com/jsapi?autoload= 
{'modules':[{'name':'visualization','version':'1.1','packages':
['corechart']}]}"></script>
	
	<!-- 구현부분 -->
	<script>
		!function ($) {
			$(document).on("click","ul.nav li.parent > a > span.icon", function(){		  
				$(this).find('em:first').toggleClass("glyphicon-minus");	  
			}); 
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
		
		$(function() {
			lineChartFactor();
			/* 라인차트 그리기 */
			google.charts.load('current', {'packages':['corechart']});
		    google.charts.setOnLoadCallback(drawLineChart);
		    /* 파이차트 그리기 */
		    google.setOnLoadCallback(drawPieChart);
		    google.setOnLoadCallback(drawDonutChart);
		});
		
		var lineFactor = [];
    	var lineChartFactor = function() {
    		for (var i = 0; i < 7; i++) {
    			$.ajax(context + "/admin/line_chart",{
    		       	 data : {
    		       		 "key" : i+1
    		       	 },
    		       	 async : false,
    		       	 success : function(data) {
    		       		lineFactor.push(parseInt(data.count));
    		   		 },
    		   		 error : function() {
    		   			
    		   		 }
    		         });
			}
		};

	   function drawLineChart() {
	        var data = google.visualization.arrayToDataTable([
	          ['요일',    '판매량',       '매출액'],
	          ['월요일',  lineFactor[0],      20],
	          ['화요일',  lineFactor[1],      40],
	          ['수요일',  lineFactor[2],      60],
	          ['목요일',  lineFactor[3],      20],
	          ['금요일',  lineFactor[4],      35],
	          ['토요일',  lineFactor[5],      32],
	          ['일요일',  lineFactor[6],      12]
	        ]);
	
	        var options = {
	          curveType: 'function',
	          legend: { position: 'bottom' },
	          width : '100%',
	          height : '500'
	        };
	
	        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
	
	        chart.draw(data, options);
        }
	    
	    function drawPieChart() {
	        var data = google.visualization.arrayToDataTable([
	          ['영화',    '예매율'],
	          ['마션',         50],
	          ['내부자들',      25],
	          ['검은사제들',    10],
	          ['헝거게임',       5],
	          ['도리화가',      10]
	        ]);

	        var options = {
	        	width : '100%',
	   	        height : '400'
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

	        chart.draw(data, options);
	    }
	    
	    function drawDonutChart() {
	        var data = google.visualization.arrayToDataTable([
	          ['연령',  '비율'],
	          ['노인',     15],
	          ['청소년',    30],
	          ['일반',     55],
	        ]);

	        var options = {
	          pieHole: 0.4,
	          width : '100%',
	   	      height : '400'
	        };

	        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
	        chart.draw(data, options);
	    }
	</script>
    
</body>

</html>
