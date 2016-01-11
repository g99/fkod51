<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a{
 text-decoration: none;
}
table {
 
 font-size:medium;
 }
table>tbody>tr:nth-child(2n){
 
}
 
table>tbody>tr:nth-child(2n+1){
 
}
td:hover{
 background:black;
 color:white;
}
.s{
 background:black;
 color: white;
}
</style>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script>
$(document).ready(function(){
 
 var num=1;
 
 function display(data){
  var output='<div>';
  var items = $(data).find('item');
  items.each(function(index,item){
   with(item){
   var title = $(this).find('title').text();
   var link = $(this).find('link').text();
   var img = $(this).find('image').text();
 
   output += '<table border = "1" style="float:left;">';
   output += '<tr>';
   output += '<td>';
   output += '<img width=\"250\"height=\"300\"src=\"'+img+'\">';
   output += '</td>';
   output += '</tr>';
   output += '<tr>';
   output += '<td style="width:250px; height: auto;" align=\"center\">';
   output += '<a href=\"'+link+'\">'+title+'</a>';
   output += '</td>';
   output += '</tr>';
   output += '</table>';
   }
   output +='</div>';
  });
  $('body').append(output);
 };
 
 function requestAjax(searchWord){
	  var uri = 'http://openapi.naver.com/search?key=1c798d8d3d140d28b3428cf1f2a7cd38&query='+searchWord+'&display=10&start='+num+'&target=movie'; 
	  alert("머여 이건 : " + uri );
  $.ajax({
   url:encodeURI(uri),
   jsonp : "callback",
   dataType : "jsonp",
   type:'GET',
   success:function(data){
    display(data);
   }
  });
 };
 
 $('#search').click(function(){
  $('table').remove();
  num=1;
  var searchWord = $('#category').val();
  requestAjax(searchWord);
  
 });
  
 
});
</script>
</head>
<body>
<h1>Naver 영화검색</h1>
<span>검색입력:</span><input type="text" id="category"><input type="button" value="검색" id="search">
</body>
</html>