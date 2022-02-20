package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.StaffManager.Model.ProjectModel;

public class ListJoinProjectMapper implements RowMapper<ProjectModel> {
	@Override
	public ProjectModel mapRow(ResultSet rs) {
		ProjectModel project = new ProjectModel();		
		try {			
			//Abstract
			project.setId(rs.getLong("id"));
			project.setCreateBy(rs.getLong("create_by"));
			project.setCreateAt(rs.getTimestamp("create_at"));
			project.setUpdateBy(rs.getLong("update_by"));
			project.setUpdateAt(rs.getTimestamp("update_at"));
			project.setDeleted(rs.getInt("deleted"));
			project.setDeleteBy(rs.getLong("deleted_by"));
			project.setDeleteAt(rs.getTimestamp("deleted_at"));
			
			//Project
			
			project.setName(rs.getString("name"));
			project.setDescription(rs.getString("description"));
			project.setProgress(rs.getInt("done"));
			project.setStatus(rs.getLong("project_status"));
			project.setBeginDate(rs.getTimestamp("begin_date"));
			project.setFinishDate(rs.getTimestamp("finish_date"));
			project.setExpectedDate(rs.getTimestamp("ex_date"));
			project.setDuration(rs.getLong("duration"));
			project.setParentId(rs.getLong("parent_id"));
			project.setManager(rs.getLong("manager"));
			project.setAccountId(rs.getLong("account_id"));
			project.setRoot(rs.getLong("root"));
			project.setPosition(rs.getLong("position"));
			return project;
		}
		catch (SQLException e) {
			return null;
		}
		
	}
}
