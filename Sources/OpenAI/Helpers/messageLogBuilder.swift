//
//  File.swift
//  
//
//  Created by Justin Purnell on 7/18/23.
//

import Foundation

func messageLogBuilder(prompt: String, relatedInformation: String) -> [[String: String]] {
	return [["role": "system", "content": command(prompt, relatedInformation)]]
}
