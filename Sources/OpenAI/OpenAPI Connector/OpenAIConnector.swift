//
//  OpenAIConnector.swift
//  
//
//  Created by Justin Purnell on 6/25/23.
//

import Foundation

@available(macOS 10.15, *)
public class OpenAIConnector: ObservableObject {
    /// This URL might change in the future, so if you get an error, make sure to check the OpenAI API Reference.
    let openAIURL = URL(string: Constants.completionURL)
    let openAIKey = "\(Keys.openAI)"
    
    /// This is what stores your messages. You can see how to use it in a SwiftUI view here:
    @Published var messageLog: [[String: String]] = [
        /// Modify this to change the personality of the assistant.
        ["role": "system", "content": "how are you today"]
    ]
	
	public init(_ messageLog: [[String : String]] = [["role": "system", "content": "how are you today"]]) {
		self.messageLog = messageLog
	}
    
//    func command(_ prompt: String, _ information: String) -> String {
//        return "\(prompt)\n\(information)"
//    }
//    
//    func messageLogBuilder(_ description: String) -> [[String: String]] {
//        return [["role": "system", "content": description]]
//    }

//    func sendToAssistant<T: Codable>(_ description: String = "") -> T? {
//        /// DON'T TOUCH THIS
//        var request = URLRequest(url: self.openAIURL!)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("Bearer \(self.openAIKey)", forHTTPHeaderField: "Authorization")
//        
//        let httpBody: [String: Any] = [
//            /// In the future, you can use a different chat model here.
//            "model" : Models.gpt3_5Turbo,
//            "messages" : messageLogBuilder(description)
//        ]
//        
//        /// DON'T TOUCH THIS
//        var httpBodyJson: Data? = nil
//
//        do {
//            httpBodyJson = try JSONSerialization.data(withJSONObject: httpBody, options: .prettyPrinted)
//        } catch {
//            print("Unable to convert to JSON \(error)")
//            logMessage("error", messageUserType: .assistant)
//        }
//        
//        request.httpBody = httpBodyJson
//        
//        if let requestData = executeRequest(request: request, withSessionConfig: nil) {
//            let jsonStr = String(data: requestData, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
//            guard let response = try? JSONDecoder().decode(OpenAIResponse.self, from: requestData) else { return nil }
//            let responseString = response.choices[0].message["content"]
//            guard let responseStringData = responseString?.data(using: .utf8) else { print("could not get response string"); return nil }
//            guard let response = try? JSONDecoder().decode(T.self, from: responseStringData) else { print("could not decode classification Data"); return nil }
//            if let json = try? JSONSerialization.jsonObject(with: responseStringData, options: .mutableContainers),
//               let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
//                print(String(decoding: jsonData, as: UTF8.self))
//            } else {
//                print("json data malformed")
//            }
//            let responseHandler = OpenAIResponseHandler()
//            logMessage((responseHandler.decodeJson(jsonString: jsonStr)?.choices[0].message["content"])!, messageUserType: .assistant)
//            return response
//        }
//        return nil
//    }
}
