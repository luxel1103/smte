//
//  ProductCell.swift
//  BoodschappenLijst
//
//  Created by Lesley Peters on 21/04/16.
//  Copyright © 2016 Lesley Peters. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var Picture: UIImageView!
    
    @IBOutlet weak var Winkel: UILabel!
    @IBOutlet weak var Prijs: UILabel!
    @IBOutlet weak var ProductNaam: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

