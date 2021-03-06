<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Ajedrez</title>

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="bootstrap/css/signin.css" rel="stylesheet">
  </head>
<body>

    <div class="container">

      <form method="post" action="inicio" class="form-signin">
        <h2 class="form-signin-heading">Comenzar partida</h2>
        <label for="txtJugador1" class="sr-only">DNI Jugador 1</label>
        <input type="text" name="txtJugador1" id="txtJugador1" class="form-control" placeholder="DNI Jugador 1" required autofocus>
        <label for="txtJugador2" class="sr-only">DNI Jugador 2</label>
        <input type="text" name="txtJugador2" id="txtJugador2" class="form-control" placeholder="DNI Jugador 2" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Jugar</button>
      </form>
      
      <% 
      			String mensaje=(String)request.getAttribute("mensaje");
        		if(mensaje!=null){
      %>
      			<div class="alert alert-danger" role="alert">
        			<strong>Error!</strong> <%=mensaje %>
      			</div>
      <%
        		}
      %>

    </div> <!-- /container -->
</body>
</html>