package com.StaffManager.DAO;

import java.util.List;

import com.StaffManager.Model.NotificationSendModel;

public interface INotificationSendDAO {
	public List<NotificationSendModel> getListNotificationSendByIdAccount(String sortBy, String sortName, Object... objects);
	public Boolean deleteNotificationByStaff(long notiId, long accId);
	public Boolean updateSeenNotificationByStaff(long notiId, long accId, Integer seen);
	public Integer getCount(Integer i, long accId);
	public List<NotificationSendModel> getListSearch(String sortBy, String sortName, String keyword, Object... objects);
	public List<NotificationSendModel> getListSeenOrUnSeen(String sortBy, String sortName, int seen, Object... objects);
	
	public Long insertNotificationSend(Object... objects);

	Boolean deleteNotification(Long notiId);
	Boolean deleteNotificationByManager(long notiId);
	Boolean restoreNotificationByManager(long notiId);
	public Integer countNotificationUnseen(Long idAcc);

}
