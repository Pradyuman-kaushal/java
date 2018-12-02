<%-- 
    Document   : faculty_login
    Created on : 12 Nov, 2018, 2:27:08 PM
    Author     : pradu
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
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
                String query1="select * from faculty where user='"+user+"' and pass='"+pass+"'";
                ResultSet rs=st.executeQuery(query1);
                
            if(rs.next())
            {    
            
            //response.sendRedirect("success.jsp");
            String name=rs.getString("user");
            session.setAttribute("username", user);
            session.setAttribute("name", name);
            
                out.println("<script>setTimeout(function(){window.location='fac_login.jsp'},1*1000);</script>");
            }
else 
            {
                out.println("<script>alert('not found');setTimeout(function(){window.location='faculty_login.html'},1*1000);</script>");
            }
            %>
            <br><br>
            
           
                
           <% 
            
   
                 st.close();
            
            }

            catch(Exception e)
            {
                System.err.println("got an exception");
                System.err.println(e.getMessage());
            }
   
        %>
</body>
</html>
