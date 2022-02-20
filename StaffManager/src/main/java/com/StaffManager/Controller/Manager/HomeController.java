package com.StaffManager.Controller.Manager;
import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.StaffManager.Model.AccountModel;
import com.StaffManager.Service.IAccountService;


@WebServlet(urlPatterns = {"/manager"})
public class HomeController extends HttpServlet {
	@Inject private IAccountService accountService;

	private static final long serialVersionUID = 4407495183398991578L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long accountId = (Long) req.getSession().getAttribute("id_3");
		String acc = accountService.getAccountById(accountId).getFullName();
		req.setAttribute("account", acc);
		RequestDispatcher render = req.getRequestDispatcher("/Views/ManagerViews/HomeViews/HomePage.jsp");
		render.forward(req, resp);
	}

}
