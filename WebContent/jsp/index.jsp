<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<H1>
SENDAI-KANKO
</H1>

<form action="./post2" method="post">



<table border=1>
<tr><th>id</th><td>1</td></tr>
<tr><th>text</th><td><input type="text" name="text" required="required" placeholder="AIで処理したい文字列" /></td></tr>
</table>
<input type="submit" value="AI処理" />
</form>

</body>
</html>