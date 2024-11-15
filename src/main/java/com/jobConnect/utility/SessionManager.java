package com.jobConnect.utility;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class SessionManager {
    // Stores active sessions with user ID as key and session ID as value
    private final Map<String, String> activeSessions = new HashMap<>();

    public boolean isSessionActive(String userId, String sessionId) {
        return activeSessions.containsKey(userId) && !activeSessions.get(userId).equals(sessionId);
    }

    public void addSession(String userId, String sessionId) {
        activeSessions.put(userId, sessionId);
    }

    public void removeSession(String sessionId) {
        activeSessions.values().remove(sessionId);
    }
}