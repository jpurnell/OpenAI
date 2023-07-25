//
//  sendToAssistantForResponse.swift
//  
//
//  Created by Justin Purnell on 7/18/23.
//

import Foundation

@available(macOS 10.15, *)
extension OpenAIConnector {
	public func sendToAssistantForResponse<T: Codable>(_ prompt: String = "", _ description: String = "", decoding type: T.Type, from model: Models = Models.gpt3_5Turbo) -> T? {
		/// DON'T TOUCH THIS
		var request = URLRequest(url: self.openAIURL!)
		request.httpMethod = "POST"
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		request.addValue("Bearer \(self.openAIKey)", forHTTPHeaderField: "Authorization")
		let message = messageLogBuilder(prompt: prompt, relatedInformation: description)
		let httpBody: [String: Any] = [
			/// In the future, you can use a different chat model here.
			"model" : "\(model.rawValue)",
			"messages" : message
		]
		/// DON'T TOUCH THIS
		var httpBodyJson: Data? = nil
		do {
			httpBodyJson = try JSONSerialization.data(withJSONObject: httpBody, options: .prettyPrinted)
		} catch {
			print("Unable to convert to JSON \(error)")
			logMessage("error", messageUserType: .assistant)
		}
		request.httpBody = httpBodyJson
		if let requestData = executeRequest(request: request, withSessionConfig: nil) {
			let jsonStr = String(data: requestData, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
			print("Sending Request:\n\(jsonStr)")
			guard let response = try? JSONDecoder().decode(OpenAIResponse.self, from: requestData) else {print("Could not get OpenAI Response"); return nil }
			let responseString = response.choices[0].message["content"]
//			print(responseString)
			guard let responseStringData = responseString?.data(using: .utf8) else { print("could not get response string"); return nil }
			guard let responseT = try? JSONDecoder().decode(type, from: responseStringData) else { print("could not decode classification Data"); return nil }
			if let json = try? JSONSerialization.jsonObject(with: responseStringData, options: .mutableContainers),
			   let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
				let string = String(decoding: jsonData, as: UTF8.self)
				print(string)
			} else {
				print("json data malformed")
			}
			let responseHandler = OpenAIResponseHandler()
			logMessage((responseHandler.decodeJson(jsonString: jsonStr)?.choices[0].message["content"])!, messageUserType: .assistant)
			print("Have response of type \(type) as \(responseT)")
			return responseT
		}
		return nil
	}
}

