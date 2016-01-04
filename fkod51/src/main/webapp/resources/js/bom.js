 var Bom = {
		popup : function(project,id) {
			var url = project + "/admin/Admin.do?";
			var name = "팝업";
			var style = "toolbar=no, status=no, directories=no, scrollbars=yes, location=no, resizable=no, border=0, menubar=no";
			var param = "page=member_profile&id="+id;
			var width = 400;
			var height = 500;
			var xpos = (screen.availWidth - width) / 2;
			var ypos = (screen.availHeight - height) / 2;
			style = style + ",top=" + ypos + ",left=" + xpos + ",width=" + width + ",height=" + height;
			url = url + param;
			window.open(url,"",style);
			}
		};
 
 var Bom2 = {
			popup : function(project,filmNumber) {
				var url = project + "/admin/Admin.do?";
				var name = "팝업";
				var style = "toolbar=no, status=no, directories=no, scrollbars=yes, location=no, resizable=no, border=0, menubar=no";
				var param = "page=movie_profile&filmNumber="+filmNumber;
				var width = 400;
				var height = 500;
				var xpos = (screen.availWidth - width) / 2;
				var ypos = (screen.availHeight - height) / 2;
				style = style + ",top=" + ypos + ",left=" + xpos + ",width=" + width + ",height=" + height;
				url = url + param;
				window.open(url,"",style);
				}
			};
