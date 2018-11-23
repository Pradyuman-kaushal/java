<%-- 
    Document   : app_status
    Created on : 16 Nov, 2018, 10:27:54 AM
    Author     : pradu
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
.button {border-radius: 50%;
display: inline-block;
  padding: 15px 25px;
  font-size: 17px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  
  box-shadow: 0 9px #999;}
.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>
    </head>
    <body>
        
                <%
                    try{
            String id = (String)session.getAttribute("s_id");
        %><h1 align="center">Applications Submitted by <%out.print(id);%></h1><%    
            out.println(id);
            String myurl="jdbc:mysql://localhost/project";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection(myurl,"root","");
                Statement st=conn.createStatement();
                String query1="select * from app where id='"+id+"'";
                ResultSet rs=st.executeQuery(query1);
                
                query1="select * from app where id='"+id+"'";
                rs=st.executeQuery(query1);
                
    %><table>
    <tr>
         <td><b>ID</b></td>
         <td><b>Subject</b></td>
         <td><b>Data</b></td>
         <td><b>Permission</b></td>
         <td><b>Status bar</b></td>
    </tr>
     <%           while(rs.next())
                {
                    %>

<tr>
    <td><%String ida=rs.getString("dept");
            out.print(ida);
             %></td>
    <td><%String sub=rs.getString("subject");
    out.print(sub);
    %></td>
    <td><%=rs.getString("application") %></td>
    <td><%String p=rs.getString("permit");
    session.setAttribute("per",p);
    out.print(p);
    
    
    %></td>
    <td><a href="status.jsp"><button>status</button></a></td>       
</tr>

               <% 
                    }
%>
</table>
<%
}

        catch(Exception e)
            {
                System.err.println("got an exception");
                System.err.println(e.getMessage());
            }
                    %>
    </body>
</html>
