package com.StaffManager.Controller.Staff;


import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.StaffManager.Model.AccountModel;
import com.StaffManager.Model.TypeAccountModel;
import com.StaffManager.Service.IAccountService;
import com.StaffManager.Service.ITypeAccountService;

@WebServlet(urlPatterns = {"/home"})
public class HomeController extends HttpServlet{
	private static final long serialVersionUID = -45387054244632550L;
	@Inject private IAccountService accountService;
	@Inject private ITypeAccountService typeAccountService;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long idAccount = (Long) req.getSession().getAttribute("id_5");
		AccountModel account = accountService.getAccountById(idAccount);
		List<TypeAccountModel> types = typeAccountService.getList();
		
		req.setAttribute("account", account);
		req.setAttribute("types", types);
		RequestDispatcher render = req.getRequestDispatcher("/Views/StaffViews/HomeViews/HomePage.jsp");
		render.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
