package com.ucsd.whatsup;

import org.jivesoftware.smack.*;
import org.jivesoftware.smack.packet.Presence;

import java.util.Collection;
import java.util.Hashtable;

public class MyContactManager {

    private Connection connection;
    private Hashtable<String, MyChatManager> chatManagers;


    public MyContactManager(Connection conn) {

        connection = conn;
        chatManagers = new Hashtable<String, MyChatManager>();

        Roster roster = connection.getRoster();

        roster.setSubscriptionMode(Roster.SubscriptionMode.accept_all);
        Collection<RosterEntry> entries = roster.getEntries();
        for (RosterEntry entry : entries) {
            chatManagers.put(entry.getUser(), new MyChatManager(connection, entry.getUser()));
            System.err.println("user added: " + entry.getUser());
        }

        roster.addRosterListener(new RosterListener() {
            public void entriesAdded(Collection<String> addresses) { for (String entry : addresses) AddContact(entry); }
            public void entriesDeleted(Collection<String> addresses) { for (String entry : addresses) DeleteContact(entry); }
            public void entriesUpdated(Collection<String> addresses) { for (String entry : addresses) UpdateContact(entry); }
            public void presenceChanged(Presence presence) { PresenceChanged(presence); }
        });
    }

    protected void AddContact(String contact) {
        synchronized (chatManagers) {
            chatManagers.put(contact, new MyChatManager(connection, contact));
        }
        System.err.println("user added: " + contact);
    }

    protected void DeleteContact(String contact) {
        synchronized (chatManagers) {
            chatManagers.remove(contact);
        }
        System.err.println("user deleted: " + contact);
    }

    protected void UpdateContact(String contact) {
        System.err.println("user updated: " + contact);
    }

    protected void PresenceChanged(Presence presence) {
        System.err.println("Presence changed: " + presence.getFrom() + " " + presence);
    }

    public void SendMessage(String contact, String message) throws XMPPException {
        if (chatManagers.containsKey(contact)) {
            chatManagers.get(contact).SendMessage(message);
        }
        else {
            System.out.println(contact + " is not in your contacts list!");
        }
    }

    public void RegisterContact(String contact) {
        Roster roster = connection.getRoster();
        try {
            roster.createEntry(contact, contact, null);
        }
        catch(Exception ex) {
            System.err.println("unable to register the new contact: " + ex.toString());
        }
    }

    public void RemoveContact(String contact) {
        Roster roster = connection.getRoster();
        try {
            roster.removeEntry(roster.getEntry(contact));
        }
        catch (Exception ex) {
            System.err.println("unable to remove " + contact + " from contacts: " + ex.toString());
        }
        synchronized (chatManagers) {
            chatManagers.remove(contact);
        }
    }

    public void PrintContacts() {
        for (String entry : chatManagers.keySet()) {
            System.out.println(entry);
        }
    }
}
