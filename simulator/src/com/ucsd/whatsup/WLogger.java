package com.ucsd.whatsup;

import java.text.SimpleDateFormat;
import java.util.Date;

public class WLogger {

    private static SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");

    public static synchronized void Log(String text) {
        Date date = new Date();
        System.out.print("[" + dateFormat.format(date) + "]\t");
        System.out.println(text);
    }

    public static synchronized void Error(Exception ex) {
        System.err.println(ex.toString());
    }

    public static synchronized void Error(String error_message) {
        System.err.println(error_message);
    }

    private static int _failures = 0;
    private static int _total = 0;

    public static synchronized void RecordStats(int failures, int total) {
        _failures += failures;
        _total += total;
    }

    public static void PrintStats() {
        Log("Failures: " + _failures + " - Total: " + _total);
    }
}
