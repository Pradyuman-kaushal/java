<%-- 
    Document   : facl_pref
    Created on : 20 Nov, 2018, 3:41:32 PM
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
            
                String pos=request.getParameter("pref");
                session.setAttribute("pos",pos);
                %><a href="list_app.jsp">Application list</a>
                 <%       
            
            %>
    </body>
</html>
