<%-- 
    Document   : status.jsp
    Created on : 21 Nov, 2018, 7:50:48 PM
    Author     : pradu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
  

}

   
    </head>
    <body>
        <h1 align="center">Application Status</h1>
        <% String permit=(String)session.getAttribute("per");
        if(permit==null)
        {
            permit="not seen";
        }
        if(permit.equals("cApprove"))
        {
        %>
        
        <br><br><br>
        <div class="container">
        <div class="progress">
    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:100%">
      <b>Approved</b>
    </div>
  </div>
 </div>
       <% }
else if(permit.equals("bApprove"))
        {
        %>
        
        <br><br><br>
        <div class="container">
        <div class="progress">
    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:66.6%">
      <b>Partially Approved</b>
    </div>
  </div>
 </div>
       <% }
else if(permit.equals("aApprove"))
        {
        %>
        
        <br><br><br>
        <div class="container">
        <div class="progress">
    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:33.3%">
      <b>InProgress</b>
    </div>
  </div>
 </div>
       <% }
else if(permit.equals("Declined"))
        {
        %>
        
        <br><br><br>
        <h1 align="center">Denied</h1>
        <div class="container">
        <div class="progress">
    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:100%">
      
    </div>
  </div>
 </div>
       <% }
else if(permit.equals("not seen"))  { %>
        
        <br><br><br>
        <h3 align="center">Not seen</h3>
        <div class="container">
        <div class="progress">
            
    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:0%">
   
    </div>
  </div>
 </div>
       <% }
        %>
    </body>
</html>
