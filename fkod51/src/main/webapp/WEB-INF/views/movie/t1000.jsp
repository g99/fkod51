<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Daum 웹 검색 API</title>
	<style type="text/css">	
table
{
border-collapse:collapse;
}
table,th, td
{
border: 1px solid black;
}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script type="text/javascript">
function search_query() {      
	var query = $("#query").val();
	var category = $("#category").val();
	var url = "https://apis.daum.net/search/"+category;
	url += "?output=json";
	url += "&apikey=7ceffb2166ac5a21e51fd4573ea1a17f"
	url += "&q=" + query;
	url += "&result=5";
	url += "&callback=?";
	
	$.getJSON(url,function(data) {
		result = "<table style='border:1px solid black;'>";
		result += "<tr>";
		result += "<th>제목</th><th>본문</th><th>링크</th>";
		result += "</tr>";
		for (var i in data.channel.item)
		{
			
			result += "<tr>";
			result += "<td>"+data.channel.item[i].title+"</td>";
			result += "<td>"+data.channel.item[i].description+"</td>";
			result += "<td>"+data.channel.item[i].link+"</td>";
			result += "</tr>";
		} 
		result += "</table>";
	}).error(function(XMLHttpRequest, textStatus, errorThrown)
	{          
		result = textStatus;
	}).complete(function(){
		$("#results").html(result);                                    
	});
}
	</script>
	</head>
		<form id="search_form" action="javascript:search_query();" method="post">
              <select id="category">
                <option value="web">web</option>
                <option value="board">board</option>
                <option value="knowledge">knowledge</option>
                <option value="blog">blog</option>
                <option value="cafe">cafe</option>

            </select>&nbsp; <input type="text" size="10" id="query" name="query"/>&nbsp;<input type="submit" >
		</form>		
		<div id="results"></div>
	</body>
</html>
