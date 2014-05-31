package com.ucsd.whatsup;

import org.jivesoftware.smack.*;
import org.jivesoftware.smack.packet.Message;

public class WChatManager {

    private Chat myChat;

    public WChatManager(final Connection connection, final String contact) {
        ChatManager chatmanager = connection.getChatManager();
        myChat = chatmanager.createChat(contact, new MessageListener() {
            public void processMessage(Chat chat, Message message) {
                if (Main.ENABLE_LOGGING) {
                    WLogger.Log(connection.getUser() + " received a new message from " +
                            contact + ": " + message.getBody());
                }
            }
        });
    }

    public void SendMessage(String message) throws XMPPException {
        myChat.sendMessage(message);
    }
}
