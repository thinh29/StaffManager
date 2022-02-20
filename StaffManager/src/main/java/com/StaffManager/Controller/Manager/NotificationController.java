package com.StaffManager.Controller.Manager;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/manager/notifications"})
public class NotificationController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4407495183398991578L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher render = req.getRequestDispatcher("/Views/ManagerViews/NotificationViews/NotificationPage.jsp");
		render.forward(req, resp);
	}

}
