//
//  LijstViewController.swift
//  BoodschappenLijst
//
//  Created by Lesley Peters on 21/04/16.
//  Copyright © 2016 Lesley Peters. All rights reserved.
//

import UIKit

class LijstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    
    var selectedProduct: Product?
    var producten = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return producten.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ProductCell
        // Configure the cell...
        let currentRow = indexPath.row
        let currentProduct = self.producten[currentRow]
        
        cell.Picture.image = UIImage(named: currentProduct.PictureNaam)
        cell.ProductNaam.text = currentProduct.Naam
        let fmt = NSNumberFormatter()
        fmt.maximumFractionDigits = 2
        fmt.minimumFractionDigits = 2
        let prijsString = fmt.stringFromNumber(currentProduct.Prijs)!
        cell.Prijs.text = "€"+prijsString
        cell.Winkel.text = currentProduct.Winkel
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toevoegen"{
            let controller = segue.destinationViewController as! SearchTableViewController
            controller.gekozenProducten = self.producten
        }
        if segue.identifier == "opslaan"{
            let controller = segue.destinationViewController as! WinkelenTableViewController
            var boodschappenlijst = [BoodschappenLijst]()
            let lijst = BoodschappenLijst(boodschappenlijst: producten)
            print(lijst.getAanmaakDatum())
            boodschappenlijst.append(lijst)
            controller.boodschappenlijsten = boodschappenlijst
        }
        
        
    }
    
}

