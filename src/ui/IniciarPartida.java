package ui;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import appExceptions.ApplicationException;
import entidades.Partida;
import negocio.CtrlAjedrez;

/**
 * Servlet implementation class IniciarPartida
 */
@WebServlet(description = "Inicia una partida nueva o continua la anterior", urlPatterns = { "/IniciarPartida" })
public class IniciarPartida extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IniciarPartida() {
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
		String opcion = request.getParameter("opcion");
		try {
			if(opcion.equals("nueva")){
				Partida partidaAntigua = (Partida)request.getSession().getAttribute("partida");
				controlador.eliminarPartida(partidaAntigua.getIdPartida());
				Partida partidaNueva = new Partida(partidaAntigua.getJugadorBlancas(), partidaAntigua.getJugadorNegras());
				controlador.nuevaPartida(partidaNueva);
				request.getSession().setAttribute("partida", partidaNueva);
			}
			response.sendRedirect("partida.jsp");
		} catch (ApplicationException e) {
			// TODO: handle exception
		}
	}

}
