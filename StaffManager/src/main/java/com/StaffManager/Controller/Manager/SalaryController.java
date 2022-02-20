package com.StaffManager.Controller.Manager;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
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
import com.StaffManager.Model.PositionStaffModel;
import com.StaffManager.Model.SalaryPeriodModel;
import com.StaffManager.Model.SalaryTableModel;
import com.StaffManager.Model.StaffModel;
import com.StaffManager.Model.TypeStaffModel;
import com.StaffManager.Service.IAccountService;
import com.StaffManager.Service.IPositionStaffService;
import com.StaffManager.Service.ISalaryPeriodService;
import com.StaffManager.Service.ISalaryTableService;
import com.StaffManager.Service.IStaffService;
import com.StaffManager.Service.ITypeStaffService;
import com.StaffManager.constant.StringsConstant;
import com.StaffManager.utils.FormUtils;

@WebServlet(urlPatterns = { "/manager/salary", })
public class SalaryController extends HttpServlet {
	ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

	private static final long serialVersionUID = 4407495183398991578L;
	@Inject
	private IAccountService accountService;
	@Inject
	private ISalaryPeriodService salaryPeriodService;
	@Inject
	private IStaffService staffService;
	@Inject
	private ISalaryTableService salaryTableService;
	@Inject
	private IPositionStaffService positionStaffService;
	@Inject
	private ITypeStaffService typeStaffService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SalaryTableModel salaryTableModel = FormUtils.toModel(SalaryTableModel.class, req);
		String type = req.getParameter("type")==null? "" : req.getParameter("type");
		Integer page = (salaryTableModel.getPage() == null) ? 1 : salaryTableModel.getPage();		
		Integer maxPageItem = (salaryTableModel.getMaxPageItem() == null) ? 20 : salaryTableModel.getMaxPageItem();
		String sortName = (salaryTableModel.getSortName() == null) ? "id" : salaryTableModel.getSortName();
		String sortBy = (salaryTableModel.getSortBy() == null) ? "DESC" : salaryTableModel.getSortBy();
		String view ="";
		String redirect = "";
		RequestDispatcher render = null;
		switch (type) {
		case StringsConstant.ADD:
			Long addID= (Long) req.getSession().getAttribute("id_3");
			AccountModel account =accountService.getAccountById(addID);
			if(account != null && account.getTypeId().toString().equals("3")) {
				String salaryPeriod = req.getParameter("salaryPeriod");			
				String message = "";
				Boolean isEmptyPeriod = salaryPeriodService.isEmptyPeriod(salaryPeriod); 
				if (isEmptyPeriod) {					
					Long idPeriod = salaryPeriodService.insertNewPeriod(salaryPeriod,addID);
					List<StaffModel> listStaffModel = staffService.getListAll(0); 
					 salaryTableService.insertListNew(listStaffModel,idPeriod);
					redirect = "/manager/salary";
				}else {
					message = "salary_period_exist";
					redirect = "/manager/salary?message="+message;
				}
				resp.sendRedirect(redirect);
			}else {
				req.getSession().removeAttribute("fullName_3");
				req.getSession().removeAttribute("id_3");
				req.getSession().removeAttribute("accept_3");
				redirect = "/login?message=expired_account";
				resp.sendRedirect(redirect);
			}			
			break;
		case StringsConstant.VIEW:
			Long salaryTableID = salaryTableModel.getId();
			SalaryTableModel stModel = salaryTableService.getSalaryTableById(salaryTableID);
			List<PositionStaffModel> positionSTMView = positionStaffService.getList();
			List<TypeStaffModel> typeSTMView = typeStaffService.getList();
			List<SalaryPeriodModel> slrPeriodView = salaryPeriodService.getList();
			StaffModel staffModel = staffService.getStaffById(stModel.getStaffId()); 
			
			req.setAttribute("staff", staffModel);
			req.setAttribute("stModel", stModel);
			req.setAttribute("slrPeriods", slrPeriodView);
			req.setAttribute("types", typeSTMView);
			req.setAttribute("position", positionSTMView);
			view = "/Views/ManagerViews/SalaryViews/View.jsp";
			render = req.getRequestDispatcher(view);
			render.forward(req, resp);
			break;
		case StringsConstant.EDIT:
			Long salaryTableIdEdit = salaryTableModel.getId();
			SalaryTableModel stModelEdit = salaryTableService.getSalaryTableById(salaryTableIdEdit);
			List<PositionStaffModel> positionSTMEdit = positionStaffService.getList();
			List<TypeStaffModel> typeSTMEdit = typeStaffService.getList();
			List<SalaryPeriodModel> slrPeriodEdit = salaryPeriodService.getList();
			StaffModel staffModelEdit = staffService.getStaffById(stModelEdit.getStaffId()); 
			
			req.setAttribute("staff", staffModelEdit);
			req.setAttribute("stModel", stModelEdit);
			req.setAttribute("slrPeriods", slrPeriodEdit);
			req.setAttribute("types", typeSTMEdit);
			req.setAttribute("position", positionSTMEdit);
			view = "/Views/ManagerViews/SalaryViews/Edit.jsp";
			render = req.getRequestDispatcher(view);
			render.forward(req, resp);
			break;
		case StringsConstant.SEARCH:
			List<SalaryTableModel> listSTMSearch =new ArrayList<SalaryTableModel>();
			Date dateSearch = new Date();
			LocalDate localDateSearch = dateSearch.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			String maxPeriodSearch =localDateSearch.getYear()  +"-"+localDateSearch.getMonthValue();
			String s = req.getParameter("s");
			String msSearch = (req.getParameter("message") == null) ? null
					: resourceBundle.getString(req.getParameter("message"));			
			listSTMSearch = salaryTableService.getListSearch(page, maxPageItem, sortName, sortBy,s);
			List<PositionStaffModel> positionSTMSearch = positionStaffService.getList();
			List<TypeStaffModel> typeSTMSearch = typeStaffService.getList();
			List<SalaryPeriodModel> slrPeriodSearch = salaryPeriodService.getList();
			Integer totalPageSearch = salaryTableService.getTotalPageSearch(maxPageItem ,s);
			
			req.setAttribute("s", s);
			req.setAttribute("maxPeriod", maxPeriodSearch);
			req.setAttribute("totalPage", totalPageSearch);
			req.setAttribute("slrPeriods", slrPeriodSearch);
			req.setAttribute("types", typeSTMSearch);
			req.setAttribute("position", positionSTMSearch);
			req.setAttribute("message", msSearch);
			req.setAttribute("listSTM", listSTMSearch);
			req.setAttribute("page", page);
			view = "/Views/ManagerViews/SalaryViews/SearchPage.jsp";
			render = req.getRequestDispatcher(view);
			render.forward(req, resp);
			break;
		default:
			List<SalaryTableModel> listSTM =new ArrayList<SalaryTableModel>();
			Date date = new Date();
			LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			String maxPeriod =localDate.getYear()  +"-"+localDate.getMonthValue();
			req.setAttribute("maxPeriod", maxPeriod);
			String ms = (req.getParameter("message") == null) ? null
					: resourceBundle.getString(req.getParameter("message"));			
			listSTM = salaryTableService.getList(page, maxPageItem, sortName, sortBy);
			List<PositionStaffModel> positionSTM = positionStaffService.getList();
			List<TypeStaffModel> typeSTM = typeStaffService.getList();
			List<SalaryPeriodModel> slrPeriod = salaryPeriodService.getList();
			Integer totalPage = salaryTableService.getTotalPage(maxPageItem);
			
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("slrPeriods", slrPeriod);
			req.setAttribute("types", typeSTM);
			req.setAttribute("position", positionSTM);
			req.setAttribute("message", ms);
			req.setAttribute("listSTM", listSTM);
			req.setAttribute("page", page);
			view = "/Views/ManagerViews/SalaryViews/SalaryPage.jsp";
			render = req.getRequestDispatcher(view);
			render.forward(req, resp);
			break;
		}	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		SalaryTableModel salaryTableModel = FormUtils.toModel(SalaryTableModel.class, req);
		String type = salaryTableModel.getType()==null? "":salaryTableModel.getType();
		Integer page = (salaryTableModel.getPage() == null) ? 1 : salaryTableModel.getPage();		//1
		Integer maxPageItem = (salaryTableModel.getMaxPageItem() == null) ? 20 : salaryTableModel.getMaxPageItem(); //20
		String sortName = (salaryTableModel.getSortName() == null) ? "id" : salaryTableModel.getSortName(); //full_name
		String sortBy = (salaryTableModel.getSortBy() == null) ? "DESC" : salaryTableModel.getSortBy(); //DESC
		String view ="";
		String redirect = "";
		RequestDispatcher render = null;
		switch (type) {
		case StringsConstant.EDIT:
			Long upBy = (Long) req.getSession().getAttribute("id_3");
			AccountModel accountModel = accountService.getAccountById(upBy);
			if (accountModel != null && accountModel.getTypeId().toString().equals("3")) {
				salaryTableService.updateSalaryTable(salaryTableModel, upBy);
				resp.sendRedirect("/manager/salary?type=view&id="+salaryTableModel.getId());
			}else {
				req.getSession().removeAttribute("fullName_3");
				req.getSession().removeAttribute("id_3");
				req.getSession().removeAttribute("accept_3");
				redirect = "/login?message=expired_account";
				resp.sendRedirect(redirect);
			}			
			break;
		case StringsConstant.SORT:
			String slrPeriodSort = req.getParameter("slrPeriodSort"); //1,2,3,4
			String typeStaff = req.getParameter("typeStaff"); //1,2
			List<SalaryTableModel> listSTM =new ArrayList<SalaryTableModel>();
			Date date = new Date();
			LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			String maxPeriod =localDate.getYear()  +"-"+localDate.getMonthValue();
			listSTM = salaryTableService.getListByOption(page, maxPageItem, sortName, sortBy,slrPeriodSort,typeStaff);
			Integer totalPage = salaryTableService.getTotalPageByOption(maxPageItem,slrPeriodSort,typeStaff);
			List<SalaryPeriodModel> slrPeriod = salaryPeriodService.getList();
			List<TypeStaffModel> typeSTM = typeStaffService.getList();
			List<PositionStaffModel> positionSTM = positionStaffService.getList();
			
			req.setAttribute("position", positionSTM);
			req.setAttribute("maxPeriod", maxPeriod);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("slrPeriods", slrPeriod);
			req.setAttribute("listSTM", listSTM);
			req.setAttribute("types", typeSTM);
			req.setAttribute("page", page);
			req.setAttribute("sortOption", sortName+" "+sortBy);
			req.setAttribute("slrPer", slrPeriodSort);
			req.setAttribute("typeSort", typeStaff);
			view = "/Views/ManagerViews/SalaryViews/SalaryPage.jsp";
			render = req.getRequestDispatcher(view);
			render.forward(req, resp);
			break;
		case StringsConstant.SEARCH:
			String slrPeriodSortSearch = req.getParameter("slrPeriodSort"); //1,2,3,4			
			String typeStaffSearch = req.getParameter("typeStaff"); //1,2
			List<SalaryTableModel> listSTMSearch =new ArrayList<SalaryTableModel>();
			String s = req.getParameter("s");
			Date dateSearch = new Date();
			LocalDate localDateSearch = dateSearch.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			String maxPeriodSearch =localDateSearch.getYear()  +"-"+localDateSearch.getMonthValue();
			listSTMSearch = salaryTableService.getListByOptionSearch(page, maxPageItem, sortName, sortBy,slrPeriodSortSearch,typeStaffSearch,s);
			Integer totalPageSearch = salaryTableService.getTotalPageByOptionSearch(maxPageItem,slrPeriodSortSearch,typeStaffSearch,s);
			List<SalaryPeriodModel> slrPeriodSearch = salaryPeriodService.getList();
			List<TypeStaffModel> typeSTMSearch = typeStaffService.getList();
			List<PositionStaffModel> positionSTMSearch = positionStaffService.getList();
			
			req.setAttribute("position", positionSTMSearch);
			req.setAttribute("maxPeriod", maxPeriodSearch);
			req.setAttribute("totalPage", totalPageSearch);
			req.setAttribute("slrPeriods", slrPeriodSearch);
			req.setAttribute("listSTM", listSTMSearch);
			req.setAttribute("types", typeSTMSearch);
			req.setAttribute("s", s);
			req.setAttribute("page", page);
			req.setAttribute("sortOption", sortName+" "+sortBy);
			req.setAttribute("slrPer", slrPeriodSortSearch);
			req.setAttribute("typeSort", typeStaffSearch);
			view = "/Views/ManagerViews/SalaryViews/SearchPage.jsp";
			render = req.getRequestDispatcher(view);
			render.forward(req, resp);
			break;
		default:
			break;
		}
	}

}
