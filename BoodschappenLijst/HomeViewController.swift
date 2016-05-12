//
//  ViewController.swift
//  BoodschappenLijst
//
//  Created by Lesley Peters on 13/04/16.
//  Copyright © 2016 Lesley Peters. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var aanbiedingen = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Test data voor aanbiedingen
        let testAanbieding1 = Product(naam: "Hak appelmoes", prijs: 1.65, winkel: "Jumbo", pictureNaam: "appelmoes")
        aanbiedingen.append(testAanbieding1)
        let testAanbieding2 = Product(naam: "Roomham", prijs: 1.50, winkel: "Albert heijn", pictureNaam: "roomham")
        aanbiedingen.append(testAanbieding2)
        let testAanbieding3 = Product(naam: "Party bapao", prijs: 1.29, winkel: "Lidl", pictureNaam: "bapao")
        aanbiedingen.append(testAanbieding3)
        let testAanbieding4 = Product(naam: "Amstel bier", prijs: 9.99, winkel: "EMTÉ", pictureNaam: "amstel")
        aanbiedingen.append(testAanbieding4)
        let testAanbieding5 = Product(naam: "Bluetooth hoofdtelefoon", prijs: 14.99, winkel: "Dirk", pictureNaam: "hoofdtelefoon")
        aanbiedingen.append(testAanbieding5)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aanbiedingen.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! AanbiedingCell
        // Cellen aanmaken
        let currentRow = indexPath.row
        let currentAanbieding = self.aanbiedingen[currentRow]
        cell.Picture.image = UIImage(named: currentAanbieding.PictureNaam)
        cell.AanbiedingNaam.text = currentAanbieding.Naam
        //double naar string en afronding van decimalen
        let fmt = NSNumberFormatter()
        fmt.maximumFractionDigits = 2
        fmt.minimumFractionDigits = 2
        let prijsString = fmt.stringFromNumber(currentAanbieding.Prijs)!
        cell.Prijs.text = "€"+prijsString
        cell.Winkel.text = currentAanbieding.Winkel
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let selectedRow = self.tableView.indexPathForSelectedRow!
        let selectedProduct = self.aanbiedingen[selectedRow.row]
        let controller = segue.destinationViewController as! ProductViewController
        //gekozen product meegeven
        controller.selectedProduct = selectedProduct
    }
    
}