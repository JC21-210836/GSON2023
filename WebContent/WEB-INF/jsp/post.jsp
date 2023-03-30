<%@page import="jp.ac.jc21.t.yoshizawa.gson2023.resultJson.Entity"%>
<%@page import="jp.ac.jc21.t.yoshizawa.gson2023.resultJson.Intent"%>
<%@page import="java.util.Optional"%>
<%@page import="jp.ac.jc21.t.yoshizawa.gson2023.resultJson.ResultBody"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

	<table border=1>
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
								3 * result.getResult().getPrediction().getEntities().length%>
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

		<%
			for (Entity es : result.getResult().getPrediction().getEntities()) {
		%>
		<tr>
			<th rowspan="2">entity</th>
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


	</table>

	<% } else {%>
	<H1>実行結果：null</H1>
	<% }%>
</body>
</html>