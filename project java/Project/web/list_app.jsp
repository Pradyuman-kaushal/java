<%-- 
    Document   : list_app
    Created on : 12 Nov, 2018, 6:34:32 PM
    Author     : pradu
--%>

<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <head>
     <style>
table {
    font-family: arial, sans-serif;
    color:black;
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
 body {
        background-image:url("back pattern 1.png");
        background-attachment:fixed;
        
        background-size:100px 100px;
        font: 400 15px/1.8 Lato, sans-serif;
      color: #777;
           
}
h3, h4 {
      margin: 10px 0 30px 0;
      letter-spacing: 10px;      
      font-size: 20px;
      color: #111;
  }
  .container {
      padding: 80px 120px;
  }
  .person {
      border: 10px solid transparent;
      margin-bottom: 25px;
      width: 80%;
      height: 80%;
      opacity: 0.7;
  }
  .person:hover {
      border-color: #f1f1f1;
  }
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
  }
  .carousel-caption h3 {
      color: #fff !important;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }
  .bg-1 {
      background: #2d2d30;
      color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  .list-group-item:first-child {
      border-top-right-radius: 0;
      border-top-left-radius: 0;
  }
  .list-group-item:last-child {
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail p {
      margin-top: 15px;
      color: #555;
  }
  .btn {
      padding: 10px 20px;
      background-color: #333;
      color: #f1f1f1;
      border-radius: 0;
      transition: .2s;
  }
  .btn:hover, .btn:focus {
      border: 1px solid #333;
      background-color: #fff;
      color: #000;
  }
  .modal-header, h4, .close {
      background-color: #333;
      color: #fff !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-header, .modal-body {
      padding: 40px 50px;
  }
  .nav-tabs li a {
      color: #777;
  }
  #googleMap {
      width: 100%;
      height: 400px;
      -webkit-filter: grayscale(100%);
      filter: grayscale(100%);
  }  
  .navbar {
      font-family: Montserrat, sans-serif;
      margin-bottom: 0;
      background-color: #2d2d30;
      border: 0;
      font-size: 11px !important;
      letter-spacing: 4px;
      opacity: 0.9;
  }
  .navbar li a, .navbar .navbar-brand { 
      color: #d5d5d5 !important;
  }
  .navbar-nav li a:hover {
      color: #fff !important;
  }
  .navbar-nav li.active a {
      color: #fff !important;
      background-color: #29292c !important;
  }
  .navbar-default .navbar-toggle {
      border-color: transparent;
  }
  .open .dropdown-toggle {
      color: #fff;
      background-color: #555 !important;
  }
  .dropdown-menu li a {
      color: #000 !important;
  }
  .dropdown-menu li a:hover {
      background-color: red !important;
  }
  footer {
      background-color: #2d2d30;
      color: #f5f5f5;
      padding: 32px;
  }
  footer a {
      color: #f5f5f5;
  }
  footer a:hover {
      color: #777;
      text-decoration: none;
  }  
  .form-control {
      border-radius: 0;
  }
  textarea {
      resize: none;
  }
#p
{
background-color:white;
margin-top: 0px;
margin-bottom: 0px;
margin-right: 100px;
margin-left: 50px;
border-radius: 25px;
    border: 2px solid black;
    padding: 20px; 
box-shadow: 5px 10px 20px black;

}

a,a:hover{
    color:white;
}
select{
    width: 50%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}

</style>
    </head>
    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
        
        <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
        <a class="navbar-brand" href="index.html"><B>COLLEGE APPLICATION APPROVAL</B></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="fac_login.jsp">HOME</a></li>
        
        <li><a href="faculty_login.html">LOG OUT</a></li>
        
             </ul>
    </div>
  </div>
</nav>    <br><br><br>
        <div id="p">
        <p align="center" style="font-family: algerian ;font-size:50px; color: black">Applications Received</h1></p>
        <hr>
                <%
                    try{
            String user = (String)session.getAttribute("username");
            
            
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
<br>
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
    <td><form action="app_sub.jsp" name="app_sub">Approve: <input type="radio" name="permit" value="Approve" checked="yes"> Decline: <input type="radio" name="permit" value="Declined"></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="button" onClick =<%session.setAttribute("id",ida[0]); session.setAttribute("sub",sub[0]);%>  ></form></td>
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
                </div>
    </body>
</html>
