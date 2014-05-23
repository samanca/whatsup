package com.ucsd.whatsup;

import org.jivesoftware.smack.*;

public class MyChatManager {

    private Connection connection;
    private String username;
    private Chat chat;

    public MyChatManager(Connection conn, String contact) {

        connection = conn;
        username = contact;

        connection.getChatManager().addChatListener(new ChatManagerListener() {
            public void chatCreated(Chat chat, boolean createdLocally) {
                if (!createdLocally)
                    chat.addMessageListener(new MyMessageListener(username));
            }
        });

        chat = connection.getChatManager().createChat(username, new MyMessageListener(username));
    }

    @Override
    protected void finalize() throws Throwable {
        super.finalize();
    }

    public void SendMessage(String message) throws XMPPException {
        chat.sendMessage(message);
    }
}
