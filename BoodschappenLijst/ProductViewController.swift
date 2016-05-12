//
//  ProductViewController.swift
//  BoodschappenLijst
//
//  Created by Lesley Peters on 14/04/16.
//  Copyright © 2016 Lesley Peters. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var testlabel: UILabel!
    @IBOutlet weak var Winkel: UILabel!
    @IBOutlet weak var Prijs: UILabel!
    @IBOutlet weak var Picture: UIImageView!
    
    var selectedProduct: Product?
    var gekozenProducten = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        // labels invullen
        testlabel.text = selectedProduct?.Naam
        Winkel.text = selectedProduct?.Winkel
        //double naar string + afronden
        let fmt = NSNumberFormatter()
        fmt.maximumFractionDigits = 2
        fmt.minimumFractionDigits = 2
        let prijsString = fmt.stringFromNumber((selectedProduct?.Prijs)!)!
        Prijs.text = "€"+prijsString
        Picture.image = UIImage(named: (selectedProduct?.PictureNaam)!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.gekozenProducten.append(selectedProduct!)
        let controller = segue.destinationViewController as! LijstViewController
        controller.producten = self.gekozenProducten
    }
    
}
