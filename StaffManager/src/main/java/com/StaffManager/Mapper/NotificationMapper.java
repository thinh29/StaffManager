package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.NotificationModel;

public class NotificationMapper implements RowMapper<NotificationModel>{

	@Override
	public NotificationModel mapRow(ResultSet rs) {
		NotificationModel notification=new NotificationModel();
		try {
			notification.setId(rs.getLong("id"));
			notification.setTitle(rs.getString("title"));
			notification.setContent(rs.getString("content"));
			notification.setLevel(rs.getLong("level"));
			notification.setCreateAt(rs.getTimestamp("create_at"));
			notification.setCreateBy(rs.getLong("create_by"));
			notification.setUpdateAt(rs.getTimestamp("update_at"));
			notification.setUpdateBy(rs.getLong("update_by"));
			notification.setDeleted(rs.getInt("deleted"));
			notification.setDeleteAt(rs.getTimestamp("deleted_at"));
			notification.setDeleteBy(rs.getLong("deleted_by"));
			return notification;
		} catch (SQLException e) {
			return null;
		}
	}

}
