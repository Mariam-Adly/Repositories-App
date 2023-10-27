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
    
    func extractNumbersFromString(_ inputString: String) -> [Int]? {
        var numbers: [Int] = []
        for num in inputString{
            if let number = Int(String(num)) {
                numbers.append(number)
                if numbers.count == 4 {
                    break
                }
            }
        }
//        let combinedNumber = numbers.reduce(0) { result, number in
//            result * 10 + number
//        }
        return numbers
    }
}

extension ReposViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reposVM?.getReposCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell", for: indexPath) as! ReposTableViewCell
        let data = reposVM?.getRepoAtIndex(index: indexPath.row)
        cell.repoImg.sd_setImage(with: URL(string: data?.owner?.avatarURL ?? ""))
        cell.repoName.text = data?.name
        cell.repoOwnerName.text = data?.owner?.login
        getDate(data: data?.owner?.login ?? "")
        let date = reposVM?.getDateAtIndex(index: indexPath.row)
        if let extractedNumbers = extractNumbersFromString(data?.createdAt ?? "") {
            print(extractedNumbers)
        } else {
            print("No numbers found")
        }
        cell.repoDate.text = date?.createdAt
        return cell
        
    }
    
}

