//
//  NetworkService.swift
//  Repositories Applications
//
//  Created by mariam adly on 25/10/2023.
//

import Foundation
import Alamofire

class NetworkServices {
    
    static func getRepos<T : Decodable>(url : URL ,completionHandler: @escaping (T) -> Void ){
       // let url = URL(string: "https://api.github.com/repositories")
//                guard let newUrl = url else {
//                    return
//                }
        let headers : HTTPHeaders = [
                "Authorization": "Bearer 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",
                "Accept": "application/json",
                "X-GitHub-Api-Version": "2022-11-28"
            ]
                AF.request(url,method: .get)
                    .validate().response { resp in
                        switch resp.result{
                        case .success(let data):
                            do{
                                if let data = data{
                                    let jsonData =  try JSONDecoder().decode(T.self, from: data)
                                    completionHandler(jsonData)
                                }
                            }catch{
                                print(error.localizedDescription)
                            }
                        case .failure(let error):
                            print(error.localizedDescription)
                         //   completionHandler(error as! T)
                      }
            }
    }
}


