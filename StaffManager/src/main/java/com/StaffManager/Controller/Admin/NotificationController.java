package com.StaffManager.Controller.Admin;

import java.io.IOException;
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
import com.StaffManager.Model.AccountNotificationModel;
import com.StaffManager.Model.NotificationLevelModel;
import com.StaffManager.Model.NotificationModel;
import com.StaffManager.Model.NotificationSendModel;
import com.StaffManager.Model.PositionStaffModel;
import com.StaffManager.Service.IAccountService;
import com.StaffManager.Service.INotificationLevelService;
import com.StaffManager.Service.INotificationSendService;
import com.StaffManager.Service.INotificationService;
import com.StaffManager.Service.IPositionStaffService;
import com.StaffManager.constant.StringsConstant;
import com.StaffManager.utils.FormUtils;

@WebServlet(urlPatterns = { "/admin/notifications" })
public class NotificationController extends HttpServlet {

	private static final long serialVersionUID = -6602740588619638451L;
	@Inject
	private INotificationService notificationService;
	@Inject
	private IPositionStaffService positionStaffService;
	@Inject
	private INotificationLevelService notificationLevelService;
	@Inject
	private INotificationSendService notificationSendService;
	@Inject
	private IAccountService accountService;
	
	ResourceBundle resourceBundle = ResourceBundle.getBundle("message");
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NotificationModel notificationModel = FormUtils.toModel(NotificationModel.class, req);
		Integer page = (notificationModel.getPage() == null) ? 1 : notificationModel.getPage();
		Integer maxPageItem = (notificationModel.getMaxPageItem() == null) ? 10 : notificationModel.getMaxPageItem();
		String sortName = (notificationModel.getSortName() == null) ? "id" : notificationModel.getSortName();
		String sortBy = (notificationModel.getSortBy() == null) ? "DESC" : notificationModel.getSortBy();
		String type = (notificationModel.getType() == null) ? "" : notificationModel.getType();
		String view = "";
		
		RequestDispatcher render =null;
		switch (type) {
		case StringsConstant.VIEW:
			Long id1 = (notificationModel.getId() == null) ? 0 : notificationModel.getId();
			if (id1 == 0) {
				resp.sendRedirect("/manager/staffs");
			} else {
				notificationModel= notificationService.getNotificationById(id1);
				AccountModel createAcc = accountService.getAccountById(notificationModel.getCreateBy());
				req.setAttribute("Noti", notificationModel);
				req.setAttribute("createAcc", createAcc);
				view = "/Views/AdminViews/NotificationViews/View.jsp";
				render = req.getRequestDispatcher(view);
				render.forward(req, resp);
			}
			break;
		case StringsConstant.ADD:
			List<AccountNotificationModel> listAcc = accountService.getListAccountNoti();
			List<PositionStaffModel> positionEdit = positionStaffService.getList();
			List<NotificationLevelModel> listLevel =notificationLevelService.getList();
			req.setAttribute("listAcc", listAcc);
			req.setAttribute("listLevel", listLevel);
			req.setAttribute("positionstaff", positionEdit);
			view = "/Views/AdminViews/NotificationViews/Add.jsp";
			render = req.getRequestDispatcher(view);
			String messageAdd = req.getParameter("message");
			if (messageAdd != null) {
				req.setAttribute("message", resourceBundle.getString(messageAdd));
				req.setAttribute("alert", "danger");
			}
			render.forward(req, resp);
			break;
		case StringsConstant.EDIT:
			Long id = (notificationModel.getId() == null) ? 0 : notificationModel.getId();
			if (id == 0) {
				resp.sendRedirect("/manager/staffs");
			} else {
				
				NotificationModel notification= notificationService.getNotificationById(id);
				
				List<AccountNotificationModel> listAcc1 = accountService.getListAccountNoti();
				List<NotificationLevelModel> listLevel1 =notificationLevelService.getList();
				List<PositionStaffModel> positionEdit1 = positionStaffService.getList();
				AccountModel createBy = accountService.getAccountById(notification.getCreateBy());
				AccountModel updateBy = accountService.getAccountById(notification.getUpdateBy());
			
				req.setAttribute("createBy", createBy);
				req.setAttribute("updateBy", updateBy);
				req.setAttribute("listAcc", listAcc1);
				req.setAttribute("Noti", notification);
				req.setAttribute("listLevel", listLevel1);
				req.setAttribute("positionstaff", positionEdit1);
				view = "/Views/AdminViews/NotificationViews/Edit.jsp";
			}
			render = req.getRequestDispatcher(view);
			render.forward(req, resp);
			break;
		case StringsConstant.DELETE:
			List<NotificationModel> listNotiDel = notificationService.getList(page, maxPageItem, 1,sortName, sortBy );
			Integer totalPageDel = notificationService.getTotalPage(maxPageItem, 1);
			List<NotificationLevelModel> listLevelDel =notificationLevelService.getList();
			req.setAttribute("totalPage", totalPageDel);
			req.setAttribute("page", page);
			req.setAttribute("listNotiDel", listNotiDel);
			req.setAttribute("listLevel", listLevelDel);
			view = "/Views/AdminViews/NotificationViews/Delete.jsp";
			render = req.getRequestDispatcher(view);
			render.forward(req, resp);
			break;	
			
		case StringsConstant.NULL:
			List<NotificationModel> listNoti = notificationService.getList(page, maxPageItem, 0,sortName, sortBy );
			List<NotificationLevelModel> listLevel1 =notificationLevelService.getList();
			Integer totalPage = notificationService.getTotalPage(maxPageItem, 0);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("page", page);
			req.setAttribute("listNoti", listNoti);
			req.setAttribute("listLevel", listLevel1);

			view = "/Views/AdminViews/NotificationViews/NotificationPage.jsp";
			render = req.getRequestDispatcher(view);
			render.forward(req, resp);
			break;	
		default:
			resp.sendRedirect("/Views/AdminViews/NotificationViews/NotificationPage.jsp");
			break;
		}
		RequestDispatcher requestDispatcher = req.getRequestDispatcher(view);
		requestDispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		NotificationModel stModel = FormUtils.toModel(NotificationModel.class, req);
		NotificationSendModel stModelS = FormUtils.toModel(NotificationSendModel.class, req);
		String redirect = "";
		String type = (stModel.getType() == null) ? "" : stModel.getType();
		String view = "";
		RequestDispatcher render = null;
		Integer page = null;
		Integer maxPageItem = null;
		String sortBy = null;
		String sortName = null;
		switch (type) {
		case StringsConstant.ADD:
			Long createBy = (Long) req.getSession().getAttribute("id_1");
			String idac = req.getParameter("idac");
			if(idac==null) {
				resp.sendRedirect("/admin/notifications?type=add&message=add_noti_fail");
			}else {
				String [] lists = idac.split(",");
				Long idStatus = Long.parseLong(req.getParameter("level"));
				Long NewNotification = notificationService.insertNewNotification(stModel, idStatus, createBy);
				stModelS.setNotificationId(NewNotification);
				for(int i=0;i<lists.length;i++) {
					if(lists[i].equals("")==false) {
						stModelS.setAccountId(Long.parseLong(lists[i]));
						notificationSendService.insertNewNotification(stModelS);
					}
				}
				
					if(NewNotification!=null) {
						resp.sendRedirect("/admin/notifications");
					}else {resp.sendRedirect("/admin/notifications?message=add_staff_fail");}
			}
			
			break;
		case StringsConstant.EDIT:
			Long udBy = (Long) req.getSession().getAttribute("id_1");
			Long idedit= Long.parseLong(req.getParameter("id"));
			String idac1 = req.getParameter("idac");
			String [] lists = idac1.split(",");
			Boolean wasNotiUpdate = notificationService.updateNotification(stModel, udBy);
			notificationSendService.deleteNotificationSend(idedit);
			stModelS.setNotificationId(idedit);
			for(int i=0;i<lists.length;i++) {
				if(lists[i].equals("")==false) {
					stModelS.setAccountId(Long.parseLong(lists[i]));
					notificationSendService.insertNewNotification(stModelS);
				}
			}
				if (wasNotiUpdate !=null) {
					resp.sendRedirect("/admin/notifications");
				} else {
					view = "/Views/ManagerViews/StaffViews/Edit.jsp";
					render = req.getRequestDispatcher(view);
					render.forward(req, resp);
				}
			break;
		case StringsConstant.DELETE:
			Long delBy = (Long) req.getSession().getAttribute("id_1");
			Long idNoti= Long.parseLong(req.getParameter("id"));
				Boolean wasDel = notificationService.deleteNotification(stModel, delBy);
				Boolean delSend = notificationSendService.deleteNotificationByManager(idNoti);
				if (wasDel  && delSend) {
					resp.sendRedirect("/admin/notifications");
				} else {
					resp.sendRedirect("/admin/notifications?message=delete_staff_fail");
				}
			break;
		case StringsConstant.RESTORE:
			Long rstBy = (Long) req.getSession().getAttribute("id_1");
			Long stRstId = Long.parseLong(req.getParameter("id"));
				Boolean wasRst = notificationService.restoreNotification(stRstId, rstBy);
				Boolean rstSend = notificationSendService.restoreNotificationByManager(stRstId);
				if (wasRst) {
					resp.sendRedirect("/admin/notifications?type=delete");
				} else {
					resp.sendRedirect("/admin/notifications?type=delete&message=delete_staff_fail");
				}
			break;
		case StringsConstant.LIST_VIEW:
			page = (stModel.getPage() == null) ? 1 : stModel.getPage();
			maxPageItem = (stModel.getMaxPageItem() == null) ? 10 : stModel.getMaxPageItem();
			sortBy = (stModel.getSortName() == null) ? "id" : stModel.getSortName();
			sortName = (stModel.getSortBy() == null) ? "DESC" : stModel.getSortBy();
			view = "";
			List<NotificationModel> listNoti = notificationService.getList(page, maxPageItem, 0,sortBy, sortName );
			Integer totalPage = notificationService.getTotalPage(maxPageItem, 0);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("page", page);
			req.setAttribute("listNoti", listNoti);
			view = "/Views/AdminViews/NotificationViews/NotificationPage.jsp";
			render = req.getRequestDispatcher(view);
			render.forward(req, resp);
			break;
		default:
			redirect = "/admin/notifications";
			resp.sendRedirect(redirect);
			break;
		}
		
	}
	
}
