package com.StaffManager.Service.implement;

import com.StaffManager.Model.HistoryProjectModel;
import com.StaffManager.Model.JoinProjectModel;
import com.StaffManager.Model.PositionProjectModel;
import com.StaffManager.Model.ProjectModel;
import com.StaffManager.Model.StatusProjectModel;
import com.StaffManager.Service.IProjectService;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import com.StaffManager.DAO.IProjectDAO;

public class ProjectService implements IProjectService{
	
	@Inject
	private IProjectDAO ProjectDAO ;
	
	@Override
	public List<ProjectModel> getProject(Long account_id,int page, int maxPageItem, String sortName, String sortBy) {
		// TODO Auto-generated method stub
		
		return  ProjectDAO.getListProject(account_id,page, maxPageItem, sortName, sortBy);
	}
	
	@Override
	public List<ProjectModel> getAllProject(int page, int maxPageItem, String sortName, String sortBy, Long accounId) {
		// TODO Auto-generated method stub
		return  ProjectDAO.getAllProject(page, maxPageItem, sortName, sortBy,accounId);
	}
	
	@Override
	public List<ProjectModel> getAllProject(int page, int maxPageItem, String sortName, String sortBy,int deleted) {
		// TODO Auto-generated method stub
		return  ProjectDAO.getAllProject(page, maxPageItem, sortName, sortBy,deleted);
	}
	
	
	@Override
	public Integer coutProjects(int deleted) {
		return ProjectDAO.coutProjects(deleted);
	}
	
	@Override
	public Integer coutProjects(Long id) {
		return ProjectDAO.coutProjects(id);
	}
	
	@Override
	public Integer coutProjectsS(Long id, int deleted) {
		return ProjectDAO.coutProjectsS(id, deleted);
	}
	
	@Override
	public ProjectModel getDetailProject(Long id) {
		return ProjectDAO.getDetailProject(id);
	}
	
	@Override
	public List<ProjectModel> getChildProject(Long id, int deleted){
		return ProjectDAO.getChildProject(id,deleted);
	}
	
	@Override
	public Boolean updateProject(Integer progress, Long status, Timestamp beginDate, Timestamp exDate, Timestamp finish_day,
			Long id,String description, String name, Long accountId, Long currentAccId,Long manager) {
		// TODO Auto-generated method stub
		return ProjectDAO.updateProject(progress, status, beginDate, exDate, finish_day, id, description, name, accountId, currentAccId, manager);
	}
	
	public Boolean updateProject(Integer progress, Long status, Timestamp beginDate, Timestamp exDate,
			Timestamp finish_day, Long id,String description, String name, Long accountId, Long currentAccId) {
		// TODO Auto-generated method stub
		return ProjectDAO.updateProject(progress, status, beginDate, exDate, finish_day, id, description,name, accountId, currentAccId);
	}
	
	@Override
	public List<StatusProjectModel> getListStatusProject() {
		// TODO Auto-generated method stub
		return ProjectDAO.getListStatusProject();
	}
	
	@Override
	public Long addProject(String name, String routine,String description,Long manager, Long duration,  Timestamp beginDate, Timestamp exDate, Long createBy,
			Integer progress, Long accountId,Long parent_id) {
		// TODO Auto-generated method stub
		return ProjectDAO.addProject(name, routine,description,manager, duration, beginDate, exDate, createBy, progress, accountId,parent_id);
	}
	
	
	@Override
	public HistoryProjectModel getHistoryProjectById(Long id) {
		return ProjectDAO.getHistoryProjectById(id);
	}
	
	@Override
	public Long addHistoryProject(String title, Long projectId, Long assignFrom, Long assignTo, Long statusFrom,
			Long statusTo, String content, Long createBy) {
		return ProjectDAO.addHistoryProject(title, projectId, assignFrom, assignTo, statusFrom, statusTo, content, createBy);
	}
	
	@Override
	public List<ProjectModel> searchProject(String option, String keyword,String status,int page, int maxPageItem, String sortName, String sortBy, int deleted) {
		return ProjectDAO.searchProject(option, keyword, status, page, maxPageItem, sortName, sortBy,deleted);
	}
	
	@Override
	public List<ProjectModel> searchProjectS(String option, String keyword,String status,int page, int maxPageItem, String sortName, String sortBy, int deleted, Long accId){
		return ProjectDAO.searchProjectS(option, keyword, status, page, maxPageItem, sortName, sortBy, deleted,accId);
	}
	
	@Override
	public Integer coutProjectsSearch(Long accId,int deleted, String option, String keyword,String status) {
		return ProjectDAO.coutProjectsSearch(accId, deleted, option, keyword, status);
	}
	
	@Override
	public Boolean deleteProject(Long id,Long accountId) {
		return ProjectDAO.deleteProject(id, accountId);
	}
	
	@Override
	public Boolean restoreProject(Long id) {
		return ProjectDAO.restoreProject(id);
	}
	
	@Override
	public List<PositionProjectModel> getListPositionProject(){
		return ProjectDAO.getListPositionProject();
	}
	
	@Override
	public Boolean updateRootProject(Long root,Long id) {
		return ProjectDAO.updateRootProject(root, id);
	}
	
	@Override
	public Long insertJoinProject(Long accountId,Long  rootId,Long position) {
		return ProjectDAO.insertJoinProject(accountId, rootId, position);
	}
	
	@Override
	public List<JoinProjectModel> getListJoinProject(Long rootId){
		return ProjectDAO.getListJoinProject(rootId);
	}
	
	@Override
	public  Boolean deleteMemberProject(Long id) {
		return ProjectDAO.deleteMemberProject(id);
	}
	
	@Override
	public JoinProjectModel getJoinProject(Long rootId,Long accId) {
		return ProjectDAO.getJoinProject(rootId, accId);
	}

	@Override
	public Integer countProjectStatus(Long project_status, int del) {
		return ProjectDAO.countProjectStatus(project_status, del);
	}

	@Override
	public List<ProjectModel> getListJoinProjectByAccount(Long id) {
		return ProjectDAO.getListJoinProjectByAccount(id);
	}

}
