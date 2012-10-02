<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HTML Editor</title>
	<script language="Javascript" src="./script/jquery-1.3.2.min.js" type="text/javascript"></script>
	<script language="Javascript" src="./script/htmlbox/htmlbox.colors.js" type="text/javascript"></script>
	<script language="Javascript" src="./script/htmlbox/htmlbox.styles.js" type="text/javascript"></script>
	<script language="Javascript" src="./script/htmlbox/htmlbox.syntax.js" type="text/javascript"></script>
	<script language="Javascript" src="./script/htmlbox/xhtml.js" type="text/javascript"></script>
	<script language="Javascript" src="./script/htmlbox/htmlbox.min.js" type="text/javascript"></script>
</head>
<body>
<textarea id='ha'></textarea>
<script language="Javascript" type="text/javascript">
$("#ha").css("height","100%").css("width","100%").htmlbox({
    toolbars:[
	    [
		// Cut, Copy, Paste
		"separator","cut","copy","paste",
		// Undo, Redo
		"separator","undo","redo",
		// Bold, Italic, Underline, Strikethrough, Sup, Sub
		"separator","bold","italic","underline","strike","sup","sub",
		// Left, Right, Center, Justify
		"separator","justify","left","center","right",
		// Ordered List, Unordered List, Indent, Outdent
		"separator","ol","ul","indent","outdent",
		// Hyperlink, Remove Hyperlink, Image
		"separator","link","unlink","image"
		
		],
		[// Show code
		"separator","code",
        // Formats, Font size, Font family, Font color, Font, Background
        "separator","formats","fontsize","fontfamily",
		"separator","fontcolor","highlight",
		],
		[
		//Strip tags
		"separator","removeformat","striptags","hr","paragraph",
		// Styles, Source code syntax buttons
		"separator","quote","styles","syntax"
		]
	],
	skin:"blue"
});
</script>
</body>
</html>