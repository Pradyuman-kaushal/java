<%-- 
    Document   : submit
    Created on : 9 Nov, 2018, 11:39:25 AM
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
                String admin = request.getParameter("to");
                String subject = request.getParameter("subject");
                String dept = request.getParameter("dept");
            String app = request.getParameter("comment");
            String urgent = request.getParameter("urgent");
            String id= request.getParameter("id");
            String myurl="jdbc:mysql://localhost/project";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection(myurl,"root","");
                String query1="insert into app values(?,?,?,?,?,?)";
                
                PreparedStatement prst=conn.prepareStatement(query1);
                 prst.setString(1,admin);
                 prst.setString(2,subject);
                 prst.setString(3,dept);
                 prst.setString(4,app);
                 prst.setString(5, urgent);
                 prst.setString(6, id);
                 int count=prst.executeUpdate();
                
                
            if(count!=-1){
            //out.println("");
            out.println("submitted successfully");
            
           // response.sendRedirect("student.html");
                    }
            else 
            {
                 
                %>
                <jsp:forward page="student.jsp"/>
            <%
                
                 prst.close();
            
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
