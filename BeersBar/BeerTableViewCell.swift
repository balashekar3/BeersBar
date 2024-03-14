//
//  BeerTableViewCell.swift
//  BeersBar
//
//  Created by Balashekar Vemula on 17/02/24.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
