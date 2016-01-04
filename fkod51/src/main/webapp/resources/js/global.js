var Global = {

   init : function() {
      var wrapper = document.createElement("div");
      wrapper.id = "wrapper";
      document.body.appendChild(wrapper);
      
      $("<div id='header'></div>").appendTo($("#wrapper"));
      $("<div id='outbox'></div>").appendTo($("#wrapper"));
         $("<div id='box'></div>").appendTo($("#outbox"));
      $("<div id='footer'></div>").appendTo($("#wrapper"));
   },

   load : function(btn, target, url) {
		$(btn).click(function() {
			$(target).load(url);
		});
   },
   
   move : function(btn, url) {
	    $(btn).click(function() {
			location.href = url;
		});
   }
};
/*=======================================================================================================*/
/*=======================================================================================================*/
/*=======================================================================================================*/
