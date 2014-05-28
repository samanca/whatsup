package com.ucsd.whatsup;

import org.jivesoftware.smack.*;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.Scanner;

public class Main
{
    private static String SERVER_NAME = "localhost";
    private static int SERVER_PORT = 5222;

    public static void main( String[] args )
    {
        // read input parameters
        String username, password, hostname;
        Scanner scanner = new Scanner(System.in);

        System.out.println("Username:");
        username = scanner.next();
        System.out.println("Password:");
        password = scanner.next();

        if (username.indexOf("@") > 0) {
            String[] tokens = username.split("@");
            username = tokens[0];
            hostname = tokens[1];
        }
        else {
            hostname = SERVER_NAME;
        }

        // configuring the server
        ConnectionConfiguration config = new ConnectionConfiguration(hostname, SERVER_PORT);
        config.setCompressionEnabled(true);
        config.setSASLAuthenticationEnabled(true);

        // open client connection
        Connection connection = new XMPPConnection(config);
        try {
            connection.connect();
            connection.login(username, password);
        }
        catch (Exception ex) {
            System.err.println("error while connecting to the server: " + ex.toString());
        }

        MyContactManager manager = new MyContactManager(connection);

        // implementing barrier
        File f = new File("/tmp/whatsUp.lock");
        while (f.exists()) {
            try {
                Thread.sleep(1);
            }
            catch (Exception ex) {
                System.err.println("BARRIER SLEEPING ERROR: " + ex.toString());
            }
        }

        System.out.println("Start running ...");

        // start message processing
        String command;
        while(true) {
            command = scanner.next();
            if (command.equals("add")) {
                System.out.println("Enter contact address:");
                manager.RegisterContact(scanner.next());
            }
            else if (command.equals("remove")) {
                System.out.println("Enter contact address:");
                manager.RemoveContact(scanner.next());
            }
            else if (command.equals("remove-all")) {
                manager.RemoveAllContacts();
            }
            else if (command.equals("list")) {
                manager.PrintContacts();
            }
            else if (command.equals("message")) {
                System.out.println("Enter contact address:");
                String contact = scanner.next();
                System.out.println("Enter message:");
                //BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

                try {
                    //String message = br.readLine();
                    String message = scanner.next();
                    manager.SendMessage(contact, message);
                    System.out.println("sending message: " + message);
                }
                catch (Exception ex) {
                    System.err.println("error sending message: " + ex.toString());
                }
            }
            else if (command.equals("exit")) {
                System.out.println("exiting ...");
                break;
            }
            else if (command.equals("sleep")) {
                try {
                    Thread.sleep(scanner.nextInt());
                }
                catch (Exception ex) {
                    System.err.println("failed to go to sleep: " + ex.toString());
                }
            }
            else {
                System.err.println("invalid command received: " + command);
            }
        }

        try { connection.disconnect(); } catch (Exception ex) { /* ignore exception */ }
        System.exit(0);
    }
}
