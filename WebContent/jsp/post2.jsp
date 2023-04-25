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
<title>Insert title here</title>
</head>


<%
	Optional<ArrayList<String>> optTextLog = Optional.ofNullable(
			(ArrayList<String>) request.getAttribute("textLog"));

	int logSize = optTextLog.get().size();

	Optional<ArrayList<String>> optHtmlLog = Optional.ofNullable(
			(ArrayList<String>) request.getAttribute("htmlLog"));
%>
<body>
	<%
		if (optTextLog.isPresent() == true) {
	%>
	<H1>実行結果：成功</H1>

	<!--
	<hr>
	<H3>[質問]</H3>
	<%= optTextLog.get().get(optTextLog.get().size()-1) %>
	<hr>
	<H3>[回答]</H3>
	<%= optHtmlLog.get().get(optHtmlLog.get().size()-1) %>
	
	 -->
	
	<% } else {%>
	<H1>実行結果：null</H1>
	<% }%>
	


	
	<% if(logSize >= 6 ){
		String message = optTextLog.get().get(logSize-6);%>
	<H3>[質問]</H3>
	<%= optTextLog.get().get(optTextLog.get().size()-6) %>
	<H3>[回答]</H3>
	<%= optHtmlLog.get().get(optHtmlLog.get().size()-6) %>
	<!--<tr >
	<td  align="right" width=10%>
	<td  align="right" width=80%>
	<div class="balloon2-right">
	  <p><%= message %></p>
	</div>
	</td>
	<td width=10% align="center"><img src="Image-2.png" width=100%></td>
	</tr>
	  -->
	<% } %>
	<% if(logSize >= 5 ){ 
		String message = optTextLog.get().get(logSize-5);%>
	<H3>[質問]</H3>
	<%= optTextLog.get().get(optTextLog.get().size()-5) %>
	<H3>[回答]</H3>
	<%= optHtmlLog.get().get(optHtmlLog.get().size()-5) %>
	<!-- 
	<tr >
	<td width=10% align="center"><img src="Image-1.png" width=100%></td>
	<td colspan="2" width=80%>
	<div class="balloon2-left">
	  <p><%= message %></p>
	</div></td>
	<td  align="right" width=10%>
	</tr>
	 -->
	<% } %>
	
	<% if(logSize >= 4 ){ 
		String message = optTextLog.get().get(logSize-4);%>
	<H3>[質問]</H3>
	<%= optTextLog.get().get(optTextLog.get().size()-4) %>
	<H3>[回答]</H3>
	<%= optHtmlLog.get().get(optHtmlLog.get().size()-4) %>
	<!-- 
	<tr >
	<td  align="right" width=10%>
	<td  align="right" width=80%>
	<div class="balloon2-right">
	  <p><%= message %></p>
	</div>
	</td>
	<td width=10% align="center"><img src="Image-2.png" width=100%></td>
	</tr>
	 -->
	<% } %>
	<% if(logSize >= 3 ){ 
		String message = optTextLog.get().get(logSize-3);%>
	<H3>[質問]</H3>
	<%= optTextLog.get().get(optTextLog.get().size()-3) %>
	<H3>[回答]</H3>
	<%= optHtmlLog.get().get(optHtmlLog.get().size()-3) %>
	<!-- 
	<tr >
	<td width=10% align="center"><img src="Image-1.png" width=100%></td>
	<td colspan="2" width=80%>
	<div class="balloon2-left">
	  <p><%= message %></p>
	</div></td>
	<td  align="right" width=10%>
	</tr>
	 -->
	<% } %>
	
	<% if(logSize >= 2 ){ 
		String message = optTextLog.get().get(logSize-2);%>
	<H3>[質問]</H3>
	<%= optTextLog.get().get(optTextLog.get().size()-2) %>
	<H3>[回答]</H3>
	<%= optHtmlLog.get().get(optHtmlLog.get().size()-2) %>
	<!-- <tr >
	<td  align="right" width=10%>
	<td  align="right" width=80%>
	<div class="balloon2-right">
	  <p><%= message %></p>
	</div>
	</td>
	<td width=10% align="center"><img src="Image-2.png" width=100%></td>
	</tr>
	 -->
	<% } %>
	<% if(logSize >= 1 ){ 
		String message = optTextLog.get().get(logSize-1);%>
	<H3>[質問]</H3>
	<%= optTextLog.get().get(optTextLog.get().size()-1) %>
	<H3>[回答]</H3>
	<%= optHtmlLog.get().get(optHtmlLog.get().size()-1) %>
	<!-- 
	<tr >
	<td width=10% align="center"><img src="Image-1.png" width=100%></td>
	<td colspan="2" width=80%>
	<div class="balloon2-left">
	  <p><%= message %></p>
	</div></td>
	<td  align="right" width=10%>
	</tr>
	 -->
	<% } %>
	
	 
	<!--<hr> -->
	<H3>[質問]</H3>
		<form action="./post2" method="POST">
	<input type="text" name="text" placeholder="質問してください" />
	
	<button type="submit"  class="btn btn-success" >話す</button>
	
	</form>
	
	<!-- 
	</td>
	<td width=10%><img src="Image-2.png" width=100%></td>
	</tr>
	
	</table>
	</body>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	
	</html>  --> 
</body>
</html>