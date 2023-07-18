//
//  logMessage.swift
//  OpenAI
//
//  Created by Justin Purnell on 6/25/23.
//

import Foundation

@available(macOS 10.15, *)
extension OpenAIConnector {
    /// This function makes it simpler to append items to messageLog.
    public func logMessage(_ message: String, messageUserType: MessageUserType) {
        var messageUserTypeString = ""
        switch messageUserType {
        case .user:
            messageUserTypeString = "user"
        case .assistant:
            messageUserTypeString = "assistant"
        }
        
        messageLog.append(["role": messageUserTypeString, "content": message])
    }
    
    public enum MessageUserType {
        case user
        case assistant
    }
}
