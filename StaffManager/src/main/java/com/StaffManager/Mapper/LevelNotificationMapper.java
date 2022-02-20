package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.LevelNotificationModel;

public class LevelNotificationMapper implements RowMapper<LevelNotificationModel>{

	@Override
	public LevelNotificationModel mapRow(ResultSet rs) {
		LevelNotificationModel levelNotification=new LevelNotificationModel();
		try {
			levelNotification.setId(rs.getLong("id"));
			levelNotification.setName(rs.getString("name"));
			levelNotification.setBackground(rs.getString("background"));
			return levelNotification;
		} catch (SQLException e) {
			return null;
		}
	}

}
