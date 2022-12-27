//
//  ItemViewCell.swift
//  MdFahimFaezAbir-30028
//
//  Created by Bjit on 14/12/22.
//

import UIKit

class ItemViewCell: UITableViewCell {

    
    @IBOutlet weak var nameOfTheItem: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
