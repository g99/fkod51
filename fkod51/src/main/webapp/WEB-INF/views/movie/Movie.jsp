<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="movie_wrap"  ></div>


<script type="text/javascript">

$(function() {
	Movie.ranking("${context}");
	$('#movie_wrap').css({
						"padding-left":"23px",
						'margin-left':'100px',
						'border-collapse':'collapse',
						"background":"rgba(151, 154, 162, 0.58)",
						"height":"2000px",
						"width":"85%"
						});
});

</script>