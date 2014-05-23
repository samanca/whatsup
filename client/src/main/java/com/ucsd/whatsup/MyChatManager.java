package com.ucsd.whatsup;

import org.jivesoftware.smack.*;
import org.jivesoftware.smack.packet.Message;

public class MyChatManager {

    private Connection connection;
    private String username;
    private Chat chat;

    public MyChatManager(Connection conn, String contact) {

        connection = conn;
        username = contact;

        chat = connection.getChatManager().createChat(username, new MessageListener() {
            public void processMessage(Chat chat, Message message) {
                if (message.getBody() != null)
                    System.out.println(username + " says " + message.getBody());
            }
        });
    }

    @Override
    protected void finalize() throws Throwable {
        super.finalize();
    }

    public void SendMessage(String message) throws XMPPException {
        chat.sendMessage(message);
    }
}
