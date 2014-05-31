package com.ucsd.whatsup;

import org.jivesoftware.smack.Chat;
import org.jivesoftware.smack.MessageListener;
import org.jivesoftware.smack.packet.Message;

public class WMessageListener implements MessageListener{

    @Override
    public void processMessage(Chat chat, Message message) {
        if (Main.ENABLE_LOGGING)
            WLogger.Log(message.getTo() + " received a new message from " + message.getFrom());
    }
}
