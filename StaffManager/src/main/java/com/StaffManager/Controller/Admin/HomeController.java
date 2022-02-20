package com.StaffManager.Controller.Admin;


import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.StaffManager.Model.AccountModel;
import com.StaffManager.Model.ProjectModel;
import com.StaffManager.Model.TypeAccountModel;
import com.StaffManager.Service.IAccountService;
import com.StaffManager.Service.INotificationService;
import com.StaffManager.Service.IProjectService;
import com.StaffManager.Service.ITypeAccountService;

@WebServlet(urlPatterns = {"/admin"})
public class HomeController extends HttpServlet{
	private static final long serialVersionUID = -45387054244632550L;
	
	@Inject
	private IAccountService accountService;
	@Inject
	private IProjectService projectService;
	@Inject
	private INotificationService notificationService;
	@Inject 
	private ITypeAccountService typeAccountService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountModel accountModel=accountService.getAccountByIdVu((Long) req.getSession().getAttribute("id_1"));
		Integer sizeAccount=accountService.getAll(0).size();
		Integer sizeProject=projectService.coutProjects(0);
		Integer sizeNotification=notificationService.getAllNotification(0).size();
		List<Integer> sizeEachAccountType=new ArrayList<Integer>();
		List<ProjectModel>listProject=projectService.getAllProject(1, 5, "id", "DESC",0);
		List<Integer>sizeEachProjectStatus=new ArrayList<Integer>();
		Timestamp time =new Timestamp(System.currentTimeMillis());
		for(Long i=1L;i<=5L;i++) {
			sizeEachAccountType.add(accountService.countAccountType(i, 0));
		}
		for(Long i=1L;i<=8L;i++) {
			sizeEachProjectStatus.add(projectService.countProjectStatus(i,0));
		}
		List<AccountModel> accountNew=accountService.getListAccountNew(0);
		List<AccountModel> accountNotActive = accountService.getListAccountNotActive(0);
		List<TypeAccountModel> typeAcc = typeAccountService.getList();
		req.setAttribute("typeAcc", typeAcc);
		req.setAttribute("accountsNotActive", accountNotActive);
		req.setAttribute("accountNew", accountNew);
		req.setAttribute("sizeAccount", sizeAccount);
		req.setAttribute("sizeProject", sizeProject);
		req.setAttribute("sizeNotification", sizeNotification);
		req.setAttribute("sizeEachAccountType", sizeEachAccountType);
		req.setAttribute("sizeEachProjectStatus", sizeEachProjectStatus);
		req.setAttribute("time", time);
		req.setAttribute("projects", listProject);
		req.setAttribute("account", accountModel);
		RequestDispatcher render = req.getRequestDispatcher("/Views/AdminViews/HomeViews/HomePage.jsp");
		render.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}
}
