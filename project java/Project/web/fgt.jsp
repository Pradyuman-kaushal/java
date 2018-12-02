<%-- 
    Document   : fgt
    Created on : 26 Nov, 2018, 8:26:23 PM
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
    <%   String user=(String)session.getAttribute("user");
         String ans1=request.getParameter("ans1");
         String ans2=request.getParameter("ans2");
         String ans3=request.getParameter("ans3");
         String pass=request.getParameter("pass");
     String myurl="jdbc:mysql://localhost/project";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection(myurl,"root","");
                Statement st=conn.createStatement();
                String query1="select * from student where user='"+user+"'";
                ResultSet rs=st.executeQuery(query1);
                
            if(rs.next())
            {    
            //session.setAttribute("user", user);
            //response.sendRedirect("success.jsp");
            String a1=rs.getString("a1");
            String a2=rs.getString("a2");
            String dob=rs.getString("dob");
            if(a1.equals(ans1)&&a2.equals(ans2)&&dob.equals(ans3))
            {
                query1="update student set pass='"+pass+"' where user='"+user+"'";
                st.execute(query1);
                out.println("<script>alert('password Successfully reset');setTimeout(function(){window.location='student.jsp'},1*1000);</script>");
            }
           else{
                out.println("<script>alert('incorrect answers');setTimeout(function(){window.location='student.jsp'},1*1000);</script>");
            }
            }
            else{
                out.println("<script>alert('incorrect info');setTimeout(function(){window.location='student.jsp'},1*1000);</script>");
            }
    %>
    </body>
</html>
