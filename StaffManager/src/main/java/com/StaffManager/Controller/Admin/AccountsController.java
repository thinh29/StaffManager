package com.StaffManager.Controller.Admin;

import java.io.IOException;
import java.util.List;
import java.util.Properties;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.StaffManager.Model.AccountModel;
import com.StaffManager.Model.PositionStaffModel;
import com.StaffManager.Model.StaffModel;
import com.StaffManager.Model.TypeAccountModel;
import com.StaffManager.Service.IAccountOwnerService;
import com.StaffManager.Service.IAccountService;
import com.StaffManager.Service.IPositionStaffService;
import com.StaffManager.Service.IStaffService;
import com.StaffManager.Service.IStatusAccountService;
import com.StaffManager.Service.ITypeAccountService;
import com.StaffManager.constant.StringsConstant;
import com.StaffManager.utils.FormUtils;

@WebServlet(urlPatterns = { "/admin/accounts" })
public class AccountsController extends HttpServlet {
	private static final long serialVersionUID = 2116857410572415552L;

	@Inject
	private IAccountService accountService;
	@Inject
	private ITypeAccountService typeAccountService;
	@Inject
	private IStatusAccountService statusAccountService;
	@Inject
	private IStaffService staffService;
	@Inject
	private IAccountOwnerService accountOwnerService;
	@Inject
	private IPositionStaffService positionStaffService;
	ResourceBundle resourceBundle = ResourceBundle.getBundle("message");
	ResourceBundle resourceBundleMail = ResourceBundle.getBundle("mail");

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountModel accountModel = FormUtils.toModel(AccountModel.class, req);
		Integer page = (accountModel.getPage() == null) ? 1 : accountModel.getPage();
		String type = (accountModel.getType() == null) ? "" : accountModel.getType();
		Integer maxPageItem = (accountModel.getMaxPageItem() == null) ? 20 : accountModel.getMaxPageItem();
		String sortBy = (accountModel.getSortBy() == null) ? "id" : accountModel.getSortBy();
		String sortName = (accountModel.getSortName() == null) ? "DESC" : accountModel.getSortName();
		String view = "";
		switch (type) {
		case StringsConstant.VIEW:
			Long id1 = (accountModel.getId() == null) ? 0 : accountModel.getId();
			if (id1 == 0) {
				resp.sendRedirect("/admin/accounts");
			} else {
				req.setAttribute("staff", accountService.getStaffByAccount(accountModel.getId()));
				accountModel = accountService.getAccountByIdVu(accountModel.getId());
				if (accountModel.getDeleted() == 1) {
					req.setAttribute("message", "Tài khoản này đã bị xóa");
					req.setAttribute("alert", "danger");
				}
				accountModel.setCreateByName(accountService.getCreateByName(accountModel.getCreateBy()));
				accountModel.setUpdateByName(accountService.getUpdateByName(accountModel.getUpdateBy()));
				accountModel.setDeleteByName(accountService.getDeleteByName(accountModel.getDeleteBy()));
				accountModel.setTypeName(accountService.getTypeName(accountModel.getTypeId()));
				accountModel.setStatusName(accountService.getStatusName(accountModel.getStatusAcc()));
				view = "/Views/AdminViews/AccountViews/View.jsp";
			}
			break;
		case StringsConstant.ADD:
			List<TypeAccountModel> types = typeAccountService.getList();
			List<PositionStaffModel> staffPositions = positionStaffService.getList();
			req.setAttribute("listStaffPosition", staffPositions);
			req.setAttribute("listTypeAccount", types);
			StaffModel staffs = new StaffModel();
			staffs.setListResult(staffService.getListStaffVu());
			req.setAttribute("listStaff", staffs);
			String messageAdd = req.getParameter("message");
			if (messageAdd != null) {
				req.setAttribute("message", resourceBundle.getString(messageAdd));
				req.setAttribute("alert", "danger");
			}
			view = "/Views/AdminViews/AccountViews/Add.jsp";
			break;
		case StringsConstant.EDIT:
			Long id = (accountModel.getId() == null) ? 0 : accountModel.getId();
			if (id == 0) {
				resp.sendRedirect("/admin/accounts");
			} else {
				req.setAttribute("staff", accountService.getStaffByAccount(accountModel.getId()));
				req.setAttribute("listTypeAccountEdit", typeAccountService.getList());
				req.setAttribute("listStatusAccountEdit", statusAccountService.getListStatus());
				accountModel = accountService.getAccountById(accountModel.getId());
				accountModel.setTypeName(accountService.getTypeName(accountModel.getTypeId()));
				accountModel.setStatusName(accountService.getStatusName(accountModel.getStatusAcc()));
				String messageEdit = req.getParameter("message");
				if (messageEdit != null) {
					req.setAttribute("message", resourceBundle.getString(messageEdit));
					req.setAttribute("alert", "danger");
				}
				view = "/Views/AdminViews/AccountViews/Edit.jsp";
			}
			break;
		case StringsConstant.DELETE:
			List<AccountModel> listAccountDeleted = accountService.getList(page, maxPageItem, 1, sortBy, sortName);
			accountModel.setListResult(listAccountDeleted);
			Integer totalPageDel = accountService.getTotalPage(maxPageItem, 1);
			req.setAttribute("totalPage", totalPageDel);
			req.setAttribute("page", page);
			String messageDelete = req.getParameter("message");
			if (messageDelete != null) {
				req.setAttribute("message", resourceBundle.getString(messageDelete));
				req.setAttribute("alert", "danger");
			}
			view = "/Views/AdminViews/AccountViews/Delete.jsp";
			break;
		default:
			List<AccountModel> accountList = accountService.getList(page, maxPageItem, 0, sortBy, sortName);
			for (int i = 0; i < accountList.size(); i++) {
				accountList.get(i).setTypeName(accountService.getTypeName(accountList.get(i).getTypeId()));
				accountList.get(i).setStatusName(accountService.getStatusName(accountList.get(i).getStatusAcc()));
			}
			Integer totalPage = accountService.getTotalPage(maxPageItem, 0);
			accountModel.setListResult(accountList);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("page", page);
			view = "/Views/AdminViews/AccountViews/AccountsPage.jsp";
			break;
		}
		req.setAttribute("account", accountModel);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher(view);
		requestDispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		AccountModel accountModel = FormUtils.toModel(AccountModel.class, req);
		String redirect = "";
		String type = (accountModel.getType() == null) ? "" : accountModel.getType();
		RequestDispatcher render = null;
		Integer page = null;
		Integer maxPageItem = null;
		String sortBy = null;
		String sortName = null;
		String view = "";
		switch (type) {
		case StringsConstant.ADD:
				Long idType = Long.parseLong(req.getParameter("typeId"));
				Long staffId = Long.parseLong(req.getParameter("idStaff"));
				Long idCreateBy = (Long) req.getSession().getAttribute("id_1");
				String fullNameStaff = staffService.getStaffById(staffId).getFullName();
				accountModel.setCreateBy(idCreateBy);
				accountModel.setFullName(fullNameStaff);
				accountModel.setTypeId(idType);
				List<AccountModel> accountCheckUsername = accountService.getAll();
				Boolean check = true;
				for (int i = 0; i < accountCheckUsername.size(); i++) {
					if (accountModel.getUsername().trim().equals(accountCheckUsername.get(i).getUsername().trim())) {
						check = false;
						resp.sendRedirect("/admin/accounts?type=add&message=username_exist");
					}
				}
				if (check) {
					Long idNewAccount = accountService.insertNewAccount(accountModel.getUsername(),
							accountModel.getFullName(), accountModel.getTypeId(), accountModel.getCreateBy());
					String messageNewAccountOwner = accountOwnerService.relaAccountAndStaff(idNewAccount, staffId);

					if (messageNewAccountOwner.equals("add_staff_success")) {
//						prepare send mail
						String systemEmail = resourceBundleMail.getString("email_verify");
						String passEmail = resourceBundleMail.getString("password_verify");
						Properties prop = new Properties();
						prop.put("mail.smtp.host", "smtp.gmail.com");
						prop.put("mail.smtp.socketFactory.port", "465");
						prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
						prop.put("mail.smtp.auth", "true");
						prop.put("mail.smtp.port", "465");
						prop.put("mail.smtp.starttls.enable", "true");
						Session sessionMail = Session.getInstance(prop, new Authenticator() {
							protected PasswordAuthentication getPasswordAuthentication() {
								return new PasswordAuthentication(systemEmail, passEmail);
							}
						});
//						send mail
						AccountModel accountNew = accountService.getAccountById(idNewAccount);
						StaffModel staffNew = staffService.getStaffById(staffId);
						String sendTo = staffNew.getEmailAddress();
						String emailSubject = resourceBundleMail.getString("subject_create_account");
						String emailContent = "Tên đăng nhập: " + req.getParameter("username") + "\nMật khẩu: "
								+ accountNew.getPassword();
						try {
							Message messageMail = new MimeMessage(sessionMail);
							messageMail.setFrom(new InternetAddress(systemEmail));
							messageMail.setRecipients(Message.RecipientType.TO, InternetAddress.parse(sendTo));
							messageMail.setSubject(emailSubject);
							messageMail.setText(emailContent);
							Transport.send(messageMail);
						} catch (MessagingException e) {
							e.printStackTrace();
						}
						resp.sendRedirect("/admin/accounts");
				}
			}
			break;
		case StringsConstant.EDIT:
			Long id = Long.parseLong(req.getParameter("id"));
			StaffModel staffResetModel = staffService.getStaffById(accountOwnerService.getIdStaffByAccountId(id));
			Long idUpdateBy = (Long) req.getSession().getAttribute("id_1");
			String checkReset = req.getParameter("checkResetPassword");
			accountModel.setId(id);
			accountModel.setUpdateBy(idUpdateBy);
			Boolean update = accountService.updateAccount(accountModel);
			Boolean resetPass = false;
			if (checkReset != null) {
				resetPass = accountService.resetPassword(id);
			}

			if (update) {
				if (resetPass) {
//						prepare send mail
					String systemEmail = resourceBundleMail.getString("email_verify");
					String passEmail = resourceBundleMail.getString("password_verify");
					Properties prop = new Properties();
					prop.put("mail.smtp.host", "smtp.gmail.com");
					prop.put("mail.smtp.socketFactory.port", "465");
					prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
					prop.put("mail.smtp.auth", "true");
					prop.put("mail.smtp.port", "465");
					prop.put("mail.smtp.starttls.enable", "true");
					Session sessionMail = Session.getInstance(prop, new Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(systemEmail, passEmail);
						}
					});
//						send mail
					AccountModel accountReset = accountService.getAccountById(id);
					String sendTo = staffResetModel.getEmailAddress();
					String emailSubject = resourceBundleMail.getString("subject_reset_password");
					String emailContent = "Tài khoản đã được reset mật khẩu:\n" + "Tên đăng nhập: "
							+ accountReset.getUsername() + "\nMật khẩu: " + accountReset.getPassword();
					try {
						Message messageMail = new MimeMessage(sessionMail);
						messageMail.setFrom(new InternetAddress(systemEmail));
						messageMail.setRecipients(Message.RecipientType.TO, InternetAddress.parse(sendTo));
						messageMail.setSubject(emailSubject);
						messageMail.setText(emailContent);
						Transport.send(messageMail);
					} catch (MessagingException e) {
						e.printStackTrace();
					}
				}
				resp.sendRedirect("/admin/accounts");
			}
			break;
		case StringsConstant.DELETE:
			String itemDelete = req.getParameter("id");
			if (itemDelete != null) {
				Long idDelete = Long.parseLong(itemDelete);
				Long idDeleteBy = (Long) req.getSession().getAttribute("id_1");
				Boolean deleted = accountService.deleteAccount(idDelete, idDeleteBy);
				if (deleted) {
					resp.sendRedirect("/admin/accounts");
				} else {
					resp.sendRedirect("/admin/accounts?message=delete_account_fail");
				}
			}
			break;
		case StringsConstant.RESTORE:
			Long idRestore = Long.parseLong(req.getParameter("id"));
			Long idStaff = accountOwnerService.getIdStaffByAccountId(idRestore);
			StaffModel staff = staffService.getStaffById(idStaff);
			if (staff.getDeleted() == 0) {
				Boolean restoreAcc = accountService.restoreAccount(idRestore);
				if (restoreAcc) {
					resp.sendRedirect("/admin/accounts?type=delete");
				}
			} else if (staff.getDeleted() == 1) {
				resp.sendRedirect("/admin/accounts?type=delete&message=restore_account_fail");
			}
			break;
		case StringsConstant.LIST_VIEW:
			page = (accountModel.getPage() == null) ? 1 : accountModel.getPage();
			maxPageItem = (accountModel.getMaxPageItem() == null) ? 20 : accountModel.getMaxPageItem();
			sortBy = (accountModel.getSortName() == null) ? "id" : accountModel.getSortName();
			sortName = (accountModel.getSortBy() == null) ? "DESC" : accountModel.getSortBy();
			view = "";
			List<AccountModel> listAccount = accountService.getList(page, maxPageItem, 0, sortBy, sortName);
			for (int i = 0; i < listAccount.size(); i++) {
				listAccount.get(i).setTypeName(accountService.getTypeName(listAccount.get(i).getTypeId()));
				listAccount.get(i).setStatusName(accountService.getStatusName(listAccount.get(i).getStatusAcc()));
			}
			Integer totalPage = accountService.getTotalPage(maxPageItem, 0);
			accountModel.setListResult(listAccount);
			req.setAttribute("account", accountModel);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("page", page);
			view = "/Views/AdminViews/AccountViews/AccountsPage.jsp";
			render = req.getRequestDispatcher(view);
			render.forward(req, resp);
			break;
		case StringsConstant.SEARCH:
			String keyword = req.getParameter("keyword");
			if (keyword.equals("")) {
				resp.sendRedirect("/admin/accounts");
			} else {
				String option = req.getParameter("option");
				page = (accountModel.getPage() == null) ? 1 : accountModel.getPage();
				maxPageItem = (accountModel.getMaxPageItem() == null) ? 20 : accountModel.getMaxPageItem();
				sortBy = (accountModel.getSortName() == null) ? "id" : accountModel.getSortName();
				sortName = (accountModel.getSortBy() == null) ? "DESC" : accountModel.getSortBy();
				switch (option) {
				case StringsConstant.SEARCH_STAFF_ACTIVE:
					List<AccountModel> accountListSearch = accountService.getListSearch(page, maxPageItem, 0, keyword,
							sortBy, sortName);
					for (int i = 0; i < accountListSearch.size(); i++) {
						accountListSearch.get(i)
								.setTypeName(accountService.getTypeName(accountListSearch.get(i).getTypeId()));
						accountListSearch.get(i)
								.setStatusName(accountService.getStatusName(accountListSearch.get(i).getStatusAcc()));
					}
					Integer ttPage = accountService.getTotalPage(maxPageItem, 0);
					accountModel.setListResult(accountListSearch);
					req.setAttribute("account", accountModel);
					req.setAttribute("totalPage", ttPage);
					req.setAttribute("page", page);
					view = "/Views/AdminViews/AccountViews/AccountsPage.jsp";
					render = req.getRequestDispatcher(view);
					render.forward(req, resp);
					break;
				case StringsConstant.SEARCH_STAFF_DELETE:
					List<AccountModel> accountListSearchDelete = accountService.getListSearch(page, maxPageItem, 1,
							keyword, sortBy, sortName);
					for (int i = 0; i < accountListSearchDelete.size(); i++) {
						accountListSearchDelete.get(i).setDeleteByName(
								accountService.getDeleteByName(accountListSearchDelete.get(i).getDeleteBy()));
						accountListSearchDelete.get(i)
								.setTypeName(accountService.getTypeName(accountListSearchDelete.get(i).getTypeId()));
						accountListSearchDelete.get(i).setStatusName(
								accountService.getStatusName(accountListSearchDelete.get(i).getStatusAcc()));
					}
					Integer ttPageDelete = accountService.getTotalPage(maxPageItem, 0);
					accountModel.setListResult(accountListSearchDelete);
					req.setAttribute("account", accountModel);
					req.setAttribute("totalPage", ttPageDelete);
					req.setAttribute("page", page);
					view = "/Views/AdminViews/AccountViews/AccountsPage.jsp";
					render = req.getRequestDispatcher(view);
					render.forward(req, resp);
					break;
				}
			}
			break;
		default:
			redirect = "/admin/accounts";
			resp.sendRedirect(redirect);
			break;
		}
	}
}
