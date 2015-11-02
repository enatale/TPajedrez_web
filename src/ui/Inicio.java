package ui;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appExceptions.ApplicationException;
import entidades.Jugador;
import entidades.Partida;
import negocio.CtrlAjedrez;

/**
 * Servlet implementation class Inicio
 */
@WebServlet(description = "Busca los jugadores y su correspondiente partida", urlPatterns = { "/inicio" })
public class Inicio extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
     * @see HttpServlet#HttpServlet()
     */
    public Inicio() {
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
		CtrlAjedrez controlador = new CtrlAjedrez();
		Jugador j1=null , j2=null;
		try {
			int dni1 =Integer.parseInt(request.getParameter("txtJugador1"));
			int dni2 = Integer.parseInt(request.getParameter("txtJugador2"));
			j1 = controlador.identificarJugador(dni1);
			j2 = controlador.identificarJugador(dni2);
			Partida partida = controlador.recuperarPartida(j1, j2);
			request.getSession().setAttribute("partida", partida);
			if(partida==null){
				partida = new Partida(j1, j2);
				controlador.nuevaPartida(partida);
				request.getSession().setAttribute("partida", partida);
				request.getRequestDispatcher("partida.jsp").forward(request, response);
			} else {
				response.sendRedirect("continuar.html");
			}
			
		} catch (NullPointerException e) {
			// TODO: Redirigir a pagina que muestre el error
			String mensaje="";
			if(j1==null) mensaje+= "No se encontro jugador con el DNI nro. 1\n";
			if(j2==null) mensaje+= "No se enconto jugador con el DNI nro. 2\n";
			request.setAttribute("mensaje", mensaje);
			request.getRequestDispatcher("comenzarPartida.jsp").forward(request, response);
		} catch (NumberFormatException e) {
			// TODO: Redirigir a pagina que muestre el error
			request.setAttribute("mensaje", "Los campos de DNI se deben completar con un numero entero");
			request.getRequestDispatcher("comenzarPartida.jsp").forward(request, response);
		} catch (ApplicationException e) {
			// TODO Redirigir a pagina que muestre el error
			request.setAttribute("mensaje", e.getMessage());
			request.getRequestDispatcher("comenzarPartida.jsp").forward(request, response);
		}
	}

}
