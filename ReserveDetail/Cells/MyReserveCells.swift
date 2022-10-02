//
//  MyReserveCells.swift
//  Warning
//
//  Created by 이주송 on 2022/10/02.
//

import UIKit

class MyReserveCells: UITableViewCell {

    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var sheetNumLabel: UILabel!
    @IBOutlet weak var roomImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
