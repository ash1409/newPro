<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"                                                    "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee </title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style1.css">
</head>
<body>
<table border="2" class="mytab">
<tr>
<td>ID</td>
<td>AGE</td>
<td>FIRST NAME</td>
<td>LAST NAME</td>
</tr>

<%
 try
 {
 String connectionURL = "jdbc:mysql://localhost/emp";
            Connection connection = null; 
            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            connection = DriverManager.getConnection(connectionURL, "root", "dblogin");
            
 String query="select * from Employees";

 Statement stmt=connection.createStatement();
 ResultSet rs=stmt.executeQuery(query);

while(rs.next())
{
%>
    <tr><td><%= rs.getInt(1) %></td>
	<td><%= rs.getString("AGE") %></td>
	<td><%= rs.getString("first")%></td>
	<td><%= rs.getString("last") %></td></tr>

<%
}
    rs.close();
    stmt.close();
    connection.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }

%>
</body>
</html> 
