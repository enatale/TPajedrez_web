<%@page import="entidades.Posicion"%>
<%@page import="entidades.Pieza"%>
<%@page import="entidades.Partida"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Ajedrez</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<%Partida partida= (Partida) session.getAttribute("partida"); %>
<div class="container">
	  <% 
      			String mensaje=(String)request.getAttribute("mensaje");
        		if(mensaje!=null){
      %>
      			<div class="alert alert-success" role="alert">
        			<h1><strong>Juego finalizado!</strong> <%=mensaje %></h1>
      			</div>
      <%
        		}
      %>
	 <div class="row  bg-success img-rounded"> 
     	<div class="col-md-6">
        	<h6>
            <label for="txtJugadorBlancas">Blancas: </label>
            <input id="txtJugadorBlancas" name="txtJugadorBlancas" type="text" class="form-control" disabled
            	value="<%=partida.getJugadorBlancas().getNombre()+" "+partida.getJugadorBlancas().getApellido() %>">
            </h6>
		</div>
        <div class="col-md-6">
        	<h6>
            <label for="txtJugadorNegras">Negras: </label>
            <input id="txtJugadorNegras" name="txtJugadorNegras" type="text" class="form-control" disabled
            	value="<%=partida.getJugadorNegras().getNombre()+" "+partida.getJugadorNegras().getApellido() %>">
            </h6>
		</div>
     </div>

     <div class="row" >
     	<div class="col-md-3 col-md-offset-3">
     		<table class="table table-striped">
            	<thead><label> Posiciones blancas: </label> </thead>
                <tbody>
     	<%
	     	for (int fila = 1; fila <= 8; fila++) {
				for (char col = 'a'; col <='h'; col++) {
					Pieza p = partida.getColPiezas().get(new Posicion(col, fila));
					if (p!=null) {
						if(p.getColor().equals("blanco")){%>
							<tr>
								<td><%=p.getTipoPieza() %></td>
								<td><%=p.getPosicion().getColumna() %><%=p.getPosicion().getFila() %></td>
							</tr>	
						<%}
					}
				}
			}
     	%>
     			</tbody>
     		</table>
        </div>
        <div class="col-md-3">
     		<table class="table table-striped">
            	<thead><label> Posiciones negras: </label> </thead>
                <tbody>
     	<%
	     	for (int fila = 1; fila <= 8; fila++) {
				for (char col = 'a'; col <='h'; col++) {
					Pieza p = partida.getColPiezas().get(new Posicion(col, fila));
					if (p!=null) {
						if(p.getColor().equals("negro")){%>
							<tr>
								<td><%=p.getTipoPieza() %></td>
								<td><%=p.getPosicion().getColumna() %><%=p.getPosicion().getFila() %></td>
							</tr>	
						<%}
					}
				}
			}
     	%>
     			</tbody>
     		</table>
        </div>

     </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>