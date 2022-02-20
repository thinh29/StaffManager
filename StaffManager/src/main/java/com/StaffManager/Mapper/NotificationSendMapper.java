package com.StaffManager.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.StaffManager.Model.NotificationSendModel;

public class NotificationSendMapper implements RowMapper<NotificationSendModel>{

	@Override
	public NotificationSendModel mapRow(ResultSet rs) {
		NotificationSendModel noti = new NotificationSendModel();
		try {
			noti.setId(rs.getLong("id"));
			noti.setNotificationId(rs.getLong("notifi_id"));
			noti.setAccountId(rs.getLong("account_id"));
			noti.setDeleted(rs.getInt("deleted"));
			noti.setSeen(rs.getInt("seen"));
			return noti;
		} catch (SQLException e) {
			return null;
		}
	}

}
