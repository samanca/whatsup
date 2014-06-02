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

    private static final int MAX_CONSECUTIVE_FAILURES = 10;
    private static final int NUMBER_OF_ATTEMPTS = 3;

    public WClient(String name) {
        super(name);
        random = new Random();
        failures = 0;
    }

    private String randomContact() {
        int c = random.nextInt(total_clients) + 1;
        return c + "@" + server_ip;
    }

    public void run() {

        if (Main.ENABLE_LOGGING)
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

        if (Main.ENABLE_LOGGING)
            WLogger.Log(username + " is connecting to the server!");
        Connection connection = getConnection();

        // Create Chat instances
        ArrayList<WChatManager> contacts = new ArrayList<WChatManager>();
        for (int counter = 0; counter < number_of_contacts; counter++) {
            String c = username;
            while (c.equals(username)) c = randomContact();
            contacts.add(new WChatManager(connection, c));
        }

        if (Main.ENABLE_LOGGING)
            WLogger.Log(username + " finished creating chat instances!");

        // Send messages
        int progress_bar = 0;
        int consecutive_failures = 0;
        int total = total_messages * number_of_contacts;
        for (int counter = 0; counter < total; counter++) {

            // Progress-bar
            if (++progress_bar >= total / 10) {
                progress_bar = 0;
                //if (Main.ENABLE_LOGGING)
                WLogger.Log(username + " has sent " + ((counter * 100) / total) + "% of his messages!");
            }

            // prepare message
            String message = RandomStringUtils.random(message_size, true, true);

            // choose a client as receiver
            WChatManager c = contacts.get(random.nextInt(number_of_contacts));

            // send message
            boolean attempt_failed = true;
            for (int attempt = 0; attempt_failed && attempt < NUMBER_OF_ATTEMPTS; attempt++) {
                try {
                    if (connection.isConnected()) {
                        c.SendMessage(message);
                        attempt_failed = false;
                    }
                    else {
                        connection.connect();
                    }
                }
                catch (Exception e) {
                    WLogger.Error(e);
                }
            }

            if (!attempt_failed) {
                consecutive_failures = 0;
            }
            else {
                failures++;
                consecutive_failures++;
            }

            if (consecutive_failures == MAX_CONSECUTIVE_FAILURES) {
                failures += (total - counter - 1);
                break;
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

        WLogger.RecordStats(failures, total);

        // Close connection
        if (connection.isConnected()) {
            try {
                connection.disconnect();
            } catch (Exception ex) { /* ignore exception */ }
        }
    }

    private Connection getConnection() {

        // Configuring the server
        ConnectionConfiguration config = new ConnectionConfiguration(server_ip, server_port);
        config.setCompressionEnabled(true);
        config.setSASLAuthenticationEnabled(false);

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
        return connection;
    }
}
