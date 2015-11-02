<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html  style="height:100%">
<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Ajedrez</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="height:100%">
<div class="container" style="height:100%">
	 <div class="row  bg-primary img-rounded"> 
     	<div class="col-md-6">
        	<h6>
            <label for="txtJugadorBlancas">Blancas: </label>
            <input id="txtJugadorBlancas" name="txtJugadorBlancas" type="text" class="form-control" disabled>
            </h6>
		</div>
        <div class="col-md-6">
        	<h6>
            <label for="txtJugadorNegras">Negras: </label>
            <input id="txtJugadorNegras" name="txtJugadorNegras" type="text" class="form-control" disabled>
            </h6>
		</div>
     </div>
     <div class="row bg-primary img-rounded" style="margin-top:15px">
     	<div class="col-md-12">
        	<h6>
            <label for="txtTurno">Turno jugador: </label>
            <input id="txtTurno" name="txtTurno" type="text" class="form-control" disabled>
            </h6>
        </div>
     </div>
     <div class="row" style="height:100%">
     	<div class="col-md-6" style="height:100%">
            <label for="txtAreaBlancas">Posiciones Blancas: </label>
            <textarea class="form-control" id="txtAreaBlancas" name="txtAreaBlancas" style="height:50%;width:100%"></textarea>
            <label for="txtAreaNegras">Posiciones Negras: </label>
            <textarea class="form-control" id="txtAreaNegras" name="txtAreaNegras" style="height:50%;width:100%"></textarea>
        </div>
        <div class="col-md-6">
        	<form action="movimiento" method="post">
                <div class="row" style="height:100%">
                        <div class="col-xs-6">
                            <h3><span class="label label-default">Columna:</span></h3>
                            <input type="text" name="txtColOrigen" id="txtColOrigen" placeholder="Columna origen" class="form-control" required><br/>
                            <input type="text" name="txtColDestino" id="txtColDestino" placeholder="Columna destino" class="form-control" required>
                        </div>
                        <div class="col-xs-6">
                            <h3><span class="label label-default">Fila:</span></h3>
                            <input type="text" name="txtFilaOrigen" id="txtFilaOrigen" placeholder="Fila origen" class="form-control" required><br/>
                            <input type="text" name="txtFilaDestino" id="txtFilaDestino" placeholder="Fila origen" class="form-control" required>
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