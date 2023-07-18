//
//  Choice.swift
//  
//
//  Created by Justin Purnell on 6/25/23.
//

import Foundation

struct Choice: Codable {
    var index: Int?
    var message: [String: String]
    var finish_reason: String?
}
