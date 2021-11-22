//
//  TableViewCell.swift
//  foodpin
//
//  Created by Tsuen Hsueh on 2021/11/1.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var competition: UILabel!
    @IBOutlet var desc: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var prefer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
