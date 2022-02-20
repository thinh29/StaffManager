package com.StaffManager.Controller.Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/admin/functions"})
public class FunctionController extends HttpServlet {
	private static final long serialVersionUID = 1095390789217572956L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/Views/AdminViews/FunctionViews/FunctionPage.jsp");
		requestDispatcher.forward(req, resp);
	}
}
