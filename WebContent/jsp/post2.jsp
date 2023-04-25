<%@page import="jp.ac.jc21.t.yoshizawa.gson2023.resultJson.Entity"%>
<%@page import="jp.ac.jc21.t.yoshizawa.gson2023.resultJson.Intent"%>
<%@page import="java.util.Optional"%>
<%@page import="jp.ac.jc21.t.yoshizawa.gson2023.resultJson.ResultBody"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="./jsp/xxx.css">

<meta charset="UTF-8">
<title>SENDAI-KANKO</title>
</head>


<%
	Optional<ArrayList<String>> optTextLog = Optional.ofNullable(
			(ArrayList<String>) request.getAttribute("textLog"));

	int logSize1 = optTextLog.get().size();

	Optional<ArrayList<String>> optHtmlLog = Optional.ofNullable(
			(ArrayList<String>) request.getAttribute("htmlLog"));
	
	int logSize2 = optHtmlLog.get().size();
%>
<body>
	<%
		if (optTextLog.isPresent() == true) {
	%>
	<H1>SENDAI-KANKO</H1>
	<H2>質問してください</H2>
	<hr>


	<table class="table table-hover table-responsive" border=0　width=600>

	
	<% if(logSize1 >= 4 ){
		String message1 = optTextLog.get().get(logSize1 - 4);
		String message2 = optHtmlLog.get().get(logSize2 - 4);%>
	
	<tr >
	<td  align="right" width=10%>
	<td  align="right" width=80%>
	<div class="balloon2-right">
	  <p><%= message1 %></p>
	</div>
	</td>
	<td width=10% align="center"><img src="Image-1.jpg" width=100%></td>
	</tr>
	<tr >
	<td width=10% align="center"><img src="Image-2.jpg" width=100%></td>
	<td colspan="2" width=80%>
	<div class="balloon2-left">
	  <p><%= message2 %></p>
	</div></td>
	<td  align="right" width=10%>
	</tr>
	<% } %>
	
	
	<% if(logSize1 >= 3 ){ 
		String message1 = optTextLog.get().get(logSize1 - 3);
		String message2 = optHtmlLog.get().get(logSize2 - 3);%>
	
	<tr >
	<td  align="right" width=10%>
	<td  align="right" width=80%>
	<div class="balloon2-right">
	  <p><%= message1 %></p>
	</div>
	</td>
	<td width=10% align="center"><img src="Image-1.jpg" width=100%></td>
	</tr>
	<tr >
	<td width=10% align="center"><img src="Image-2.jpg" width=100%></td>
	<td colspan="2" width=80%>
	<div class="balloon2-left">
	  <p><%= message2 %></p>
	</div></td>
	<td  align="right" width=10%>
	</tr>
	
	<% } %>
	
	<% if(logSize1 >= 2 ){ 
		String message1 = optTextLog.get().get(logSize1 - 2);
		String message2 = optHtmlLog.get().get(logSize2 - 2);%>
	
	<tr >
	<td  align="right" width=10%>
	<td  align="right" width=80%>
	<div class="balloon2-right">
	  <p><%= message1 %></p>
	</div>
	</td>
	<td width=10% align="center"><img src="Image-1.jpg" width=100%></td>
	</tr>
	<tr >
	<td width=10% align="center"><img src="Image-2.jpg" width=100%></td>
	<td colspan="2" width=80%>
	<div class="balloon2-left">
	  <p><%= message2 %></p>
	</div></td>
	<td  align="right" width=10%>
	</tr>
	
	<% } %>
	<% if(logSize1 >= 1 ){ 
		String message1 = optTextLog.get().get(logSize1 - 1);
		String message2 = optHtmlLog.get().get(logSize2 - 1);%>
	
	<tr >
	<td  align="right" width=10%>
	<td  align="right" width=80%>
	<div class="balloon2-right">
	  <p><%= message1 %></p>
	</div>
	</td>
	<td width=10% align="center"><img src="Image-1.jpg" width=100%></td>
	</tr>
	<tr >
	<td width=10% align="center"><img src="Image-2.jpg" width=100%></td>
	<td colspan="2" width=80%>
	<div class="balloon2-left">
	  <p><%= message2 %></p>
	</div></td>
	<td  align="right" width=10%>
	</tr>
	
	<% } %>
	
	
	
	<% } else {%>
	<H1>実行結果：null</H1>
	<% }%>
	 
	 <tr>
	 <td colspan="3">
	<div id="quest">
	<hr>
		<form action="./post2" method="POST">
	
	<input type="text" name="text" placeholder="質問してください" />
	
	<button type="submit"  class="btn btn-success" >話す</button>
	</div>
	</form>
	</td>
	</tr>
	</table>

</body>
</html>