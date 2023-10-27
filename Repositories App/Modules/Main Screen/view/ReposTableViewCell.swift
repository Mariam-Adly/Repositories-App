//
//  ReposTableViewCell.swift
//  Repositories Applications
//
//  Created by mariam adly on 25/10/2023.
//

import UIKit

class ReposTableViewCell: UITableViewCell {

    @IBOutlet weak var repoDate: UILabel!
    @IBOutlet weak var repoOwnerName: UILabel!
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
