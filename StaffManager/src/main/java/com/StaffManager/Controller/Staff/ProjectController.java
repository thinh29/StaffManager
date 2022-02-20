package com.StaffManager.Controller.Staff;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.StaffManager.Model.AccountModel;
import com.StaffManager.Model.HistoryProjectModel;
import com.StaffManager.Model.JoinProjectModel;
import com.StaffManager.Model.PositionProjectModel;
import com.StaffManager.Model.ProjectModel;
import com.StaffManager.Model.StatusProjectModel;
import com.StaffManager.Service.IAccountService;
import com.StaffManager.Service.IProjectService;
import com.StaffManager.constant.StringsConstant;
import com.StaffManager.utils.FormUtils;

@WebServlet(urlPatterns = { "/projects" })
public class ProjectController extends HttpServlet {
	private static final long serialVersionUID = 3342680513089682969L;
	@Inject private IProjectService projectService;
	@Inject private IAccountService accountService;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProjectModel projectModel = FormUtils.toModel(ProjectModel.class, req);
		Long accountId = (Long) req.getSession().getAttribute("id_5");	
		String view = "";
		switch ((projectModel.getType() == null) ? "" : projectModel.getType()) {
		case StringsConstant.VIEW:
			if (projectModel.getId() == null) {
				List<ProjectModel> listProject = new ArrayList<>();
				if(projectModel.getPage() == null) {
					projectModel.setPage(1);
				}
				if(projectModel.getMaxPageItem() == null) {
					projectModel.setMaxPageItem(20);
				}
				if(projectModel.getSortName() == null) {
					projectModel.setSortName("id");
				}
				
				if(projectModel.getSortBy() == null) {
					projectModel.setSortBy("desc");;
				}
				listProject = projectService.getProject(accountId,projectModel.getPage(), projectModel.getMaxPageItem(), 
						projectModel.getSortName(),projectModel.getSortBy());				
				Integer maxItems = projectService.coutProjects(accountId);
				int maxPages = (int) ((maxItems / projectModel.getMaxPageItem()) + 1) ;
				
				req.setAttribute("list", listProject);
				req.setAttribute("maxPages", maxPages);
				req.setAttribute("currentPage",projectModel.getPage());
				view = "/Views/StaffViews/ProjectViews/ViewAll.jsp";
			} else {
				
				ProjectModel project = projectService.getDetailProject(projectModel.getId());

				Boolean del;
				Integer  del1 = project.getDeleted();
				Integer  del2 = projectService.getDetailProject(project.getRoot()).getDeleted();
				if(( del1+del2) > 0) del = true; else  del = false;
				List<ProjectModel> listChildProject = new ArrayList<>();
				listChildProject = projectService.getChildProject(projectModel.getId(),0);
				
				ProjectModel projectParent = projectService.getDetailProject(project.getParentId());
				Long createBy = projectService.getDetailProject(project.getId()).getCreateBy();
				String createByName = accountService.getAccountById(createBy).getFullName();
				int statusId = project.getStatus().intValue() - 1  ;
				String status = projectService.getListStatusProject().get(statusId).getName();
				HistoryProjectModel historyProject = projectService.getHistoryProjectById(project.getId());
				
				List<PositionProjectModel> positionP = projectService.getListPositionProject();
				List <AccountModel> listStaff = accountService.getListStaffPosition();
				List <JoinProjectModel> listMember = projectService.getListJoinProject(project.getRoot()); 
					
				JoinProjectModel accountPosition = projectService.getJoinProject(project.getRoot(), accountId);
				
				String managerName = accountService.getAccountById(project.getManager()).getFullName();
				String accountName = accountService.getAccountById(project.getAccountId()).getFullName();
				
				String updateByName="";
				String assignToName="";
				String assignFromName ="";
				String oldStatus= "";
				String newStatus = "";
				
				if(historyProject != null ) {
					updateByName = accountService.getAccountById(historyProject.getCreateBy()).getFullName();				
					assignToName = accountService.getAccountById(historyProject.getAssignTo()).getFullName();
					assignFromName = accountService.getAccountById(historyProject.getAssignFrom()).getFullName();
					oldStatus = projectService.getListStatusProject().get(historyProject.getStatusFrom().intValue() - 1).getName();
					newStatus = projectService.getListStatusProject().get(historyProject.getStatusTo().intValue() - 1).getName();
				}
				
				req.setAttribute("listMember", listMember);
				req.setAttribute("listStaff", listStaff);
				req.setAttribute("project", project);
				req.setAttribute("child_project", listChildProject);
				req.setAttribute("projectParent", projectParent);	
				req.setAttribute("createByName", createByName);
				req.setAttribute("managerName", managerName);
				req.setAttribute("accountName", accountName);
				req.setAttribute("status", status);
				req.setAttribute("history", historyProject);
				req.setAttribute("updateName", updateByName);
				req.setAttribute("assignTo", assignToName);
				req.setAttribute("assignFrom", assignFromName);
				req.setAttribute("oldStatus", oldStatus);
				req.setAttribute("newStatus", newStatus);
				req.setAttribute("positionProject", positionP);
				req.setAttribute("accountPosition", accountPosition);
				if(del || (accountPosition == null )) {
					resp.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
					resp.setHeader("Location","/projects");
				}
				view = "/Views/StaffViews/ProjectViews/View.jsp";
			}
			break;
		case StringsConstant.EDIT:
			ProjectModel project1 = projectService.getDetailProject(projectModel.getId());
			Boolean del_1;
			Integer  del11 = project1.getDeleted();
			Integer  del21 = projectService.getDetailProject(project1.getRoot()).getDeleted();
			if(( del11+del21) > 0) del_1 = true; else  del_1 = false;
			ProjectModel projectParent1 = projectService.getDetailProject(project1.getParentId());
			Long createBy1 = projectService.getDetailProject(project1.getId()).getCreateBy();
			String createByName1 = accountService.getAccountById(createBy1).getFullName();
			List <StatusProjectModel> status1 = projectService.getListStatusProject();
			HistoryProjectModel historyProject1 = projectService.getHistoryProjectById(project1.getId());
			//List <AccountModel> listAssignTo = accountService.getListStaffPosition();
			List <JoinProjectModel> listAssignTo = projectService.getListJoinProject(project1.getRoot());
			String mName = accountService.getAccountById(project1.getManager()).getFullName();
			String accName = accountService.getAccountById(project1.getAccountId()).getFullName();		
			String updateByName1="";
			if(historyProject1 != null ) updateByName1 = accountService.getAccountById(historyProject1.getCreateBy()).getFullName();
			
			JoinProjectModel accountPosition1 = projectService.getJoinProject(project1.getRoot(), accountId);
			
			req.setAttribute("managerName", mName);
			req.setAttribute("accountName", accName);
			req.setAttribute("createByName", createByName1);
			req.setAttribute("project", project1);
			req.setAttribute("projectParent", projectParent1);	
			req.setAttribute("status", status1);
			req.setAttribute("history", historyProject1);
			req.setAttribute("updateName", updateByName1);
			req.setAttribute("listAssignTo", listAssignTo);
			if(del_1 || (accountPosition1 == null )) {
				resp.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
				resp.setHeader("Location","/projects");
			}
			
			view = "/Views/StaffViews/ProjectViews/Edit.jsp";
			break;
		case StringsConstant.DELETE:
			view = "/Views/StaffViews/ProjectViews/Delete.jsp";
			break;
		case StringsConstant.ADD:
			
			ProjectModel prj = projectService.getDetailProject(projectModel.getId());
			Boolean del_2;
			Integer  del_21 = prj.getDeleted();
			Integer  del_22 = projectService.getDetailProject(prj.getRoot()).getDeleted();
			if(( del_21+del_22) > 0) del_2 = true; else  del_2 = false;

			List <JoinProjectModel> listManager = projectService.getListJoinProject(prj.getRoot());
			JoinProjectModel accountPosition2 = projectService.getJoinProject(prj.getRoot(), accountId);
			req.setAttribute("project", prj);
			req.setAttribute("listManager", listManager);
			if(del_2 || (accountPosition2 == null )) {
				resp.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
				resp.setHeader("Location","/projects");
			}
			view = "/Views/StaffViews/ProjectViews/Add.jsp";
			break;
		case StringsConstant.SEARCH:
			String option = req.getParameter("option");
			String statusK = req.getParameter("status");
			String keyword = req.getParameter("keyword");
			
			List<ProjectModel> listSearch = new ArrayList<>();
			if(projectModel.getPage() == null) {
				projectModel.setPage(1);
			}
			if(projectModel.getMaxPageItem() == null) {
				projectModel.setMaxPageItem(20);
			}
			if(projectModel.getSortName() == null) {
				projectModel.setSortName("id");
			}
			
			if(projectModel.getSortBy() == null) {
				projectModel.setSortBy("desc");;
			}
			listSearch = projectService.searchProjectS(option, keyword, statusK,projectModel.getPage(), projectModel.getMaxPageItem(), projectModel.getSortName(),projectModel.getSortBy(),0,accountId);
			Integer maxItems = projectService.coutProjectsSearch(accountId,0,option,keyword,statusK);
			int maxPages = (int) ((maxItems / projectModel.getMaxPageItem()) + 1) ;
			req.setAttribute("list", listSearch);
			req.setAttribute("maxPages", maxPages);
			req.setAttribute("currentPage",projectModel.getPage());
			view = "/Views/StaffViews/ProjectViews/Search.jsp";
			break;
		default:
			List<ProjectModel> listProject = new ArrayList<>();
			if(projectModel.getPage() == null) {
				projectModel.setPage(1);
			}
			if(projectModel.getMaxPageItem() == null) {
				projectModel.setMaxPageItem(20);
			}
			if(projectModel.getSortName() == null) {
				projectModel.setSortName("root");
			}
			
			if(projectModel.getSortBy() == null) {
				projectModel.setSortBy("desc");;
			}
			listProject = projectService.getAllProject(projectModel.getPage(), projectModel.getMaxPageItem(), 
					projectModel.getSortName(),projectModel.getSortBy(),accountId);
			Integer mItems = projectService.coutProjectsS(accountId,0);
			int mPages = (int) ((mItems / projectModel.getMaxPageItem()) + 1) ;
			
			req.setAttribute("list", listProject);
			req.setAttribute("maxPages", mPages);
			req.setAttribute("currentPage",projectModel.getPage());
			
			view = "/Views/StaffViews/ProjectViews/ProjectPage.jsp";
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
		ProjectModel projectModel = FormUtils.toModel(ProjectModel.class, req);
		Long accountId = (Long) req.getSession().getAttribute("id_5");
		
		String redirect = "";
		String view="";
		switch ((projectModel.getType() == null) ? "" : projectModel.getType()) {
		case StringsConstant.ADD:
				
				Long lastId = projectService.addProject(projectModel.getName() , "aa",projectModel.getDescription() ,projectModel.getManager(),projectModel.getDuration(),projectModel.getBeginDate(), projectModel.getExpectedDate(),accountId ,0, projectModel.getManager(),projectModel.getId());				
				projectService.updateRootProject(projectModel.getRoot(), lastId);
				redirect = "/projects?type=view&id=" + projectModel.getId().toString();
				resp.sendRedirect(redirect);
				
			break;
		case StringsConstant.EDIT:
			String editTile = req.getParameter("editTitle");
			Long editAssignTo = Long.parseLong(req.getParameter("editAssignTo"));
			Long editAssignFrom = Long.parseLong(req.getParameter("editAssignFrom"));
			String editNote = req.getParameter("editNote");

			Long oldStatus  = projectService.getDetailProject(projectModel.getId()).getStatus();
			projectService.updateProject(projectModel.getProgress(),projectModel.getStatus(), projectModel.getBeginDate(), 
					 projectModel.getExpectedDate(), projectModel.getFinishDate(),projectModel.getId(),projectModel.getDescription(),projectModel.getName(),editAssignTo,accountId) ;
			projectService.addHistoryProject(editTile, projectModel.getId(), editAssignFrom, editAssignTo, oldStatus,projectModel.getStatus() , editNote, accountId);
			redirect = "/projects?type=view&id=" + projectModel.getId().toString();
			resp.sendRedirect(redirect);
			break;
		default:
			List<ProjectModel> listProject = new ArrayList<>();
			if(projectModel.getPage() == null) {
				projectModel.setPage(1);
			}
			if(projectModel.getMaxPageItem() == null) {
				projectModel.setMaxPageItem(20);
			}
			if(projectModel.getSortName() == null) {
				projectModel.setSortName("root");
			}
			
			if(projectModel.getSortBy() == null) {
				projectModel.setSortBy("desc");;
			}
			listProject = projectService.getAllProject(projectModel.getPage(), projectModel.getMaxPageItem(), 
					projectModel.getSortName(),projectModel.getSortBy(),accountId);
			Integer mItems = projectService.coutProjectsS(accountId,0);
			
			int mPages = (int) ((mItems / projectModel.getMaxPageItem()) + 1) ;
			
			req.setAttribute("list", listProject);
			req.setAttribute("maxPages", mPages);
			req.setAttribute("currentPage",projectModel.getPage());
			view = "/Views/StaffViews/ProjectViews/ProjectPage.jsp";
			RequestDispatcher requestDispatcher = req.getRequestDispatcher(view);
			requestDispatcher.forward(req, resp);
			break;
		}
		
	}
}
