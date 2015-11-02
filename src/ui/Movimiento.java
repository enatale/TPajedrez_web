package ui;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appExceptions.ApplicationException;
import appExceptions.EndGameException;
import entidades.Partida;
import entidades.Posicion;
import negocio.CtrlAjedrez;

/**
 * Servlet implementation class Movimiento
 */
@WebServlet(description = "Realiza el movimiento de una pieza", urlPatterns = { "/movimiento" })
public class Movimiento extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Movimiento() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Partida partida = (Partida)request.getSession().getAttribute("partida");
			CtrlAjedrez controlador = new CtrlAjedrez(partida);
			char colOrigen = request.getParameter("txtColOrigen").toCharArray()[0];
			int filaOrigen = Integer.parseInt(request.getParameter("txtFilaOrigen"));
			Posicion posOrigen = new Posicion(colOrigen, filaOrigen);
			char colDestino = request.getParameter("txtColDestino").toCharArray()[0];
			int filaDestino = Integer.parseInt(request.getParameter("txtFilaDestino"));
			Posicion posDestino = new Posicion(colDestino, filaDestino);
			controlador.moverPieza(posOrigen, posDestino);
		} catch (EndGameException e) {
			// TODO: handle exception
		} catch (ApplicationException e) {
			// TODO: handle exception
		}
	}

}