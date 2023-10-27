//
//  ViewController.swift
//  Repositories Applications
//
//  Created by mariam adly on 25/10/2023.
//

import UIKit
import SDWebImage

class ReposViewController: UIViewController {

    @IBOutlet weak var reposTV: UITableView!
    var reposVM : ReposViewModel?
    var networkIndecator : UIActivityIndicatorView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reposTV.dataSource = self
        reposVM = ReposViewModel()
        
        networkIndecator = UIActivityIndicatorView(style: .large)
        networkIndecator.color = UIColor.black
        networkIndecator.center = view.center
        networkIndecator.startAnimating()
        view.addSubview(networkIndecator)
        
        reposTV.register(UINib(nibName: "ReposTableViewCell", bundle: nil), forCellReuseIdentifier: "repoCell")
        
        getRepos()
    }
    
    func getRepos(){
        let url = URL(string: "https://api.github.com/repositories")
           guard let newUrl = url else {
              return
                }
        reposVM?.getRepos(url: newUrl)
        reposVM?.bindResultToReposTableViewController = {
            DispatchQueue.main.async {
                self.reposTV.reloadData()
                self.networkIndecator.stopAnimating()
            }
        }
    }
    
    func getDate(data : String){
        let urlDate = URL(string: "https://api.github.com/users/\(data)")
        guard let newUrlDate = urlDate else {
            return
        }
        reposVM?.getDate(url: newUrlDate)
        reposVM?.bindDateToReposTableViewController = {
            DispatchQueue.main.async {
                self.reposTV.reloadData()
                self.networkIndecator.stopAnimating()
            }
        }
    }
}

extension ReposViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reposVM?.getReposCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as! ReposTableViewCell
        let data = reposVM?.getRepoAtIndex(index: indexPath.row)
      //  self.productVM?.saveToCoreData(product: self.productVM?.productsResult ?? [Result()])
        cell.repoImg.sd_setImage(with: URL(string: data?.owner?.avatarURL ?? ""),placeholderImage: UIImage(named: "product"))
        cell.repoName.text = data?.name
        cell.repoOwnerName.text = data?.owner?.login
        getDate(data: data?.owner?.login ?? "")
        let date = reposVM?.getDateAtIndex(index: indexPath.row)
        cell.repoDate.text = date?.createdAt
//        for (index, char) in date.enumerated() where index + 3 < date.count {
//            let startIndex = date.index(date.startIndex, offsetBy: index)
//                let endIndex = date.index(startIndex, offsetBy: 3)
//                let substring = date[startIndex...endIndex]
//
//                if let year = Int(substring), year > 2020 {
//                    print("Found a year greater than 2020 at index", index)
//                    cell.repoDate.text = date
//                }
//        }
        
        return cell
        
    }
    
}

