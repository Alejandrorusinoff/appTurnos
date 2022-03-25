//
//  Webservice.swift
//  appTurnos
//
//  Created by Alejandro Rusinoff on 01/03/2022.
//

import Foundation
import SwiftUI



class Webservice: ObservableObject {
    @Published var userToken: String = ""
    @Published var userId: String = ""

    //Login
//    func login(email:String, password: String) {
//        guard let url = URL(string: "http://localhost:3000/api/user/login") else {
//            print("Error: cannot create URL")
//            return
//        }
//
//        // Create model
//        struct UploadData: Codable {
//            let email: String
//            let password: String
//        }
//
//        //Get user
//        struct GetUser: Decodable {
//            let tokem: String
//            let user: String
//        }
//
//        // User
//        struct SingleUser: Codable {
//            let _id: String
//            let provinde: String
//            let location: String
//            let password: String
//            let __v: Int
//            let date: String
//            let email: String
//            let direction: String
//            let name: String
//            let lastName: String
//        }
//        // Get User
//        struct User: Codable {
//            let userData: SingleUser
//            let token: String
//        }
//
//        // Add data to the model
//        let uploadDataModel = UploadData(email: email, password: password)
//
//        guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
//            print("Error: Trying to convert model to JSON data")
//            return
//        }
//
//        // Create the url request
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
//        request.setValue("application/json", forHTTPHeaderField: "Accept") // the response expected to be in JSON format
//        request.httpBody = jsonData
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//
//            guard error == nil else {
//                print("Error: error calling POST")
//                print(error!)
//                return
//            }
//            guard let data = data else {
//                print("Error: Did not receive data")
//                return
//            }
//
//        if let data = data,
//                 let filmSummary = try? JSONDecoder().decode(GetUser.self, from: data) {
//                 completionHandler(filmSummary.results ?? [])
//               }
//            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
//                print("Error: HTTP request failed")
//                return
//            }
//            do {
//                guard let jsonObject = try JSONDecoder().decode(GetUser.self, from: data) as? [String: Any] else {
//                    print("Error: Cannot convert data to JSON object")
//                    return
//                }   catch {
//                    print("Error: Trying to convert JSON data to string")
//                    return
//                }
//            }
//            let data1 = try JSONDecoder().decode(GetUser.self, from: data)
//            print("data1 \(data1)")
//            do {
//                let data1 = try JSONDecoder().decode(GetUser.self, from: data)
//
//
//                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
//                    print("Error: Cannot convert data to JSON object")
//                    return
//                }
//                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
//                    print("Error: Cannot convert JSON object to Pretty JSON data")
//                    return
//                }
//                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
//                    print("Error: Couldn't print JSON in String")
//                    return
//                }
//
//                print("prettyPrintedJson \(prettyPrintedJson)")
//                print("data1 \(data1)")
//
//            } catch {
//                print("Error: Trying to convert JSON data to string")
//                return
//            }
//        }.resume()
//    }
    
    
    //Login
    func login(email:String, password: String) {
        guard let url = URL(string: "http://localhost:3000/api/user/login") else {
            print("Error: cannot create URL")
            return
        }

        // Create model
        struct UploadData: Codable {
            let email: String
            let password: String
        }

        struct User: Decodable {
            var _id: String
            var name: String
            var lastName: String
            var province: String
            var location: String
            var direction: String
            var email: String
        }
        
        struct DataUser: Decodable {
            var user: User
            var token: String
        }

        // Add data to the model
        let uploadDataModel = UploadData(email: email, password: password)

        guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
            print("Error: Trying to convert model to JSON data")
            return
        }

        // Create the url request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
        request.setValue("application/json", forHTTPHeaderField: "Accept") // the response expected to be in JSON format
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                print("Error")
            }
            
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let user = try! JSONDecoder().decode(DataUser.self, from: data)
                print(" user.token ---> \(user.token)")
                self.userToken = user.token
                self.userId = user.user._id
                print("userToken --->  \(self.userToken)")
                print("user.user._id --->  \(self.userId)")
            }
       }.resume()
    }
    
    
    //Register
    func register (name: String, lastName: String, province: String, location: String, direction: String, dni: String, DD: String, MM: String, YYYY: String, email: String, password: String) {
        guard let url = URL(string: "http://localhost:3000/api/user/register")  else {
            print("Error: cannot create URL")
            return
        }
        // Create model
        struct CreateData: Codable {
            let name: String
            let lastName: String
            let province: String
            let location: String
            let direction: String
            let dni: String
            let DD: String
            let MM: String
            let YYYY: String
            let email: String
            let password: String
        }
        // Add data to the model
        let creatDataModel = CreateData(name: name,lastName: lastName, province: province, location:location, direction: direction, dni: dni, DD: DD, MM: MM, YYYY: YYYY, email: email, password: password)
        print(creatDataModel)
        // Convert model to JSON data
        guard let jsonData = try? JSONEncoder().encode(creatDataModel) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        print("jsonData ---> \(jsonData)")
        // Create the url request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
        request.setValue("application/json", forHTTPHeaderField: "Accept") // the response expected to be in JSON format
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling POST")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Couldn't print JSON in String")
                    return
                }
                print("jsonObject \(jsonObject)")
                print("prettyJsonData \(prettyJsonData)")
                print("prettyPrintedJson \(prettyPrintedJson)")
            }
            catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
    
    //Create Turns
    func createTurns (specialist: String, turnDateandTime: Date, additionalInformation: String, location: String, direction: String) {
        guard let url = URL(string: "http://localhost:3000/api/turns/") else {
            print("Error: cannot create URL")
            return
        }
        // Create model
        struct CreateData: Codable {
            let specialist: String
            let turnDateandTime: Date
            let additionalInformation: String
            let location: String
            let direction: String
        }
        // Add data to the model
        let creatDataModel = CreateData(specialist: specialist, turnDateandTime: turnDateandTime, additionalInformation: additionalInformation, location:location, direction: direction)
        print(creatDataModel)
        // Convert model to JSON data
        guard let jsonData = try? JSONEncoder().encode(creatDataModel) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        print("jsonData ---> \(jsonData)")
        // Create the url request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
        request.setValue("application/json", forHTTPHeaderField: "Accept") // the response expected to be in JSON format
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling POST")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Couldn't print JSON in String")
                    return
                }
                
                print(prettyPrintedJson)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
    
    //Create Turns
    func getUser (specialist: String, turnDateandTime: Date, additionalInformation: String, location: String, direction: String) {
        guard let url = URL(string: "http://localhost:3000/api/turns/") else {
            print("Error: cannot create URL")
            return
        }
        // Create model
        struct CreateData: Codable {
            let specialist: String
            let turnDateandTime: Date
            let additionalInformation: String
            let location: String
            let direction: String
        }
        // Add data to the model
        let creatDataModel = CreateData(specialist: specialist, turnDateandTime: turnDateandTime, additionalInformation: additionalInformation, location:location, direction: direction)
        print(creatDataModel)
        // Convert model to JSON data
        guard let jsonData = try? JSONEncoder().encode(creatDataModel) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        print("jsonData ---> \(jsonData)")
        // Create the url request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
        request.setValue("application/json", forHTTPHeaderField: "Accept") // the response expected to be in JSON format
        request.httpBody = jsonData
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: error calling POST")
                print(error!)
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Couldn't print JSON in String")
                    return
                }
                
                print(prettyPrintedJson)
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        }.resume()
    }
}
