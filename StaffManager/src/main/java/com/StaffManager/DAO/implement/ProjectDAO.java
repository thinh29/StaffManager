package com.StaffManager.DAO.implement;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.StaffManager.DAO.IProjectDAO;
import com.StaffManager.Mapper.HistoryProjectMapper;
import com.StaffManager.Mapper.JoinProjectMapper;
import com.StaffManager.Mapper.PositionProjectMapper;
import com.StaffManager.Mapper.ProjectMapper;
import com.StaffManager.Mapper.StatusProjectMapper;
import com.StaffManager.Mapper.ListJoinProjectMapper;
import com.StaffManager.Model.HistoryProjectModel;
import com.StaffManager.Model.JoinProjectModel;
import com.StaffManager.Model.PositionProjectModel;
import com.StaffManager.Model.ProjectModel;
import com.StaffManager.Model.StatusProjectModel;
public class ProjectDAO extends AbstractDAO<ProjectModel> implements IProjectDAO  {
	@Override
	public List<ProjectModel> getListProject(Long account_id,int page, int maxPageItem, String sortName, String sortBy) {		
		List<ProjectModel> results = new ArrayList<>();
		String sql = "SELECT A.* FROM projects  as A inner join join_project  as B on A.id = B.root_id where B.account_id = ? and A.deleted = 0 and A.parent_id = 0  order by " + sortName + " "  + sortBy +" limit ? offset ? ";
		results = queryGetList(sql,new ProjectMapper(),account_id,maxPageItem,(page-1)*maxPageItem);
		
		return results.isEmpty() ? null :results;
	}
	
	
	@Override
	public List<ProjectModel> getAllProject(int page, int maxPageItem, String sortName, String sortBy, Long accountId) {
		
		List<ProjectModel> results = new ArrayList<>();
		String sql = "select A.* from projects as A inner join projects as B on A.root = B.id where  A.deleted = 0 and B.deleted = 0 and A.account_id = ? order by " + sortName + " "  + sortBy +",id asc limit ? offset ? ";
		results = queryGetList(sql,new ProjectMapper(),accountId,maxPageItem,(page-1)*maxPageItem);
		
		return results.isEmpty() ? null :results;
	}
	
	@Override
	public List<ProjectModel> getAllProject(int page, int maxPageItem, String sortName, String sortBy,int deleted) {
		
		List<ProjectModel> results = new ArrayList<>();
		String sql = "SELECT * FROM projects where parent_id = 0 and deleted = ? order by " + sortName + " "  + sortBy +" limit ? offset ? ";
		results = queryGetList(sql,new ProjectMapper(),deleted,maxPageItem,(page-1)*maxPageItem);
		
		return results.isEmpty() ? null :results;
	}
	
	@Override
	public Integer coutProjects(int deleted) {
		String sql = "SELECT COUNT(*)  FROM projects where parent_id = 0 and deleted = ?" ;
		return count(sql,deleted);
	}
	
	@Override
	public Integer coutProjects(Long id) {
		String sql = "SELECT COUNT(*)  FROM projects  as A inner join join_project  as B on A.id = B.root_id where B.account_id = ? and A.deleted = 0 and A.parent_id = 0 ;" ;
		return count(sql,id);
	}
	
	@Override
	public Integer coutProjectsS(Long id,int deleted) {
		String sql = "SELECT COUNT(*) from projects as A inner join projects as B on A.root = B.id where A.account_id = ?  and A.deleted = ? and B.deleted = ?" ;
		return count(sql,id,deleted,deleted);
	}
	
	@Override
	public ProjectModel getDetailProject(Long id) {
		String sql = "select * from projects where projects.id = ? " ; 
		List<ProjectModel> results = new ArrayList<>();
		results = queryGetList(sql, new ProjectMapper() , id);
		
		return results.isEmpty() ? null :results.get(0);
	}
	
	
	@Override
	public List<ProjectModel> getChildProject(Long id, int deleted) {
		List<ProjectModel> results = new ArrayList<>();
		String sql = "select * from projects where parent_id = ? and deleted = ?";
		results = queryGetList(sql,new ProjectMapper(),id,deleted);
		return results.isEmpty() ? null :results;
	}
	
	@Override
	public Boolean updateProject(Integer progress, Long status, Timestamp beginDate, Timestamp exDate, Timestamp finish_day,
			Long id,String description, String name, Long accountId, Long currentAccId,Long manager) {
		// TODO Auto-generated method stub
		Boolean results;
		String sql = "update projects set  done = ? ,project_status = ?, name = ? , description = ? ,  begin_date = ? ,  ex_date = ? , finish_date = ?, update_at=now() , update_by = ?, account_id = ?, manager = ?  where id = ?";
		results =  update(sql,progress,status,name,description,beginDate,exDate,finish_day,currentAccId,accountId,manager,id);
		return results;
	}
	
	@Override
	public Boolean updateProject(Integer progress, Long status, Timestamp beginDate, Timestamp exDate, Timestamp finish_day,Long id, String description, String name, Long accountId, Long currentAccId) {
		// TODO Auto-generated method stub
		Boolean results;
		String sql = "update projects set  done = ? ,project_status = ?, name = ? , description = ? ,  begin_date = ? ,  ex_date = ? , finish_date = ?, update_at=now() , update_by = ?, account_id = ?  where id = ?";
		results =  update(sql,progress,status,name,description,beginDate,exDate,finish_day,currentAccId,accountId,id);
		return results;
	}
	
	@Override
	public Long addProject(String name,String routine,String description, Long manager, Long duration, Timestamp beginDate,Timestamp exDate, Long createBy,Integer progress,Long accountId,Long parent_id) {
		Long results = null;
		String sql = "insert into projects (name,routine,description,manager,duration,begin_date,ex_date,create_at,create_by,done,account_id,parent_id) values (?,?,?,?,?,?,?,now(),?,?,?,?);";
		results =  insert(sql,name,routine,description,manager,duration,beginDate,exDate,createBy,progress,accountId,parent_id);

		return results;	
	}
	
	@Override
	public List<StatusProjectModel> getListStatusProject() {
		// TODO Auto-generated method stub
		List<StatusProjectModel> results = new ArrayList<>();
		String sql = "select * from project_status ;";
		results =  queryGetList(sql, new StatusProjectMapper() );

		return results.isEmpty() ? null :results;
	}
	@Override
	public HistoryProjectModel getHistoryProjectById(Long id){
		List<HistoryProjectModel> results = new ArrayList<>();
		String sql = "select * from history_project where project_id = ? order by id desc";
		results = queryGetList(sql, new HistoryProjectMapper(),id);

		return results.isEmpty() ? null :results.get(0);
	}
	@Override
	public Long addHistoryProject(String title, Long projectId, Long assignFrom, Long assignTo, Long statusFrom, Long statusTo, String content,Long createBy) {
		Long results;
		String sql = "insert into history_project(title,project_id,assign_from,assign_to,status_from,status_to,content,create_at,create_by) values (?,?,?,?,?,?,?,now(),?)";
		results = insert(sql,title,projectId,assignFrom, assignTo,statusFrom, statusTo, content, createBy );
		return results;
	}
	
	@Override
	public List<ProjectModel> searchProject(String option, String keyword,String status,int page, int maxPageItem, String sortName, String sortBy, int deleted){
		List<ProjectModel> results;
		String sql="";
		if(option.compareTo("keywork") == 0  ) sql = "select * from projects where parent_id = 0 and deleted = ? and (lower(name) like '%"+keyword+"%')";
		else {
			if(status.equals("finished") ) sql = "select * from projects where parent_id = 0 and deleted = ? and done = 100 ";
			else if (status.equals("unfinished") ) sql = "select * from projects where parent_id = 0 and deleted = ? and done < 100 ";
			else sql = "select * from project where deleted = ?" ;
		} 
		sql+= "order by " + sortName + " "  + sortBy + " limit ? offset ? " ;
		
	

		results = queryGetList(sql,new ProjectMapper(),deleted,maxPageItem,(page-1)*maxPageItem);
		return results;
	}
	
	
	
	@Override
	public List<ProjectModel> searchProjectS(String option, String keyword,String status,int page, int maxPageItem, String sortName, String sortBy, int deleted, Long accId){
		List<ProjectModel> results;
		String sql="";
		if(option.compareTo("keywork") == 0  ) sql = "select A.* from projects as A inner join join_project as B on A.root = B.root_id where B.account_id = ? and parent_id = 0 and deleted = ? and (lower(name) like '%"+keyword+"%')";
		else {
			if(status.equals("finished") ) sql = "select A.* from projects as A inner join join_project as B on A.root = B.root_id where B.account_id = ? and parent_id = 0 and deleted = ? and done = 100 ";
			else if (status.equals("unfinished") ) sql = "select A.* from projects as A inner join join_project as B on A.root = B.root_id where B.account_id = ? and parent_id = 0 and deleted = ? and done < 100 ";
			else sql = "select A.* from projects as A inner join join_project as B on A.root = B.root_id where B.account_id = ? and deleted = ?" ;
		} 
		sql+= "order by " + sortName + " "  + sortBy + " limit ? offset ? " ;
		
		results = queryGetList(sql,new ProjectMapper(),accId,deleted,maxPageItem,(page-1)*maxPageItem);
		return results;
	}
	
	@Override
	public Integer coutProjectsSearch(Long accId,int deleted, String option, String keyword,String status) {
		String sql="";
		if(option.compareTo("keywork") == 0  ) sql = "select count(*) from projects as A inner join join_project as B on A.root = B.root_id where B.account_id = ? and parent_id = 0 and deleted = ? and (lower(name) like '%"+keyword+"%')";
		else {
			if(status.equals("finished") ) sql = "selectcount(*) from projects as A inner join join_project as B on A.root = B.root_id where B.account_id = ? and parent_id = 0 and deleted = ? and done = 100 ";
			else if (status.equals("unfinished") ) sql = "select count(*) from projects as A inner join join_project as B on A.root = B.root_id where B.account_id = ? and parent_id = 0 and deleted = ? and done < 100 ";
			else sql = "select count(*) from projects as A inner join join_project as B on A.root = B.root_id where B.account_id = ? and deleted = ?" ;
		} 
		return count(sql,accId,deleted);
	}
	
	@Override
	public Boolean deleteProject(Long id,Long accountId) {
		Boolean results;
		String sql = "update projects set  deleted_by = ? ,deleted = 1, deleted_at = now() where id = ?";
		results =  update(sql,accountId,id);
		return results	;
	}
	
	@Override
	public Boolean restoreProject(Long id) {
		Boolean results;
		String sql = "update projects set  deleted_by = null ,deleted = 0, deleted_at = null where id = ?";
		results =  update(sql,id);
		return results	;
	}
	

	@Override	
	public List<PositionProjectModel> getListPositionProject(){
		List<PositionProjectModel> results;
		String sql = "select * from position_project";
		results = queryGetList(sql, new PositionProjectMapper());
		return results;
	}
	
	@Override
	public Boolean updateRootProject(Long root,Long id) {
		String sql = "update projects set root = ? where id = ?" ; 
		return update(sql,root,id);
	}
	
	@Override
	public Long insertJoinProject(Long accountId,Long  rootId,Long position) {
		String sql = "insert into join_project(account_id, root_id, position) value (?,?,?) ";
		return insert(sql,accountId, rootId, position);
	}
	@Override
	public List<JoinProjectModel> getListJoinProject(Long rootId){
		List<JoinProjectModel> results;
		String sql = "select B.*, A.full_name, C.name From accounts as A inner join join_project as B on A.id = B.account_id inner join position_project as C on C.id = B.position where B.root_id = ?";
		results = queryGetList(sql, new JoinProjectMapper() , rootId);
		return results;
	}
	
	@Override
	public JoinProjectModel getJoinProject(Long rootId,Long accId){
		List<JoinProjectModel> results;
		String sql = "select A.name, B.*, c.full_name from position_project  as A inner join join_project as B on A.id = B.position inner join accounts as C on C.id = B.account_id where B.account_id = ? and root_id = ?";
		results = queryGetList(sql, new JoinProjectMapper() , accId, rootId);
		return results.isEmpty() ? null :results.get(0);
	}
	
	@Override
	public  Boolean deleteMemberProject(Long id) {
		String sql = "delete from join_project where id = ?" ;
		return update(sql, id);
	}

	@Override
	public Integer countProjectStatus(Long project_status, int del) {
		String sql = "SELECT count(*) FROM projects WHERE project_status = ? and deleted = ? ;";
		return count(sql, project_status, del);
	}

	@Override
	public List<ProjectModel> getListJoinProjectByAccount(Long id) {
		List<ProjectModel> results = new ArrayList<ProjectModel>();
		String sql = "select a.*, b.position from projects as a inner join join_project as b on a.id = b.root_id where a.account_id = ?";
		results = queryGetList(sql, new ListJoinProjectMapper(), id);
		return results.isEmpty()? null: results;
	}

	
}
