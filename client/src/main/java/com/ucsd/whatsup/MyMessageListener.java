package com.ucsd.whatsup;

import org.jivesoftware.smack.Chat;
import org.jivesoftware.smack.MessageListener;
import org.jivesoftware.smack.packet.Message;

public class MyMessageListener implements MessageListener {

    private String username;

    public MyMessageListener(String user) {
        username = user;
    }

    @Override
    public void processMessage(Chat chat, Message message) {
        if (message.getFrom().indexOf(username) >= 0)
            System.out.println(username + " says: " + message.getBody());
    }
}
