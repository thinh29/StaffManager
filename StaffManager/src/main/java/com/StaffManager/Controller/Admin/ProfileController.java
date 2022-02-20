package com.StaffManager.Controller.Admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.StaffManager.Model.AccountModel;
import com.StaffManager.Model.StaffModel;
import com.StaffManager.Service.IAccountOwnerService;
import com.StaffManager.Service.IAccountService;
import com.StaffManager.Service.IPositionStaffService;
import com.StaffManager.Service.IStaffService;
import com.StaffManager.utils.FormUtils;
@WebServlet(urlPatterns = {"/admin/my-profile"})
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = -6602740588619638451L;
	
	@Inject
	private IAccountService accountService;
	@Inject
	private IStaffService staffService;
	@Inject
	private IAccountOwnerService accountOwnerService;
	@Inject
	private IPositionStaffService positionStaffService;
	
	ResourceBundle resourceBundle = ResourceBundle.getBundle("message");
	
	@SuppressWarnings("deprecation")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountModel accountModel = FormUtils.toModel(AccountModel.class, req);
		Long idAcc=(Long) req.getSession().getAttribute("id_1");
		accountModel=accountService.getAccountByIdVu(idAcc);
		Long idStaff=accountOwnerService.getIdStaffByAccountId(idAcc);
		StaffModel staffModel= staffService.getStaffById(idStaff);
		staffModel.setPositionName(positionStaffService.getPositionById(staffModel.getPosition()).getName());
		Integer sizeAccount=accountOwnerService.countAccountsOfOneStaff(idStaff);
		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
		List<AccountModel>accountsCreate=accountService.getListAccountCreateByOnSameDay(idAcc, timestamp.getDate(), "create_by", "create_at");
		List<AccountModel>accountsUpdate=accountService.getListAccountCreateByOnSameDay(idStaff, timestamp.getDate(), "update_by", "update_at");
		List<AccountModel>accountsDelete=accountService.getListAccountCreateByOnSameDay(idAcc, timestamp.getDate(), "deleted_by", "deleted_at");
		List<String>minutes=new ArrayList<String>();
		for (int i = 0; i < accountsCreate.size(); i++) {
			accountsCreate.get(i).setTypeName(accountService.getTypeName(accountsCreate.get(i).getTypeId()));
			accountsCreate.get(i).setStatusName(accountService.getStatusName(accountsCreate.get(i).getStatusAcc()));
			minutes.add(accountService.calculateMinuteForCreateAccount(timestamp, accountsCreate.get(i).getCreateAt()));
		}
		List<String>minutes2=new ArrayList<String>();
		for(int i=0;i<accountsUpdate.size();i++) {
			minutes2.add(accountService.calculateMinuteForCreateAccount(timestamp, accountsUpdate.get(i).getUpdateAt()));
		}
		List<String>minutes3=new ArrayList<String>();
		for(int i=0;i<accountsDelete.size();i++) {
			minutes3.add(accountService.calculateMinuteForCreateAccount(timestamp, accountsDelete.get(i).getDeleteAt()));
		}
		String messageEditAcc = req.getParameter("message");
		String messageEditStaff = req.getParameter("message2");
		if (messageEditAcc != null) {
			if(messageEditAcc.contains("success")) {
				req.setAttribute("message", resourceBundle.getString(messageEditAcc));
			}else if(messageEditAcc.contains("fail")) {
				req.setAttribute("message", resourceBundle.getString(messageEditAcc));
				req.setAttribute("alert", "danger");
			}
		}
		if (messageEditStaff != null) {
			if(messageEditStaff.contains("success")) {
				req.setAttribute("message2", resourceBundle.getString(messageEditStaff));
			}else if(messageEditStaff.contains("fail")) {
				req.setAttribute("message2", resourceBundle.getString(messageEditStaff));
				req.setAttribute("alert", "danger");
			}
		}
		req.setAttribute("accountsUpdate", accountsUpdate);
		req.setAttribute("accountsDelete", accountsDelete);
		req.setAttribute("minutes", minutes);
		req.setAttribute("minutes2", minutes2);
		req.setAttribute("minutes3", minutes3);
		req.setAttribute("accountsCreate", accountsCreate);
		req.setAttribute("sizeAccount", sizeAccount);
		req.setAttribute("staff", staffModel);
		req.setAttribute("account", accountModel);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/Views/AdminViews/ProfileViews/ProfilePage.jsp");
		requestDispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		AccountModel accountModel = FormUtils.toModel(AccountModel.class, req);
		String password2=req.getParameter("password2");
		if(password2.equals(accountModel.getPassword())==false) {
			resp.sendRedirect("/admin/my-profile?message=password_fail");
		}else {
			Long idUpdateBy = (Long) req.getSession().getAttribute("id_1");
			StaffModel staff = staffService.getStaffById(accountOwnerService.getIdStaffByAccountId(accountModel.getId()));
			staff.setFullName(accountModel.getFullName());
			accountModel.setUpdateBy(idUpdateBy);
			Boolean updateAccount=accountService.updateAccount(accountModel);
			Boolean updateStaff=staffService.updateStaff(staff, idUpdateBy);
			if(updateAccount==true&&updateStaff==true) {
				resp.sendRedirect("/admin/my-profile?message=edit_account_success&message2=edit_staff_success");
			}else if(updateAccount==false&&updateStaff==true) {
				resp.sendRedirect("/admin/my-profile?message=edit_account_fail&message2=edit_staff_success");
			}else if(updateAccount==true&&updateStaff==false) {
				resp.sendRedirect("/admin/my-profile?message=edit_account_success&message2=edit_staff_fail");
			}else {
				resp.sendRedirect("/admin/my-profile?message=edit_account_fail&message2=edit_staff_fail");
			}
		}
		
	}
	
}
