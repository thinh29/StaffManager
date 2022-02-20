package com.StaffManager.Controller.Login;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.StaffManager.Model.AccountModel;
import com.StaffManager.Service.IAccountService;
import com.StaffManager.constant.StringsConstant;
import com.StaffManager.utils.FormUtils;

@WebServlet(urlPatterns = { "/login", "/logout" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = -45387054244632550L;

	@Inject
	private IAccountService accountService;
	ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = (req.getParameter("action") == null) ? "" : req.getParameter("action");
		String view = "";
		if (action.equals(StringsConstant.LOGOUT)) {
			HttpSession session = req.getSession();
			switch (req.getParameter("accept")) {
			case "accept_1":
				session.removeAttribute("fullName_1");
				session.removeAttribute("id_1");
				session.removeAttribute("accept_1");
				break;
			case "accept_2":
				session.removeAttribute("fullName_2");
				session.removeAttribute("id_2");
				session.removeAttribute("accept_2");
				break;
			case "accept_3":
				session.removeAttribute("fullName_3");
				session.removeAttribute("id_3");
				session.removeAttribute("accept_3");
				break;
			case "accept_4":
				session.removeAttribute("fullName_4");
				session.removeAttribute("id_4");
				session.removeAttribute("accept_4");
				break;
			case "accept_5":
				session.removeAttribute("fullName_5");
				session.removeAttribute("id_5");
				session.removeAttribute("accept_5");
				break;
			default:
				break;
			}
			resp.sendRedirect("/login");
		} else {
			String message = req.getParameter("message");
			if (message != null) {
				req.setAttribute("message", resourceBundle.getString(message));
				req.setAttribute("alert", "danger");
			}
			view = "/Views/LoginViews/Login.jsp";
			RequestDispatcher render = req.getRequestDispatcher(view);
			render.forward(req, resp);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountModel accountModel = FormUtils.toModel(AccountModel.class, req);
		String username = accountModel.getUsername();
		String password = accountModel.getPassword();
		String redirect = "";
		HttpSession session = req.getSession();
		if (!(username.equals("") || password.equals(""))) {
			accountModel = accountService.getLogin(username, password);
			if (accountModel != null) {
				if (accountModel.getStatusAcc() != 2) {
					redirect = "/login?message=account_not_active_block";
				} else {
					switch (accountModel.getTypeId().toString()) {
					case "1":
						session.setAttribute("fullName_1", accountModel.getFullName());
						session.setAttribute("id_1", accountModel.getId());
						session.setAttribute("accept_1", true);
						redirect = "/admin";
						break;
					case "3":
						session.setAttribute("fullName_3", accountModel.getFullName());
						session.setAttribute("id_3", accountModel.getId());
						session.setAttribute("accept_3", true);
						redirect = "/manager";
						break;
					case "5":
						session.setAttribute("fullName_5", accountModel.getFullName());
						session.setAttribute("id_5", accountModel.getId());
						session.setAttribute("accept_5", true);
						redirect = "/home";
						break;
					default:
						redirect = "/login?message=invalid_account";
						break;
					}
				}
			} else {
				redirect = "/login?message=username_or_password_wrong";
			}
		} else {
			redirect = "/login?message=enter_username_and_password";
		}
		resp.sendRedirect(redirect);
	}
}
