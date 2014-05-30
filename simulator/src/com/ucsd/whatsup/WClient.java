package com.ucsd.whatsup;

import org.apache.commons.lang.RandomStringUtils;
import org.jivesoftware.smack.*;

import java.util.ArrayList;
import java.util.Random;

public class WClient extends Thread {

    public String server_ip;
    public int server_port;

    public String username;
    public String password;

    public int total_clients;
    public int total_messages;
    public int message_size;
    public int number_of_contacts;
    public int delay;

    private Random random;
    private int failures;

    public WClient() {
        random = new Random();
        failures = 0;
    }

    private String randomContact() {
        int c = random.nextInt(total_clients) + 1;
        return c + "@" + server_ip;
    }

    public void run() {

        WLogger.Log("Start running " + username);

        // wait for all the other threads to initialize
        while (!Main.channel) {
            try {
                sleep(100);
            } catch (InterruptedException e) {
                //e.printStackTrace();
                WLogger.Error(e);
            }
        }

        WLogger.Log(username + " will configure connection shortly!");

        // Configuring the server
        ConnectionConfiguration config = new ConnectionConfiguration(server_ip, server_port);
        config.setCompressionEnabled(true);
        config.setSASLAuthenticationEnabled(true);

        // Connect to the server
        Connection connection = new XMPPConnection(config);
        try {
            connection.connect();
            connection.login(username, password);
        }
        catch (Exception ex) {
            WLogger.Error("error while connecting to the server: " + ex.toString());
        }

        // Register chat listener
        connection.getChatManager().addChatListener(
            new ChatManagerListener() {
                @Override
                public void chatCreated(Chat chat, boolean createdLocally) {
                    if (!createdLocally)
                        chat.addMessageListener(new WMessageListener());
                }
            });

        // Create Chat instances
        ArrayList<WChatManager> contacts = new ArrayList<WChatManager>();
        for (int counter = 0; counter < number_of_contacts; counter++) {
            String c = username;
            while (c.equals(username)) c = randomContact();
            contacts.add(new WChatManager(connection, c));
        }

        WLogger.Log(username + " finished creating chat instances!");

        // Send messages
        int total = total_messages * number_of_contacts;
        for (int counter = 0; counter < total; counter++) {

            // prepare message
            String message = RandomStringUtils.random(message_size, true, true);

            // choose a client as receiver
            WChatManager c = contacts.get(random.nextInt(number_of_contacts));

            // send message
            try {
                c.SendMessage(message);
            } catch (XMPPException e) {
                //e.printStackTrace();
                failures++;
                WLogger.Error(e);
            }

            // wait before sending next message
            if (delay > 0) {
                try {
                    sleep(delay);
                }
                catch (InterruptedException e) {
                    //e.printStackTrace();
                    WLogger.Error(e);
                }
            }
        }

        // Close connection
        try { connection.disconnect(); } catch (Exception ex) { /* ignore exception */ }

        WLogger.RecordStats(failures, total);
    }
}
