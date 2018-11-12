<%-- 
    Document   : success
    Created on : 11 Nov, 2018, 12:18:38 PM
    Author     : pradu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
    if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) {

        %>
You are not logged in<br/>
<a href="student.jsp">Please Login</a>
<%} else {
%>
<h1>Welcome <%=session.getAttribute("user")%></h1>
 <a href="application.html"> submit application</a>
            <a href="status.html"> application status</a>
            <br><br>
            
<a href='logout.jsp'>Log out</a>
<%
    }
%>
            
    </body>
</html>
