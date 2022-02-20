package com.StaffManager.Service;

import java.util.List;

import com.StaffManager.Model.NotificationSendModel;

public interface INotificationSendService {
	public List<NotificationSendModel>getListNotificationSendByIdAccount(Long idAcc, Integer page, Integer maxPageItem, int i, String sortBy, String sortName);
	public Boolean deleteNotificationByStaff(long notiId, long accId);
	public Boolean updateSeenNotificationByStaff(long notiId, long accId, Integer seen);
	public Integer getTotalPage(Integer maxPageItem, Integer i, long accId);
	public List<NotificationSendModel>getListSearch(Long idAcc, Integer page, Integer maxPageItem, int i, String keyword, String sortBy, String sortName);
	public List<NotificationSendModel>getListSeenOrUnSeen(Long idAcc, Integer page, Integer maxPageItem, int i, int seen, String sortBy, String sortName);	
	Long insertNewNotification(NotificationSendModel notificationSendModel);
	Boolean deleteNotificationSend(Long notiId);
	Boolean deleteNotificationByManager(long notiId);
	Boolean restoreNotificationByManager(long notiId);
	public Integer countNotificationUnseen(Long idAcc);
}
