package com.StaffManager.Service;


import java.sql.Timestamp;
import java.util.List;

import com.StaffManager.Model.HistoryProjectModel;
import com.StaffManager.Model.JoinProjectModel;
import com.StaffManager.Model.PositionProjectModel;
import com.StaffManager.Model.ProjectModel;
import com.StaffManager.Model.StatusProjectModel;

public interface IProjectService  {
	public List<ProjectModel> getProject(Long account_id, int page, int maxPageItem, String sortName, String sortBy);
	public List<ProjectModel> getAllProject(int page, int maxPageItem, String sortName, String sortBy,Long accountId);
	public List<ProjectModel> getAllProject(int page, int maxPageItem, String sortName, String sortBy,int deleted);
	public Integer coutProjects(int deleted);
	public Integer coutProjects(Long id);
	public Integer coutProjectsS(Long id, int deleted);
	public ProjectModel getDetailProject(Long id);
	public List<ProjectModel> getChildProject(Long id, int deleted);
	public Boolean updateProject(Integer progress, Long status, Timestamp beginDate, Timestamp exDate, Timestamp finish_day,
			Long id,String description, String name, Long accountId, Long currentAccId,Long manager);
	public Boolean updateProject(Integer progress, Long status, Timestamp beginDate, Timestamp exDate, Timestamp finish_day,Long id, String description, String name, Long accountId, Long currentAccId);
	public List<StatusProjectModel> getListStatusProject() ;
	public Long addProject(String name,String routine,String description, Long manager,Long duration, Timestamp beginDate,Timestamp exDate, Long createAt,Integer progress,Long accountId, Long parent_id);
	public HistoryProjectModel getHistoryProjectById(Long id);
	public Long addHistoryProject(String title, Long projectId, Long assignFrom, Long assignTo, Long statusFrom, Long statusTo, String content,Long createBy);
	public List<ProjectModel> searchProject(String option, String keyword,String status,int page, int maxPageItem, String sortName, String sortBy, int deleted);
	public List<ProjectModel> searchProjectS(String option, String keyword,String status,int page, int maxPageItem, String sortName, String sortBy, int deleted, Long accId);
	public Integer coutProjectsSearch(Long accId,int deleted, String option, String keyword,String status);
	public Boolean deleteProject(Long id,Long accountId);
	public Boolean restoreProject(Long id);
	public List<PositionProjectModel> getListPositionProject();
	public Boolean updateRootProject(Long root,Long id);
	public Long insertJoinProject(Long accountId,Long  rootId,Long position);
	public List<JoinProjectModel> getListJoinProject(Long rootId);
	public  Boolean deleteMemberProject(Long id);
	public JoinProjectModel getJoinProject(Long rootId,Long accId);

	public Integer countProjectStatus(Long project_status,int del);
	public List<ProjectModel> getListJoinProjectByAccount(Long id);
}
