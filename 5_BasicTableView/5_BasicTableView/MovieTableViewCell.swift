//
//  MovieTableViewCell.swift
//  5_BasicTableView
//
//  Created by absin on 1/26/18.
//  Copyright © 2018 absin.io. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    @IBOutlet weak var MovieName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
