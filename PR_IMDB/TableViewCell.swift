//
//  TableViewCell.swift
//  PR_IMDB
//
//  Created by Paulinho on 06/08/19.
//  Copyright © 2019 Paulo Pereira. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var lblMovie: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
