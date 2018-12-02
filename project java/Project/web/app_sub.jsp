<%-- 
    Document   : app_sub
    Created on : 14 Nov, 2018, 10:07:16 AM
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
            
            
            String permit = request.getParameter("permit");
            String sub=(String)session.getAttribute("sub");
            String id=(String)session.getAttribute("id");
            String pos=(String)session.getAttribute("pos");
            String myurl="jdbc:mysql://localhost/project";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection(myurl,"root","");
                Statement st=conn.createStatement();
                String query1="update app set permit='"+permit+"' where subject='"+sub+"' and id='"+id+"'";
                if(pos.equals("low")&&permit.equals("Approve"))
                query1="update app set permit='aApprove' where subject='"+sub+"' and id='"+id+"'";
                else if(pos.equals("low")&&permit.equals("Declined"))
                query1="update app set permit='Declined1' where subject='"+sub+"' and id='"+id+"'";
                else if(pos.equals("mid")&&permit.equals("Approve"))
                query1="update app set permit='bApprove' where subject='"+sub+"' and id='"+id+"'";
                else if(pos.equals("mid")&&permit.equals("Declined"))
                query1="update app set permit='Declined2' where subject='"+sub+"' and id='"+id+"'";
                else if(pos.equals("high")&&permit.equals("Approve"))
                query1="update app set permit='cApprove' where subject='"+sub+"' and id='"+id+"'";
                else if(pos.equals("high")&&permit.equals("Declined"))
                query1="update app set permit='Declined3' where subject='"+sub+"' and id='"+id+"'";
                else
                    query1="update app set permit='"+permit+"' where subject='"+sub+"' and id='"+id+"'";
                PreparedStatement prst=conn.prepareStatement(query1);
                int i=prst.executeUpdate();
                if(i==1)
            out.println("<script>alert('Changes Successful');setTimeout(function(){window.location='list_app.jsp'},1*1000);</script>");
         
                 else
            
                out.println("<script>alert('Changes Unsuccessful');setTimeout(function(){window.location='list_app.jsp'},1*1000);</script>");
            

%>                

    </body>
</html>
