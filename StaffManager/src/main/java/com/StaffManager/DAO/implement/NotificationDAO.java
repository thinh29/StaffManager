package com.StaffManager.DAO.implement;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.StaffManager.DAO.INotificationDAO;
import com.StaffManager.Mapper.NotificationMapper;
import com.StaffManager.Model.NotificationModel;

public class NotificationDAO extends AbstractDAO<NotificationModel> implements INotificationDAO {

	@Override
	public List<NotificationModel> getList(String sortName, String sortBy, Object... objects) {
		// TODO Auto-generated method stub
		List<NotificationModel> listResult = new ArrayList<NotificationModel>();
		String sql = "SELECT * FROM notifications WHERE deleted = ? ORDER BY " + sortBy + " " + sortName + " LIMIT ?, ?;";
		listResult = queryGetList(sql, new NotificationMapper(), objects  );
		return listResult.isEmpty() ? null : listResult;
	}

	@Override
	public Integer getCount(Integer i) {
		String sql = "SELECT count(*) FROM notifications WHERE deleted = ?;";
		return count(sql, i);
	}

	@Override
	public Boolean restoreNotification( Timestamp updateAt, Long updateBy, Long stRstId ) {
		StringBuilder sql = new StringBuilder("UPDATE notifications ");
		sql.append("SET deleted = 0, ");
		sql.append("deleted_at = null, ");
		sql.append("deleted_by = null, ");
		sql.append("update_at = ?, ");
		sql.append("update_by = ? ");
		sql.append("WHERE id = ?;");
		return update(sql.toString(),updateAt,updateBy, stRstId);
	}

	@Override
	public NotificationModel getNotificationById(Long id) {
		List<NotificationModel> listResults = new ArrayList<NotificationModel>();
		String sql = "SELECT * FROM notifications WHERE id = ? ;";
		listResults = queryGetList(sql, new NotificationMapper(), id);
		return listResults.isEmpty() ? null : listResults.get(0);
	}

	@Override
	public Boolean deleteNotification(Long staffId, Long delBy, Timestamp delAt) {
		StringBuilder sql = new StringBuilder("UPDATE notifications ");
		sql.append("SET deleted = 1, ");
		sql.append("deleted_at = ?, ");
		sql.append("deleted_by = ? ");
		sql.append("WHERE id = ?;");
		return update(sql.toString(), delAt, delBy, staffId);
	}


	@Override
	public Long insertNewNotification(Object... objects) {
		Long lastID = null;
		StringBuilder sql = new StringBuilder(
				"INSERT INTO notifications (title, content, level, create_at, create_by, deleted) ");
		sql.append("VALUES (?, ?, ?, ?, ?, ?);");
		lastID = insert(sql.toString(), objects);
		return lastID;
	}

	@Override
	public Boolean updateNotification(Object... objects) {
		StringBuilder sql = new StringBuilder("UPDATE notifications ");
		sql.append("SET title = ?, ");
		sql.append("content = ?, ");
		sql.append("level = ?, ");
		sql.append("update_at = ?, ");
		sql.append("update_by = ? ");
		sql.append("WHERE id = ? AND deleted = ?;");
		return update(sql.toString(), objects);

	}

	@Override
	public Long insertNotificationSend(Object... objects) {
		Long lastID = null;
		StringBuilder sql = new StringBuilder(
				"INSERT INTO notification_send (notifi_id, account_id, deleted) ");
		sql.append("VALUES (?, ?, ?);");
		lastID = insert(sql.toString(), objects);
		return lastID;
	}
	@Override
	public List<NotificationModel> getAllNotification(int del) {
		String sql ="SELECT * FROM notifications where deleted = ?;";
		return queryGetList(sql, new NotificationMapper(), del);
	}

}
