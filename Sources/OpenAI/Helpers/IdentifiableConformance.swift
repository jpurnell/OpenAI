//
//  IdentifiableConformance.swift
//  
//
//  Created by Justin Purnell on 6/25/23.
//

import Foundation

extension Dictionary: Identifiable { public var id: UUID { UUID() } }
extension Array: Identifiable { public var id: UUID { UUID() } }
extension String: Identifiable { public var id: UUID { UUID() } }
