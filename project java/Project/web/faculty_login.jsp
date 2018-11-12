<%-- 
    Document   : faculty_login
    Created on : 12 Nov, 2018, 2:27:08 PM
    Author     : pradu
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%
            
            try{
            String user = request.getParameter("uname");
            String pass = request.getParameter("psw");
            
            String myurl="jdbc:mysql://localhost/project";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection(myurl,"root","");
                Statement st=conn.createStatement();
                String query1="select * from faculty where user='"+user+"' and pass='"+pass+"'";
                ResultSet rs=st.executeQuery(query1);
                
            if(rs.next())
            {    
            //session.setAttribute("user", user);
            //response.sendRedirect("success.jsp");
            String name=rs.getString("user");
            %>
            <h1>Welcome <% out.print(name);%> Department</h1>
            <br><br>
            <a href="faculty_login.html"> logout</a>
                <%
            }
            else 
            {
                out.println("<script>alert('not found');setTimeout(function(){window.location='faculty_login.html'},1*1000);</script>");
            }
   
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
