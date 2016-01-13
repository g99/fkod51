<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FKOD - member</title>

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
				<h1 class="page-header">관리자 홈</h1>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">방문자 수</div>
					<div class="panel-body">
						<div id="chart_div"></div>
					</div>
				</div>
			</div>
		</div><!--/.row-->	
		
								
		<div id="checkcheck" class="row" style="margin-left: 0%; margin-right: 0%;">
				<div class="panel panel-blue">
					<div class="panel-heading dark-overlay"><svg class="glyph stroked clipboard-with-paper"><use xlink:href="#stroked-clipboard-with-paper"></use></svg>체크리스트</div>
					<div class="panel-body">
						<ul class="todo-list">
							<li class="todo-list-item" style="height:5%;">
								<div class="checkbox">
									<input type="hidden"/>
									<label></label>
								</div>
								<div class="pull-right action-buttons">
									<a id="delete" href="#checkcheck" class="trash"><svg class="glyph stroked trash"><use xlink:href="#stroked-trash"></use></svg></a>
								</div>
							</li>
						</ul>
					</div>
					<div class="panel-footer">
						<div class="input-group">
							<input id="btn-input" type="text" class="form-control input-md" placeholder="Add new task" />
							<span class="input-group-btn">
								<button class="btn btn-primary btn-md" id="btn-todo">Add</button>
							</span>
						</div>
					</div>
				</div>
		</div><!--/.row-->
	</div>	<!--/.main-->

	<script src="${admin_js}/jquery-1.11.1.min.js"></script>
	<script src="${admin_js}/bootstrap.min.js"></script>
	<script src="${admin_js}/bootstrap-datepicker.js"></script>
	<!-- 막대차트 -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
			google.charts.load('current', {packages: ['corechart', 'bar']});
			google.charts.setOnLoadCallback(drawBasic);
			
			$("#delete").click(function() {
				$("#checkbox:checked").parent().parent().remove();
			});
			$("#btn-todo").click(function() {
				$(".todo-list").append(
						'<li class="todo-list-item">'
						+'<div class="checkbox">'
						+'<input type="checkbox" id="checkbox" />'
						+'<label for="checkbox">'+ $("#btn-input").val()+'</label>'
						+'</div>'
						+'</li>'
						);
				$("#btn-input").val("");
			});
		});
		function drawBasic() {

		      var data = new google.visualization.DataTable();
		      data.addColumn('timeofday', 'Time of Day');
		      data.addColumn('number', '방문자 수');

		      data.addRows([
		        [{v: [9, 0, 0], f: '9 am'}, 2],
		        [{v: [10, 0, 0], f:'10 am'}, 3],
		        [{v: [11, 0, 0], f: '11 am'}, 4],
		        [{v: [12, 0, 0], f: '12 pm'}, 5],
		        [{v: [13, 0, 0], f: '1 pm'}, 10],
		        [{v: [14, 0, 0], f: '2 pm'}, 12],
		        [{v: [15, 0, 0], f: '3 pm'}, 7],
		        [{v: [16, 0, 0], f: '4 pm'}, 15],
		        [{v: [17, 0, 0], f: '5 pm'}, 18],
		        [{v: [18, 0, 0], f: '6 pm'}, 24],
		        [{v: [19, 0, 0], f: '7 pm'}, 20],
		        [{v: [20, 0, 0], f: '8 pm'}, 15],
		        [{v: [21, 0, 0], f: '9 pm'}, 10],
		        [{v: [22, 0, 0], f: '10 pm'}, 7],
		        [{v: [23, 0, 0], f: '11 pm'}, 5],
		        [{v: [24, 0, 0], f: '12 pm'}, 2],
		      ]);

		      var options = {
		        title: '',
		        hAxis: {
		          format: 'h:mm a',
		          viewWindow: {
		            min: [8, 30, 0],
		            max: [24, 30, 0]
		          }
		        },
		        vAxis: {
		        	title : ""
		        },
		        width : '100%',
		        height : '500'
		      };

		      var chart = new google.visualization.ColumnChart(
		        document.getElementById('chart_div'));

		      chart.draw(data, options);
		    }
	</script>
</body>

</html>
