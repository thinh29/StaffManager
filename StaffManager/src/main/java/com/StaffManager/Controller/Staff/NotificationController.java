package com.StaffManager.Controller.Staff;

import java.io.IOException;
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

import com.StaffManager.Model.NotificationModel;
import com.StaffManager.Model.NotificationSendModel;
import com.StaffManager.Service.ILevelNotificationService;
import com.StaffManager.Service.INotificationSendService;
import com.StaffManager.Service.INotificationService;
import com.StaffManager.constant.StringsConstant;
import com.StaffManager.utils.FormUtils;


@WebServlet(urlPatterns = { "/notifications" })
public class NotificationController extends HttpServlet {
	private static final long serialVersionUID = 3342680513089682969L;
	
	@Inject
	private INotificationService notificationService;
	@Inject
	private INotificationSendService notificationSendService;
	@Inject
	private ILevelNotificationService levelNotificationService;
	
	ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NotificationModel notificationModel = FormUtils.toModel(NotificationModel.class, req);
		Integer page = (notificationModel.getPage() == null) ? 1 : notificationModel.getPage();
		String type = (notificationModel.getType() == null) ? "" : notificationModel.getType();
		Integer maxPageItem = (notificationModel.getMaxPageItem() == null) ? 20 : notificationModel.getMaxPageItem();
		String sortBy = (notificationModel.getSortBy() == null) ? "id" : notificationModel.getSortBy();
		String sortName = (notificationModel.getSortName() == null) ? "DESC" : notificationModel.getSortName();
		String view = "";
		Long idAcc = (Long) req.getSession().getAttribute("id_5");
		switch (type) {
		case StringsConstant.VIEW:
			Long idNotiView=Long.parseLong(req.getParameter("id"));
			Boolean seenByStaff=notificationSendService.updateSeenNotificationByStaff(idNotiView, idAcc, 1);
			if(seenByStaff) {
				List<Integer>seen=new ArrayList<Integer>();
				notificationModel=notificationService.getNotificationById(idNotiView);
				List<NotificationModel>listNotiView=new ArrayList<NotificationModel>();
				List<NotificationSendModel>listNotiSendView=notificationSendService.getListNotificationSendByIdAccount(idAcc, page, 15, 0, sortBy, sortName);
				for(int i=0;i<listNotiSendView.size();i++) {
					NotificationModel noti=notificationService.getNotificationById(listNotiSendView.get(i).getNotificationId());
					noti.setLevelName(levelNotificationService.getLevelNotificationById(noti.getLevel()).getName());
					noti.setBackgroundName(levelNotificationService.getLevelNotificationById(noti.getLevel()).getBackground());
					listNotiView.add(noti);
					seen.add(listNotiSendView.get(i).getSeen());
				}
				notificationModel.setListResult(listNotiView);
				req.setAttribute("seen", seen);
			}
			view = "/Views/StaffViews/NotificationViews/View.jsp";
			break;

		default:
			List<Integer>seen=new ArrayList<Integer>();
			List<NotificationModel>listNoti=new ArrayList<NotificationModel>();
			Integer sizeNotificationUnseen=notificationSendService.countNotificationUnseen(idAcc);
			List<NotificationSendModel>listNotiSend=notificationSendService.getListNotificationSendByIdAccount(idAcc, page, maxPageItem, 0, sortBy, sortName);
			for(int i=0;i<listNotiSend.size();i++) {
				NotificationModel noti=notificationService.getNotificationById(listNotiSend.get(i).getNotificationId());
				noti.setLevelName(levelNotificationService.getLevelNotificationById(noti.getLevel()).getName());
				noti.setBackgroundName(levelNotificationService.getLevelNotificationById(noti.getLevel()).getBackground());
				listNoti.add(noti);
				seen.add(listNotiSend.get(i).getSeen());
			}
			notificationModel.setListResult(listNoti);
			req.setAttribute("seen", seen);
			String message = req.getParameter("message");
			if (message != null) {
				req.setAttribute("message", resourceBundle.getString(message));
				req.setAttribute("alert", "danger");
			}
			Integer totalPage = notificationSendService.getTotalPage(maxPageItem, 0, idAcc);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("page", page);
			req.setAttribute("sizeNotificationUnseen", sizeNotificationUnseen);
			view = "/Views/StaffViews/NotificationViews/NotificationPage.jsp";
			break;
		}
		req.setAttribute("notification", notificationModel);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher(view);
		requestDispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		NotificationModel notificationModel = FormUtils.toModel(NotificationModel.class, req);
		String type=(notificationModel.getType() == null) ? "" : notificationModel.getType();
		RequestDispatcher render = null;
		Integer page = null;
		Integer maxPageItem = null;
		String sortBy = null;
		String sortName = null;
		String view = "";
		String redirect = "";
		Long idAcc=(Long) req.getSession().getAttribute("id_5");
		switch (type) {
		case StringsConstant.DELETE:
			Long idNotificationDel =Long.parseLong(req.getParameter("id"));
			Long idAccDel=(Long) req.getSession().getAttribute("id_5");
			Boolean deleted=notificationSendService.deleteNotificationByStaff(idNotificationDel, idAccDel);
			if(deleted) {
				resp.sendRedirect("/notifications");
			}else {
				resp.sendRedirect("/notifications?message=delete_noti_fail");
			}
			break;
		case StringsConstant.LIST_VIEW:
			page = (notificationModel.getPage() == null) ? 1 : notificationModel.getPage();
			maxPageItem = (notificationModel.getMaxPageItem() == null) ? 20 : notificationModel.getMaxPageItem();
			sortBy = (notificationModel.getSortName() == null) ? "id" : notificationModel.getSortName();
			sortName = (notificationModel.getSortBy() == null) ? "DESC" : notificationModel.getSortBy();
			List<Integer>seen=new ArrayList<Integer>();
			List<NotificationModel>listNoti=new ArrayList<NotificationModel>();
			List<NotificationSendModel>listNotiSend=notificationSendService.getListNotificationSendByIdAccount(idAcc, page, maxPageItem, 0, sortBy, sortName);
			for(int i=0;i<listNotiSend.size();i++) {
				NotificationModel noti=notificationService.getNotificationById(listNotiSend.get(i).getNotificationId());
				noti.setLevelName(levelNotificationService.getLevelNotificationById(noti.getLevel()).getName());
				noti.setBackgroundName(levelNotificationService.getLevelNotificationById(noti.getLevel()).getBackground());
				listNoti.add(noti);
				seen.add(listNotiSend.get(i).getSeen());
			}
			notificationModel.setListResult(listNoti);
			req.setAttribute("seen", seen);
			Integer totalPage = notificationSendService.getTotalPage(maxPageItem, 0, idAcc);
			req.setAttribute("notification", notificationModel);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("page", page);
			view = "/Views/StaffViews/NotificationViews/NotificationPage.jsp";
			render = req.getRequestDispatcher(view);
			render.forward(req, resp);
			break;
		case StringsConstant.SEARCH:
			String keyword = req.getParameter("keyword");
			String actionSeen=req.getParameter("action");
			if(keyword!=null) {
				if (keyword.equals("")) {
					resp.sendRedirect("/notifications");
				}else {
					page = (notificationModel.getPage() == null) ? 1 : notificationModel.getPage();
					maxPageItem = (notificationModel.getMaxPageItem() == null) ? 20 : notificationModel.getMaxPageItem();
					sortBy = (notificationModel.getSortName() == null) ? "id" : notificationModel.getSortName();
					sortName = (notificationModel.getSortBy() == null) ? "DESC" : notificationModel.getSortBy();
					List<Integer>seenSearch=new ArrayList<Integer>();
					List<NotificationModel>listNotiSearch=new ArrayList<NotificationModel>();
					List<NotificationSendModel>listNotiSendSearch=notificationSendService.getListSearch(idAcc, page, maxPageItem, 0, keyword, sortBy, sortName);
					for(int i=0;i<listNotiSendSearch.size();i++) {
						listNotiSearch.add(notificationService.getNotificationById(listNotiSendSearch.get(i).getNotificationId()));
						seenSearch.add(listNotiSendSearch.get(i).getSeen());
					}
					notificationModel.setListResult(listNotiSearch);
					req.setAttribute("seen", seenSearch);
					Integer totalPageSearch = notificationSendService.getTotalPage(maxPageItem, 0, idAcc);
					req.setAttribute("notification", notificationModel);
					req.setAttribute("totalPage", totalPageSearch);
					req.setAttribute("page", page);
					view = "/Views/StaffViews/NotificationViews/NotificationPage.jsp";
					render = req.getRequestDispatcher(view);
					render.forward(req, resp);
				}
			}else if(actionSeen!=null) {
				page = (notificationModel.getPage() == null) ? 1 : notificationModel.getPage();
				maxPageItem = (notificationModel.getMaxPageItem() == null) ? 20 : notificationModel.getMaxPageItem();
				sortBy = (notificationModel.getSortName() == null) ? "id" : notificationModel.getSortName();
				sortName = (notificationModel.getSortBy() == null) ? "ASC" : notificationModel.getSortBy();
				if(actionSeen.equals("unseen")) {
					List<Integer>seenFilter=new ArrayList<Integer>();
					List<NotificationModel>listNotiUnSeenFilter=new ArrayList<NotificationModel>();
					List<NotificationSendModel>listNotiSendUnSeenFilter=notificationSendService.getListSeenOrUnSeen(idAcc, page, maxPageItem, 0, 0, sortBy, sortName);
					for(int i=0;i<listNotiSendUnSeenFilter.size();i++) {
						NotificationModel noti=notificationService.getNotificationById(listNotiSendUnSeenFilter.get(i).getNotificationId());
						noti.setLevelName(levelNotificationService.getLevelNotificationById(noti.getLevel()).getName());
						noti.setBackgroundName(levelNotificationService.getLevelNotificationById(noti.getLevel()).getBackground());
						listNotiUnSeenFilter.add(noti);
						seenFilter.add(listNotiSendUnSeenFilter.get(i).getSeen());
					}
					notificationModel.setListResult(listNotiUnSeenFilter);
					req.setAttribute("seen", seenFilter);
					Integer totalPageSeen = notificationSendService.getTotalPage(maxPageItem, 0, idAcc);
					req.setAttribute("notification", notificationModel);
					req.setAttribute("totalPage", totalPageSeen);
					req.setAttribute("page", page);
					view = "/Views/StaffViews/NotificationViews/NotificationPage.jsp";
					render = req.getRequestDispatcher(view);
					render.forward(req, resp);
				}else if(actionSeen.equals("seen")) {
					List<Integer>seenFilter=new ArrayList<Integer>();
					List<NotificationModel>listNotiSeenFilter=new ArrayList<NotificationModel>();
					List<NotificationSendModel>listNotiSendSeenFilter=notificationSendService.getListSeenOrUnSeen(idAcc, page, maxPageItem, 0, 1, sortBy, sortName);
					for(int i=0;i<listNotiSendSeenFilter.size();i++) {
						NotificationModel noti=notificationService.getNotificationById(listNotiSendSeenFilter.get(i).getNotificationId());
						noti.setLevelName(levelNotificationService.getLevelNotificationById(noti.getLevel()).getName());
						noti.setBackgroundName(levelNotificationService.getLevelNotificationById(noti.getLevel()).getBackground());
						listNotiSeenFilter.add(noti);
						seenFilter.add(listNotiSendSeenFilter.get(i).getSeen());
					}
					notificationModel.setListResult(listNotiSeenFilter);
					req.setAttribute("seen", seenFilter);
					Integer totalPageSeen = notificationSendService.getTotalPage(maxPageItem, 0, idAcc);
					req.setAttribute("notification", notificationModel);
					req.setAttribute("totalPage", totalPageSeen);
					req.setAttribute("page", page);
					view = "/Views/StaffViews/NotificationViews/NotificationPage.jsp";
					render = req.getRequestDispatcher(view);
					render.forward(req, resp);
				}else {
					resp.sendRedirect("/notifications");
				}
				
			}
			break;
		default:
			redirect = "/notifications";
			resp.sendRedirect(redirect);
			break;
		}
	}
}
