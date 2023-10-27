//
//  NetworkServiceProtocol.swift
//  Repositories App
//
//  Created by mariam adly on 27/10/2023.
//

import Foundation
protocol NetworkServiceProtocol {
    
    static func getRepos<T : Decodable>(url : URL ,completionHandler: @escaping (T) -> Void )
}
