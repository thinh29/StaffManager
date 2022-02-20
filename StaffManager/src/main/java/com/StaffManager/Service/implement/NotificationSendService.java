package com.StaffManager.Service.implement;

import java.util.List;

import javax.inject.Inject;

import com.StaffManager.DAO.INotificationSendDAO;
import com.StaffManager.Model.NotificationSendModel;
import com.StaffManager.Service.INotificationSendService;

public class NotificationSendService implements INotificationSendService{

	@Inject
	private INotificationSendDAO notificationSendDAO;
	@Override
	public List<NotificationSendModel> getListNotificationSendByIdAccount(Long idAcc, Integer page, Integer maxPageItem, int i, String sortBy, String sortName) {
		int start = (page - 1) * maxPageItem;
		return notificationSendDAO.getListNotificationSendByIdAccount(sortBy, sortName, idAcc, i, start, maxPageItem);
	}
	@Override
	public Boolean deleteNotificationByStaff(long notiId, long accId) {
		return notificationSendDAO.deleteNotificationByStaff(notiId, accId);
	}
	@Override
	public Boolean updateSeenNotificationByStaff(long notiId, long accId, Integer seen) {
		return notificationSendDAO.updateSeenNotificationByStaff(notiId, accId, seen);
	}
	@Override
	public Integer getTotalPage(Integer maxPageItem, Integer i, long accId) {
		Integer items = notificationSendDAO.getCount(i, accId);
		Integer surplus = ((items % maxPageItem) > 0) ? 1 : 0;
		Integer totalPage = (items / maxPageItem) + surplus;
		return totalPage;
	}
	@Override
	public List<NotificationSendModel> getListSearch(Long idAcc, Integer page, Integer maxPageItem, int i,
			String keyword, String sortBy, String sortName) {
		int start = (page - 1) * maxPageItem;
		return notificationSendDAO.getListSearch(sortBy, sortName, keyword, idAcc, i, start, maxPageItem);
	}
	@Override
	public List<NotificationSendModel> getListSeenOrUnSeen(Long idAcc, Integer page, Integer maxPageItem, int i,
			int seen, String sortBy, String sortName) {
		int start = (page - 1) * maxPageItem;
		return notificationSendDAO.getListSeenOrUnSeen(sortBy, sortName, seen, idAcc, i, start, maxPageItem);
	}

	 
	@Override
	public Long insertNewNotification(NotificationSendModel notificationSendModel) {
		Long notiId = notificationSendModel.getNotificationId();
		Long accId = notificationSendModel.getAccountId();
		return notificationSendDAO.insertNotificationSend(notiId, accId);
	}
	@Override
	public Boolean deleteNotificationSend(Long notiId)
	{
		return notificationSendDAO.deleteNotification(notiId);
	}
	@Override
	public Boolean deleteNotificationByManager(long notiId) {
		return notificationSendDAO.deleteNotificationByManager(notiId);
	}
	@Override
	public Boolean restoreNotificationByManager(long notiId) {
		return notificationSendDAO.restoreNotificationByManager(notiId);
	}
	@Override
	public Integer countNotificationUnseen(Long idAcc) {
		return notificationSendDAO.countNotificationUnseen(idAcc);
	}
}
