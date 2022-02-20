package com.StaffManager.Controller.Staff.api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.StaffManager.Model.AccountModel;
import com.StaffManager.Model.NotificationModel;
import com.StaffManager.Model.NotificationSendModel;
import com.StaffManager.Service.IAccountService;
import com.StaffManager.Service.ILevelNotificationService;
import com.StaffManager.Service.INotificationSendService;
import com.StaffManager.Service.INotificationService;
import com.StaffManager.utils.HttpUtil;


@WebServlet(urlPatterns = { "/api-staff" })
public class NotificationAPI extends HttpServlet{

	private static final long serialVersionUID = 4863615464077814673L;
	
	@Inject 
	private INotificationSendService notificationSendService;
	@Inject
	private INotificationService notificationService;
	@Inject
	private IAccountService accountService;
	@Inject
	private ILevelNotificationService levelNotificationService;
	@Inject
	private AccountModel accountModel;
	@SuppressWarnings("deprecation")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		List<NotificationSendModel> listNotiSend= notificationSendService.getListSeenOrUnSeen(accountModel.getId(), 1, 5, 0, 0, "id", "DESC");
		List<NotificationModel>listNotiView=new ArrayList<NotificationModel>();
		for(int i=0;i<listNotiSend.size();i++) {
			NotificationModel noti=notificationService.getNotificationById(listNotiSend.get(i).getNotificationId());
			noti.setLevelName(levelNotificationService.getLevelNotificationById(noti.getLevel()).getName());
			noti.setBackgroundName(levelNotificationService.getLevelNotificationById(noti.getLevel()).getBackground());
			listNotiView.add(noti);
		}
		PrintWriter writer = resp.getWriter();
		PrintWriter writer2=resp.getWriter();
		writer2.print(listNotiView.size()+"|");
		for(int i=0;i<listNotiView.size();i++) {
			writer.print("<a class=\"dropdown-item d-flex align-items-center\"\r\n"
					+ "					href=\"/notifications?type=view&id="+listNotiView.get(i).getId()+"\">\r\n"
					+ "					<div class=\"mr-3\">\r\n"
					+ "						<div class=\"icon-circle bg-"+listNotiView.get(i).getBackgroundName()+"\">\r\n"
					+ "							<i class=\"fas fa-"+(listNotiView.get(i).getLevel()==1L?"file-alt":(listNotiView.get(i).getLevel()==2?"exclamation-triangle":(listNotiView.get(i).getLevel()==3?"exclamation-circle":"donate")))+" text-white\"></i>\r\n"
					+ "						</div>\r\n"
					+ "					</div>\r\n"
					+ "					<div>\r\n"
					+ "						<div class=\"small text-gray-500\">"+listNotiView.get(i).convertNumberMonthToMonthName(listNotiView.get(i).getCreateAt().getMonth()+1)+" "+listNotiView.get(i).getCreateAt().getDate()+", "+(listNotiView.get(i).getCreateAt().getYear()+1900)+"</div>\r\n"
					+ "						<span class=\"font-weight-bold\">#"+listNotiView.get(i).getTitle()+"</span>\r\n"
					+ "					</div>\r\n"
					+ "				</a> ");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		accountModel=HttpUtil.of(req.getReader()).toModel(AccountModel.class);
		accountModel=accountService.getAccountByIdVu(accountModel.getId());
	}
}
