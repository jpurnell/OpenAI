//
//  File.swift
//  
//
//  Created by Justin Purnell on 6/25/23.
//

import Foundation

struct Usage: Codable {
    var prompt_tokens: Int?
    var completion_tokens: Int?
    var total_tokens: Int?
}
