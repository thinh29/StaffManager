package com.StaffManager.Controller.Chat;

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
import com.StaffManager.Service.implement.AccountService;
import com.StaffManager.utils.FormUtils;

@WebServlet(urlPatterns = { "/chatRoom" , "/admin/chatRoom" , "/manager/chatRoom"})
public class ChatController extends HttpServlet{

	private static final long serialVersionUID = -6626152459006213264L;
	
	@Inject
	private IAccountService accountService = new AccountService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AccountModel accountModel = FormUtils.toModel(AccountModel.class, req);
		Long id1=(Long) req.getSession().getAttribute("id_1");
		Long id3=(Long) req.getSession().getAttribute("id_3");
		Long id5=(Long) req.getSession().getAttribute("id_5");
		if(id1!=null) {
			accountModel=accountService.getAccountByIdVu(id1);
		}else if(id3!=null) {
			accountModel=accountService.getAccountByIdVu(id3);
		}else if(id5!=null) {
			accountModel=accountService.getAccountByIdVu(id5);
		}
		req.setAttribute("account", accountModel);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/Views/ChatViews/Chat.jsp");
		requestDispatcher.forward(req, resp);
	}

}
