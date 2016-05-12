//
//  AfvingCell.swift
//  BoodschappenLijst
//
//  Created by Lesley Peters on 22/04/16.
//  Copyright © 2016 Lesley Peters. All rights reserved.
//

import UIKit

class AfvinkCell: UITableViewCell {
    
    @IBOutlet weak var afvinkImage: UIImageView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNaam: UILabel!
    @IBOutlet weak var productPrijs: UILabel!
    @IBOutlet weak var productWinkel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
