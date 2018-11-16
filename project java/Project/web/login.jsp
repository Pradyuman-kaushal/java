<%-- 
    Document   : login
    Created on : 7 Nov, 2018, 5:06:04 PM
    Author     : pradu
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            
            try{
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            
            String myurl="jdbc:mysql://localhost/project";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection(myurl,"root","");
                Statement st=conn.createStatement();
                String query1="select * from student where user='"+user+"' and pass='"+pass+"'";
                ResultSet rs=st.executeQuery(query1);
                
            if(rs.next())
            {    
            //session.setAttribute("user", user);
            //response.sendRedirect("success.jsp");
            String name=rs.getString("name");
            %>
            <h1>Welcome <% out.print(name);%></h1>
            <a href="application.html"> submit application</a>
            <a href="status.html"> application status</a>
            <br><br>
            <a href="student.jsp"> logout</a>
                <%
            }
            else 
            {
                 
                 out.println("<script>alert('not found');setTimeout(function(){window.location='student.jsp'},1*1000);</script>");
                
                 st.close();
            
            }
}
            catch(Exception e)
            {
                System.err.println("got an exception");
                System.err.println(e.getMessage());
            }
   
        %>
    </body>
</html>
