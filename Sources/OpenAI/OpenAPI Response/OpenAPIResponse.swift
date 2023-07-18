//
//  OpenAIResponse.swift
//  
//
//  Created by Justin Purnell on 6/25/23.
//

import Foundation

public struct OpenAIResponse: Codable {
    var id: String?
    var object: String?
    var created: Int?
    var choices: [Choice]
    var usage: Usage?
}
