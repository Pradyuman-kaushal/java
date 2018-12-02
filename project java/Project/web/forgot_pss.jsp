<%-- 
    Document   : forgot_pss
    Created on : 26 Nov, 2018, 8:02:27 PM
    Author     : pradu
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
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
color:black;

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
        <li><a href="index.html">HOME</a></li>
        <li><a href="signup.html">SIGN UP</a></li>
        <li><a href="student.jsp">LOG IN</a></li>
        <li><a href="#contact">CONTACT</a></li>
        
        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
      </ul>
    </div>
  </div>
</nav>
        <br><br><br>
<div id="p">
    <%
    String user=request.getParameter("user");
    session.setAttribute("user",user);
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
            String q1=rs.getString("q1");
            String a1=rs.getString("a1");
            String q2=rs.getString("q2");
            String a2=rs.getString("a2");
            String dob=rs.getString("dob");
            
            %><form action="fgt.jsp">
               <p align="center" style="font-family: Times New Roman; font-size:20px">
            <%
                out.println(q1);
            %>
        
                <input type="text" name="ans1">
                <br>
                <p align="center" style="font-family: Times New Roman; font-size:20px">
            <%
                out.println(q2);
            %>
            
                <input type="text" name="ans2">
                <br>
                <p align="center" style="font-family: Times New Roman; font-size:20px">
                <%
                out.println("Enter your D.O.B");
            %>
            
                <input type="text" name="ans3">
                <br>
                <p align="center" style="font-family: Times New Roman; font-size:20px">
            <%
                out.println("Enter new Password");
            %>
                <input type="text" name="pass">
                <br>
                <input type="submit">
                </form>
            </p><%
                
            }
            else 
            {
                 
                 out.println("<script>alert('not found');setTimeout(function(){window.location='student.jsp'},1*1000);</script>");
                
                 st.close();
            
            }
    %>
            </div>

    </body>
</html>
