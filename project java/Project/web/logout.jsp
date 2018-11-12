<%-- 
    Document   : logout
    Created on : 11 Nov, 2018, 12:25:24 PM
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
session.setAttribute("user", null);
session.invalidate();
response.sendRedirect("student.jsp");
%>
    </body>
</html>
