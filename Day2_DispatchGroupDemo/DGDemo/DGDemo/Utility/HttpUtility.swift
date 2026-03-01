//
//  HttpUtility.swift
//  DGDemo
//
//  Created by CodeCat15 on 2/12/21.
//

import Foundation

struct HttpUtility {

    static let shared = HttpUtility()
    private init() {}

    public func request<T:Decodable>(urlRequest: URLRequest, resultType: T.Type, completionHandler:@escaping(_ result: T?)-> Void) {

        URLSession.shared.dataTask(with: urlRequest) { (serverData, urlResponse, error) in
            if(error == nil && serverData != nil){
                do {
                    //debugPrint(String(data: serverData!, encoding: .utf8))
                   let result = try JSONDecoder().decode(T.self, from: serverData!)
                    completionHandler(result)
                } catch {
                    debugPrint("parser error = \(error.localizedDescription)")
                }
            }
        }.resume()
    }
}
