package com.StaffManager.Controller.Manager;

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
import com.StaffManager.Model.ProvinceModel;
import com.StaffManager.Model.StaffModel;
import com.StaffManager.Model.TypeAccountModel;
import com.StaffManager.Model.TypeStaffModel;
import com.StaffManager.Service.IAccountOwnerService;
import com.StaffManager.Service.IAccountService;
import com.StaffManager.Service.IPositionStaffService;
import com.StaffManager.Service.IProvinceService;
import com.StaffManager.Service.IStaffService;
import com.StaffManager.Service.ITypeAccountService;
import com.StaffManager.Service.ITypeStaffService;
import com.StaffManager.constant.StringsConstant;
import com.StaffManager.utils.FormUtils;

@WebServlet(urlPatterns = { "/manager/staffs" })
public class StaffController extends HttpServlet {
	ResourceBundle resourceBundle = ResourceBundle.getBundle("message");
	ResourceBundle resourceBundleMail = ResourceBundle.getBundle("mail");
	private static final long serialVersionUID = 4407495183398991578L;
	@Inject
	private IStaffService staffService;
	@Inject
	private IPositionStaffService positionStaffService;
	@Inject
	private IAccountService accountService;
	@Inject
	private IAccountOwnerService accountOwner;
	@Inject
	private IProvinceService provinceService;
	@Inject
	private ITypeAccountService typeAccountService;
	@Inject
	private ITypeStaffService typeStaffService;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StaffModel staffModel = FormUtils.toModel(StaffModel.class, req);
		Integer page = (staffModel.getPage() == null) ? 1 : staffModel.getPage();
		String type = (staffModel.getType() == null) ? "" : staffModel.getType();
		Integer maxPageItem = (staffModel.getMaxPageItem() == null) ? 20 : staffModel.getMaxPageItem();
		String sortName = (staffModel.getSortName() == null) ? "id" : staffModel.getSortName();
		String sortBy = (staffModel.getSortBy() == null) ? "DESC" : staffModel.getSortBy();
		String view = "";
		RequestDispatcher render = null;
		switch (type) {
		case StringsConstant.ADD:
			List<PositionStaffModel> position = positionStaffService.getList();
			List<ProvinceModel> provinces = provinceService.getList();
			TypeAccountModel types = typeAccountService.getTypeAccountById(5l);
			List<TypeStaffModel> typeStAdd = typeStaffService.getList();
			req.setAttribute("typeSt", typeStAdd);
			req.setAttribute("types", types);
			req.setAttribute("positions", position);
			req.setAttribute("provinces", provinces);

			view = "/Views/ManagerViews/StaffViews/Add.jsp";
			render = req.getRequestDispatcher(view);
			render.forward(req, resp);
			break;
		case StringsConstant.EDIT:
			Long id = (staffModel.getId() == null) ? 0 : staffModel.getId();
			if (id == 0) {
				resp.sendRedirect("/manager/staffs");
			} else {
				StaffModel staffEdit = staffService.getStaffById(id);
				List<PositionStaffModel> positionEdit = positionStaffService.getList();
				List<ProvinceModel> provinceEdit = provinceService.getList();
				List<TypeAccountModel> typeEdit = typeAccountService.getList();
				List<TypeStaffModel> typeStEdit = typeStaffService.getList();
				req.setAttribute("typeSt", typeStEdit);
				req.setAttribute("types", typeEdit);
				req.setAttribute("positions", positionEdit);
				req.setAttribute("provinces", provinceEdit);
				req.setAttribute("staff", staffEdit);
				view = "/Views/ManagerViews/StaffViews/Edit.jsp";
			}
			render = req.getRequestDispatcher(view);
			render.forward(req, resp);
			break;
		case StringsConstant.DELETE:
			List<StaffModel> listDeleted = staffService.getList(page, maxPageItem, 1, sortName, sortBy);
			List<PositionStaffModel> positionStaffDel = positionStaffService.getList();
			Integer totalPageDel = staffService.getTotalPage(maxPageItem, 1);
			req.setAttribute("totalPage", totalPageDel);
			req.setAttribute("page", page);
			req.setAttribute("listStaffs", listDeleted);
			req.setAttribute("positionStaffs", positionStaffDel);
			String msD = (req.getParameter("message") == null) ? null
					: resourceBundle.getString(req.getParameter("message"));
			req.setAttribute("message", msD);
			view = "/Views/ManagerViews/StaffViews/Delete.jsp";
			render = req.getRequestDispatcher(view);
			render.forward(req, resp);
			break;
		case StringsConstant.VIEW:
			Long id1 = (staffModel.getId() == null) ? 0 : staffModel.getId();
			if (id1 == 0) {
				resp.sendRedirect("/manager/staffs");
			} else {
				staffModel = staffService.getStaffById(id1);
				PositionStaffModel positionStaff = positionStaffService.getPositionById(staffModel.getPosition());
				ProvinceModel provinceStaff = provinceService.getProvinceById(staffModel.getHometown());
				AccountModel createAcc = accountService.getAccountById(staffModel.getCreateBy());
				AccountModel updateAcc = accountService.getAccountById(staffModel.getUpdateBy());
				AccountModel deleteAcc = accountService.getAccountById(staffModel.getDeleteBy());
				List<TypeStaffModel> typeSt = typeStaffService.getList();
				req.setAttribute("typeSt", typeSt);
				req.setAttribute("hometown", provinceStaff);
				req.setAttribute("position", positionStaff);
				req.setAttribute("staff", staffModel);
				req.setAttribute("createAcc", createAcc);
				req.setAttribute("updateAcc", updateAcc);
				req.setAttribute("deleteAcc", deleteAcc);
				view = "/Views/ManagerViews/StaffViews/View.jsp";
				render = req.getRequestDispatcher(view);
				render.forward(req, resp);
			}

			break;
		case StringsConstant.NULL:
			List<StaffModel> listStaff = staffService.getList(page, maxPageItem, 0, sortName, sortBy);
			List<PositionStaffModel> positionStaff = positionStaffService.getList();
			Integer totalPage = staffService.getTotalPage(maxPageItem, 0);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("page", page);
			req.setAttribute("listStaffs", listStaff);
			req.setAttribute("positionStaffs", positionStaff);
			String ms = (req.getParameter("message") == null) ? null
					: resourceBundle.getString(req.getParameter("message"));
			req.setAttribute("message", ms);
			view = "/Views/ManagerViews/StaffViews/StaffPage.jsp";
			render = req.getRequestDispatcher(view);
			render.forward(req, resp);
			break;
		default:
			resp.sendRedirect("/manager/staffs");
			break;
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		StaffModel stModel = FormUtils.toModel(StaffModel.class, req);
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
			Long createBy = (Long) req.getSession().getAttribute("id_3");
//			Long createBy = (long) 2;
			AccountModel accountModel = accountService.getAccountById(createBy);
			if (accountModel != null && accountModel.getTypeId().toString().equals("3")) {
				String userName = req.getParameter("username");
				Long typeId = Long.parseLong(req.getParameter("typeId"));
				Long idNewStaff = staffService.insertNewStaff(stModel, createBy);
				Long idNewAcc = accountService.insertNewAccount(userName, req.getParameter("fullName"), typeId,
						createBy);
				String message = accountOwner.relaAccountAndStaff(idNewAcc, idNewStaff);
				if (message.equals("add_staff_success")) {
//				prepare send mail
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
//				send mail
					AccountModel accountNew = accountService.getAccountById(idNewAcc);
					String sendTo = stModel.getEmailAddress();
					String emailSubject = resourceBundleMail.getString("subject_create_account");
					String emailContent = "Tên đăng nhập: " + req.getParameter("username") + "   Mật khẩu: "
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
					resp.sendRedirect("/manager/staffs");
				} else {
					req.setAttribute("message", "Thêm nhân viên thất bại. Vui lòng kiểm tra lại!");
					req.setAttribute("alert", "danger");
					view = "/Views/ManagerViews/StaffViews/Add.jsp";
					render = req.getRequestDispatcher(view);
					render.forward(req, resp);
				}
			} else {
				req.getSession().removeAttribute("fullName_3");
				req.getSession().removeAttribute("id_3");
				req.getSession().removeAttribute("accept_3");
				redirect = "/login?message=expired_account";
				resp.sendRedirect(redirect);
			}

			break;
		case StringsConstant.EDIT:
			Long udBy = (Long) req.getSession().getAttribute("id_3");
			AccountModel accModel = accountService.getAccountById(udBy);
//			Long staffId = Long.parseLong(req.getParameter("id"));
			if (accModel != null && accModel.getTypeId().toString().equals("3")) {
				Boolean wasStaffUpdate = staffService.updateStaff(stModel, udBy);
				if (wasStaffUpdate) {
					resp.sendRedirect("/manager/staffs?type=view&id=" + stModel.getId());
				} else {
					req.setAttribute("message", "Sửa nhân viên thất bại. Vui lòng kiểm tra lại!");
					req.setAttribute("alert", "danger");
					view = "/Views/ManagerViews/StaffViews/Edit.jsp";
					render = req.getRequestDispatcher(view);
					render.forward(req, resp);
				}
			} else {
				req.getSession().removeAttribute("fullName_3");
				req.getSession().removeAttribute("id_3");
				req.getSession().removeAttribute("accept_3");
				redirect = "/login?message=expired_account";
				resp.sendRedirect(redirect);
			}

			break;
		case StringsConstant.DELETE:
			Long delBy = (Long) req.getSession().getAttribute("id_3");
			AccountModel accDel = accountService.getAccountById(delBy);
			if (accDel != null && accDel.getTypeId().toString().equals("3")) {
				Boolean wasDel = staffService.deleteStaff(stModel, delBy);
				if (wasDel) {
					resp.sendRedirect("/manager/staffs");
				} else {
					resp.sendRedirect("/manager/staffs?message=delete_staff_fail");
				}
			} else {
				req.getSession().removeAttribute("fullName_3");
				req.getSession().removeAttribute("id_3");
				req.getSession().removeAttribute("accept_3");
				redirect = "/login?message=expired_account";
				resp.sendRedirect(redirect);
			}

			break;
		case StringsConstant.RESTORE:
			Long rstBy = (Long) req.getSession().getAttribute("id_3");
//			Long rstBy = (long) 2;
			AccountModel accRst = accountService.getAccountById(rstBy);
			Long stRstId = Long.parseLong(req.getParameter("id"));
			if (accRst != null && accRst.getTypeId().toString().equals("3")) {
				Boolean wasRst = staffService.restoreStaff(stRstId, rstBy);
				if (wasRst) {
					resp.sendRedirect("/manager/staffs?type=delete");
				} else {
					resp.sendRedirect("/manager/staffs?type=delete&message=delete_staff_fail");
				}

			} else {
				req.getSession().removeAttribute("fullName_3");
				req.getSession().removeAttribute("id_3");
				req.getSession().removeAttribute("accept_3");
				redirect = "/login?message=expired_account";
				resp.sendRedirect(redirect);
			}

			break;
		case StringsConstant.LIST_VIEW:
			page = (stModel.getPage() == null) ? 1 : stModel.getPage();
			maxPageItem = (stModel.getMaxPageItem() == null) ? 20 : stModel.getMaxPageItem();
			sortBy = (stModel.getSortName() == null) ? "id" : stModel.getSortName();
			sortName = (stModel.getSortBy() == null) ? "DESC" : stModel.getSortBy();
			view = "";
			List<StaffModel> listStaff = staffService.getList(page, maxPageItem, 0, sortName, sortBy);
			List<PositionStaffModel> positionStaff = positionStaffService.getList();
			Integer totalPage = staffService.getTotalPage(maxPageItem, 0);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("page", page);
			req.setAttribute("listStaffs", listStaff);
			req.setAttribute("positionStaffs", positionStaff);
			view = "/Views/ManagerViews/StaffViews/StaffPage.jsp";
			render = req.getRequestDispatcher(view);
			render.forward(req, resp);
			break;
		case StringsConstant.SEARCH:
			String s = req.getParameter("s") == null ? "" : req.getParameter("s");
			if (s.equals("")) {
				resp.sendRedirect("/manager/staffs");
			} else {
				String option = req.getParameter("option");
				page = (stModel.getPage() == null) ? 1 : stModel.getPage();
				maxPageItem = (stModel.getMaxPageItem() == null) ? 20 : stModel.getMaxPageItem();
				sortName = (stModel.getSortName() == null) ? "id" : stModel.getSortName();
				sortBy = (stModel.getSortBy() == null) ? "DESC" : stModel.getSortBy();
				switch (option) {
				case StringsConstant.SEARCH_STAFF_ACTIVE:
					List<StaffModel> listSearch = staffService.getListSearch(page, maxPageItem, 0, "full_name", s,
							sortName, sortBy);
					List<PositionStaffModel> positionStaffS = positionStaffService.getList();
					Integer ttPage = staffService.getTotalPageS(maxPageItem, 0, s);
					req.setAttribute("s", s);
					req.setAttribute("totalPage", ttPage);
					req.setAttribute("page", page);
					req.setAttribute("listStaffs", listSearch);
					req.setAttribute("positionStaffs", positionStaffS);
					view = "/Views/ManagerViews/StaffViews/Search.jsp";
					render = req.getRequestDispatcher(view);
					render.forward(req, resp);
					break;
				case StringsConstant.SEARCH_STAFF_DELETE:
					List<StaffModel> listSearchDel = staffService.getListSearch(page, maxPageItem, 1, "full_name", s,
							sortName, sortBy);
					List<PositionStaffModel> positionStaffSDel = positionStaffService.getList();
					Integer ttPageDel = staffService.getTotalPageS(maxPageItem, 1, s);
					req.setAttribute("s", s);
					req.setAttribute("totalPage", ttPageDel);
					req.setAttribute("page", page);
					req.setAttribute("listStaffs", listSearchDel);
					req.setAttribute("positionStaffs", positionStaffSDel);
					view = "/Views/ManagerViews/StaffViews/SearchTrash.jsp";
					render = req.getRequestDispatcher(view);
					render.forward(req, resp);
					break;
				default:
					break;
				}
			}
			break;
		default:
			redirect = "/manager/staffs";
			resp.sendRedirect(redirect);
			break;
		}

	}

}
