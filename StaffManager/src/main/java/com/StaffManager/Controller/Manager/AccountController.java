package com.StaffManager.Controller.Manager;
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
import com.StaffManager.Model.AccountOwnerModel;
import com.StaffManager.Model.PositionStaffModel;
import com.StaffManager.Model.StaffModel;
import com.StaffManager.Model.TypeStaffModel;
import com.StaffManager.Service.IAccountOwnerService;
import com.StaffManager.Service.IAccountService;
import com.StaffManager.Service.IPositionStaffService;
import com.StaffManager.Service.IStaffService;
import com.StaffManager.Service.ITypeStaffService;

@WebServlet(urlPatterns = {"/manager/my-profile"})
public class AccountController extends HttpServlet {
	@Inject 
	private IAccountService accountService;
	@Inject
	private IAccountOwnerService accountOwnerService;
	@Inject
	private IStaffService staffService;
	@Inject
	private IPositionStaffService positionStaffService;
	@Inject
	private ITypeStaffService typeStaffService;
	private static final long serialVersionUID = 4407495183398991578L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long accountId = (Long) req.getSession().getAttribute("id_3");
		AccountModel account = accountService.getAccountById(accountId);
		Long staffId = accountOwnerService.getIdStaffByAccountId(accountId);
		StaffModel staff = staffService.getStaffById(staffId);
		//List<PositionStaffModel> positions = positionStaffService.getList();
		List<TypeStaffModel> typeSt = typeStaffService.getList();
		
		
		req.setAttribute("typeSt", typeSt);
		//req.setAttribute("positions", positions);
		req.setAttribute("account", account);
		req.setAttribute("staff", staff);
		
		RequestDispatcher render = req.getRequestDispatcher("/Views/ManagerViews/AccountViews/AccountPage.jsp");
		render.forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long accountId = (Long) req.getSession().getAttribute("id_3");
		String password = req.getParameter("password");
		Boolean i =  accountService.resetPassword(accountId, password);
		if(i) resp.setStatus(200); else resp.setStatus(500);
		String redirect = "/manager/my-profile";
		resp.sendRedirect(redirect);
	}

}
