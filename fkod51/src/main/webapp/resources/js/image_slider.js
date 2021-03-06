//1. set ul width 
//2. image when click prev/next button
var ul;
var liItems;
var imageNumber;
var imageWidth;
var prev, next;
var currentPostion = 0;
var currentImage = 0;

var slider = {
 init : function(){
	ul = document.getElementById('image_slider');
	liItems = ul.children;
	imageNumber = liItems.length;
	imageWidth = $(".image_container").width();
	imageWidth = imageWidth/2;
	ul.style.width = parseInt(imageWidth * imageNumber) + 'px';
	prev = document.getElementById("prev");
	next = document.getElementById("next");
	slider.generatePager(imageNumber);
	//.onclike = slide(-1) will be fired when onload;
	/*
	prev.onclick = function(){slide(-1);};
	next.onclick = function(){slide(1);};*/
	prev.onclick = function(){ slider.onClickPrev();};
	next.onclick = function(){ slider.onClickNext();};
	$(".image_container img").css("width",imageWidth);
},

animate : function(opts){
	var start = new Date;
	var id = setInterval(function(){
		var timePassed = new Date - start;
		var progress = timePassed / opts.duration;
		if (progress > 1){
			progress = 1;
		}
		var delta = opts.delta(progress);
		opts.step(delta);
		if (progress == 1){
			clearInterval(id);
			opts.callback();
		}
	}, opts.delay || 17);
	//return id;
},

slideTo : function(imageToGo){
	var direction;
	var numOfImageToGo = Math.abs(imageToGo - currentImage);
	// slide toward left

	direction = currentImage > imageToGo ? 1 : -1;
	currentPostion = -1 * currentImage * imageWidth;
	var opts = {
		duration:500,
		delta:function(p){return p;},
		step:function(delta){
			ul.style.left = parseInt(currentPostion + direction * delta * imageWidth * numOfImageToGo) + 'px';
		},
		callback:function(){currentImage = imageToGo;}	
	};
	slider.animate(opts);
},

onClickPrev :function(){
	if (currentImage == 0){
		slider.slideTo(imageNumber - 2);
	} 		
	else{
		slider.slideTo(currentImage - 1);
	}		
},

onClickNext :function(){
	if (currentImage == imageNumber - 2){
		slider.slideTo(0);
	}		
	else{
		slider.slideTo(currentImage + 1);
	}		
},

generatePager :function(imageNumber){	
	var pageNumber;
	var pagerDiv = document.getElementById('pager');
	for (i = 0; i < imageNumber-1; i++){
		var li = document.createElement('li');
		pageNumber = document.createTextNode(parseInt(i + 1));
		li.appendChild(pageNumber);
		pagerDiv.appendChild(li);
		// add event inside a loop, closure issue.
		li.onclick = function(i){
			return function(){
				slider.slideTo(i);
			}
		}(i);
	}	
	var computedStyle = document.defaultView.getComputedStyle(li, null);
	//border width 1px; offsetWidth = 22
	var liWidth = parseInt(li.offsetWidth);
	var liMargin = parseInt(computedStyle.margin.replace('px',""));
	pagerDiv.style.width = parseInt((liWidth + liMargin * 2) * imageNumber) + 'px';
}
}