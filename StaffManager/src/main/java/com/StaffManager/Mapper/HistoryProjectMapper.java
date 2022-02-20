package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.HistoryProjectModel;

public class HistoryProjectMapper implements RowMapper<HistoryProjectModel>{
	@Override
	public HistoryProjectModel mapRow(ResultSet rs) {
		
		HistoryProjectModel historyPrj = new HistoryProjectModel();
		try {
			historyPrj.setId(rs.getLong("id"));
			historyPrj.setTitle(rs.getString("title"));
			historyPrj.setProject_id(rs.getLong("project_id"));
			historyPrj.setAssignFrom(rs.getLong("assign_from"));
			historyPrj.setAssignTo(rs.getLong("assign_to"));
			historyPrj.setContent(rs.getString("content"));
			historyPrj.setStatusFrom(rs.getLong("status_from"));
			historyPrj.setStatusTo(rs.getLong("status_to"));
			historyPrj.setCreateBy(rs.getLong("create_by"));
			historyPrj.setCreateAt(rs.getTimestamp("create_at"));
			return historyPrj;
		}
		catch (SQLException e) {
			return null;
		}
	}
}
