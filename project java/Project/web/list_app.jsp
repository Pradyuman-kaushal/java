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
        <a href="faculty_login.jsp">Home</a>
        <a href="faculty_login.html">logout</a>
        
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
                String pos=(String)session.getAttribute("pos");
                if(pos.equals("high"))
                query1="select * from app where dept='"+user+"' and permit='bApprove'";
                else if(pos.equals("mid"))
                query1="select * from app where dept='"+user+"' and permit='aApprove'";
                else
                query1="select * from app where dept='"+user+"' and permit is NULL";
                    
                rs=st.executeQuery(query1);
                

    
    %>
    <script>
function myFunction(o,int j) {
 
      session.setAttribute("permit",o.value);
      session.setAttribute("id",ida[j]);
session.setAttribute("sub",sub[j]);
 
}
</script>
<table>
    <tr>
         <td><b>ID</b></td>
         <td><b>Subject</b></td>
         <td><b>Data</b></td>
         <td><b>Permission</b></td>
         <td><b></b></td>
    </tr>
     <%  String ida[]=new String[100];
         String sub[]=new String[100];
         String app[]=new String[100];
         String per[]=new String[100];
         String subm[]=new String[100];
         int i=0;
         while(rs.next())
                {
                    ida[i]=rs.getString("id");
                    sub[i]=rs.getString("subject");
                    app[i]=rs.getString("application");
                    per[i]=null;
                    subm[i]="submit";
                    i++;
                }
         for(int j=0;j<i;j++)
         {
                    %>

<tr>
    <td><%
            out.print(ida[j]);
                %></td>
    <td><%//String sub=rs.getString("subject");
    out.print(sub[j]);
    %></td>
    <td><%//=rs.getString("application") 
        out.print(app[j]);%></td>
    <td><form action="app_sub.jsp" name="app_sub">Approve: <input type="radio" name="permit" value="Approve"> Decline: <input type="radio" name="permit" value="Declined"></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" onClick =<%session.setAttribute("id",ida[0]); session.setAttribute("sub",sub[0]);%>  ></form></td>
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
