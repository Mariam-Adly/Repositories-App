//
//  NetworkService.swift
//  Repositories Applications
//
//  Created by mariam adly on 25/10/2023.
//

import Foundation
import Alamofire

class NetworkServices : NetworkServiceProtocol{
    
    static func getRepos<T : Decodable>(url : URL ,completionHandler: @escaping (T) -> Void ){
        let headers : HTTPHeaders = [
                "Authorization": "Bearer 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",
                "X-GitHub-Api-Version": "2022-11-28"
            ]
                AF.request(url,method: .get,headers: headers)
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


