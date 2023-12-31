//
//  ReposViewModel.swift
//  Repositories Applications
//
//  Created by mariam adly on 25/10/2023.
//

import Foundation
class ReposViewModel{
    var bindResultToReposTableViewController : (()->()) = {}
    var bindDateToReposTableViewController : (()->()) = {}
   
    var reposResult : [Repos]?{
        didSet{
            bindResultToReposTableViewController()
        }
    }
    
    var dateResult : RepoDate?{
    didSet{
        bindDateToReposTableViewController()
      }
   }
    
    var dates : [RepoDate] = []
    
    func getRepos(url : URL){
        NetworkServices.getRepos(url : url){
            [weak self] result in
            self?.reposResult = result
        }
    }

    func getDate(url : URL){
        NetworkServices.getRepos(url : url){
            [weak self] result in
            self?.dateResult = result
        }
      dates.append(dateResult ?? RepoDate())
    }
    
    func  getReposCount()-> Int{
        return reposResult?.count ?? 0
    }
        
    func getRepoAtIndex(index:Int)-> Repos{
        return reposResult?[index] ?? Repos()
    }
    
    
    func getDateAtIndex(index:Int)->RepoDate{
        return dates[index]
    }
        
}
