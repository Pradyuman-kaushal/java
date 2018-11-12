<%-- 
    Document   : signup
    Created on : 7 Nov, 2018, 4:21:22 PM
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
            System.out.println("hello");
           
                String id = request.getParameter("id");
                String name = request.getParameter("name");
                String dob = request.getParameter("dob");
            String user = request.getParameter("user");
            String pass = request.getParameter("pass");
            
            String myurl="jdbc:mysql://localhost/project";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection(myurl,"root","");
                String query1="insert into student values(?,?,?,?,?)";
                
                PreparedStatement prst=conn.prepareStatement(query1);
                 prst.setString(1,id);
                 prst.setString(2,name);
                 prst.setString(3,dob);
                 prst.setString(4,user);
                 prst.setString(5, pass);
                 
                 try{
                 prst.executeUpdate();
                        
            out.print("Registration is Successful"+"<a href='student.jsp'>Go to Login</a>");
//Please Login Here <a href='student.jsp'>    
       }
            //prst.close();

            catch(Exception e)
            {
                out.println("<script>alert('User already exists');setTimeout(function(){window.location='student.jsp'},1*1000);</script>");
            }
   
        %>
    </body>
</html>
