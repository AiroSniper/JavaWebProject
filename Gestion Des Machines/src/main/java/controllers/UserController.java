package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import beans.User;
import beans.UserResult;
import beans.UserToCopy;
import service.UserService;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService us = new UserService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {

		if (request.getParameter("op") == null) {

		} else {
			if (request.getParameter("op").equals("usrGen")) {
				us.generate();
				response.setContentType("application/json");
				List<User> users = us.findAll();
				Gson json = new Gson();
				response.getWriter().write(json.toJson(users));
			}
			if (request.getParameter("op").equals("load")) {
				response.setContentType("application/json");
				List<User> users = us.findAll();
				Gson json = new Gson();
				response.getWriter().write(json.toJson(users));
			}
			if (request.getParameter("op").equals("up")) {
				String login = request.getParameter("login");
				us.up(us.findByLogin(login));
				response.setContentType("application/json");
				List<User> users = us.findAll();
				Gson json = new Gson();
				response.getWriter().write(json.toJson(users));
			}
			if (request.getParameter("op").equals("down")) {
				String login = request.getParameter("login");
				us.down(us.findByLogin(login));
				response.setContentType("application/json");
				List<User> users = us.findAll();
				Gson json = new Gson();
				response.getWriter().write(json.toJson(users));
			}
			if (request.getParameter("op").equals("copy")) {
				String login = request.getParameter("login");
				us.panding(us.findByLogin(login));
				User user = us.findByLogin(login);
				List<User> users = us.findAll();
				UserToCopy ustc = new UserToCopy(user, users);
				response.setContentType("application/json");

				Gson json = new Gson();
				response.getWriter().write(json.toJson(ustc));
			}
			if (request.getParameter("op").equals("del")) {

				String login = request.getParameter("login");
				us.delete(us.findByLogin(login));
				response.setContentType("application/json");
				List<User> users = us.findAll();
				Gson json = new Gson();
				response.getWriter().write(json.toJson(users));
			}
			if (request.getParameter("op").equals("logout")) {

				request.getSession(false).invalidate();

			}
			if (request.getParameter("op").equals("editInfos")) {
				int id = Integer.parseInt(request.getParameter("id"));
				String login = request.getParameter("login");
				String email = request.getParameter("email");
				String nom = request.getParameter("nom");
				String prenom = request.getParameter("prenom");

				User user = new User(id, login, email, nom, prenom);

				int result = us.updateInfos(user);
				if (result == 1) {

					request.getSession(false).setAttribute("login", user.getLogin());
					request.getSession(false).setAttribute("nom", user.getNom());
					request.getSession(false).setAttribute("prenom", user.getPrenom());
					request.getSession(false).setAttribute("email", user.getEmail());

				}

				response.setContentType("application/json");
				Gson json = new Gson();
				response.getWriter().write(json.toJson(result));

			}
			if (request.getParameter("op").equals("editass")) {
				int id = Integer.parseInt(request.getParameter("id"));
				
				String pass = request.getParameter("pass");

				User user = new User(id, pass,true);

				boolean result = us.updatePass(user);
				if (result) {

					request.getSession(false).setAttribute("password", user.getPassword());
				
				}

				response.setContentType("application/json");
				Gson json = new Gson();
				response.getWriter().write(json.toJson(result));

			}
			if (request.getParameter("op").equals("editStatus")) {
				int id = Integer.parseInt(request.getParameter("id"));
				
				String password = request.getParameter("password");

				User user = new User(id, password,1);

				boolean result = us.updatePassWithStatus(user);
				if (result) {

					request.getSession(false).setAttribute("status", user.getStatus());
				
				}

				response.setContentType("application/json");
				Gson json = new Gson();
				response.getWriter().write(json.toJson(result));

			}
			if (request.getParameter("op").equals("userLog")) {

				String login = request.getParameter("login");
				String password = request.getParameter("password");

				boolean result = us.login(login, password);
				User user = null;

				if (result) {
					
					
					user = us.findByLogin(login);
					
					
					
					HttpSession session = request.getSession();
					session.setMaxInactiveInterval(10 * 60);
					if(user.getStatus() != -1) {
						session.setAttribute("id", user.getId());
						session.setAttribute("login", user.getLogin());
						session.setAttribute("password", user.getPassword());
						session.setAttribute("nom", user.getNom());
						session.setAttribute("prenom", user.getPrenom());
						session.setAttribute("email", user.getEmail());
						session.setAttribute("status", user.getStatus());
						session.setAttribute("image", user.getImage());
					}
					
					response.setContentType("application/json");
					Gson json = new Gson();
					response.getWriter().write(json.toJson(user));
					
				}
				
			}
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
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
