package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.NotificationLevelModel;

public class NotificationLevelMapper implements RowMapper<NotificationLevelModel>{

	@Override
	public NotificationLevelModel mapRow(ResultSet rs) {
		NotificationLevelModel noti = new NotificationLevelModel();
		try {
			noti.setId(rs.getLong("id"));
			noti.setName(rs.getString("name"));
			noti.setBackground(rs.getString("background"));
			return noti;
		} catch (SQLException e) {
			return null;
		}
	}

}
