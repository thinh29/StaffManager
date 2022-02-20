package com.StaffManager.Controller.Chat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.inject.Inject;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.StaffManager.Model.AccountModel;
import com.StaffManager.Service.IAccountService;
import com.StaffManager.Service.implement.AccountService;


@ServerEndpoint(value = "/chatRoomServer")
public class ChatServer{
	
	static Set<Session> users = Collections.synchronizedSet(new HashSet<>());
	
	@Inject
	private IAccountService accountService =new AccountService();

	@OnOpen
	public void handleOpen(Session session) {
		users.add(session);
	}

	@OnMessage
	public void handleMessage(String message, Session userSession) throws IOException {
		String username = (String) userSession.getUserProperties().get("username");
		AccountModel accountModel = new AccountModel();
		if(username==null) {
			userSession.getUserProperties().put("username", message);
			accountModel = accountService.getAccountByUsername((String) userSession.getUserProperties().get("username"));
			if (accountModel == null) {
				userSession.getBasicRemote().sendText("Hệ thống: Tài khoản không hợp lệ... ");
				userSession.getUserProperties().clear();
			}else {
				userSession.getBasicRemote().sendText("Hệ thống: Bạn đã kết nối bằng tài khoản " + accountModel.getUsername());
				for (Session user : users) {
					if (!userSession.getId().equals(user.getId())) {
						 user.getBasicRemote().sendText("Hệ thống: "+(String) userSession.getUserProperties().get("username")+" đã tham gia vào phòng chat.");
		            }
		        }
			}
		}else {
			accountModel=accountService.getAccountByUsername(username);
			accountModel.setTypeName(accountService.getTypeName(accountModel.getTypeId()));
			for (Session session : users) {
				session.getBasicRemote().sendText(username+"("+accountModel.getTypeName()+")" + ": " + message);
			}
		}
	}

	@OnClose
	public void handleClose(Session session) throws IOException{
		users.remove(session);
		for (Session user : users) {
            user.getBasicRemote().sendText("Hệ thống: "+(String) session.getUserProperties().get("username")+" đã rời khỏi phòng chat.");
        }
	}

	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
}
