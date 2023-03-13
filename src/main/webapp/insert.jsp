<%@page import="com.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%
	Member member = null;
	if(request.getAttribute("member") != null){
		member = (Member) request.getAttribute("member");
	}
	if(member != null){
	%>
	<title>Update Member</title>
	<%
	} else {
	%>
	<title>Add Member</title>
	<%
	}
	%>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style type="text/css">
tr, td {
	padding: 10px !important;
}
</style>
</head>
<body>
	<form name="action" action="MemberController" method="post">
		<table>
			<tr>
				<td>
					<%
						if(member != null){
					%>
						<input type="hidden" name="id" value="<%=member.getMemberId() %>" required="required">
					<%
						} 
					%>
				</td>
			</tr>
			<tr>
				<td>First Name:</td>
				<td>
					<%
						if(member != null){
					%>
						<input type="text" name="firstName" value="<%=member.getFirstName() %>" required="required">
					<%
						} else {
					%>
						<input type="text" name="firstName" required="required">
					<% 	
						}
					%>
				</td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td>
					<%
						if(member != null){
					%>
						<input type="text" name="lastName" value="<%=member.getLastName() %>" required="required">
					<%
						} else {
					%>
						<input type="text" name="lastName" required="required">
					<% 	
						}
					%>
				</td>
			</tr>
			<tr>
				<td>Email:</td>
				<td>
					<%
						if(member != null){
					%>
						<input type="text" name="email" value="<%=member.getEmail()%>" required="required">
					<%
						} else {
					%>
						<input type="text" name="email" required="required"> 
					<% 	
						}
					%>
				</td>
			</tr>
			<tr>
				<td>Mobile:</td>
				<td>
					<%
						if(member != null){
					%>
						<input type="text" name="mobile" value="<%=member.getMobile()%>" required="required">
					<%
						} else {
					%>
						<input type="text" name="mobile" required="required"> 
					<% 	
						}
					%>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<%
						if(member != null){
					%>
						<input type="submit" name="action" value="Update" class="btn btn-primary"> 
					<%
						} else {
					%>
 						<input type="submit" name="action" value="Register" class="btn btn-primary"> 
					<% 	
						}
					%>
				</td>
			</tr>
		</table>
	</form>
	<%
		if(member == null){
	%>
		<a href="display.jsp" class="btn btn-primary" > View All Members</a>
	<%
		} 
	%>
	
</body>
</html>