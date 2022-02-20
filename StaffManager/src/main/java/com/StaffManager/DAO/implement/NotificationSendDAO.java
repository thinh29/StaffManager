package com.StaffManager.DAO.implement;

import java.util.List;

import com.StaffManager.DAO.INotificationSendDAO;
import com.StaffManager.Mapper.NotificationSendMapper;
import com.StaffManager.Model.NotificationSendModel;

public class NotificationSendDAO extends AbstractDAO<NotificationSendModel> implements INotificationSendDAO{

	@Override
	public List<NotificationSendModel> getListNotificationSendByIdAccount(String sortBy, String sortName, Object... objects) {
		String sql="SELECT * FROM notification_send WHERE account_id= ? AND deleted = ? ORDER BY "+sortBy+" "+sortName+" LIMIT ?, ?;";
		return queryGetList(sql, new NotificationSendMapper(), objects);
	}

	@Override
	public Boolean deleteNotificationByStaff(long notiId, long accId) {
		String sql="UPDATE notification_send SET deleted = 1 WHERE notifi_id = ? AND account_id = ?";
		return update(sql, notiId, accId);
	}

	@Override
	public Boolean updateSeenNotificationByStaff(long notiId, long accId, Integer seen) {
		String sql="UPDATE notification_send SET seen = "+seen+" WHERE notifi_id = ? AND account_id = ?";
		return update(sql, notiId, accId);
	}

	@Override
	public Integer getCount(Integer i, long accId) {
		String sql="SELECT count(*) FROM notification_send WHERE deleted = ? AND account_id= ?;";
		return count(sql, i, accId);
	}

	@Override
	public List<NotificationSendModel> getListSearch(String sortBy, String sortName, String keyword,
			Object... objects) {
		StringBuilder sql= new StringBuilder("SELECT notification_send.* FROM notification_send");
		sql.append(" INNER JOIN notifications ON notifications.id = notification_send.notifi_id");
		sql.append(" WHERE notification_send.account_id=? AND notification_send.deleted=? and notifications.title LIKE '%"+keyword+"%'");
		sql.append(" ORDER BY "+sortBy+" "+sortName+" limit ?, ?;");
		return queryGetList(sql.toString(), new NotificationSendMapper(), objects);
	}

	@Override
	public List<NotificationSendModel> getListSeenOrUnSeen(String sortBy, String sortName, int seen,
			Object... objects) {
		String sql="SELECT * FROM notification_send WHERE account_id= ? AND deleted = ? AND seen = "+seen+" ORDER BY "+sortBy+" "+sortName+" LIMIT ?, ?";
		return queryGetList(sql, new NotificationSendMapper(), objects);
	}
	
	@Override
	public Long insertNotificationSend(Object... objects) {
		Long lastID = null;
		StringBuilder sql = new StringBuilder(
				"INSERT INTO notification_send (notifi_id, account_id) ");
		sql.append("VALUES (?, ?);");
		lastID = insert(sql.toString(), objects);
		return lastID;
	}
	@Override
	public Boolean deleteNotification(Long notiId) {
		StringBuilder sql = new StringBuilder("DELETE FROM notification_send ");
		sql.append("WHERE notifi_id = ?;");
		return update(sql.toString(), notiId);
	}
	@Override
	public Boolean deleteNotificationByManager(long notiId) {
		String sql="UPDATE notification_send SET deleted = 1 WHERE notifi_id = ?";
		return update(sql, notiId);
	}
	@Override
	public Boolean restoreNotificationByManager(long notiId) {
		String sql="UPDATE notification_send SET deleted = 0, seen = 0 WHERE notifi_id = ?";
		return update(sql, notiId);
	}
	@Override
	public Integer countNotificationUnseen(Long idAcc) {
		String sql="SELECT count(*) FROM notification_send WHERE account_id=? AND seen =0;";
		return count(sql, idAcc);
	}
}
