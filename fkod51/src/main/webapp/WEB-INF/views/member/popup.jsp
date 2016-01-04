<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body topmargin=0 leftmargin=0>
<a href="#" onclick="javascript:goAction(); return false;">openner 닫기</a>
</body>
<script type="text/javascript">
	function goAction() {
		if (opener.closed) {
			alert(opener.closed);
		} else {
			alert(opener.closed)
			window.opener.close();
		}
	}
</script>

