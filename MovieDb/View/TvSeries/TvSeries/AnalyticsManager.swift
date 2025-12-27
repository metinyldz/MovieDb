//
//  AnalyticsManager.swift
//  MovieDb
//
//  Created by Metin Yıldız on 27.12.2024.
//

import Foundation

enum AnalyticsManager {
    
    enum Event {
        case screenViewed(String)
        case errorOccurred(Error, screen: String)
        case userAction(String, parameters: [String: Any]?)
        case apiCall(endpoint: String, success: Bool, duration: TimeInterval)
        case retryAttempt(screen: String, attemptNumber: Int)
    }
    
    // MARK: - Public Methods
    
    static func log(event: Event) {
        #if DEBUG
        printDebugLog(event: event)
        #endif
        
        // You can integrate real analytics providers here:
        // - Firebase Analytics
        // - Mixpanel
        // - Amplitude
        // - Custom analytics backend
        
        logToAnalyticsService(event: event)
    }
    
    static func logError(_ error: Error, screen: String, additionalInfo: [String: Any]? = nil) {
        log(event: .errorOccurred(error, screen: screen))
        
        // Send to crash reporting service:
        // - Firebase Crashlytics
        // - Sentry
        // - Bugsnag
        logToCrashReporting(error: error, screen: screen, info: additionalInfo)
    }
    
    // MARK: - Private Methods
    
    private static func printDebugLog(event: Event) {
        let timestamp = Date().formatted(date: .omitted, time: .standard)
        
        switch event {
        case .screenViewed(let screen):
            print("📊 [\(timestamp)] Screen Viewed: \(screen)")
            
        case .errorOccurred(let error, let screen):
            print("❌ [\(timestamp)] Error on \(screen): \(error.localizedDescription)")
            
        case .userAction(let action, let params):
            let paramsString = params?.description ?? "none"
            print("👆 [\(timestamp)] User Action: \(action) | Params: \(paramsString)")
            
        case .apiCall(let endpoint, let success, let duration):
            let status = success ? "✅" : "❌"
            print("\(status) [\(timestamp)] API: \(endpoint) | Duration: \(String(format: "%.2f", duration))s")
            
        case .retryAttempt(let screen, let attemptNumber):
            print("🔄 [\(timestamp)] Retry Attempt #\(attemptNumber) on \(screen)")
        }
    }
    
    private static func logToAnalyticsService(event: Event) {
        // Implement your analytics service here
        // Example: Firebase, Mixpanel, etc.
    }
    
    private static func logToCrashReporting(error: Error, screen: String, info: [String: Any]?) {
        // Implement crash reporting here
        // Example: Crashlytics.recordError(error)
    }
}

// MARK: - Error Extensions

extension Error {
    var isNetworkError: Bool {
        let nsError = self as NSError
        return nsError.domain == NSURLErrorDomain
    }
    
    var isOfflineError: Bool {
        let nsError = self as NSError
        return nsError.code == NSURLErrorNotConnectedToInternet ||
               nsError.code == NSURLErrorNetworkConnectionLost
    }
}
