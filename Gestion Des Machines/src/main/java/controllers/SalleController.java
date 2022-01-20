package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beans.Salle;
import service.SalleService;

/**
 * Servlet implementation class SalleController
 */
@WebServlet("/SalleController")
public class SalleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SalleService ss = new SalleService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SalleController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @throws IOException
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {

		if (request.getParameter("op") == null) {

			String code = request.getParameter("code");
			String label = request.getParameter("label");
			String type = request.getParameter("type");
			ss.create(new Salle(code, label, type));

			response.setContentType("application/json");
			List<Salle> salles = ss.findAll();
			Gson json = new Gson();
			response.getWriter().write(json.toJson(salles));

		} else {
			if (request.getParameter("op").equals("load")) {

				response.setContentType("application/json");
				List<Salle> salles = ss.findAll();
				Gson json = new Gson();
				response.getWriter().write(json.toJson(salles));

			}
			if (request.getParameter("op").equals("LoadSalles")) {

				response.setContentType("application/json");
				List<Salle> salles = ss.findAll();
				Gson json = new Gson();
				response.getWriter().write(json.toJson(salles));

			}
			if (request.getParameter("op").equals("GetCount")) {

				response.setContentType("application/json");
				int count = ss.count();

			
				Gson json = new Gson();
				response.getWriter().write(json.toJson(count));

			}
			if (request.getParameter("op").equals("search")) {

				String query = request.getParameter("query");

				response.setContentType("application/json");
				List<Salle> salles = ss.findAll(query);
				Gson json = new Gson();
				response.getWriter().write(json.toJson(salles));

			}
			if (request.getParameter("op").equals("del")) {

				int id = Integer.parseInt(request.getParameter("id"));
				ss.delete(ss.findById(id));

				response.setContentType("application/json");
				List<Salle> salles = ss.findAll();
				Gson json = new Gson();
				response.getWriter().write(json.toJson(salles));
			}
			if (request.getParameter("op").equals("edit")) {

				int id = Integer.parseInt(request.getParameter("id"));
				String code = request.getParameter("code");
				String label = request.getParameter("label");
				String type = request.getParameter("type");

				Salle s = ss.findById(id);
				s.setCode(code);
				s.setLabel(label);
				s.setType(type);
				ss.update(s);

				response.setContentType("application/json");
				List<Salle> salles = ss.findAll();
				Gson json = new Gson();
				response.getWriter().write(json.toJson(salles));
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);

	}

}
