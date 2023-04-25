<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./jsp/xxx.css">
<meta charset="UTF-8">
<title>SENDAI-KANKO</title>
</head>
<body>
<H1>
SENDAI-KANKO
</H1>

<form action="./post2" method="post">

 
 <H2>質問してください</H2>
 <hr>
 	<div id="quest">
		<input type="text" name="text" placeholder="質問してください" />
		<button type="submit"  class="btn btn-success" >話す</button>
	</div>
</form>

</body>
</html>