package com.ucsd.whatsup;

import org.jivesoftware.smack.*;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Scanner;

public class Main
{
    private static String SERVER_NAME = "localhost";
    private static int SERVER_PORT = 5222;

    public static void main( String[] args )
    {
        String username, password;
        Scanner scanner = new Scanner(System.in);

        System.out.println("Username:");
        username = scanner.next();
        System.out.println("Password:");
        password = scanner.next();

        ConnectionConfiguration config = new ConnectionConfiguration(SERVER_NAME, SERVER_PORT);
        config.setCompressionEnabled(true);
        config.setSASLAuthenticationEnabled(true);

        Connection connection = new XMPPConnection(config);
        try {
            connection.connect();
            connection.login(username, password);
        }
        catch (Exception ex) {
            System.err.println("error while connecting to the server: " + ex.toString());
        }

        MyContactManager manager = new MyContactManager(connection);

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
            else if (command.equals("list")) {
                manager.PrintContacts();
            }
            else if (command.equals("message")) {
                System.out.println("Enter contact address:");
                String contact = scanner.next();
                System.out.println("Enter message:");
                BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

                try {
                    String message = br.readLine();
                    manager.SendMessage(contact, message);
                }
                catch (Exception ex) {
                    System.err.println("error sending message: " + ex.toString());
                }
            }
            else if (command.equals("exit")) {
                System.out.println("exiting ...");
                break;
            }
            else {
                System.err.println("invalid command received: " + command);
            }
        }

        connection.disconnect();
        System.exit(0);
    }
}
