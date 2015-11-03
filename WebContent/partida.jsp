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
	 <div class="row  bg-primary img-rounded"> 
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
     <div class="row bg-primary img-rounded" style="margin-top:15px">
     	<div class="col-md-12">
        	<h6>
            <label for="txtTurno">Turno jugador: </label>
            <input id="txtTurno" name="txtTurno" type="text" class="form-control" disabled
            	value="<%=partida.getTurno()%>">
            </h6>
        </div>
     </div>
     <div class="row" >
     	<div class="col-md-3">
     		<table class="table table-condensed table-striped">
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
     		<table class="table table-condensed table-striped">
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
        
        
        <div class="col-md-6">
        	<form action="movimiento" method="post">
                <div class="row">
                        <div class="col-xs-6">
                            <h3><span class="label label-default">Columna:</span></h3>
                            <input type="text" name="txtColOrigen" id="txtColOrigen" placeholder="Columna origen" class="form-control" required tabindex="1"><br/>
                            <input type="text" name="txtColDestino" id="txtColDestino" placeholder="Columna destino" class="form-control" required tabindex="3">
                        </div>
                        <div class="col-xs-6">
                            <h3><span class="label label-default">Fila:</span></h3>
                            <input type="text" name="txtFilaOrigen" id="txtFilaOrigen" placeholder="Fila origen" class="form-control" required tabindex="2"><br/>
                            <input type="text" name="txtFilaDestino" id="txtFilaDestino" placeholder="Fila destino" class="form-control" required tabindex="4">
                        </div>
                </div>
                <br />
                <div class="row">
                	<div class="col-xs-4 col-xs-offset-4" style="text-align:center">
                    	<input type="submit" value="Mover" class="btn btn-lg btn-success">
                    </div>
                </div>
            </form>
        </div>
     </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>