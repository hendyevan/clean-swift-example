//
//  HeaderTableViewCell.swift
//  Clean Swift
//
//  Created by Fabianus Hendy Evan on 12/04/19.
//  Copyright © 2019 Fabianus Hendy Evan. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var headerTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(_ title: String){
        headerTitleLabel.text = title
    }
    
}
