<%@page import="com.dao.MemberDao"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Members</title>
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
<%
	ApplicationContext context = new ClassPathXmlApplicationContext("application.xml");
	MemberDao dao = context.getBean("memberDao", MemberDao.class);
	List<Member> members = dao.getAllMember();;
%>
<a href="insert.jsp" class="btn btn-primary" > Add Member</a>
	<form method="post" action="MemberController">
		<table width=100% border="1" cellpadding="10px" cellspacing="10px">
			<tr>
				<td>ID</td>
				<td>First Name</td>
				<td>Last name</td>
				<td>Mobile</td>
				<td>Email</td><
				<td>Edit</td>
				<td>Delete</td>
			</tr>
			<%
			if (!members.isEmpty()) {
				for (Member mem : members) {
			%>
			<tr>
				<td><%=mem.getMemberId()%></td>
				<td><%=mem.getFirstName()%></td>
				<td><%=mem.getLastName()%></td>
				<td><%=mem.getMobile()%></td>
				<td><%=mem.getEmail()%></td>
				<td>
					<form name="edit" method="post" action="MemberController">
						<input type="hidden" name="id" value="<%=mem.getMemberId()%>"> 
						<input type="submit" name="action" value="Edit" class="btn btn-primary" />
					</form>
				</td>
				<td>
					<form name="delete" method="post" action="MemberController">
						<input type="hidden" name="id" value="<%=mem.getMemberId()%>"> 
						<input type="submit" name="action" value="Delete" class="btn btn-danger" />
					</form>
				</td>
			</tr>
			<%
				}
			}
			%>
		</table>
	</form>
</body>
</html>