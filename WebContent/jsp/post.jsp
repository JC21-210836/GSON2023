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

<link rel="stylesheet" type="text/css" href="xxx.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<%
	Optional<ResultBody> optResult = Optional.ofNullable(
			(ResultBody) request.getAttribute("result"));
%>
<body>
	<%
		if (optResult.isPresent() == true) {
			ResultBody result = optResult.get();
	%>
	<H1>実行結果：成功</H1>

	<!--<table border=1>
		<tr>
			<th>kind</th>
			<td><%=result.getKind()%></td>
		</tr>
		<tr>
			<th
				rowspan="<%=3 +
								2 * result.getResult().getPrediction().getIntents().length +
								3 * result.getResult().getPrediction().getEntities().length%>">result</th>
			<th>query</th>
			<td><%=result.getResult().getQuery()%></td>
		</tr>
		<tr>
			<th
				rowspan="<%=2 +
								2 * result.getResult().getPrediction().getIntents().length +
								3 * result.getResult().getPrediction().getEntities().length %>
		%>">prediction</th>
			<th>topIntent</th>
			<td><%=result.getResult().getPrediction().getTopIntent()%></td>
		</tr>
		<tr>
			<th>projectKind</th>
			<td><%=result.getResult().getPrediction().getProjectKind()%></td>
		</tr>

		<tr>
			<th rowspan="<%= result.getResult().getPrediction().getIntents().length %>">intent</th>
		<%
			for (Intent is : result.getResult().getPrediction().getIntents()) {
		%>
			<td>category : <%=is.getCategory()%></td>
			<td>( confidenceScore : <%=(int) (is.getConfidenceScore() * 100)%>%
				)
			</td>
		</tr>
		<%
			}
		%>

			<th rowspan="<%= 2* result.getResult().getPrediction().getEntities().length %>">entity</th>
		<%
			for (Entity es : result.getResult().getPrediction().getEntities()) {
		%>
			<td rowspan="2">category : <%=es.getCategory()%></td>
			<td>( text : <%=es.getText()%> )
			</td>
		</tr>
		<tr>
			<td>( confidenceScore : <%=(int) (es.getConfidenceScore() * 100)%>%
				)
			</td>
		</tr>
		<%} %>


	</table>-->
	
	
	<% if(result.getResult().getPrediction().getTopIntent().equals("toEat")){
		for (Entity es : result.getResult().getPrediction().getEntities()) {
	%>
	<h1><%= es.getText()%>を食べよう！</h1>
	<a href="https://www.google.com/search?q=<%= es.getText() %>+%E3%81%8A%E3%81%99%E3%81%99%E3%82%81">おいしい店を紹介します</a>
	<%	}
		} %>
	
	<% if(result.getResult().getPrediction().getTopIntent().equals("place")){
		for (Entity es : result.getResult().getPrediction().getEntities()) {
	%>
	<h1><%= es.getText()%>に行こう！</h1>
	<a href="https://www.google.com/search?q=<%= es.getText() %>+%E3%80%80行き方">行き方を紹介します</a>
	<%	}
		} %>
	
	<% } else {%>
	<H1>実行結果：null</H1>
	<% }%>
	
	<% 
	ArrayList<String> messageLog = new ArrayList<String>();
	if(request.getAttribute("MESSAGE")!= null){
		 messageLog = (ArrayList<String>)request.getAttribute("MESSAGE");
	}
	int logSize = messageLog.size();
	%>
	<body>
	
	<table class="table table-hover table-responsive" border=0 width=600>
	
	
	<% if(logSize >= 6 ){ 
		String message = messageLog.get(logSize-6);%>
	<tr >
	<td  align="right" width=10%>
	<td  align="right" width=80%>
	<div class="balloon2-right">
	  <p><%= message %></p>
	</div>
	</td>
	<td width=10% align="center"><img src="Image-2.png" width=100%></td>
	</tr>
	<% } %>
	<% if(logSize >= 5 ){ 
		String message = messageLog.get(logSize-5);%>
	<tr >
	<td width=10% align="center"><img src="Image-1.png" width=100%></td>
	<td colspan="2" width=80%>
	<div class="balloon2-left">
	  <p><%= message %></p>
	</div></td>
	<td  align="right" width=10%>
	</tr>
	<% } %>
	
	<% if(logSize >= 4 ){ 
		String message = messageLog.get(logSize-4);%>
	<tr >
	<td  align="right" width=10%>
	<td  align="right" width=80%>
	<div class="balloon2-right">
	  <p><%= message %></p>
	</div>
	</td>
	<td width=10% align="center"><img src="Image-2.png" width=100%></td>
	</tr>
	<% } %>
	<% if(logSize >= 3 ){ 
		String message = messageLog.get(logSize-3);%>
	<tr >
	<td width=10% align="center"><img src="Image-1.png" width=100%></td>
	<td colspan="2" width=80%>
	<div class="balloon2-left">
	  <p><%= message %></p>
	</div></td>
	<td  align="right" width=10%>
	</tr>
	<% } %>
	
	<% if(logSize >= 2 ){ 
		String message = messageLog.get(logSize-2);%>
	<tr >
	<td  align="right" width=10%>
	<td  align="right" width=80%>
	<div class="balloon2-right">
	  <p><%= message %></p>
	</div>
	</td>
	<td width=10% align="center"><img src="Image-2.png" width=100%></td>
	</tr>
	<% } %>
	<% if(logSize >= 1 ){ 
		String message = messageLog.get(logSize-1);%>
	<tr >
	<td width=10% align="center"><img src="Image-1.png" width=100%></td>
	<td colspan="2" width=80%>
	<div class="balloon2-left">
	  <p><%= message %></p>
	</div></td>
	<td  align="right" width=10%>
	</tr>
	<% } %>
	
	<tr >
	<td colspan="2" align="right">
	<form action="./post" method="POST">
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