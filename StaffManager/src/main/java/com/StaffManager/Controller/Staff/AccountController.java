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
import com.StaffManager.Model.AccountOwnerModel;
import com.StaffManager.Model.PositionProjectModel;
import com.StaffManager.Model.PositionStaffModel;
import com.StaffManager.Model.ProjectModel;
import com.StaffManager.Model.StaffModel;
import com.StaffManager.Model.TypeStaffModel;
import com.StaffManager.Service.IAccountOwnerService;
import com.StaffManager.Service.IAccountService;
import com.StaffManager.Service.IPositionStaffService;
import com.StaffManager.Service.IProjectService;
import com.StaffManager.Service.IStaffService;
import com.StaffManager.Service.ITypeStaffService;
import com.StaffManager.constant.StringsConstant;
import com.StaffManager.utils.FormUtils;

@WebServlet(urlPatterns = { "/accounts" })
public class AccountController extends HttpServlet {
	private static final long serialVersionUID = 3342680513089682969L;
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
	@Inject
	private IProjectService projectService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountModel accountModel = FormUtils.toModel(AccountModel.class, req);
		Long accountId = (Long) req.getSession().getAttribute("id_5");
		String view = "";
		RequestDispatcher requestDispatcher = null;
		switch ((accountModel.getType() == null) ? "" : accountModel.getType()) {
		case StringsConstant.EDIT:
			AccountModel accountEdit = accountService.getAccountById(accountId);
			AccountOwnerModel accountOwnerEdit = accountOwnerService.getAccountOwnerByAccountId(accountId);
			StaffModel staffEdit = staffService.getStaffById(accountOwnerEdit.getStaffId());
			List<PositionStaffModel> positionsEdit = positionStaffService.getList();
			List<TypeStaffModel> typeStEdit = typeStaffService.getList();

			req.setAttribute("typeSt", typeStEdit);
			req.setAttribute("positions", positionsEdit);
			req.setAttribute("account", accountEdit);
			req.setAttribute("staff", staffEdit);
			view = "/Views/StaffViews/AccountViews/Edit.jsp";
			requestDispatcher = req.getRequestDispatcher(view);
			requestDispatcher.forward(req, resp);
			break;
		case StringsConstant.VIEW:
			Long viewId = Long.parseLong(req.getParameter("id"));
			StaffModel staffModel = staffService.getStaffById(viewId);
			List<PositionStaffModel> positionsView = positionStaffService.getList();
			List<TypeStaffModel> typeStView = typeStaffService.getList();

			req.setAttribute("typeSt", typeStView);
			req.setAttribute("positions", positionsView);
			req.setAttribute("staff", staffModel);
			view = "/Views/StaffViews/AccountViews/View.jsp";
			requestDispatcher = req.getRequestDispatcher(view);
			requestDispatcher.forward(req, resp);
			break;
		default:
			AccountModel account = accountService.getAccountById(accountId);
			AccountOwnerModel accountOwner = accountOwnerService.getAccountOwnerByAccountId(accountId);
			StaffModel staff = staffService.getStaffById(accountOwner.getStaffId());
			List<PositionStaffModel> positions = positionStaffService.getList();
			List<TypeStaffModel> typeSt = typeStaffService.getList();
			List<ProjectModel> projectRoots = projectService.getListJoinProjectByAccount(account.getId());
			List<PositionProjectModel> listPositionProject = projectService.getListPositionProject();

			req.setAttribute("projectRoots", projectRoots);
			req.setAttribute("listPositionProject", listPositionProject);
			req.setAttribute("typeSt", typeSt);
			req.setAttribute("positions", positions);
			req.setAttribute("account", account);
			req.setAttribute("staff", staff);
			view = "/Views/StaffViews/AccountViews/AccountPage.jsp";
			requestDispatcher = req.getRequestDispatcher(view);
			requestDispatcher.forward(req, resp);
			break;
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		AccountModel accountModel = FormUtils.toModel(AccountModel.class, req);
		Long accountId = (Long) req.getSession().getAttribute("id_5");
		String view = "";
		String redirect = "";
		switch ((accountModel.getType() == null) ? "" : accountModel.getType()) {
		case StringsConstant.EDIT:

			String fullName = req.getParameter("fullName");
			String address = req.getParameter("address");
			String phone = req.getParameter("phone");
			String story = req.getParameter("story");
			Long idStaff = Long.parseLong(req.getParameter("id"));
			StaffModel staffModel = new StaffModel();
			staffModel.setId(idStaff);
			staffModel.setFullName(fullName);
			staffModel.setAddress(address);
			staffModel.setPhone(phone);
			staffModel.setStory(story);
			staffService.updateStaffFromStaff(staffModel, accountId);
			accountService.updateAccountInStaff(fullName, accountId);
			redirect = "/accounts";
			resp.sendRedirect(redirect);

			break;
		case StringsConstant.CHANGE_PASSWORD:
			AccountModel accountChangePass = accountService.getAccountById(Long.parseLong(req.getParameter("id")));
			accountChangePass.setPassword(req.getParameter("password"));
			accountService.updateAccount(accountChangePass);
			redirect = "/accounts";
			resp.sendRedirect(redirect);
			break;
		default:

			view = "/Views/StaffViews/AccountViews/Edit.jsp";
			RequestDispatcher requestDispatcher = req.getRequestDispatcher(view);
			requestDispatcher.forward(req, resp);
			break;
		}

	}
}
