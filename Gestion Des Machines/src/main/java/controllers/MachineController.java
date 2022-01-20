package controllers;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beans.Collections;
import beans.Machine;
import beans.MachinesByMarkes;
import beans.MachinesBySalle;
import beans.MachinesParType;
import beans.Salle;
import service.MachineService;
import service.SalleService;

/**
 * Servlet implementation class MachineController
 */
@WebServlet("/MachineController")
public class MachineController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MachineService ms = new MachineService();
	SalleService ss = new SalleService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MachineController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @throws ParseException 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {

		if (request.getParameter("op") == null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			String reference = request.getParameter("ref");
			String marque = request.getParameter("marque");
			Date dateAchat = sdf.parse(request.getParameter("date"));
			double prix = Double.parseDouble(request.getParameter("prix"));
			Salle salle = ss.findById(Integer.parseInt(request.getParameter("salle")));
			
			ms.create(new Machine(salle,reference,marque,dateAchat,prix));

			response.setContentType("application/json");
			List<Machine> machines = ms.findAll();
			List<Salle> salles = ss.findAll();

			Collections co = new Collections(salles, machines);
			Gson json = new Gson();
			response.getWriter().write(json.toJson(co));

		} else {
			if (request.getParameter("op").equals("load")) {

				response.setContentType("application/json");
				List<Machine> machines = ms.findAll();
				List<Salle> salles = ss.findAll();

				Collections co = new Collections(salles, machines);
				Gson json = new Gson();
				response.getWriter().write(json.toJson(co));

			}
			
			if (request.getParameter("op").equals("LoadMachines")) {

				response.setContentType("application/json");
				List<Machine> machines = ms.findAll();
				

				Gson json = new Gson();
				response.getWriter().write(json.toJson(machines));

			}
			
			if (request.getParameter("op").equals("GetCount")) {

				response.setContentType("application/json");
				int count = ms.count();

			
				Gson json = new Gson();
				response.getWriter().write(json.toJson(count));

			}
			if (request.getParameter("op").equals("MachineBySalle")) {

				response.setContentType("application/json");
				List<MachinesBySalle> mm = ms.machinesBySalle();

				
				Gson json = new Gson();
				response.getWriter().write(json.toJson(mm));

			}
			if (request.getParameter("op").equals("MachineByMarque")) {

				response.setContentType("application/json");
				List<MachinesByMarkes> mm = ms.machinesByMarke();

				
				Gson json = new Gson();
				response.getWriter().write(json.toJson(mm));

			}
			if (request.getParameter("op").equals("MachineByType")) {

				response.setContentType("application/json");
				List<MachinesParType> mm = ms.machinesByType();

				
				Gson json = new Gson();
				response.getWriter().write(json.toJson(mm));

			}
			if (request.getParameter("op").equals("search")) {

			/*	String query = request.getParameter("query");
				response.setContentType("application/json");
				List<Machine> machines = ms.findAll(query);
				
				Gson json = new Gson();
				response.getWriter().write(json.toJson(machines));*/

			}
			if (request.getParameter("op").equals("del")) {

				int id = Integer.parseInt(request.getParameter("id"));
				ms.delete(ms.findById(id));
				
				response.setContentType("application/json");
				List<Machine> machines = ms.findAll();
				List<Salle> salles = ss.findAll();

				Collections co = new Collections(salles, machines);
				Gson json = new Gson();
				response.getWriter().write(json.toJson(co));
			}
			if (request.getParameter("op").equals("search")) {

				String query = request.getParameter("query");
				
				response.setContentType("application/json");
				List<Machine> machines = ms.findAll(query);
				List<Salle> salles = ss.findAll();

				Collections co = new Collections(salles, machines);
				Gson json = new Gson();
				response.getWriter().write(json.toJson(co));
			}
			if (request.getParameter("op").equals("search_salle")) {

				int id =Integer.parseInt( request.getParameter("query"));
				
				response.setContentType("application/json");
				List<Machine> machines = ms.findAll(id);
				Gson json = new Gson();
				response.getWriter().write(json.toJson(machines));
			}
			if (request.getParameter("op").equals("search_dates")) {

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date debut = sdf.parse(request.getParameter("debut"));
				Date fin = sdf.parse(request.getParameter("fin"));
				
				response.setContentType("application/json");
				List<Machine> machines = ms.findAll(debut,fin);
				Gson json = new Gson();
				response.getWriter().write(json.toJson(machines));
			}
			if (request.getParameter("op").equals("edit")) {

				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				int id = Integer.parseInt(request.getParameter("id"));
				String reference = request.getParameter("ref");
				String marque = request.getParameter("marque");
				Date dateAchat = sdf.parse(request.getParameter("date"));
				double prix = Double.parseDouble(request.getParameter("prix"));
				Salle salle = ss.findById(Integer.parseInt(request.getParameter("salle")));
				
				Machine m = ms.findById(id);
				m.setDateAchat(dateAchat);
				m.setMarque(marque);
				m.setPrix(prix);
				m.setSalle(salle);
				m.setReference(reference);
				
				ms.update(m);

				response.setContentType("application/json");
				List<Machine> machines = ms.findAll();
				List<Salle> salles = ss.findAll();

				Collections co = new Collections(salles, machines);
				Gson json = new Gson();
				response.getWriter().write(json.toJson(co));
			}
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (IOException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (IOException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
