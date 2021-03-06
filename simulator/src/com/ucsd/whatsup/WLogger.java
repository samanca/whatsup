package com.ucsd.whatsup;

import java.text.SimpleDateFormat;
import java.util.Date;

public class WLogger {

    private static SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd H:m:s:S");

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

    private static long startTime = 0;

    public static synchronized void StartTimer() {
        if (startTime > 0) return;
        startTime = System.currentTimeMillis();
    }

    public static synchronized void StopTimer() {
        if (startTime > 0) {
            long endTime = System.currentTimeMillis();
            System.out.println("Total time: " + (endTime - startTime) + "ms");
        }
        startTime = 0;
    }
}
