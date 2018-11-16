<%-- 
    Document   : list_app
    Created on : 12 Nov, 2018, 6:34:32 PM
    Author     : pradu
--%>

<%@page import="java.sql.*"%>
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
        <h1 align="center">Applications Submitted</h1>
                <%
                    try{
            String user = (String)session.getAttribute("username");
            
            out.println(user);
            String myurl="jdbc:mysql://localhost/project";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection(myurl,"root","");
                Statement st=conn.createStatement();
                String query1="select * from app where dept='"+user+"'";
                ResultSet rs=st.executeQuery(query1);
                
                query1="select * from app where dept='"+user+"' and permit is NULL";
                rs=st.executeQuery(query1);
                

    
    %><table>
    <tr>
         <td><b>ID</b></td>
         <td><b>Subject</b></td>
         <td><b>Data</b></td>
         <td><b>Permission</b></td>
         <td><b></b></td>
    </tr>
     <%           while(rs.next())
                {
                    %>

<tr>
    <td><%String ida=rs.getString("id");
            out.print(ida);
             session.setAttribute("id",ida);   %></td>
    <td><%String sub=rs.getString("subject");
    out.print(sub);
    session.setAttribute("sub",sub);%></td>
    <td><%=rs.getString("application") %></td>
    <td><form action="app_sub.jsp">Approve: <input type="radio" name="permit" value="Approve"> Decline: <input type="radio" name="permit" value="Declined"></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="button" value="Submit"></form></td>
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
